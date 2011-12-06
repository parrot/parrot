/*
 * Copyright (C) 2004-2008, Parrot Foundation.
 */

/*

=head1 NAME

examples/compiler/japhc.c

=head1 DESCRIPTION

example compiler used by japh16.pasm

=head1 SYNOPSIS


  $ make -C examples/compilers/
  $ parrot examples/japh/japh16.pasm

=head2 Functions

=over 4

=cut

 */

#include "parrot/parrot.h"
#include "../../src/pmc/pmc_sub.h"

#define C_DEBUG 0

#if C_DEBUG
#  include <stdio.h>
#  define cdebug(x) fprintf (x)
#else
#  define cdebug(x)
#endif

PMC* japh_compiler(PARROT_INTERP, const char *s);

/*

=item C<void Parrot_lib_japhc_init(PARROT_INTERP, PMC* lib)>

loadlib calls the load and init hooks
we use init to register the compiler

=cut

*/

void
Parrot_lib_japhc_init(PARROT_INTERP, PMC* lib)
{
    STRING *cmp;

    cdebug((stderr, "japhc_init\n"));
    cmp = Parrot_str_new_constant(interp, "JaPH_Compiler");
    Parrot_compreg(interp, cmp, japh_compiler);
}


/*

=item C<static int unescape(char *string)>

Unescape a string.

=cut

*/

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

/*

=item C<static int add_const_str(PARROT_INTERP, PackFile_ConstTable *consts,
char *str)>

add constant string to constant_table

=cut

*/

static int
add_const_str(PARROT_INTERP, PackFile_ConstTable *consts, char *str)
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
    if (consts->constants == NULL)
        consts->constants = mem_sys_allocate(
                k * sizeof (PackFile_Constant *));
    else
        consts->constants = mem_sys_realloc(consts->constants,
                k * sizeof (PackFile_Constant *));

    /* Allocate a new constant */
    consts->constants[--k] = PackFile_Constant_new(interp);
    consts->constants[k]->type = PFC_STRING;
    consts->constants[k]->u.string = Parrot_str_new_init(interp, buf,
            (UINTVAL) l, Parrot_latin1_encoding_ptr, 0);
    free(o);
    return k;
}

/*

=item C<PMC* japh_compiler(PARROT_INTERP, const char *program)>

simple compiler - no error checking

=cut

*/

PMC*
japh_compiler(PARROT_INTERP, const char *program)
{
    PackFile_ByteCode *cur_cs, *old_cs;
    PackFile_ConstTable *consts;
    opcode_t* pc;
    const char *p;
    PMC *sub;
    Parrot_sub *sub_data;

#define CODE_SIZE 128
    cdebug((stderr, "japh_compiler '%s'\n", program));

    /*
     * need some packfile segments
     */
    cur_cs = PF_create_default_segs(interp, "JAPHc", 1);
    old_cs = Parrot_switch_to_cs(interp, cur_cs, 0);
    /*
     * alloc byte code mem
     */
    cur_cs->base.data = mem_sys_allocate(CODE_SIZE * sizeof (opcode_t));
    cur_cs->base.size = CODE_SIZE;
    consts = cur_cs->const_table;
    /*
     * now start compiling
     */
    pc = cur_cs->base.data;
    for (p = program; *p; ++p) {
        switch (*p) {
          case 'p':        /* print_sc */
            *pc++ = interp->op_lib->op_code("print_sc", 1);
            /* const follows */
            ++p;
            switch (*p) {
              case 'J':
                *pc++ = add_const_str(interp, consts, "Just ");
                break;
              case 'a':
                *pc++ = add_const_str(interp, consts, "another ");
                break;
              case 'P':
                *pc++ = add_const_str(interp, consts, "Parrot ");
                break;
              case 'H':
                *pc++ = add_const_str(interp, consts, "Hacker");
                break;
              case 'n':
                *pc++ = add_const_str(interp, consts, "\n");
                break;
            }
            break;
          case 'e':        /* end */
            *pc++ = interp->op_lib->op_code("invoke_p", 1);
            *pc++ = 1;
            break;
        }
    }
    if (old_cs) {
        /* restore old byte_code, */
        (void)Parrot_switch_to_cs(interp, old_cs, 0);
    }
    /*
     * create sub PMC
     */
    sub = pmc_new(interp, enum_class_Eval);
    PMC_get_sub(interp, sub, sub_data);
    sub_data->seg = cur_cs;
    sub_data->address = cur_cs->base.data;
    sub_data->end = cur_cs->base.data + cur_cs->base.size;
    sub_data->name = string_from_literal(interp, "JaPHC");
    return sub;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
