/*
 * example compiler used by japh16.pasm
 *
 * $ make -C examples/compilers/
 * $ parrot examples/japh/japh16.pasm
 *
 */

#include "parrot/parrot.h"
#include "parrot/embed.h"

#define C_DEBUG 0

#if C_DEBUG
#include <stdio.h>
#  define cdebug(x) fprintf x
#else
#  define cdebug(x)
#endif

void* japh_compiler(Parrot_Interp interpreter, const char *s);

/*
 * loadlib calls the load and init hooks
 * we use init to register the compiler
 */

void
Parrot_lib_japhc_init(Parrot_Interp interpreter, PMC* lib)
{
    STRING *cmp;

    cdebug((stderr, "japc_init\n"));
    cmp = const_string(interpreter, "JaPH_Compiler");
    Parrot_compreg(interpreter, cmp, (PMC*)F2DPTR(japh_compiler));
}

/*
 * some code almost duplicated from imcc/pbc.c
 * XXX should make some public util functions
 */
static struct PackFile_Segment *
create_seg(struct PackFile_Directory *dir, pack_file_types t, const char *name)
{
    struct PackFile_Segment *seg;
    seg = PackFile_Segment_new_seg(dir, t, name, 1);
    return seg;
}

static struct PackFile *
create_pf_segs(Parrot_Interp interpreter)
{
    struct PackFile *pf = PackFile_new(0);
    struct PackFile_Segment *seg;
    struct PackFile_ByteCode *cur_cs;

    seg = create_seg(&pf->directory, PF_BYTEC_SEG, "JaPHc_bc");
    cur_cs = pf->cur_cs = (struct PackFile_ByteCode*)seg;

    seg = create_seg(&pf->directory, PF_CONST_SEG, "JaPHc_const");
    cur_cs->consts = pf->const_table = (struct PackFile_ConstTable*) seg;
    cur_cs->consts->code = cur_cs;
    return pf;
}

static int
unescape(char *string)
{
    char *start, *p;

    for (start = p = string ; *string; string++) {
        if (*string == '\\' && string[1]) {
            switch (*++string) {
                case 'n':
                    *p++ = '\n';
                    break;
                default:
                    *p++ = *string;
                    break;
            }
        }
        else
            *p++ = *string;
    }
    *p = 0;
    return p - start;
}

/* add constant string to constant_table */
static int
add_const_str(Parrot_Interp interpreter,
	struct PackFile_ConstTable *consts, char *str)
{
    int k, l;
    char *o;
    char *buf = o = strdup(str);

    /*
     * TODO strip delimiters in lexer, this needs adjustment in printint strings
     */
    if (*buf == '"') {
        buf++;
        l = unescape(buf);
        if (l)
        buf[--l] = '\0';
    }
    else if (*buf == '\'') {
        buf++;
        l = strlen(buf);
        if (l)
            buf[--l] = '\0';
    }
    else {
        l = unescape(buf);
    }

    /* Update the constant count and reallocate */
    k = ++consts->const_count;
    consts->constants = mem_sys_realloc(consts->constants,
            k * sizeof(struct PackFile_Constant *));

    /* Allocate a new constant */
    consts->constants[--k] = PackFile_Constant_new();
    consts->constants[k]->type = PFC_STRING;
    consts->constants[k]->u.string =
        string_make(interpreter, buf, (UINTVAL) l, NULL,
                PObj_constant_FLAG, NULL);
    free(o);
    return k;
}

/*
 * simple compiler - no error checking
 */
void*
japh_compiler(Parrot_Interp interpreter, const char *program)
{
    struct PackFile *pf;
    struct PackFile_ByteCode *cur_cs;
    struct PackFile_ConstTable *consts;
    opcode_t* pc;
    const char *p;

#define CODE_SIZE 128
    cdebug((stderr, "japc_compiler '%s'\n", program));

    /*
     * need some packfile segments
     */
    pf = create_pf_segs(interpreter);
    cur_cs = pf->cur_cs;
    /*
     * alloc byte code mem
     */
    cur_cs->base.data = mem_sys_allocate(CODE_SIZE * sizeof(opcode_t));
    cur_cs->base.size = CODE_SIZE;
    consts = cur_cs->consts;
    /*
     * now start compiling
     */
    pc = cur_cs->base.data;
    for (p = program; *p; ++p) {
	switch (*p) {
	    case 'p':	/* print_sc */
		*pc++ = interpreter->op_lib->op_code("print_sc", 1);
		/* const follows */
		++p;
		switch (*p) {
		    case 'J':
			*pc++ = add_const_str(interpreter, consts, "Just ");
			break;
		    case 'a':
			*pc++ = add_const_str(interpreter, consts, "another ");
			break;
		    case 'P':
			*pc++ = add_const_str(interpreter, consts, "Parrot ");
			break;
		    case 'H':
			*pc++ = add_const_str(interpreter, consts, "Hacker");
			break;
		    case 'n':
			*pc++ = add_const_str(interpreter, consts, "\n");
			break;
		}
		break;
	    case 'e':	/* end */
		*pc++ = interpreter->op_lib->op_code("end", 1);
		break;
	}
    }
    return pf;
}
