/*
Copyright (C) 2001-2003, The Perl Foundation.
$Id$

=head1 NAME

src/key.c - Base vtable calling functions

=head1 DESCRIPTION

The base vtable calling functions.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/*

=item C<PMC *
key_new(Interp *interp)>

Returns a new C<Key> PMC.

=cut

*/

PMC *
key_new(Interp *interp)
{
    PMC *key = pmc_new(interp, enum_class_Key);

    return key;
}

/*

=item C<PMC *
key_new_integer(Interp *interp, INTVAL value)>

Returns a new integer C<Key> PMC with value C<value>.

=cut

*/

PMC *
key_new_integer(Interp *interp, INTVAL value)
{
    PMC *key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_integer_FLAG;
    PMC_int_val(key) = value;

    return key;
}

/*

=item C<PMC *
key_new_number(Interp *interp, FLOATVAL value)>

Returns a new number C<Key> PMC with value C<value>.

=cut

*/

PMC *
key_new_number(Interp *interp, FLOATVAL value)
{
    PMC *key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_number_FLAG;
    PMC_num_val(key) = value;

    return key;
}

/*

=item C<PMC *
key_new_string(Interp *interp, STRING *value)>

Returns a new string C<Key> PMC with value C<value>.

=cut

*/

PMC *
key_new_string(Interp *interp, STRING *value)
{
    PMC *key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_string_FLAG;
    PMC_str_val(key) = value;

    return key;
}

/*

=item C<PMC *
key_new_cstring(Interp *interp, const char *value)>

Returns a new string C<Key> PMC with value C<value> converted to a
C<STRING>.

=cut

*/

PMC *
key_new_cstring(Interp *interp, const char *value)
{
    return key_new_string(interp,
            string_from_cstring(interp, value, 0));
}

/*

=item C<PMC *
key_new_pmc(Interp *interp, PMC *value)>

Returns a new PMC C<Key> PMC with value C<value>.

=cut

*/

PMC *
key_new_pmc(Interp *interp, PMC *value)
{
    PMC *key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_pmc_FLAG;
    internal_exception(1, "this is broken - see slice.pmc");
    PMC_pmc_val(key) = value;

    return key;
}

/*

=item C<void
key_set_integer(Interp *interp, PMC *key, INTVAL value)>

Set the integer C<value> in C<key>.

=cut

*/

void
key_set_integer(Interp *interp, PMC *key, INTVAL value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_integer_FLAG;
    PMC_int_val(key) = value;

    return;
}

/*

=item C<void
key_set_register(Interp *interp, PMC *key, INTVAL value,
                 INTVAL flag)>

Set the register C<value> in C<key>.

=cut

*/

void
key_set_register(Interp *interp, PMC *key, INTVAL value,
                 INTVAL flag)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_register_FLAG | flag;
    PMC_int_val(key) = value;

    return;
}

/*

=item C<void
key_set_number(Interp *interp, PMC *key, FLOATVAL value)>

Set the number C<value> in C<key>.

=cut

*/

void
key_set_number(Interp *interp, PMC *key, FLOATVAL value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_number_FLAG;
    PMC_num_val(key) = value;

    return;
}

/*

=item C<void
key_set_string(Interp *interp, PMC *key, STRING *value)>

Set the string C<value> in C<key>.

=cut

*/

void
key_set_string(Interp *interp, PMC *key, STRING *value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_string_FLAG;
    PMC_str_val(key) = value;

    return;
}

/*

=item C<void
key_set_pmc(Interp *interp, PMC *key, PMC *value)>

Set the PMC C<value> in C<key>.

=cut

*/

void
key_set_pmc(Interp *interp, PMC *key, PMC *value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_pmc_FLAG;
    /*
     * XXX leo
     * what for is this indirection?
     */
    internal_exception(1, "this is broken - see slice.pmc");
    PMC_pmc_val(key) = value;

    return;
}

/*

=item C<INTVAL
key_type(Interp *interp, PMC *key)>

Returns the type of C<key>.

=cut

*/

INTVAL
key_type(Interp *interp, PMC *key)
{
    return (PObj_get_FLAGS(key) & KEY_type_FLAGS) & ~KEY_register_FLAG;
}

/*

=item C<INTVAL
key_integer(Interp *interp, PMC *key)>

=cut

*/

INTVAL
key_integer(Interp *interp, PMC *key)
{
    PMC *reg;
    STRING *s_reg;

    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_hash_iterator_FLAGS:
    case KEY_integer_FLAG:
        return PMC_int_val(key);
    case KEY_integer_FLAG | KEY_register_FLAG:
        return REG_INT(PMC_int_val(key));
    case KEY_pmc_FLAG | KEY_register_FLAG:
        reg = REG_PMC(PMC_int_val(key));
        return VTABLE_get_integer(interp, reg);
    case KEY_string_FLAG:
        return string_to_int(interp, PMC_str_val(key));
    case KEY_string_FLAG | KEY_register_FLAG:
        s_reg = REG_STR(PMC_int_val(key));
        return string_to_int(interp, s_reg);
    default:
        /* TODO check for slice_FLAGs */
        return VTABLE_get_integer(interp, key);
    }
}

/*

=item C<FLOATVAL
key_number(Interp *interp, PMC *key)>

=cut

*/

FLOATVAL
key_number(Interp *interp, PMC *key)
{
    PMC *reg;

    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_number_FLAG:
        return PMC_num_val(key);
    case KEY_number_FLAG | KEY_register_FLAG:
        return REG_NUM(PMC_int_val(key));
    case KEY_pmc_FLAG:
        return VTABLE_get_number(interp, key);
                                                 /*  PMC_pmc_val(key)); */
    case KEY_pmc_FLAG | KEY_register_FLAG:
        reg = REG_PMC(PMC_int_val(key));
        return VTABLE_get_number(interp, reg);
    default:
        internal_exception(INVALID_OPERATION, "Key not a number!\n");
        return 0;
    }
}

/*

=item C<STRING *
key_string(Interp *interp, PMC *key)>

=cut

*/

STRING *
key_string(Interp *interp, PMC *key)
{
    PMC *reg;

    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_string_FLAG:
        return PMC_str_val(key);
    case KEY_string_FLAG | KEY_register_FLAG:
        return REG_STR(PMC_int_val(key));
                                                   /*   PMC_pmc_val(key)); */
    case KEY_pmc_FLAG | KEY_register_FLAG:
        reg = REG_PMC(PMC_int_val(key));
        return VTABLE_get_string(interp, reg);
    case KEY_integer_FLAG:
        return string_from_int(interp, PMC_int_val(key));
    case KEY_integer_FLAG | KEY_register_FLAG:
        return string_from_int(interp, REG_INT(PMC_int_val(key)));
    default:
    case KEY_pmc_FLAG:
        return VTABLE_get_string(interp, key);
    }
}

/*

=item C<PMC *
key_pmc(Interp *interp, PMC *key)>

These functions return the integer/number/string/PMC values of C<key> if
possible. Otherwise they throws an exceptions.

=cut

*/

PMC *
key_pmc(Interp *interp, PMC *key)
{
    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_pmc_FLAG | KEY_register_FLAG:
        return REG_PMC(PMC_int_val(key));
    default:
        return key; /* PMC_pmc_val(key); */
    }
}

/*

=item C<PMC *
key_next(Interp *interp, PMC *key)>

Returns the next key if C<key> is in a sequence of linked keys.

=cut

*/

PMC *
key_next(Interp *interp, PMC *key)
{
    if (!key->pmc_ext)
        return NULL;
    return PMC_data(key);
}

/*

=item C<PMC *
key_append(Interp *interp, PMC *key1, PMC *key2)>

Appends C<key2> to C<key1>.

Note that if C<key1> is not the last key in a sequence linked keys then
the last key will be found and C<key2> appended to that.

Returns C<key1>.

=cut

*/

PMC *
key_append(Interp *interp, PMC *key1, PMC *key2)
{
    PMC *tail = key1;

    while (PMC_data(tail)) {
        tail = PMC_data(tail);
    }

    PMC_data(tail) = key2;

    return key1;
}

/*

=item C<void
key_mark(Interp *interp, PMC *key)>

Marks C<key> as live.

=cut

*/

void
key_mark(Interp *interp, PMC *key)
{
    UINTVAL flags;

    flags = PObj_get_FLAGS(key) & KEY_type_FLAGS;
    if (flags == KEY_string_FLAG)
        pobject_lives(interp, (PObj *)PMC_str_val(key));
    /*
     * KEY_hash_iterator_FLAGS denote a hash key iteration, PMC_data() is
     * the bucket_index and not the next key component
     */
    if (flags == KEY_hash_iterator_FLAGS)
        return;

    /* if iteration hasn't started, above flag isn't set yet */
    if (PMC_data(key) && PMC_data(key) != (void *)INITBucketIndex)
        pobject_lives(interp, (PObj *)PMC_data(key));

}

/*

=back

=head1 SEE ALSO

F<include/parrot/key.h>.

=head1 HISTORY

Initial version by Jeff G. on 2001.12.05.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
