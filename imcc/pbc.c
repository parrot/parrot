#include "imc.h"
#include "pbc.h"
#include "parrot/packfile.h"

/*
 * pbc.c
 *
 * emit imcc instructions into parrot interpreter
 *
 * the e_pbc_emit function is called per instruction
 *
 * Notes:
 *
 * I'm using existing data structure here (SymReg*) to store
 * various global items e.g. bsr fixups and constants.
 * The index in the constant table is in SymReg* ->color
 * data member. This looks odd, but the register number
 * from imc.c:allocate is also there for variables,
 * so it's a little bit consistent at least.
 *
 * So when reading color here it's either a constant table idx
 * or a parrot register number, depending on data type.
 *
 * TODO memory clean up
 *
 * And finally: there might be some issues on 64bit systems with
 * my mixing of int and opcode_t, which will be looked at, when this
 * is in CVS
 *
 * -lt
 *
 */

/*
 * globals store the state between individual e_pbc_emit calls
 */

struct subs {
    size_t size;                        /* code size in ops */
    int ins_line;                       /* line# for debug */
    int n_basic_blocks;                 /* block count */
    SymHash labels;         /* label names */
    SymHash  bsrs;           /* bsr, set_addr locations */
    IMC_Unit * unit;
    int pmc_const;                       /* index in const table */
    struct subs *prev;
    struct subs *next;
};

/* subs are kept per code segment */
struct cs_t {
    struct PackFile_ByteCode *seg;      /* bytecode segment */
    struct PackFile_Segment *jit_info;  /* bblocks, register usage */
    struct subs *subs;                  /* current sub data */
    struct subs *first;                 /* first sub of code segment */
    struct cs_t *prev;                  /* previous code segment */
    struct cs_t *next;                  /* next code segment */
    SymHash key_consts;                 /* cached key constants for this seg */
    int pic_idx;                        /* next index of PIC */
};

static struct globals {
    struct cs_t *cs;                     /* current code segment */
    struct cs_t *first;                  /* first code segment */
    int inter_seg_n;
} globals;


static int add_const_str(Interp *, SymReg *r);

static void imcc_globals_destroy(int ex, void *param);
static opcode_t build_key(Interp *interpreter, SymReg *reg);

static void
imcc_globals_destroy(int ex, void *param)
{
    struct cs_t *cs, *prev_cs;
    struct subs *s, *prev_s;
    Interp *interp = (Interp *)param;

    UNUSED(ex);
    UNUSED(interp);
    cs = globals.cs;
    while (cs) {
        s = cs->subs;
        while (s) {
            prev_s = s->prev;
            clear_sym_hash(&s->labels);
            clear_sym_hash(&s->bsrs);
            mem_sys_free(s);
            s = prev_s;
        }
        prev_cs = cs->prev;
        mem_sys_free(cs);
        cs = prev_cs;
    }
    globals.cs = NULL;
}


int
e_pbc_open(Interp * interpreter, void *param)
{
    struct cs_t *cs;

    /* make a new code segment
     */
    UNUSED(param);
    if (!globals.cs) {
        /* register cleanup code */
        Parrot_on_exit(imcc_globals_destroy, interpreter);
    }
    cs = mem_sys_allocate_zeroed(sizeof(struct cs_t));
    cs->prev = globals.cs;
    /* free previous cached key constants if any */
    if (globals.cs) {
        SymHash *h = &globals.cs->key_consts;
        clear_sym_hash(h);
    }
    create_symhash(&cs->key_consts);
    cs->next = NULL;
    cs->subs = NULL;
    cs->first = NULL;
    cs->jit_info = NULL;
    if (!globals.first)
        globals.first = cs;
    else
        cs->prev->next = cs;
    /*
     * we need some segments
     */
    if (!interpreter->code) {
        PMC *self;
        int k;

        cs->seg = interpreter->code =
            PF_create_default_segs(interpreter,
                    IMCC_INFO(interpreter)->state->file, 1);
        /*
         * create a PMC constant holding the interpreter state
         */
        self = VTABLE_get_pmc_keyed_int(interpreter, interpreter->iglobals,
                IGLOBALS_INTERPRETER);
        k = PDB_extend_const_table(interpreter);
        interpreter->code->const_table->constants[k]->type = PFC_PMC;
        interpreter->code->const_table->constants[k]->u.key = self;
    }
    globals.cs = cs;
    return 0;
}

#ifdef HAS_JIT
/* get size/line of bytecode in ops till now */
static int
old_blocks(void)
{
    size_t size;
    struct subs *s;

    size = 0;
    for (s = globals.cs->subs; s; s = s->prev) {
        size += s->n_basic_blocks;
    }
    return size;
}

opcode_t *
make_jit_info(Interp *interpreter, IMC_Unit * unit)
{
    char *name;
    size_t size, old;

    if (!globals.cs->jit_info) {
        name = malloc(strlen(globals.cs->seg->base.name) + 5);
        sprintf(name, "%s_JIT", globals.cs->seg->base.name);
        globals.cs->jit_info =
            PackFile_Segment_new_seg(interpreter,
                    interpreter->code->base.dir, PF_UNKNOWN_SEG, name, 1);
        free(name);
    }
    size = unit->n_basic_blocks + (old = old_blocks());
    /* store current size */
    globals.cs->subs->n_basic_blocks = unit->n_basic_blocks;
    /* offset of block start and end, 4 * registers_used */
    globals.cs->jit_info->data = realloc(globals.cs->jit_info->data,
            size * sizeof(opcode_t) * 6);
    globals.cs->jit_info->size = size * 6;
    return globals.cs->jit_info->data + old * 6;
}
#endif

/* allocate a new globals.cs->subs structure */
static void
make_new_sub(Interp *interpreter, IMC_Unit * unit)
{
    struct subs *s = mem_sys_allocate_zeroed(sizeof(struct subs));

    s->prev = globals.cs->subs;
    s->next = NULL;
    s->unit = unit;
    s->pmc_const = -1;
    if (globals.cs->subs)
        globals.cs->subs->next = s;
    if (!globals.cs->first)
        globals.cs->first = s;
    globals.cs->subs = s;
    create_symhash(&s->labels);
    create_symhash(&s->bsrs);
#ifdef HAS_JIT
    if ((IMCC_INFO(interpreter)->optimizer_level & OPT_J)) {
        allocate_jit(interpreter, unit);
    }
#else
    UNUSED(interpreter);
#endif
}


/* get size/line of bytecode in ops till now */
static int
get_old_size(Interp *interpreter, int *ins_line)
{
    size_t size;
    struct subs *s;

    size = *ins_line = 0;
    if (!globals.cs || interpreter->code->base.data == NULL)
        return 0;
    for (s = globals.cs->subs; s; s = s->prev) {
        size += s->size;
        *ins_line += s->ins_line;
    }
    return size;
}


static void
store_sub_size(size_t size, size_t ins_line)
{
    globals.cs->subs->size = size;
    globals.cs->subs->ins_line = ins_line;
}

static void
store_label(Interp *interpreter, SymReg * r, int pc)
{
    SymReg * label;
    label = _mk_address(interpreter, &globals.cs->subs->labels,
            str_dup(r->name), U_add_uniq_label);
    label->color = pc;
}

static void
store_bsr(Interp *interpreter, SymReg * r, int pc, int offset)
{
    SymReg * bsr;
    bsr = _mk_address(interpreter, &globals.cs->subs->bsrs,
            str_dup(r->name), U_add_all);
    if (r->set == 'p')
        bsr->set = 'p';
    bsr->color = pc;
    bsr->offset = offset;        /* bsr = 1, set_addr I,x = 2  */
    /* This is hackish but it's better to have it here than in the
     * fixup code until we decide if we need the _globallabel semantic.
     */
    if (r->name[0] == '_' || (r->usage & U_FIXUP))
       bsr->usage |= U_FIXUP;
}

static void
store_key_const(char * str, int idx)
{
    SymReg * c;
    c  = _mk_const(&globals.cs->key_consts, str_dup(str), 0);
    c->color = idx;
}


/*
 * find a label in the interpreter's fixup table
 */
static int
find_label_cs(Interp *interpreter, char *name)
{
    struct PackFile_FixupEntry *fe =
        PackFile_find_fixup_entry(interpreter, enum_fixup_label, name);
    return fe != NULL;
}

/* store global labels and bsr for later fixup
 * return size in ops
 */
static int
store_labels(Interp *interpreter, IMC_Unit * unit, int *src_lines, int oldsize)
{
    Instruction * ins;
    int code_size;
    opcode_t pc;

    /* run through instructions:
     * 1st pass:
     * - sanity check
     * - calc code size
     * - calc nr of src lines for debug info
     */
    *src_lines = 0;
    for (code_size = 0, ins = unit->instructions; ins ; ins = ins->next) {
        if (ins->op && *ins->op) {
            (*src_lines)++;
            if (ins->opnum < 0)
                IMCC_fatal(interpreter, 1, "store_labels: "
                        "no opnum ins#%d %I\n",
                        ins->index, ins);
            code_size += ins->opsize;
        }
        else if (ins->opsize)
            IMCC_fatal(interpreter, 1, "store_labels: "
                    "non instruction with size found\n");
    }

    /* 2nd pass:
     * remember subroutine calls (bsr, addr (closures)) and labels
     * for fixup
     */
    for (pc = 0, ins = unit->instructions; ins ; ins = ins->next) {
        if (ins->type & ITLABEL) {
            store_label(interpreter, ins->r[0], pc);
            ins->r[0]->color = pc;
        }
        else if (ins->type & ITBRANCH) {
            if (!strcmp(ins->op, "bsr")) {
                if (!(ins->r[0]->type & VTREGISTER))
                    store_bsr(interpreter, ins->r[0], pc, 1);
            }
            else if (!strcmp(ins->op, "set_addr"))
                store_bsr(interpreter, ins->r[1], pc, 2);
        }
        else if (ins->opsize == 3 && ins->r[1]->set == 'p') {
            /*
             * set_p_pc opcode
             */
            IMCC_debug(interpreter, DEBUG_PBC_FIXUP, "PMC constant %s\n",
                    ins->r[1]->name);
            store_bsr(interpreter, ins->r[1], pc, 2);
        }
        pc += ins->opsize;
    }

    /* 3rd pass: look for intersegment jumps
     * if found, rewrite code:
     *
     *   if x, non_local1
     *
     *   if x, #ics_NN
     *   ...
     *   end/ret # after instructions apppend:
     *   #ics_NN:
     *     branch_cs fixup_entry_nr
     *
     * if a compile command was found, write global fixup records
     * for all local labels
     * and write fixup records for global _labels.
     */
    for (ins = unit->instructions; ins ; ins = ins->next) {
        SymReg *addr, *label;
        if ((ins->type & ITLABEL) &&
              (IMCC_INFO(interpreter)->has_compile ||
                   ins->r[0]->usage & U_FIXUP)) {
            /* XXX labels should be mangled with current subroutine name
             * they should only be reachable from eval's in current sub
             */
            IMCC_debug(interpreter, DEBUG_PBC_FIXUP, "write fixup '%s' offs %d\n",
                    ins->r[0]->name, ins->r[0]->color + oldsize);
            PackFile_FixupTable_new_entry(interpreter,
                    ins->r[0]->name, enum_fixup_label,
                    ins->r[0]->color + oldsize);
        }
        if (!ins->op || !*ins->op)
            continue;
        /* if no jump */
        if ((addr = get_branch_reg(ins)) == 0)
            continue;
        /* it's a kind of register */
        if (addr->type & VTREGISTER)
            continue;
        /* branch found */
        label = _get_sym(&globals.cs->subs->labels, addr->name);
        /* maybe global */
        if (label)
            continue;
        if (strcmp(ins->op, "bsr") && strcmp(ins->op, "set_addr") &&
                strcmp(ins->op, "branch_cs")) {
            char buf[64];
            SymReg *r[1];
            char *glabel;

            IMCC_debug(interpreter, DEBUG_PBC_FIXUP,
                    "inter_cs found for '%s'\n", addr->name);
            /* find symbol */
            if (!find_label_cs(interpreter, addr->name))
                IMCC_debug(interpreter, DEBUG_PBC_FIXUP,
                        "store_labels", "inter_cs label '%s' not found\n",
                        addr->name);
            glabel = addr->name;
            /* append inter_cs jump */
            sprintf(buf, "_%cisc_%d", IMCC_INTERNAL_CHAR,
                    globals.inter_seg_n++);
            addr->name = str_dup(buf);
            INS_LABEL(unit, addr, 1);
            /* this is the new location */
            store_label(interpreter, addr, code_size);
            /* increase code_size by 2 ops */
            code_size += 2;
            /* add inter_segment jump */
            r[0] = mk_const(interpreter, glabel, 'S');
            r[0]->color = add_const_str(interpreter, r[0]);
            INS(interpreter, unit, "branch_cs", "", r, 1, 0, 1);
        }
    }
    /* return code size */
    return code_size;
}


/* get a global label, return the pc (absolute) */
static SymReg *
find_global_label(char *name, struct subs *sym, int *pc, struct subs **s1)
{
    SymReg * r;
    struct subs *s;
    *pc = 0;
    for (s = globals.cs->first; s; s = s->next) {
#if 0
        fprintf(stderr, "namespace %s\n", s->unit->namespace ?
                s->unit->namespace->name : "(null");
        debug_dump_sym_hash(s->labels);
        fprintf(stderr, "\n");
#endif
        if (sym && (
                    ((sym->unit->namespace && s->unit->namespace) &&
                     strcmp(sym->unit->namespace->name,
                         s->unit->namespace->name))
                    || (sym->unit->namespace && !s->unit->namespace)
                    || (!sym->unit->namespace && s->unit->namespace)))
            continue;
        if ( (r = _get_sym(&s->labels, name)) ) {
            *pc += r->color;    /* here pc was stored */
            *s1 = s;
            return r;
        }
        *pc += s->size;
    }
    return 0;
}

/* fix global branches */
void
fixup_bsrs(Interp *interpreter)
{
    int i, pc, addr;
    SymReg * bsr, *lab;
    struct subs *s, *s1;
    int jumppc = 0;
    int pmc_const;
    SymHash *hsh;

    for (s = globals.cs->first; s; s = s->next) {
        hsh = &s->bsrs;
        for (i = 0; i < hsh->size; i++) {
            for (bsr = hsh->data[i]; bsr; bsr = bsr->next ) {
#if IMC_TRACE_HIGH
                fprintf(stderr, "fixup_bsr %s\n", bsr->name);
#endif
                if (!(bsr->usage & U_FIXUP))
                {
#if IMC_TRACE_HIGH
                    fprintf(stderr, "skip fixup %s\n", bsr->name);
#endif
                    continue;
                }
                addr = jumppc + bsr->color;
                if (bsr->set == 'p') {
                    Instruction *ins;
                    SymReg *r1;
                    struct pcc_sub_t *pcc_sub;
                    /*
                     * check in matching namespace
                     */
                    lab = find_global_label(bsr->name, s, &pc, &s1);
                    /*
                     * if failed change opcode:
                     *   set_p_pc  => find_name p_sc
                     * if a sub label is found
                     *   convert to find_name, if the sub is a multi
                     */
                    if (lab) {
                        assert(s1->unit);
                        if (s1->unit->type & IMC_PCCSUB) {
                            ins = s1->unit->instructions;
                            assert(ins);
                            r1 = ins->r[0];
                            assert(r1);
                            pcc_sub = r1->pcc_sub;
                            assert(pcc_sub);
                            if (pcc_sub->nmulti)
                                lab = NULL;
                        }
                    }
                    if (!lab) {
                        int op, col;
                        SymReg *nam;
                        op = interpreter->op_lib->op_code("find_name_p_sc", 1);
                        assert(op);
                        interpreter->code->base.data[addr] = op;
                        nam = mk_const(interpreter, str_dup(bsr->name), 'S');
                        if (nam->color >= 0)
                            col = nam->color;
                        else {
                            col = nam->color = add_const_str(interpreter, nam);
                        }
                        interpreter->code->base.data[addr+2] = col;
                        IMCC_debug(interpreter, DEBUG_PBC_FIXUP,
                                "fixup const PMC"
                                " find_name sub '%s' const nr: %d\n",
                                bsr->name, col);
                        continue;
                    }
                    pmc_const = s1->pmc_const;
                    if (pmc_const < 0) {
                        IMCC_fatal(interpreter, 1, "fixup_bsrs: "
                                "couldn't find sub 2 '%s'\n",
                                bsr->name);
                    }
                    interpreter->code->base.data[addr+bsr->offset] =
                        pmc_const;
                    IMCC_debug(interpreter, DEBUG_PBC_FIXUP, "fixup const PMC"
                            " sub '%s' const nr: %d\n", bsr->name,
                            pmc_const);
                    continue;
                }
                lab = find_global_label(bsr->name, NULL, &pc, &s1);
                if (!lab) {
                    /* TODO continue; */
                    /* do fixup at runtime */
                    IMCC_fatal(interpreter, 1, "fixup_bsrs: "
                        "couldn't find addr of sub '%s'\n", bsr->name);
                }
                /* patch the bsr __ instruction */
                IMCC_debug(interpreter, DEBUG_PBC_FIXUP, "fixup %s pc %d fix %d\n",
                        bsr->name, addr, pc - addr);
                interpreter->code->base.data[addr+bsr->offset] = pc - addr;
            }
        }
        jumppc += s->size;
    }
}

STRING *
IMCC_string_from_reg(Interp *interpreter, SymReg *r)
{
    char *buf = r->name;
    STRING *s = NULL;
    char *charset = NULL;

    if (r->type & VT_ENCODED) {
        char *p;
        /*
         * the lexer parses:   foo:"string"
         * get first part as charset, rest as string
         */
        p = strchr(r->name, '"');
        assert(p && p[-1] == ':');
        p[-1] = 0;
        charset = r->name;
        buf = p + 1;        /* past delim */
        s = string_unescape_cstring(interpreter, buf, '"', charset);
        /* restore colon, as we may reuse this string */
        p[-1] = ':';
    }
    else if (*buf == '"') {
        buf++;
        s = string_unescape_cstring(interpreter, buf, '"', charset);
    }
    else if (*buf == '\'') {   /* TODO handle python raw strings */
        buf++;
        s = string_make(interpreter, buf, strlen(buf) - 1, "ascii",
                PObj_constant_FLAG);
    }
    else {
        /* unquoted bare name - ascii only for now */
        s = string_unescape_cstring(interpreter, buf, 0, NULL);
    }
    return s;
}

/* add constant string to constant_table */
static int
add_const_str(Interp *interpreter, SymReg *r)
{
    int k;
    STRING *s;

    s = IMCC_string_from_reg(interpreter, r);
    k = PDB_extend_const_table(interpreter);
    interpreter->code->const_table->constants[k]->type = PFC_STRING;
    interpreter->code->const_table->constants[k]->u.string = s;

    return k;
}

static int
add_const_num(Interp *interpreter, char *buf)
{
    int k;
    STRING *s;

    k = PDB_extend_const_table(interpreter);

    interpreter->code->const_table->constants[k]->type =
        PFC_NUMBER;
    s = string_from_cstring(interpreter, buf, 0);
    interpreter->code->const_table->constants[k]->u.number =
        string_to_num(interpreter, s);
    return k;
}

static PMC*
mk_multi_sig(Interp* interpreter, SymReg *r)
{
    INTVAL i, n;
    STRING *sig;
    PMC *multi_sig;
    struct pcc_sub_t *pcc_sub;

    pcc_sub = r->pcc_sub;
    multi_sig = pmc_new(interpreter, enum_class_FixedStringArray);
    n = pcc_sub->nmulti;
    VTABLE_set_integer_native(interpreter, multi_sig, n);
    for (i = 0; i < n; ++i) {
        sig = string_from_cstring(interpreter, pcc_sub->multi[i]->name, 0);
        VTABLE_set_string_keyed_int(interpreter, multi_sig, i, sig);
    }
    return multi_sig;
}

static PMC*
create_lexinfo(Interp *interpreter, IMC_Unit *unit, PMC *sub)
{
    PMC *lex_info;
    int i, k;
    SymReg * r;
    SymHash *hsh;
    struct PackFile_Constant **constants;
    STRING *lex_name;
    STRING *decl_lex;
    PMC *decl_lex_meth, *lex_info_class;
    INTVAL lex_info_id;
    typedef void (*decl_func_t)(Interp *, PMC*, STRING *, INTVAL);
    decl_func_t decl_func;

    constants = interpreter->code->const_table->constants;
    /* TODO use CONST_STRING */
    decl_lex = const_string(interpreter, "declare_lex_preg");
    lex_info_id = Parrot_get_ctx_HLL_type(interpreter, enum_class_LexInfo);
    lex_info_class = Parrot_base_vtables[lex_info_id]->class;
    decl_lex_meth = VTABLE_find_method(interpreter,
            lex_info_class, decl_lex);
    if (!decl_lex_meth) {
        real_exception(interpreter, NULL, METH_NOT_FOUND,
                "Method '%Ss' not found", decl_lex);
    }
    if (decl_lex_meth->vtable->base_type != enum_class_NCI) {
        real_exception(interpreter, NULL, METH_NOT_FOUND,
                "Method '%Ss' is not a NCI", decl_lex);
    }
    /*
     * I think letting this override in PASM/PIR would be a
     * can of worms - how do we call this if it declares .lex
     */
    decl_func = (decl_func_t) PMC_struct_val(decl_lex_meth);
    hsh = &unit->hash;
    lex_info = NULL;
    for (i = 0; i < hsh->size; i++) {
        for (r = hsh->data[i]; r; r = r->next) {
            if (r->set == 'P' && r->usage & U_LEXICAL) {
                if (!lex_info) {
                    lex_info = pmc_new_noinit(interpreter, lex_info_id);
                    VTABLE_init_pmc(interpreter, lex_info, sub);
                }
                assert(r->reg); /* lexical name */
                k = r->reg->color;
                assert(k >= 0);
                lex_name = constants[k]->u.string;
                assert(PObj_is_string_TEST(lex_name));
                (decl_func)(interpreter,
                        lex_info, lex_name, r->color);
            }
        }
    }
    return lex_info;
}

static int
add_const_pmc_sub(Interp *interpreter, SymReg *r,
        int offs, int end)
{
    int i, k;
    INTVAL type;
    PMC *ns_pmc;
    PMC *sub_pmc;
    struct Parrot_sub *sub;
    struct PackFile_Constant *pfc;
    SymReg *ns;
    int ns_const = -1;
    char *real_name;
    struct PackFile_ConstTable *ct;
    IMC_Unit *unit;

    unit = globals.cs->subs->unit;

    if (unit->namespace) {
        ns = unit->namespace->reg;
        if (ns->set == 'K')
            ns->color = build_key(interpreter, ns);
        IMCC_debug(interpreter, DEBUG_PBC_CONST,
                "name space const = %d ns name '%s'\n",
                ns->color, ns->name);
        ns_const = ns->color;
        /* strip namespace off from front */
        real_name = strrchr(r->name, '@');
        if (!real_name)
            real_name = r->name;
        else
            ++real_name;
    }
    else
        real_name = r->name;

    ct = interpreter->code->const_table;
    k = PDB_extend_const_table(interpreter);
    pfc = ct->constants[k];
    globals.cs->subs->pmc_const = k;


    type = (r->pcc_sub->calls_a_sub & ITPCCYIELD) ?
        enum_class_Coroutine : enum_class_Sub;
    /* TODO constant - see also src/packfile.c
    */
    sub_pmc = pmc_new(interpreter, type);
    PObj_get_FLAGS(sub_pmc) |= (r->pcc_sub->pragma & SUB_FLAG_PF_MASK);
    sub = PMC_sub(sub_pmc);
    sub->name = string_from_cstring(interpreter, real_name, 0);

    ns_pmc = NULL;
    if (ns_const >= 0 && ns_const < ct->const_count) {
        switch (ct->constants[ns_const]->type) {
            case PFC_KEY:
                ns_pmc = ct->constants[ns_const]->u.key;
                break;
            case PFC_STRING:
                ns_pmc = constant_pmc_new(interpreter,
                        enum_class_String);
                PMC_str_val(ns_pmc) =
                    ct->constants[ns_const]->u.string;
                break;
        }
    }
    sub->namespace = ns_pmc;
    sub->address = (opcode_t*)(long)offs;
    sub->end = (opcode_t*)(long)end;
    sub->HLL_id = unit->HLL_id;
    for (i = 0; i < 4; ++i)
        sub->n_regs_used[i] = unit->n_regs_used[i];
    sub->lex_info = create_lexinfo(interpreter, unit, sub_pmc);
    /*
     * XXX work around implict P5 usage in exception handling code
     *     need at least 6 PMC regs
     */
    if (unit->has_push_eh && sub->n_regs_used[REGNO_PMC] < 6)
        sub->n_regs_used[REGNO_PMC] = 6;
    /*
     * check if it's declared multi
     */
    if (r->pcc_sub->nmulti)
        sub->multi_signature = mk_multi_sig(interpreter, r);
    else
        sub->multi_signature = NULL;

    if (!(r->pcc_sub->pragma & SUB_FLAG_PF_ANON)) {
        Parrot_store_sub_in_namespace(interpreter, sub_pmc);
    }
    pfc->type = PFC_PMC;
    pfc->u.key = sub_pmc;
    IMCC_debug(interpreter, DEBUG_PBC_CONST,
            "add_const_pmc_sub '%s' -> '%s' flags %d color %d (%s)\n",
            r->name, real_name, r->pcc_sub->pragma, k,
            (char*) sub_pmc->vtable->whoami->strstart);
    /*
     * create entry in our fixup (=symbol) table
     * the offset is the index in the constant table of this Sub
     */
    PackFile_FixupTable_new_entry(interpreter, real_name, enum_fixup_sub, k);
    return k;
}

/* add constant key to constant_table */
static int
add_const_key(Interp *interpreter, opcode_t key[],
        int size, char *s_key)
{
    int k;
    SymReg *r;
    struct PackFile_Constant *pfc;
    opcode_t *rc;

    if ( (r = _get_sym(&globals.cs->key_consts, s_key)) != 0)
        return r->color;
    pfc = malloc(sizeof(struct PackFile_Constant));
    rc = PackFile_Constant_unpack_key(interpreter,
            interpreter->code->const_table, pfc, key);
    if (!rc)
        IMCC_fatal(interpreter, 1,
            "add_const_key: PackFile_Constant error\n");
    k = PDB_extend_const_table(interpreter);
    interpreter->code->const_table->constants[k]->type = PFC_KEY;
    interpreter->code->const_table->constants[k]->u.key = pfc->u.key;
    store_key_const(s_key, k);
    IMCC_debug(interpreter, DEBUG_PBC_CONST, "\t=> %s #%d size %d\n", s_key, k, size);
    IMCC_debug(interpreter, DEBUG_PBC_CONST, "\t %x /%x %x/ /%x %x/\n",
            key[0],key[1],key[2],key[3],key[4]);
    return k;
}

static char *
slice_deb(int bits) {
    if ((bits & VT_SLICE_BITS) == (VT_START_SLICE|VT_END_SLICE))
        return "start+end";
    if ((bits & VT_SLICE_BITS) == (VT_START_ZERO|VT_END_SLICE))
        return "..end";
    if ((bits & VT_SLICE_BITS) == (VT_START_SLICE|VT_END_INF))
        return "start..";
    if (bits & VT_START_SLICE)
        return "start";
    if (bits & VT_END_SLICE)
        return "end";
    return "";
}
/*
 * color is a parrot register number
 *       or a constant table index
 *
 * for the rest, please consult PDD08_KEYS(1)
 *
 * additionally, I build a string representation of the key,
 * which gets cached in the globals.keys
 *
 */

static opcode_t
build_key(Interp *interpreter, SymReg *reg)
{
#define KEYLEN 21
    opcode_t key[KEYLEN], *pc, size;
    char s_key[KEYLEN*10];
    int key_length;     /* P0["hi;there"; S0; 2] has length 3 */
    char *s;
    int k;
    SymReg * r;
    int var_type, slice_bits, type;

    pc = key + 1;       /* 0 is length */
    s = s_key;          /* stringified key */
    *s = 0;
    if (reg->set == 'K')
        reg = reg->nextkey;

    for (key_length = 0; reg ; reg = reg->nextkey, key_length++) {
        if ((pc - key - 2) >= KEYLEN)
            IMCC_fatal(interpreter, 1, "build_key:"
                    "key too complex increase KEYLEN\n");
        r = reg;
        /* if key is a register, the original sym is in r->reg */
        type = r->type;
        if (r->reg)
            r = r->reg;
        var_type = type & ~VT_SLICE_BITS;
        slice_bits = type & VT_SLICE_BITS;
        switch (var_type) {
            case VTIDENTIFIER:       /* P[S0] */
            case VTPASM:       /* P[S0] */
            case VTREG:        /* P[S0] */
                if (r->set == 'I')
                    *pc++ = PARROT_ARG_I | slice_bits;    /* register type */
                else if (r->set == 'S')
                    *pc++ = PARROT_ARG_S | slice_bits;
                else
                    IMCC_fatal(interpreter, 1, "build_key: "
                            "wrong register set\n");
                /* don't emit mapped regs in key parts */
                if (r->color < 0)
                    *pc++ = -1 - r->color;
                else
                    *pc++ = r->color;
                sprintf(s+strlen(s), "%c%d", r->set, (int)r->color);
                IMCC_debug(interpreter, DEBUG_PBC_CONST,
                        " keypart reg %s %c%d slice %s\n",
                        r->name, r->set, (int)r->color,
                        slice_deb(slice_bits));
                break;
            case VT_CONSTP:
            case VTCONST:
                switch (r->set) {
                    case 'S':                       /* P["key"] */
                        *pc++ = PARROT_ARG_SC | slice_bits;  /* str constant */
                        *pc++ = r->color;       /* constant idx */
                        IMCC_debug(interpreter, DEBUG_PBC_CONST,
                                " keypart SC %s #%d slice %s\n",
                                r->name, r->color,
                                slice_deb(slice_bits));
                        break;
                    case 'I':                       /* P[;42;..] */
                        *pc++ = PARROT_ARG_IC | slice_bits;  /* int constant */
                        *pc++ = r->color = atol(r->name);   /* value */
                        IMCC_debug(interpreter, DEBUG_PBC_CONST,
                                " keypart IC %s #%d slice %s\n",
                                r->name, r->color,
                                slice_deb(slice_bits));
                        break;
                    default:
                        IMCC_fatal(interpreter, 1,"build_key: "
                                "unknown set\n");
                }
                sprintf(s+strlen(s), "%cc" INTVAL_FMT, r->set, r->color);
                break;
            default:
                IMCC_fatal(interpreter, 1,"build_key: "
                    "unknown type 0x%x on %s\n", var_type, r->name);
        }
    }
    key[0] = key_length;
    size = pc - key;
    /* now we have a packed key, which packfile can work on */
    /* XXX endianess? probably no, we pack/unpack on the very
     * same computer */
    k =  add_const_key(interpreter, key, size, s_key);
    return k;
}

INTVAL
IMCC_int_from_reg(Interp *interpreter, SymReg *r)
{
    INTVAL i;

    UNUSED(interpreter);
    if (r->type & VT_CONSTP)
        r = r->reg;
    if (r->name[0] == '0' && (r->name[1] == 'x' || r->name[1] == 'X'))
        i = strtoul(r->name+2, 0, 16);
    else if (r->name[0] == '0' &&
            (r->name[1] == 'b' || r->name[1] == 'B'))
        i = strtoul(r->name+2, 0, 2);
    else
        i = strtol(r->name, 0, 10);
    /*
     * TODO
     * - is this portable?
     * - reset errno first?
     * - there are some more atol()s in this file
     */
    if (errno == ERANGE)
        IMCC_fatal(interpreter, 1, "add_1_const:"
                "Integer overflow '%s'", r->name);
    return i;
}

static void
make_pmc_const(Interp *interpreter, SymReg *r)
{
    STRING *s;
    PMC *p, *class;
    int k;

    if (*r->name == '"')
        s = string_unescape_cstring(interpreter, r->name + 1, '"', NULL);
    else
    if (*r->name == '\'')
        s = string_unescape_cstring(interpreter, r->name + 1, '\'', NULL);
    else
        s = string_unescape_cstring(interpreter, r->name, 0, NULL);
    class = Parrot_base_vtables[r->pmc_type]->class;
    p = VTABLE_new_from_string(interpreter, class, s, PObj_constant_FLAG);
    /* append PMC constant */
    k = PDB_extend_const_table(interpreter);
    interpreter->code->const_table->constants[k]->type = PFC_PMC;
    interpreter->code->const_table->constants[k]->u.key = p;
    r->color = k;
}

static void
add_1_const(Interp *interpreter, SymReg *r)
{
    if (r->color >= 0)
        return;
    if (r->use_count <= 0)
        return;
    switch (r->set) {
        case 'I':
            r->color = IMCC_int_from_reg(interpreter, r);
            break;
        case 'S':
            if (r->type & VT_CONSTP)
                r = r->reg;
            r->color = add_const_str(interpreter, r);
            break;
        case 'N':
            r->color = add_const_num(interpreter, r->name);
            break;
        case 'K':
            for (r = r->nextkey; r; r = r->nextkey)
                if (r->type & VTCONST)
                    add_1_const(interpreter, r);
            break;
        case 'P':
            make_pmc_const(interpreter, r);
            IMCC_debug(interpreter, DEBUG_PBC_CONST,
                    "PMC const %s\tcolor %d\n",
                    r->name, r->color);
            break;
        default:
            break;
    }
    if (r)
        IMCC_debug(interpreter, DEBUG_PBC_CONST,
                "const %s\tcolor %d use_count %d\n",
                r->name, r->color, r->use_count);

}

/* store a constants idx for later reuse */
static void
constant_folding(Interp *interpreter, IMC_Unit * unit)
{
    SymReg * r;
    int i;
    SymHash *hsh;

    /* go through all consts of current sub */
    hsh = &IMCC_INFO(interpreter)->ghash;
    for (i = 0; i < hsh->size; i++) {
        /* normally constants are in ghash ... */
        for (r = hsh->data[i]; r; r = r->next) {
            if (r->type & (VTCONST|VT_CONSTP)) {
                add_1_const(interpreter, r);
            }
            if (r->usage & U_LEXICAL) {
                add_1_const(interpreter, r->reg); /* lex_name */
            }
        }
    }
    /* ... but keychains 'K' are in local hash, they may contain
     * variables and constants
     */
    hsh = &unit->hash;
    for (i = 0; i < hsh->size; i++) {
        /* normally constants are in ghash ... */
        for (r = hsh->data[i]; r; r = r->next) {
            if (r->type & VTCONST) {
                add_1_const(interpreter, r);
            }
        }
    }
}

int
e_pbc_new_sub(Interp *interpreter, void *param, IMC_Unit * unit)
{
    UNUSED(param);
    if (!unit->instructions)
        return 0;
    make_new_sub(interpreter, unit);     /* we start a new compilation unit */
    return 0;
}

int
e_pbc_end_sub(Interp *interpreter, void *param, IMC_Unit * unit)
{
    Instruction *ins;
    int pragma;

    UNUSED(param);
    if (!unit->instructions)
        return 0;
    /*
     * if the sub was marked IMMEDIATE, we run it now
     * This is *dangerous*: all possible global state can be messed
     * up, e.g. when that sub start loading bytecode
     */
    ins = unit->instructions;
    /* we run only PCC subs */
    if (!ins->r[0] || !ins->r[0]->pcc_sub)
        return 0;
    pragma = ins->r[0]->pcc_sub->pragma;
    if (pragma & P_IMMEDIATE) {
        IMCC_debug(interpreter, DEBUG_PBC, "immediate sub '%s'",
                ins->r[0]->name);
        PackFile_fixup_subs(interpreter, PBC_IMMEDIATE, NULL);
    }
    return 0;
}

/*
 * - check if any get_ argument contains constants
 * - fill in type bits for argument types and constants, if missing
 */

static void
verify_signature(Interp *interpreter, Instruction *ins, opcode_t *pc)
{
    PMC *sig_arr = interpreter->code->const_table->constants[pc[-1]]->u.key;
    INTVAL i, n, sig;
    SymReg *r;
    int no_consts, needed;
    PMC *changed_sig = NULL;

    assert(PObj_is_PMC_TEST(sig_arr));
    assert(sig_arr->vtable->base_type == enum_class_FixedIntegerArray);
    no_consts = (ins->opnum == PARROT_OP_get_results_pc ||
        ins->opnum == PARROT_OP_get_params_pc);
    n = VTABLE_elements(interpreter, sig_arr);
    for (i = 0; i < n; ++i) {
        r = ins->r[i + 1];
        if (no_consts && (r->type & VTCONST))
                IMCC_fatal(interpreter, 1, "e_pbc_emit: "
                        "constant argument '%s' in get param/result\n",
                        r->name);
        sig = VTABLE_get_integer_keyed_int(interpreter, sig_arr, i);
        if ((r->type & VTCONST) && !(sig & PARROT_ARG_CONSTANT)) {
            if (!changed_sig)
                changed_sig = VTABLE_clone(interpreter, sig_arr);
            sig |= PARROT_ARG_CONSTANT;
            VTABLE_set_integer_keyed_int(interpreter, changed_sig, i, sig);
        }
        switch (r->set) {
            case 'I': needed = PARROT_ARG_INTVAL; break;
            case 'S': needed = PARROT_ARG_STRING; break;
            case 'P': needed = PARROT_ARG_PMC; break;
            case 'N': needed = PARROT_ARG_FLOATVAL; break;
        }
        if (needed != (sig & PARROT_ARG_TYPE_MASK)) {
            if (!changed_sig)
                changed_sig = VTABLE_clone(interpreter, sig_arr);
            sig &= ~PARROT_ARG_TYPE_MASK;
            sig |= needed;
            VTABLE_set_integer_keyed_int(interpreter, changed_sig, i, sig);
        }
    }
    if (changed_sig) {
        /* append PMC constant */
        int k = PDB_extend_const_table(interpreter);
        interpreter->code->const_table->constants[k]->type = PFC_PMC;
        interpreter->code->const_table->constants[k]->u.key = changed_sig;
        pc[-1] = k;
    }
}

/*
 * now let the fun begin, actually emit code for one ins
 */

int
e_pbc_emit(Interp *interpreter, void *param, IMC_Unit * unit, Instruction * ins)
{
    int ok = 0;
    static opcode_t * pc, npc;
    op_info_t *op_info;
    int op, i;
    /* XXX move these statics into IMCC_INFO */
    static struct PackFile_Debug *debug_seg;
    static int ins_line;

#if IMC_TRACE_HIGH
    PIO_eprintf(NULL, "e_pbc_emit\n");
#endif

    UNUSED(param);
    /* first instruction, do initialisation ... */
    if (ins == unit->instructions) {
        int code_size, ins_size;
        int oldsize;
        int bytes;

        oldsize = get_old_size(interpreter, &ins_line);
        code_size = store_labels(interpreter, unit, &ins_size, oldsize);
        IMCC_debug(interpreter, DEBUG_PBC, "code_size(ops) %d  oldsize %d\n",
                code_size, oldsize);
        constant_folding(interpreter, unit);
        store_sub_size(code_size, ins_size);
        bytes = (oldsize + code_size) * sizeof(opcode_t);
        /*
         * allocate code and pic_index
         *
         * pic_index is half the size of the code, as one PIC-cachable opcode
         * is at least two opcodes wide - see below how to further decrease
         * this storage
         */
        if (interpreter->code->base.data) {
            interpreter->code->base.data =
                mem_sys_realloc(interpreter->code->base.data, bytes);
            interpreter->code->pic_index->data =
                mem_sys_realloc(interpreter->code->pic_index->data, bytes/2);
        } else {
            interpreter->code->base.data = mem_sys_allocate(bytes);
            interpreter->code->pic_index->data = mem_sys_allocate(bytes/2);
        }
        interpreter->code->base.size = oldsize + code_size;
        interpreter->code->pic_index->size = (oldsize + code_size)/2;
        pc = (opcode_t*) interpreter->code->base.data + oldsize;
        npc = 0;
        /* add debug if necessary */
        if (!IMCC_INFO(interpreter)->optimizer_level ||
            IMCC_INFO(interpreter)->optimizer_level == OPT_PASM) {
            const char *sourcefile = unit->file;
            /* FIXME length and multiple subs */
            debug_seg = Parrot_new_debug_seg(interpreter,
                    interpreter->code,
                    (size_t) ins_line + ins_size + 1);
            Parrot_debug_add_mapping(interpreter, debug_seg, ins_line,
                     PF_DEBUGMAPPINGTYPE_FILENAME, sourcefile, 0);
        }
        else
            debug_seg = NULL;
        /* if item is a PCC_SUB entry then store it constants */
        if (ins->r[0] && ins->r[0]->pcc_sub) {
#if IMC_TRACE
            PIO_eprintf(NULL, "pbc.c: e_pbc_emit (pcc_sub=%s)\n", ins->r[0]->name);
#endif
            add_const_pmc_sub(interpreter, ins->r[0], oldsize,
                    oldsize+code_size);
        }
        else {
            /* need a dummy to hold register usage */
            SymReg *r = mk_sub_label(interpreter, str_dup("(null)"));
            r->type = VT_PCC_SUB;
            r->pcc_sub = calloc(1, sizeof(struct pcc_sub_t));
            add_const_pmc_sub(interpreter, r, oldsize,
                    oldsize+code_size);
        }
    }
    /*
     * if this is not the first sub then store the sub
     */
    if (npc && unit->pasm_file && ins->r[0] && ins->r[0]->pcc_sub) {
        /* we can only set the offset for PASM code */
        add_const_pmc_sub(interpreter, ins->r[0], npc, npc);
    }
    if (ins->op && *ins->op) {
        /* fixup local jumps */
        SymReg *addr, *r;
#if IMC_TRACE_HIGH
        PIO_eprintf(NULL, "emit_pbc: op [%d %s]\n", ins->opnum, ins->op);
#endif
        if ((addr = get_branch_reg(ins)) != 0 && !(addr->type & VTREGISTER)) {
            SymReg *label = _get_sym(&globals.cs->subs->labels, addr->name);
            /* maybe global */
            if (label) {
                addr->color = label->color - npc;
                IMCC_debug(interpreter, DEBUG_PBC_FIXUP, "branch label %d jump %d %s %d\n",
                        npc, label->color, addr->name,addr->color);
            }
            else if (strcmp(ins->op, "bsr") && strcmp(ins->op, "set_addr")) {
                /* TODO make intersegment branch */
                IMCC_fatal(interpreter, 1, "e_pbc_emit: "
                        "label not found for '%s'\n",
                        addr->name);
            }
        }
        /* add debug line info */
        if (debug_seg) {
            debug_seg->base.data[ins_line++] = (opcode_t) ins->line;
        }
        op = (opcode_t)ins->opnum;
        /* add PIC idx */
        if (parrot_PIC_op_is_cached(interpreter, op)) {
            size_t offs = pc - interpreter->code->base.data;
            /*
             * for pic_idx fitting into a short, we could
             * further reduce the size by storing shorts
             * the relation code_size / pic_index_size could
             * indicate the used storage
             *
             * drawback: if we reach 0xffff, we'd have to resize again
             */
            interpreter->code->pic_index->data[offs / 2] =
                ++globals.cs->pic_idx;
        }
        /* Start generating the bytecode */
        *pc++ = op;
        /* Get the info for that opcode */
        op_info = &interpreter->op_info_table[op];
        IMCC_debug(interpreter, DEBUG_PBC, "%d %s", npc, op_info->full_name);
        for (i = 0; i < op_info->arg_count-1; i++) {
            switch (op_info->types[i+1]) {
                case PARROT_ARG_I:
                case PARROT_ARG_N:
                case PARROT_ARG_S:
                case PARROT_ARG_P:
                case PARROT_ARG_K:
                case PARROT_ARG_KI:
                case PARROT_ARG_KIC:
                case PARROT_ARG_IC:
                case PARROT_ARG_SC:
                case PARROT_ARG_NC:
                case PARROT_ARG_PC:
                    r = ins->r[i];
                    if (r->type & VT_CONSTP)
                        r = r->reg;
                    *pc++ = (opcode_t) r->color;
                    IMCC_debug(interpreter, DEBUG_PBC," %d", r->color);
                    break;
                case PARROT_ARG_KC:
                    *pc++ = build_key(interpreter, ins->r[i]);
                    IMCC_debug(interpreter, DEBUG_PBC," %d", pc[-1]);
                    break;
                default:
                    IMCC_fatal(interpreter, 1, "e_pbc_emit:"
                            "unknown argtype in parrot op\n");
                    break;
            }
        }
        if (ins->opnum == PARROT_OP_set_args_pc ||
                ins->opnum == PARROT_OP_get_results_pc ||
                ins->opnum == PARROT_OP_get_params_pc ||
                ins->opnum == PARROT_OP_set_returns_pc) {
            verify_signature(interpreter, ins, pc);
            /* emit var_args part */
            for (; i < ins->opsize - 1; ++i) {
                r = ins->r[i];
                if (r->type & VT_CONSTP)
                    r = r->reg;
                *pc++ = (opcode_t) r->color;
                IMCC_debug(interpreter, DEBUG_PBC," %d", r->color);
            }
        }
        IMCC_debug(interpreter, DEBUG_PBC, "\t%I\n", ins);
        npc += ins->opsize;
    }
    return ok;
}

int
e_pbc_close(Interp *interpreter, void *param)
{
    UNUSED(param);
    fixup_bsrs(interpreter);

    return 0;
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

