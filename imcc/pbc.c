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
 * More weird, in global fixup reg->score is used for the opcode offset
 * into the instruction.
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

#define PF_USE_FREEZE_THAW 0

/*
 * globals store the state between individual e_pbc_emit calls
 */

struct subs {
    size_t size;                        /* code size in ops */
    int ins_line;                       /* line# for debug */
    int n_basic_blocks;                 /* block count */
    SymReg * labels[HASH_SIZE];         /* label names */
    SymReg * bsrs[HASH_SIZE];           /* bsr, set_addr locations */
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
    SymReg * key_consts[HASH_SIZE];     /* cached key constants for this seg */
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
            clear_sym_hash(s->labels);
            clear_sym_hash(s->bsrs);
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
        SymReg **h = globals.cs->key_consts;
        clear_sym_hash(h);
    }
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
    if (!interpreter->code->cur_cs) {
        cs->seg = interpreter->code->cur_cs =
            PF_create_default_segs(interpreter,
                    IMCC_INFO(interpreter)->state->file, 1);
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
                    &interpreter->code->directory, PF_UNKNOWN_SEG, name, 1);
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
    if (!globals.cs || interpreter->code->byte_code == NULL)
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
    label = _mk_address(interpreter, globals.cs->subs->labels, str_dup(r->name),
            U_add_uniq_label);
    label->color = pc;
}

static void
store_bsr(Interp *interpreter, SymReg * r, int pc, int offset)
{
    SymReg * bsr;
    bsr = _mk_address(interpreter, globals.cs->subs->bsrs, str_dup(r->name), U_add_all);
    if (r->set == 'p')
        bsr->set = 'p';
    bsr->color = pc;
    bsr->score = offset;        /* bsr = 1, set_addr I,x = 2, newsub = 3 */
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
    c  = _mk_const(globals.cs->key_consts, str_dup(str), 0);
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
            else if (!strcmp(ins->op, "newsub"))
                store_bsr(interpreter, ins->r[2], pc, 3);
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
        /* it's kind of a register */
        if (addr->type & VTREGISTER)
            continue;
        /* branch found */
        label = _get_sym(globals.cs->subs->labels, addr->name);
        /* maybe global */
        if (label)
            continue;
        if (strcmp(ins->op, "bsr") && strcmp(ins->op, "set_addr") &&
                strcmp(ins->op, "branch_cs") && strcmp(ins->op, "newsub")) {
            char buf[64];
            SymReg *r[IMCC_MAX_REGS];
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
        if ( (r = _get_sym(s->labels, name)) ) {
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

    for (s = globals.cs->first; s; s = s->next) {
        for (i = 0; i < HASH_SIZE; i++) {
            for (bsr = s->bsrs[i]; bsr; bsr = bsr->next ) {
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
                    /*
                     * check in matching namespace
                     */
                    lab = find_global_label(bsr->name, s, &pc, &s1);
                    /*
                     * if failed change opcode:
                     * set_p_pc  => find_name p_sc
                     */
                    if (!lab) {
                        int op, col;
                        SymReg *nam;
                        op = interpreter->op_lib->op_code("find_name_p_sc", 1);
                        assert(op);
                        interpreter->code->byte_code[addr] = op;
                        nam = mk_const(interpreter, str_dup(bsr->name), 'S');
                        if (nam->color >= 0)
                            col = nam->color;
                        else {
                            col = nam->color = add_const_str(interpreter, nam);
                        }
                        interpreter->code->byte_code[addr+2] = col;
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
                    interpreter->code->byte_code[addr+bsr->score] =
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
                interpreter->code->byte_code[addr+bsr->score] = pc - addr;
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
    /*
     * VT_UNICODE should better be VT_CHARSET
     */
    if (r->type & VT_UNICODE) {
        char *p;
        p = strchr(r->name, ':');
        assert(p);
        *p = 0;
        charset = r->name;
        buf = p + 2;        /* past delim */
        s = string_unescape_cstring(interpreter, buf, '"', charset);
    }
    else if (*buf == '"') {
        buf++;
        s = string_unescape_cstring(interpreter, buf, '"', charset);
    }
    else if (*buf == '\'') {   /* TODO handle python raw strings */
        buf++;
        s = string_make(interpreter, buf, strlen(buf) - 1, "iso-8859-1",
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

static int
add_const_pmc_sub(Interp *interpreter, SymReg *r,
        int offs, int end)
{
    int k;
    char buf[256];
    opcode_t *rc;
    struct PackFile_Constant *pfc;
    SymReg *ns;
    int ns_const = -1;
    char *real_name;
    char *class;
    struct PackFile_ConstTable *ct;
    struct PackFile *pf;

    pf = interpreter->code;
    if (globals.cs->subs->unit->namespace) {
        ns = globals.cs->subs->unit->namespace->reg;
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

#if PF_USE_FREEZE_THAW
    {
        INTVAL type;
        PMC *name_space;
        PMC *sub_pmc;
        struct Parrot_sub *sub;

        type = (r->pcc_sub->calls_a_sub & ITPCCYIELD) ?
             enum_class_Coroutine : enum_class_Sub;
        /* TODO constant - see also src/packfile.c
        */
        sub_pmc = pmc_new(interpreter, type);
        PObj_get_FLAGS(sub_pmc) |= (r->pcc_sub->pragma & SUB_FLAG_PF_MASK);
        sub = PMC_sub(sub_pmc);
        sub->name = string_from_cstring(interpreter, real_name, 0);

        name_space = NULL;
        if (ns_const >= 0 && ns_const < ct->const_count) {
            switch (ct->constants[ns_const]->type) {
                case PFC_KEY:
                    name_space = ct->constants[ns_const]->u.key;
                    break;
                case PFC_STRING:
                    name_space = constant_pmc_new(interpreter,
                            enum_class_String);
                    PMC_str_val(name_space) =
                            ct->constants[ns_const]->u.string;
                    break;
            }
        }
        sub->name_space = name_space;
        sub->address = (opcode_t*)(long)offs;
        sub->end = (opcode_t*)(long)end;

        if (!(r->pcc_sub->pragma & SUB_FLAG_PF_ANON)) {
            Parrot_store_sub_in_namespace(interpreter, pf,
                    sub_pmc, sub->name, name_space);
        }
        pfc->type = PFC_PMC;
        pfc->u.key = sub_pmc;
        IMCC_debug(interpreter, DEBUG_PBC_CONST,
                "add_const_pmc_sub '%s' -> '%s' flags %d color %d\n",
                r->name, real_name, r->pcc_sub->pragma, k);
    }
#else
    /*
     * TODO use serialize api if that is done
     *      for now:
     * "Class name offs end flags namespace#"
     */
    class = "Sub";
    if (r->pcc_sub->calls_a_sub & ITPCCYIELD)
        class = "Coroutine";
    sprintf(buf, "%s %s %d %d %d %d", class, real_name, offs, end,
            r->pcc_sub->pragma, ns_const);
    rc = PackFile_Constant_unpack_pmc(interpreter, ct, pfc, (opcode_t*)buf);
    if (!rc)
        IMCC_fatal(interpreter, 1,
            "add_const_pmc: PackFile_Constant error\n");

    IMCC_debug(interpreter, DEBUG_PBC_CONST,
            "add_const_pmc_sub '%s' -> '%s' flags %d color %d\n\t%s\n",
            r->name, real_name, r->pcc_sub->pragma, k, buf);
#endif
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

    if ( (r = _get_sym(globals.cs->key_consts, s_key)) != 0)
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
            r->color = add_const_str(interpreter, r);
            break;
        case 'N':
            r->color = add_const_num(interpreter, r->name);
            break;
        case 'K':
            for (r = r->nextkey; r; r = r->nextkey)
                if (r->type & VTCONST)
                    add_1_const(interpreter, r);
        default:
            break;
    }
    if (r /*&& r->set != 'I' */)
        IMCC_debug(interpreter, DEBUG_PBC_CONST,"const %s\tcolor %d use_count %d\n",
                r->name, r->color, r->use_count);

}

/* store a constants idx for later reuse */
static void
constant_folding(Interp *interpreter, IMC_Unit * unit)
{
    SymReg * r;
    int i;

    /* go through all consts of current sub */
    for (i = 0; i < HASH_SIZE; i++) {
        /* normally constants are in ghash ... */
        for (r = IMCC_INFO(interpreter)->ghash[i]; r; r = r->next) {
            if (r->type & (VTCONST|VT_CONSTP)) {
                add_1_const(interpreter, r);
            }
        }
        /* ... but keychains 'K' are in local hash, they may contain
         * variables and constants
         */
        for (r = unit->hash[i]; r; r = r->next) {
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
    if (!ins->r[1] || !ins->r[1]->pcc_sub)
        return 0;
    /* if we are compiling, we don't run it */
    if (IMCC_INFO(interpreter)->write_pbc)
        return 0;
    pragma = ins->r[1]->pcc_sub->pragma;
    if (pragma & P_IMMEDIATE) {
        IMCC_debug(interpreter, DEBUG_PBC, "immediate sub '%s'",
                ins->r[1]->name);
        PackFile_fixup_subs(interpreter, PBC_IMMEDIATE);
    }
    return 0;
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
        if (interpreter->code->byte_code) {
            interpreter->code->byte_code =
                mem_sys_realloc(interpreter->code->byte_code, bytes);
        } else {
            interpreter->code->byte_code =
                mem_sys_allocate(bytes);
        }
        interpreter->code->cur_cs->base.size = oldsize + code_size;
        interpreter->code->cur_cs->base.data = interpreter->code->byte_code;
        pc = (opcode_t*) interpreter->code->byte_code + oldsize;
        npc = 0;
        /* add debug if necessary */
        if (!IMCC_INFO(interpreter)->optimizer_level) {
            const char *sourcefile = IMCC_INFO(interpreter)->state->file;
            /* FIXME length and multiple subs */
            debug_seg = Parrot_new_debug_seg(interpreter,
                    interpreter->code->cur_cs, sourcefile,
                    (size_t) ins_line + ins_size + 1);
        }
        else
            debug_seg = NULL;
        /* if item is a PCC_SUB entry then store it constants */
        if (ins->r[1] && ins->r[1]->pcc_sub) {
#if IMC_TRACE
            PIO_eprintf(NULL, "pbc.c: e_pbc_emit (pcc_sub=%s)\n", ins->r[1]->name);
#endif
            add_const_pmc_sub(interpreter, ins->r[1], oldsize,
                    oldsize+code_size);
        }
    }
    /*
     * if this is not the first sub then store the sub
     */
    if (npc && unit->pasm_file && ins->r[1] && ins->r[1]->pcc_sub) {
        /* we can only set the offset for PASM code */
        add_const_pmc_sub(interpreter, ins->r[1], npc, npc);
    }
    if (ins->op && *ins->op) {
        /* fixup local jumps */
        SymReg *addr, *r;
#if IMC_TRACE_HIGH
        PIO_eprintf(NULL, "emit_pbc: op [%d %s]\n", ins->opnum, ins->op);
#endif
        if ((addr = get_branch_reg(ins)) != 0 && !(addr->type & VTREGISTER)) {
            SymReg *label = _get_sym(globals.cs->subs->labels, addr->name);
            /* maybe global */
            if (label) {
                addr->color = label->color - npc;
                IMCC_debug(interpreter, DEBUG_PBC_FIXUP, "branch label %d jump %d %s %d\n",
                        npc, label->color, addr->name,addr->color);
            }
            else if (strcmp(ins->op, "bsr") && strcmp(ins->op, "set_addr") &&
                    strcmp(ins->op, "newsub")) {
                /* TODO make intersegment branch */
                IMCC_fatal(interpreter, 1, "e_pbc_emit: "
                        "label not found for '%s'\n",
                        addr->name);
            }
            if (ins->opsize == 5 && !strcmp(ins->op, "newsub")) {
                /* this only fixes local branches,
                 * TODO globals
                 */
                addr = ins->r[2];
                label = _get_sym(globals.cs->subs->labels, addr->name);
                /* maybe global */
                if (label) {
                    addr->color = label->color - npc;
                    IMCC_debug(interpreter, DEBUG_PBC_FIXUP, "branch label %d jump %d %s %d\n",
                            npc, label->color, addr->name,addr->color);
                }
            }
        }
        /* add debug line info */
        if (debug_seg) {
            debug_seg->base.data[ins_line++] = (opcode_t) ins->line;
        }
        /* Start generating the bytecode */
        *pc++ = op = (opcode_t)ins->opnum;
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

