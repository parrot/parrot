/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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
key_new(Interp *interpreter)>

Returns a new C<Key> PMC.

=cut

*/

PMC *
key_new(Interp *interpreter)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    return key;
}

/*

=item C<PMC *
key_new_integer(Interp *interpreter, INTVAL value)>

Returns a new integer C<Key> PMC with value C<value>.

=cut

*/

PMC *
key_new_integer(Interp *interpreter, INTVAL value)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_integer_FLAG;
    PMC_int_val(key) = value;

    return key;
}

/*

=item C<PMC *
key_new_number(Interp *interpreter, FLOATVAL value)>

Returns a new number C<Key> PMC with value C<value>.

=cut

*/

PMC *
key_new_number(Interp *interpreter, FLOATVAL value)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_number_FLAG;
    PMC_num_val(key) = value;

    return key;
}

/*

=item C<PMC *
key_new_string(Interp *interpreter, STRING *value)>

Returns a new string C<Key> PMC with value C<value>.

=cut

*/

PMC *
key_new_string(Interp *interpreter, STRING *value)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_string_FLAG;
    PMC_str_val(key) = value;

    return key;
}

/*

=item C<PMC *
key_new_cstring(Interp *interpreter, const char *value)>

Returns a new string C<Key> PMC with value C<value> converted to a
C<STRING>.

=cut

*/

PMC *
key_new_cstring(Interp *interpreter, const char *value)
{
    return key_new_string(interpreter,
            string_from_cstring(interpreter, value, 0));
}

/*

=item C<PMC *
key_new_pmc(Interp *interpreter, PMC *value)>

Returns a new PMC C<Key> PMC with value C<value>.

=cut

*/

PMC *
key_new_pmc(Interp *interpreter, PMC *value)
{
    PMC *key = pmc_new(interpreter, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_pmc_FLAG;
    internal_exception(1, "this is broken - see slice.pmc");
    PMC_pmc_val(key) = value;

    return key;
}

/*

=item C<void
key_set_integer(Interp *interpreter, PMC *key, INTVAL value)>

Set the integer C<value> in C<key>.

=cut

*/

void
key_set_integer(Interp *interpreter, PMC *key, INTVAL value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_integer_FLAG;
    PMC_int_val(key) = value;

    return;
}

/*

=item C<void
key_set_register(Interp *interpreter, PMC *key, INTVAL value,
                 INTVAL flag)>

Set the register C<value> in C<key>.

=cut

*/

void
key_set_register(Interp *interpreter, PMC *key, INTVAL value,
                 INTVAL flag)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_register_FLAG | flag;
    PMC_int_val(key) = value;

    return;
}

/*

=item C<void
key_set_number(Interp *interpreter, PMC *key, FLOATVAL value)>

Set the number C<value> in C<key>.

=cut

*/

void
key_set_number(Interp *interpreter, PMC *key, FLOATVAL value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_number_FLAG;
    PMC_num_val(key) = value;

    return;
}

/*

=item C<void
key_set_string(Interp *interpreter, PMC *key, STRING *value)>

Set the string C<value> in C<key>.

=cut

*/

void
key_set_string(Interp *interpreter, PMC *key, STRING *value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_string_FLAG;
    PMC_str_val(key) = value;

    return;
}

/*

=item C<void
key_set_pmc(Interp *interpreter, PMC *key, PMC *value)>

Set the PMC C<value> in C<key>.

=cut

*/

void
key_set_pmc(Interp *interpreter, PMC *key, PMC *value)
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
key_type(Interp *interpreter, PMC *key)>

Returns the type of C<key>.

=cut

*/

INTVAL
key_type(Interp *interpreter, PMC *key)
{
    return (PObj_get_FLAGS(key) & KEY_type_FLAGS) & ~KEY_register_FLAG;
}

/*

=item C<INTVAL
key_integer(Interp *interpreter, PMC *key)>

=cut

*/

INTVAL
key_integer(Interp *interpreter, PMC *key)
{
    PMC *reg;

    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_hash_iterator_FLAGS:
    case KEY_integer_FLAG:
        return PMC_int_val(key);
    case KEY_integer_FLAG | KEY_register_FLAG:
        return REG_INT(PMC_int_val(key));
    case KEY_pmc_FLAG | KEY_register_FLAG:
        reg = REG_PMC(PMC_int_val(key));
        return VTABLE_get_integer(interpreter, reg);
    default:
        return VTABLE_get_integer(interpreter,  key);
    }
}

/*

=item C<FLOATVAL
key_number(Interp *interpreter, PMC *key)>

=cut

*/

FLOATVAL
key_number(Interp *interpreter, PMC *key)
{
    PMC *reg;

    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_number_FLAG:
        return PMC_num_val(key);
    case KEY_number_FLAG | KEY_register_FLAG:
        return REG_NUM(PMC_int_val(key));
    case KEY_pmc_FLAG:
        return VTABLE_get_number(interpreter, key);
                                                 /*  PMC_pmc_val(key)); */
    case KEY_pmc_FLAG | KEY_register_FLAG:
        reg = REG_PMC(PMC_int_val(key));
        return VTABLE_get_number(interpreter, reg);
    default:
        internal_exception(INVALID_OPERATION, "Key not a number!\n");
        return 0;
    }
}

/*

=item C<STRING *
key_string(Interp *interpreter, PMC *key)>

=cut

*/

STRING *
key_string(Interp *interpreter, PMC *key)
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
        return VTABLE_get_string(interpreter, reg);
    case KEY_integer_FLAG:
        return string_from_int(interpreter, PMC_int_val(key));
    case KEY_integer_FLAG | KEY_register_FLAG:
        return string_from_int(interpreter, REG_INT(PMC_int_val(key)));
    default:
    case KEY_pmc_FLAG:
        return VTABLE_get_string(interpreter, key);
    }
}

/*

=item C<PMC *
key_pmc(Interp *interpreter, PMC *key)>

These functions return the integer/number/string/PMC values of C<key> if
possible. Otherwise they throws an exceptions.

=cut

*/

PMC *
key_pmc(Interp *interpreter, PMC *key)
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
key_next(Interp *interpreter, PMC *key)>

Returns the next key if C<key> is in a sequence of linked keys.

=cut

*/

PMC *
key_next(Interp *interpreter, PMC *key)
{
    if (!key->pmc_ext)
        return NULL;
    return PMC_data(key);
}

/*

=item C<PMC *
key_append(Interp *interpreter, PMC *key1, PMC *key2)>

Appends C<key2> to C<key1>.

Note that if C<key1> is not the last key in a sequence linked keys then
the last key will be found and C<key2> appended to that.

Returns C<key1>.

=cut

*/

PMC *
key_append(Interp *interpreter, PMC *key1, PMC *key2)
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
key_mark(Interp *interpreter, PMC *key)>

Marks C<key> as live.

=cut

*/

void
key_mark(Interp *interpreter, PMC *key)
{
    UINTVAL flags;

    flags = PObj_get_FLAGS(key) & KEY_type_FLAGS;
    if (flags == KEY_string_FLAG)
        pobject_lives(interpreter, (PObj *)PMC_str_val(key));
    /*
     * KEY_hash_iterator_FLAGS denote a hash key iteration, PMC_data() is
     * the bucket_index and not the next key component
     */
    if (flags == KEY_hash_iterator_FLAGS)
        return;

    if (PMC_data(key))
        pobject_lives(interpreter, (PObj *)PMC_data(key));

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
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
