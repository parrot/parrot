/*
Copyright: 2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/mmd_fallback.c - Multimethod dispatch fallback functions

=head1 DESCRIPTION

Fallback functions are called as the last resort, if for a
given left argument type no matching MMD function is found.

=head2 MMD Fallback Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

/*

=item C<void
register_fallback_methods(Parrot_Interp interp)>

Calls C<mmd_add_function()> for each MMD 'fallback' function. These are the
functions that are called when we don't know how to do MMD for a
vtable function.

=cut

*/

/*

=item C<void
mmd_fallback_add_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets numbers from C<left> and C<right>, adds them and saves the result
in C<dest>.

=cut

*/

static void
mmd_fallback_add_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    FLOATVAL result = (VTABLE_get_number(interp, left) +
                       VTABLE_get_number(interp, right));
    VTABLE_set_number_native(interp, dest, result);
}

/*

=item C<void
mmd_fallback_add_int(Parrot_Interp interp, PMC *left, INTVAL right, PMC *dest)>

Gets number from C<left> add to C<right>, and save the result in
C<dest>.

=cut

*/

static void
mmd_fallback_add_int(Parrot_Interp interp, PMC *left, INTVAL right, PMC *dest)
{
    FLOATVAL result = VTABLE_get_number(interp, left) + right;
    VTABLE_set_number_native(interp, dest, result);
}

static void
mmd_fallback_add_float(Parrot_Interp interp, PMC *left, FLOATVAL right,
        PMC *dest)
{
    FLOATVAL result = VTABLE_get_number(interp, left) + right;
    VTABLE_set_number_native(interp, dest, result);
}

/*

=item C<void
mmd_fallback_subtract_pmc(Parrot_Interp interp,
        PMC *left, PMC *right, PMC *dest)>

Gets numbers from C<left> and C<right>, does the subtraction and sets
the result as a number in C<dest>.

=cut

*/

static void
mmd_fallback_subtract_pmc(Parrot_Interp interp,
        PMC *left, PMC *right, PMC *dest)
{
    FLOATVAL result = (VTABLE_get_number(interp, left) -
                       VTABLE_get_number(interp, right));
    VTABLE_set_number_native(interp, dest, result);

}

static void
mmd_fallback_subtract_int(Parrot_Interp interp,
        PMC *left, INTVAL right, PMC *dest)
{
    FLOATVAL result = VTABLE_get_number(interp, left) - right;
    VTABLE_set_number_native(interp, dest, result);

}

static void
mmd_fallback_subtract_float(Parrot_Interp interp,
        PMC *left, FLOATVAL right, PMC *dest)
{
    FLOATVAL result = VTABLE_get_number(interp, left) - right;
    VTABLE_set_number_native(interp, dest, result);

}
/*

=item C<void
mmd_fallback_multiply_pmc(Parrot_Interp interp,
        PMC *left, PMC *right, PMC *dest)>

Gets numbers from C<left> and C<right>, multiplies them and sets the
result as a number in C<dest>.

=cut

*/

static void
mmd_fallback_multiply_pmc(Parrot_Interp interp,
        PMC *left, PMC *right, PMC *dest)
{
    FLOATVAL result = VTABLE_get_number(interp, left) *
                       VTABLE_get_number(interp, right);
    VTABLE_set_number_native(interp, dest, result);
}

static void
mmd_fallback_multiply_int(Parrot_Interp interp,
        PMC *left, INTVAL right, PMC *dest)
{
    FLOATVAL result = VTABLE_get_number(interp, left) * right;
    VTABLE_set_number_native(interp, dest, result);
}

static void
mmd_fallback_multiply_float(Parrot_Interp interp,
        PMC *left, FLOATVAL right, PMC *dest)
{
    FLOATVAL result = VTABLE_get_number(interp, left) * right;
    VTABLE_set_number_native(interp, dest, result);
}

/*

=item C<void
mmd_fallback_divide_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets numbers from C<left> and C<right>, performs the division and sets
the result as a number in C<dest>.

=cut

*/

static void
mmd_fallback_divide_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest) {
    FLOATVAL result = (VTABLE_get_number(interp, left) /
                       VTABLE_get_number(interp, right));
    VTABLE_set_number_native(interp, dest, result);

}

static void
mmd_fallback_divide_int(Parrot_Interp interp, PMC *left, INTVAL right,
        PMC *dest) {
    FLOATVAL result = VTABLE_get_number(interp, left) / right;
    VTABLE_set_number_native(interp, dest, result);

}

static void
mmd_fallback_divide_float(Parrot_Interp interp, PMC *left, FLOATVAL right,
        PMC *dest) {
    FLOATVAL result = VTABLE_get_number(interp, left) / right;
    VTABLE_set_number_native(interp, dest, result);

}

/*

=item C<void
mmd_fallback_cmod_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets integers from C<left> and C<right>, performs a C C<mod> (C<%>) and
sets the result as an integer in C<dest>.

=cut

*/

static void
mmd_fallback_cmod_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    VTABLE_set_number_native(interp, dest,
                             VTABLE_get_integer(interp, left) %
                             VTABLE_get_integer(interp, right));
}

static void
mmd_fallback_cmod_int(Parrot_Interp interp, PMC *left, INTVAL right, PMC *dest)
{
    VTABLE_set_number_native(interp, dest,
                             VTABLE_get_integer(interp, left) % right);
}

static void
mmd_fallback_cmod_float(Parrot_Interp interp, PMC *left, FLOATVAL right,
        PMC *dest)
{
    VTABLE_set_number_native(interp, dest,
                             VTABLE_get_integer(interp, left) % (INTVAL)right);
}

/*

=item C<void
mmd_fallback_mod_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets numbers from C<left> and C<right>, performs a C<floatval_mod> and
sets the result as a number in C<dest>.

=cut

*/

static void
mmd_fallback_mod_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    FLOATVAL result = floatval_mod(VTABLE_get_number(interp, left),
                                   VTABLE_get_number(interp, right));
    VTABLE_set_number_native(interp, dest, result);
}

static void
mmd_fallback_mod_int(Parrot_Interp interp, PMC *left, INTVAL right, PMC *dest)
{
    FLOATVAL result = floatval_mod(VTABLE_get_number(interp, left), right);
    VTABLE_set_number_native(interp, dest, result);
}

static void
mmd_fallback_mod_float(Parrot_Interp interp, PMC *left, FLOATVAL right,
        PMC *dest)
{
    FLOATVAL result = floatval_mod(VTABLE_get_number(interp, left), right);
    VTABLE_set_number_native(interp, dest, result);
}

/*

=item C<void
mmd_fallback_band_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets numbers from C<left> and C<right>, performs a binary C<and> and
sets the result as an integer in C<dest>.

=cut

*/

static void
mmd_fallback_band_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    VTABLE_set_integer_native(interp, dest,
                              VTABLE_get_integer(interp, left) &
                              VTABLE_get_integer(interp, right));
}

static void
mmd_fallback_band_int(Parrot_Interp interp, PMC *left, INTVAL right, PMC *dest)
{
    VTABLE_set_integer_native(interp, dest,
                              VTABLE_get_integer(interp, left) & right);
}

/*

=item C<void
mmd_fallback_bor_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets integers from C<left> and C<right>, performs a binary C<or> and
sets the result as an integer in C<dest>.

=cut

*/

static void
mmd_fallback_bor_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    VTABLE_set_integer_native(interp, dest,
                              VTABLE_get_integer(interp, left) |
                              VTABLE_get_integer(interp, right));
}

static void
mmd_fallback_bor_int(Parrot_Interp interp, PMC *left, INTVAL right, PMC *dest)
{
    VTABLE_set_integer_native(interp, dest,
                              VTABLE_get_integer(interp, left) | right);
}

/*

=item C<void
mmd_fallback_bxor_pmc(Parrot_Interp, PMC *left, PMC *right, PMC *dest)>

=item C<void
mmd_fallback_bxor_int(Parrot_Interp, PMC *left, INTVAL right, PMC *dest)>

Gets integers from C<left> and C<right>, performs a binary C<xor> and
sets the result as an integer in C<dest>.

=cut

*/

static void
mmd_fallback_bxor_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    VTABLE_set_integer_native(interp, dest,
                              VTABLE_get_integer(interp, left) ^
                              VTABLE_get_integer(interp, right));
}

static void
mmd_fallback_bxor_int(Parrot_Interp interp, PMC *left, INTVAL right, PMC *dest)
{
    VTABLE_set_integer_native(interp, dest,
                              VTABLE_get_integer(interp, left) ^
                              right);
}
/*

=item C<void
mmd_fallback_bsl_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets integers from C<left> and C<right>, performs a binary shift left
(C<<< << >>>) and sets the result as an integer in C<dest>.

=cut

*/

static void
mmd_fallback_bsl_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    VTABLE_set_integer_native(interp, dest,
                              VTABLE_get_integer(interp, left) <<
                              VTABLE_get_integer(interp, right));
}

static void
mmd_fallback_bsl_int(Parrot_Interp interp, PMC *left, INTVAL right, PMC *dest)
{
    VTABLE_set_integer_native(interp, dest,
                              VTABLE_get_integer(interp, left) << right);
}

/*

=item C<void
mmd_fallback_bsr_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets integers from C<left> and C<right>, performs a binary shift right
(C<<< >> >>>) and sets the result as an integer in C<dest>.

=cut

*/

static void
mmd_fallback_bsr_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    VTABLE_set_integer_native(interp, dest,
                              VTABLE_get_integer(interp, left) >>
                              VTABLE_get_integer(interp, right));
}

static void
mmd_fallback_bsr_int(Parrot_Interp interp, PMC *left, INTVAL right, PMC *dest)
{
    VTABLE_set_integer_native(interp, dest,
                              VTABLE_get_integer(interp, left) >> right);
}

/*

=item C<void
mmd_fallback_concat_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets strings from C<left> and C<right>, performs the concatenation and
sets the result as an string in C<dest>.

=cut

*/

static void
mmd_fallback_concat_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    STRING *left_str, *right_str, *total_string;
    left_str = VTABLE_get_string(interp, left);
    right_str = VTABLE_get_string(interp, right);
    total_string = string_concat(interp, left_str, right_str, 0);
    VTABLE_set_string_native(interp, dest, total_string);

}

static void
mmd_fallback_concat_str(Parrot_Interp interp, PMC *left, STRING *right,
        PMC *dest)
{
    STRING *left_str, *total_string;
    left_str = VTABLE_get_string(interp, left);
    total_string = string_concat(interp, left_str, right, 0);
    VTABLE_set_string_native(interp, dest, total_string);

}

/*

=item C<void
mmd_fallback_land_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets boolean values from C<left> and C<right>, performs a logical C<and>
and sets the result as an string in C<dest>.

=cut

*/

static void
mmd_fallback_land_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    PMC *truth;
    if (!VTABLE_get_bool(interp, left)) {
        truth = left;
    } else {
        truth = right;
    }
    VTABLE_set_pmc(interp, dest, truth);
}

/*

=item C<void
mmd_fallback_lor_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets boolean values from C<left> and C<right>, performs a logical C<or>
and sets the result as an string in C<dest>.

=cut

*/

static void
mmd_fallback_lor_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    PMC *truth;
    if (VTABLE_get_bool(interp, left)) {
        truth = left;
    } else {
        truth = right;
    }
    VTABLE_set_pmc(interp, dest, truth);
}

/*

=item C<void
mmd_fallback_lxor_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets boolean values from C<left> and C<right>, performs a logical C<xor>
and sets the result as an string in C<dest>.

=cut

*/

static void
mmd_fallback_lxor_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    INTVAL left_truth, right_truth;
    PMC *true;
    left_truth = VTABLE_get_bool(interp, left);
    right_truth = VTABLE_get_bool(interp, left);
    /* Are they both false? That's the easy case */
    if ((left_truth && right_truth) || (!left_truth && !right_truth)) {
        true = constant_pmc_new_noinit(interp, enum_class_PerlUndef);
    } else {
        if (left_truth) {
            true = left;
        } else {
            true = right;
        }
    }
    VTABLE_set_pmc(interp, dest, true);
}

/*

=item C<void
mmd_fallback_repeat_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)>

Gets a string from C<left> and an integer C<right>, repeats the string
the specified number of times, and sets the result as an string in
C<dest>.

=cut

*/

static void
mmd_fallback_repeat_pmc(Parrot_Interp interp, PMC *left, PMC *right, PMC *dest)
{
    STRING *base;
    INTVAL count;

    base = VTABLE_get_string(interp, left);
    count = VTABLE_get_integer(interp, right);

    VTABLE_set_string_native(interp, dest,
                             string_repeat(interp, base, count, NULL));
}

/*

=item C<INTVAL
mmd_fallback_numeq_pmc(Parrot_Interp interp, PMC *left, PMC *right)>

=item C<INTVAL
mmd_fallback_eq_pmc(Parrot_Interp interp, PMC *left, PMC *right)>

Gets numbers from C<left> and C<right>, performs a numeric equals
and sets the result as an string in C<dest>.

=cut

*/

static INTVAL
mmd_fallback_numeq_pmc(Parrot_Interp interp, PMC *left, PMC *right)
{
    if (VTABLE_get_number(interp, left) == VTABLE_get_number(interp, right)) {
        return 1;
    } else {
        return 0;
    }
}

/*

=item C<INTVAL
mmd_fallback_streq_pmc(Parrot_Interp interp, PMC *left, PMC *right)>

Gets numbers from C<left> and C<right>, performs a string equals
and sets the result as an string in C<dest>.

=cut

*/

static INTVAL
mmd_fallback_streq_pmc(Parrot_Interp interp, PMC *left, PMC *right)
{
    if (string_compare(interp, VTABLE_get_string(interp, left),
                VTABLE_get_string(interp, right))) {
        return 1;
    } else {
        return 0;
    }
}

/*

=item C<INTVAL
mmd_fallback_numcmp_pmc(Parrot_Interp interp, PMC *left, PMC *right)>

=item C<INTVAL
mmd_fallback_cmp_pmc(Parrot_Interp interp, PMC *left, PMC *right)>

Gets numbers from C<left> and C<right>, performs a numeric comparison
and sets the result as an string in C<dest>.

=cut

*/

static INTVAL
mmd_fallback_numcmp_pmc(Parrot_Interp interp, PMC *left, PMC *right)
{
    FLOATVAL left_float, right_float;
    INTVAL cmp_val;

    left_float = VTABLE_get_number(interp, left);
    right_float = VTABLE_get_number(interp, right);

    if (left_float == right_float) {
        cmp_val = 0;
    } else {
        if (left_float > right_float) {
            cmp_val = 1;
        } else {
            cmp_val = -1;
        }
    }

    return cmp_val;
}

/*

=item C<INTVAL
mmd_fallback_strcmp_pmc(Parrot_Interp interp, PMC *left, PMC *right)>

Gets strings from C<left> and C<right>, performs a string comparison
and sets the result as an string in C<dest>.

=cut

*/

static INTVAL
mmd_fallback_strcmp_pmc(Parrot_Interp interp, PMC *left, PMC *right)
{
    return string_compare(interp, VTABLE_get_string(interp, left),
            VTABLE_get_string(interp, right));
}

/*

=item C<void
mmd_fallback_stringor_pmc(Parrot_Interp interp, PMC *left, PMC *right,
                          PMC *dest)>

Gets strings from C<left> and C<right>, performs a string bitwise C<or>
and sets the result as an string in C<dest>.

=cut

*/

static void
mmd_fallback_stringor_pmc(Parrot_Interp interp, PMC *left, PMC *right,
        PMC *dest)
{
    VTABLE_set_string_native(interp, dest,
            string_bitwise_or(interp,
                VTABLE_get_string(interp, left),
                VTABLE_get_string(interp, right), NULL));
}

static void
mmd_fallback_stringor_str(Parrot_Interp interp, PMC *left, STRING *right,
        PMC *dest)
{
    VTABLE_set_string_native(interp, dest,
            string_bitwise_or(interp,
                VTABLE_get_string(interp, left), right, NULL));
}

/*

=item C<mmd_fallback_stringand_pmc(Parrot_Interp interp, PMC *left,
                                   PMC *right, PMC *dest)>

Gets strings from C<left> and C<right>, performs a string bitwise C<and>
and sets the result as an string in C<dest>.

=cut

*/

static void
mmd_fallback_stringand_pmc(Parrot_Interp interp, PMC *left, PMC *right,
        PMC *dest)
{
    VTABLE_set_string_native(interp, dest,
            string_bitwise_and(interp,
                VTABLE_get_string(interp, left),
                VTABLE_get_string(interp, right), NULL));
}

static void
mmd_fallback_stringand_str(Parrot_Interp interp, PMC *left, STRING *right,
        PMC *dest)
{
    VTABLE_set_string_native(interp, dest,
            string_bitwise_and(interp,
                VTABLE_get_string(interp, left), right, NULL));
}

/*

=item C<mmd_fallback_stringxor_pmc(Parrot_Interp interp, PMC *left,
                                   PMC *right, PMC *dest)>

Gets strings from C<left> and C<right>, performs a string bitwise C<xor>
and sets the result as an string in C<dest>.

=cut

*/

static void
mmd_fallback_stringxor_pmc(Parrot_Interp interp, PMC *left, PMC *right,
        PMC *dest)
{
    VTABLE_set_string_native(interp, dest,
            string_bitwise_xor(interp,
                VTABLE_get_string(interp, left),
                VTABLE_get_string(interp, right), NULL));
}

static void
mmd_fallback_stringxor_str(Parrot_Interp interp, PMC *left, STRING *right,
        PMC *dest)
{
    VTABLE_set_string_native(interp, dest,
            string_bitwise_xor(interp,
                VTABLE_get_string(interp, left),
                right, NULL));
}

void
register_fallback_methods(Parrot_Interp interp) {
    /* Yeah, this first one's out of order logically, but it means
       the table doesn't have to keep being re-malloc'd */
    mmd_add_function(interp, MMD_SXOR_STR,
            (funcptr_t)mmd_fallback_stringxor_str);
    mmd_add_function(interp, MMD_ADD, (funcptr_t)mmd_fallback_add_pmc);
    mmd_add_function(interp, MMD_ADD_INT, (funcptr_t)mmd_fallback_add_int);
    mmd_add_function(interp, MMD_SUBTRACT,
            (funcptr_t)mmd_fallback_subtract_pmc);
    mmd_add_function(interp, MMD_SUBTRACT_INT,
            (funcptr_t)mmd_fallback_subtract_int);
    mmd_add_function(interp, MMD_SUBTRACT_FLOAT,
            (funcptr_t)mmd_fallback_subtract_float);
    mmd_add_function(interp, MMD_MULTIPLY,
            (funcptr_t)mmd_fallback_multiply_pmc);
    mmd_add_function(interp, MMD_MULTIPLY_INT,
            (funcptr_t)mmd_fallback_multiply_int);
    mmd_add_function(interp, MMD_MULTIPLY_FLOAT,
            (funcptr_t)mmd_fallback_multiply_float);
    mmd_add_function(interp, MMD_DIVIDE, (funcptr_t)mmd_fallback_divide_pmc);
    mmd_add_function(interp, MMD_DIVIDE_INT,
            (funcptr_t)mmd_fallback_divide_int);
    mmd_add_function(interp, MMD_DIVIDE_FLOAT,
            (funcptr_t)mmd_fallback_divide_float);
    mmd_add_function(interp, MMD_MOD, (funcptr_t)mmd_fallback_mod_pmc);
    mmd_add_function(interp, MMD_MOD_INT, (funcptr_t)mmd_fallback_mod_int);
    mmd_add_function(interp, MMD_MOD_FLOAT, (funcptr_t)mmd_fallback_mod_float);
    mmd_add_function(interp, MMD_CMOD, (funcptr_t)mmd_fallback_cmod_pmc);
    mmd_add_function(interp, MMD_CMOD_INT, (funcptr_t)mmd_fallback_cmod_int);
    mmd_add_function(interp, MMD_CMOD_FLOAT,
            (funcptr_t)mmd_fallback_cmod_float);
    mmd_add_function(interp, MMD_BAND, (funcptr_t)mmd_fallback_band_pmc);
    mmd_add_function(interp, MMD_BAND_INT, (funcptr_t)mmd_fallback_band_int);
    mmd_add_function(interp, MMD_BOR, (funcptr_t)mmd_fallback_bor_pmc);
    mmd_add_function(interp, MMD_BOR_INT, (funcptr_t)mmd_fallback_bor_int);
    mmd_add_function(interp, MMD_BXOR, (funcptr_t)mmd_fallback_bxor_pmc);
    mmd_add_function(interp, MMD_BXOR_INT, (funcptr_t)mmd_fallback_bxor_int);
    mmd_add_function(interp, MMD_BSL, (funcptr_t)mmd_fallback_bsl_pmc);
    mmd_add_function(interp, MMD_BSL_INT, (funcptr_t)mmd_fallback_bsl_int);
    mmd_add_function(interp, MMD_BSR, (funcptr_t)mmd_fallback_bsr_pmc);
    mmd_add_function(interp, MMD_BSR_INT, (funcptr_t)mmd_fallback_bsr_int);
    mmd_add_function(interp, MMD_CONCAT, (funcptr_t)mmd_fallback_concat_pmc);
    mmd_add_function(interp, MMD_CONCAT_STR,
            (funcptr_t)mmd_fallback_concat_str);
    mmd_add_function(interp, MMD_LAND, (funcptr_t)mmd_fallback_land_pmc);
    mmd_add_function(interp, MMD_LOR, (funcptr_t)mmd_fallback_lor_pmc);
    mmd_add_function(interp, MMD_LXOR, (funcptr_t)mmd_fallback_lxor_pmc);
    mmd_add_function(interp, MMD_REPEAT, (funcptr_t)mmd_fallback_repeat_pmc);
    mmd_add_function(interp, MMD_EQ, (funcptr_t)mmd_fallback_numeq_pmc);
    mmd_add_function(interp, MMD_NUMEQ, (funcptr_t)mmd_fallback_numeq_pmc);
    mmd_add_function(interp, MMD_STREQ, (funcptr_t)mmd_fallback_streq_pmc);
    mmd_add_function(interp, MMD_CMP, (funcptr_t)mmd_fallback_numcmp_pmc);
    mmd_add_function(interp, MMD_NUMCMP, (funcptr_t)mmd_fallback_numcmp_pmc);
    mmd_add_function(interp, MMD_STRCMP, (funcptr_t)mmd_fallback_strcmp_pmc);
    mmd_add_function(interp, MMD_SOR, (funcptr_t)mmd_fallback_stringor_pmc);
    mmd_add_function(interp, MMD_SOR_STR, (funcptr_t)mmd_fallback_stringor_str);
    mmd_add_function(interp, MMD_SAND, (funcptr_t)mmd_fallback_stringand_pmc);
    mmd_add_function(interp, MMD_SAND_STR,
            (funcptr_t)mmd_fallback_stringand_str);
    mmd_add_function(interp, MMD_SXOR, (funcptr_t)mmd_fallback_stringxor_pmc);
}

/*

=back

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
