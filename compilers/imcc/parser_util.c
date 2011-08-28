/*
 * parser_util.c
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 * Copyright (C) 2002-2009, Parrot Foundation.
 *
 * parser support functions
 *
 *
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#define _PARSER

#include "imc.h"
#include "parrot/dynext.h"
#include "parrot/embed.h"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"
#include "pbc.h"
#include "parser.h"
#include "optimizer.h"

/*

=head1 NAME

compilers/imcc/parser_util.c

=head1 DESCRIPTION

ParserUtil - Parser support functions.

=cut

*/

/* HEADERIZER HFILE: compilers/imcc/imc.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
static int change_op_arg_to_num(
    ARGMOD(imc_info_t * imcc),
    ARGMOD(IMC_Unit *unit),
    ARGMOD(SymReg **r),
    int num,
    int emit)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*r);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static op_info_t * try_find_op(
    ARGMOD(imc_info_t * imcc),
    ARGMOD(IMC_Unit *unit),
    ARGIN(const char *name),
    ARGMOD(SymReg **r),
    int n,
    int keyvec,
    int emit)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*r);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const char * try_rev_cmp(ARGIN(const char *name), ARGMOD(SymReg **r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*r);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static Instruction * var_arg_ins(
    ARGMOD(imc_info_t * imcc),
    ARGMOD(IMC_Unit *unit),
    ARGIN(const char *name),
    ARGMOD(SymReg **r),
    int n,
    int emit)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*r);

#define ASSERT_ARGS_change_op_arg_to_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_try_find_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_try_rev_cmp __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_var_arg_ins __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(r))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*
 * used in -D20 to print files with the output of every PIR compilation
 * this can't be attached to the imcc->interpreter or packfile because it has to be
 * absolutely global to prevent the files from being overwritten.
 *
 */

/*

=head2 Functions

=over

=item C<void op_fullname(char *dest, const char *name, SymReg * const *args, int
narg, int keyvec)>

Lookup the full opcode given the short name

   set I0, 5  -> set_i_ic
   set I0, I1 -> set_i_i

Obviously the registers must be examined before returning the correct
opcode.

=cut

 */
void
op_fullname(ARGOUT(char *dest), ARGIN(const char *name),
    ARGIN(SymReg * const *args), int narg, int keyvec)
{
    ASSERT_ARGS(op_fullname)
    int i;
    const size_t namelen = strlen(name);

    memcpy(dest, name, namelen+1);
    dest += namelen;

    for (i = 0; i < narg && args[i]; i++) {
        *dest++ = '_';
        if (args[i]->type == VTADDRESS) {
            *dest++ = 'i';
            *dest++ = 'c';
            continue;
        }
        /* if one ever wants num keys, they go with 'S' */
        if (keyvec & KEY_BIT(i)) {
            *dest++ = 'k';
            if (args[i]->set=='S' || args[i]->set=='N' || args[i]->set=='K') {
                *dest++ = 'c';
                continue;
            }
            else if (args[i]->set == 'P')
                continue;
        }

        if (args[i]->set == 'K')
            *dest++ = 'p';
        else
            *dest++ = (char)tolower((unsigned char)args[i]->set);

        if (args[i]->type & (VTCONST|VT_CONSTP)) {
            *dest++ = 'c';
        }
    }
    *dest = '\0';
}

/*

=item C<void check_op(imc_info_t * imcc, op_info_t **op_info, char *fullname,
const char *name, SymReg * const * r, int narg, int keyvec)>

Return opcode value for op name

=cut

*/

void
check_op(ARGMOD(imc_info_t * imcc), ARGOUT(op_info_t **op_info), ARGOUT(char *fullname),
        ARGIN(const char *name), ARGIN(SymReg * const * r), int narg, int keyvec)
{
    ASSERT_ARGS(check_op)
    op_fullname(fullname, name, r, narg, keyvec);
    *op_info = (op_info_t *)Parrot_hash_get(imcc->interp, imcc->interp->op_hash, fullname);
    if (*op_info && !STREQ((*op_info)->full_name, fullname))
        *op_info = NULL;
}

/*

=item C<int is_op(imc_info_t * imcc, const char *name)>

Is instruction a parrot opcode?

=cut

*/

PARROT_WARN_UNUSED_RESULT
int
is_op(ARGMOD(imc_info_t * imcc), ARGIN(const char *name))
{
    ASSERT_ARGS(is_op)
    return Parrot_hash_exists(imcc->interp, imcc->interp->op_hash, name);
}

/*

=item C<static Instruction * var_arg_ins(imc_info_t * imcc, IMC_Unit *unit,
const char *name, SymReg **r, int n, int emit)>

Create an C<Instruction> object for an instruction that takes a variable
number of arguments.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static Instruction *
var_arg_ins(ARGMOD(imc_info_t * imcc), ARGMOD(IMC_Unit *unit), ARGIN(const char *name),
        ARGMOD(SymReg **r), int n, int emit)
{
    ASSERT_ARGS(var_arg_ins)
    op_info_t *op;
    Instruction *ins;
    char fullname[64];

    /* in constant */
    int dirs       = 1;

    /* XXX: Maybe the check for n == 0 is the only one required
     * and the other must be assertions? */
    if (n == 0 || r[0] == NULL || r[0]->name == NULL)
        IMCC_fataly(imcc, EXCEPTION_SYNTAX_ERROR,
                    "The opcode '%s' needs arguments", name);

    if (r[0]->set == 'S') {
        r[0]           = mk_const(imcc, r[0]->name, 'P');
        r[0]->pmc_type = enum_class_FixedIntegerArray;
    }

    op_fullname(fullname, name, r, 1, 0);
    op = (op_info_t *)Parrot_hash_get(imcc->interp, imcc->interp->op_hash, fullname);

    PARROT_ASSERT(op && STREQ(op->full_name, fullname));

    ins         = _mk_instruction(name, "", n, r, dirs);
    ins->op     = op;
    ins->opsize = n + 1;

    if (emit)
        emitb(imcc, unit, ins);

    return ins;
}

/*

=item C<Instruction * INS(imc_info_t * imcc, IMC_Unit *unit, const char *name,
const char *fmt, SymReg **r, int n, int keyvec, int emit)>

Makes an instruction.

name   ... op name
fmt    ... optional format
regs   ... SymReg **
n      ... number of params
keyvec ... see KEY_BIT()
emit   ... if true, append to instructions

see imc.c for usage

=cut

*/

PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
Instruction *
INS(ARGMOD(imc_info_t * imcc), ARGMOD(IMC_Unit *unit), ARGIN(const char *name),
    ARGIN_NULLOK(const char *fmt), ARGIN(SymReg **r), int n, int keyvec,
    int emit)
{
    ASSERT_ARGS(INS)

    if (STREQ(name, ".annotate")) {
        Instruction *ins = _mk_instruction(name, "", n, r, 0);
        if (emit)
            return emitb(imcc, unit, ins);
        else
            return ins;
    }

    if ((STREQ(name, "set_args"))
            ||  (STREQ(name, "get_results"))
            ||  (STREQ(name, "get_params"))
            ||  (STREQ(name, "set_returns")))
        return var_arg_ins(imcc, unit, name, r, n, emit);
    else {
        Instruction *ins;
        int i, len;
        int dirs = 0;
        op_info_t *op;
        char fullname[64] = "", format[128] = "";

        op_fullname(fullname, name, r, n, keyvec);
        op = (op_info_t *)Parrot_hash_get(imcc->interp, imcc->interp->op_hash, fullname);
        if (op && !STREQ(op->full_name, fullname))
            op = NULL;

        /* maybe we have a fullname */
        if (!op) {
            op = (op_info_t *)Parrot_hash_get(imcc->interp, imcc->interp->op_hash, name);
            if (op && !STREQ(op->full_name, name))
                op = NULL;
        }

        /* still wrong, try reverse compare */
        if (!op) {
            const char * const n_name = try_rev_cmp(name, r);
            if (n_name) {
                name = n_name;
                op_fullname(fullname, name, r, n, keyvec);
                op = (op_info_t *)Parrot_hash_get(imcc->interp, imcc->interp->op_hash, fullname);
                if (op && !STREQ(op->full_name, fullname))
                    op = NULL;
            }
        }

        /* still wrong, try to find an existing op */
        if (!op)
            op = try_find_op(imcc, unit, name, r, n, keyvec, emit);

        if (!op) {
            int ok = 0;

            /* check mixed constants */
            ins = IMCC_subst_constants_umix(imcc, unit, name, r, n + 1);
            if (ins)
                goto found_ins;

            /* and finally multiple constants */
            ins = IMCC_subst_constants(imcc, unit, name, r, n + 1, &ok);

            if (ok) {
                if (ins)
                    goto found_ins;
                else
                    return NULL;
            }
        }
        else
            strcpy(fullname, name);

        if (!op)
            IMCC_fataly(imcc, EXCEPTION_SYNTAX_ERROR,
                        "The opcode '%s' (%s<%d>) was not found. "
                        "Check the type and number of the arguments",
                        fullname, name, n);

        *format = '\0';

        /* info->op_count is args + 1
         * build instruction format
         * set LV_in / out flags */
        if (n != op->op_count - 1)
            IMCC_fataly(imcc, EXCEPTION_SYNTAX_ERROR,
                    "arg count mismatch: op #%d '%s' needs %d given %d",
                    op, fullname, op->op_count-1, n);

        /* XXX Speed up some by keep track of the end of format ourselves */
        for (i = 0; i < n; i++) {
            switch (op->dirs[i]) {
              case PARROT_ARGDIR_INOUT:
                dirs |= 1 << (16 + i);
                /* go on */
              case PARROT_ARGDIR_IN:
                dirs |= 1 << i ;
                break;

              case PARROT_ARGDIR_OUT:
                dirs |= 1 << (16 + i);
                break;

              default:
                PARROT_ASSERT(0);
            };

            if (keyvec & KEY_BIT(i)) {
                /* XXX Assert that len > 2 */
                len          = strlen(format) - 2;
                PARROT_ASSERT(len >= 0);
                format[len]  = '\0';
                strcat(format, "[%s], ");
            }
            else if (r[i]->set == 'K')
                strcat(format, "[%s], ");
            else
                strcat(format, "%s, ");
        }

        len = strlen(format);
        if (len >= 2)
            len -= 2;

        format[len] = '\0';

        if (fmt && *fmt) {
            strncpy(format, fmt, sizeof (format) - 1);
            format[sizeof (format) - 1] = '\0';
        }

        IMCC_debug(imcc, DEBUG_PARSER, "%s %s\t%s\n", name, format, fullname);

        /* make the instruction */
        ins         = _mk_instruction(name, format, n, r, dirs);
        ins->keys  |= keyvec;

        /* fill in oplib's info */
        ins->op  = op;
        ins->opsize = n + 1;

        /* mark end as absolute branch */
        if (STREQ(name, "end") || STREQ(name, "ret")) {
            ins->type |= ITBRANCH | IF_goto;
        }
        else if (STREQ(name, "yield")) {
            if (!imcc->cur_unit->instructions->symregs[0])
                IMCC_fataly(imcc, EXCEPTION_SYNTAX_ERROR,
                    "Cannot yield from non-continuation\n");

            imcc->cur_unit->instructions->symregs[0]->pcc_sub->yield = 1;
        }

        /* set up branch flags
         * mark registers that are labels */
        for (i = 0; i < op->op_count - 1; i++) {
            if (op->labels[i])
                ins->type |= ITBRANCH | (1 << i);
            else {
                if (r[i]->type == VTADDRESS)
                    IMCC_fataly(imcc, EXCEPTION_SYNTAX_ERROR,
                            "undefined identifier '%s'\n", r[i]->name);
            }
        }

        if (op->jump) {
            ins->type |= ITBRANCH;
            /* TODO use opnum constants */
            if (STREQ(name, "branch")
                    ||  STREQ(name, "tailcall")
                    ||  STREQ(name, "returncc"))
                ins->type |= IF_goto;
            else if (STREQ(fullname, "jump_i")
                     ||  STREQ(fullname, "branch_i"))
                imcc->dont_optimize = 1;
        }

      found_ins:
        if (emit)
            emitb(imcc, unit, ins);

        return ins;
    }
}


/*

=item C<static int change_op_arg_to_num(imc_info_t * imcc, IMC_Unit *unit,
SymReg **r, int num, int emit)>

Change one argument of an op to be numeric in stead of integral. Used when
integer argument op variants don't exist.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
change_op_arg_to_num(ARGMOD(imc_info_t * imcc), ARGMOD(IMC_Unit *unit),
        ARGMOD(SymReg **r), int num, int emit)
{
    ASSERT_ARGS(change_op_arg_to_num)
    int changed = 0;

    if (r[num]->type & (VTCONST|VT_CONSTP)) {
        /* make a number const */
        const SymReg *c = r[num];

        if (c->type & VT_CONSTP)
            c = c->reg;

        r[num]  = mk_const(imcc, c->name, 'N');
        changed = 1;
    }
    else if (emit) {
        /* emit
        *   set $N0, Iy
        *   op  Nx, $N0
        * or
        *   op  Nx, ..., $N0
        */
        SymReg *rr[2];

        rr[0]   = mk_temp_reg(imcc, 'N');
        rr[1]   = r[num];

        INS(imcc, unit, "set", NULL, rr, 2, 0, 1);

        r[num]  = rr[0];
        changed = 1;

        /* need to allocate the temp - run reg_alloc */
        imcc->optimizer_level |= OPT_PASM;
    }

    return changed;
}

/*

=item C<static op_info_t * try_find_op(imc_info_t * imcc, IMC_Unit *unit, const
char *name, SymReg **r, int n, int keyvec, int emit)>

Try to find valid op doing the same operation e.g.

   add_n_i_n  => add_n_n_i
   div_n_ic_n => div_n_nc_n
   div_n_i_n  => set_n_i ; div_n_n_n
   ge_n_ic_ic => ge_n_nc_ic
   acos_n_i   => acos_n_n

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static op_info_t *
try_find_op(ARGMOD(imc_info_t * imcc), ARGMOD(IMC_Unit *unit), ARGIN(const char *name),
        ARGMOD(SymReg **r), int n, int keyvec, int emit)
{
    ASSERT_ARGS(try_find_op)
    char fullname[64];
    int changed = 0;

    if (n == 3 && r[0]->set == 'N') {
        if (r[1]->set == 'I') {
            const SymReg * const r1 = r[1];
            changed |= change_op_arg_to_num(imcc, unit, r, 1, emit);

            /* op Nx, Iy, Iy: reuse generated temp Nz */
            if (r[2]->set == 'I' && r[2]->type != VTADDRESS && r[2] == r1)
                r[2] = r[1];
        }

        if (r[2]->set == 'I' && r[2]->type != VTADDRESS)
            changed |= change_op_arg_to_num(imcc, unit, r, 2, emit);
    }

    /* handle eq_i_n_ic */
    else if (n == 3 && r[1]->set == 'N' && r[0]->set == 'I' &&
            r[2]->type == VTADDRESS) {
        changed |= change_op_arg_to_num(imcc, unit, r, 0, emit);
    }
    else if (n == 2 && r[0]->set == 'N' && r[1]->set == 'I') {
        /*
         * transcendentals  e.g. acos N, I
         */
        if (!STREQ(name, "fact"))
            changed = change_op_arg_to_num(imcc, unit, r, 1, emit);
    }

    if (changed) {
        op_info_t *op;
        op_fullname(fullname, name, r, n, keyvec);
        op = (op_info_t *)Parrot_hash_get(imcc->interp, imcc->interp->op_hash, fullname);
        if (op && !STREQ(op->full_name, fullname))
            op = NULL;
        return op;
    }

    return NULL;
}

/*

=item C<static const char * try_rev_cmp(const char *name, SymReg **r)>

Try to find a valid op doing the same thing by reversing comparisons.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const char *
try_rev_cmp(ARGIN(const char *name), ARGMOD(SymReg **r))
{
    ASSERT_ARGS(try_rev_cmp)
    static const struct br_pairs {
        PARROT_OBSERVER const char * const op;
        PARROT_OBSERVER const char * const nop;
        const int to_swap;
    } br_pairs[] = {
        { "gt",   "lt",   0 },
        { "ge",   "le",   0 },
        { "isgt", "islt", 1 },
        { "isge", "isle", 1 },
    };

    unsigned int i;

    for (i = 0; i < N_ELEMENTS(br_pairs); i++) {
        if (STREQ(name, br_pairs[i].op)) {
            const int to_swap = br_pairs[i].to_swap;
            SymReg *t;

            if (r[to_swap + 1]->set == 'P')
                return NULL;

            t              = r[to_swap];
            r[to_swap]     = r[to_swap + 1];
            r[to_swap + 1] = t;

            return br_pairs[i].nop;
        }
    }

    return NULL;
}


/*

=item C<int imcc_vfprintf(imc_info_t * imcc, PMC *io, const char *format,
va_list ap)>

Formats a given series of arguments per a given format string and prints it to
the given Parrot IO PMC.

=cut

*/

PARROT_IGNORABLE_RESULT
int
imcc_vfprintf(ARGMOD(imc_info_t * imcc), ARGMOD(PMC *io),
        ARGIN(const char *format), va_list ap)
{
    ASSERT_ARGS(imcc_vfprintf)
    return Parrot_io_putps(imcc->interp, io, Parrot_vsprintf_c(imcc->interp, format, ap));
}

/*

=item C<int imcc_string_ends_with(imc_info_t * imcc, const STRING *str, const
char *ext)>

Checks whether string C<str> has extension C<ext>.

=cut

*/

int
imcc_string_ends_with(ARGMOD(imc_info_t * imcc), ARGIN(const STRING *str),
        ARGIN(const char *ext))
{
    ASSERT_ARGS(imcc_string_ends_with)
    STRING *ext_str = Parrot_str_new(imcc->interp, ext, 0);
    STRING *substr;
    INTVAL  ext_len = STRING_length(ext_str);
    INTVAL  len     = STRING_length(str);

    if (ext_len >= len)
        return 0;

    substr = STRING_substr(imcc->interp, str, len - ext_len, ext_len);

    return STRING_equal(imcc->interp, substr, ext_str);
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
