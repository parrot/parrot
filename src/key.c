/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/key.c - Base vtable calling functions

=head1 DESCRIPTION

The base vtable calling functions.

=head2 Functions

*/

#include "parrot/parrot.h"
#include "parrot/key.h"

/* HEADERIZER HFILE: include/parrot/key.h */

/*

FUNCDOC: key_new
Returns a new C<Key> PMC.

*/

PARROT_API
PMC *
key_new(Interp *interp /*NN*/)
{
    PMC * const key = pmc_new(interp, enum_class_Key);

    return key;
}

/*

FUNCDOC: key_new_integer
Returns a new integer C<Key> PMC with value C<value>.

*/

PARROT_API
PMC *
key_new_integer(Interp *interp /*NN*/, INTVAL value)
{
    PMC * const key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_integer_FLAG;
    PMC_int_val(key) = value;

    return key;
}

/*

FUNCDOC: key_new_number
Returns a new number C<Key> PMC with value C<value>.

*/

PARROT_API
PMC *
key_new_number(Interp *interp /*NN*/, FLOATVAL value)
{
    PMC * const key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_number_FLAG;
    PMC_num_val(key) = value;

    return key;
}

/*

FUNCDOC:
Returns a new string C<Key> PMC with value C<value>.

*/

PARROT_API
PMC *
key_new_string(Interp *interp /*NN*/, STRING *value)
{
    PMC * const key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_string_FLAG;
    PMC_str_val(key) = value;

    return key;
}

/*

FUNCDOC:
Returns a new string C<Key> PMC with value C<value> converted to a
C<STRING>.

*/

PARROT_API
PMC *
key_new_cstring(Interp *interp /*NN*/, const char *value /*NULLOK*/)
{
    return key_new_string(interp,
            string_from_cstring(interp, value, 0));
}

/*

FUNCDOC:
Returns a new PMC C<Key> PMC with value C<value>.

*/

PARROT_API
PMC *
key_new_pmc(Interp *interp /*NN*/, PMC *value)
{
    PMC * const key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_pmc_FLAG;
    real_exception(interp, NULL, 1, "this is broken - see slice.pmc");
    PMC_pmc_val(key) = value;

    return key;
}

/*

FUNCDOC:
Set the integer C<value> in C<key>.

*/

PARROT_API
void
key_set_integer(SHIM_INTERP, PMC *key /*NN*/, INTVAL value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_integer_FLAG;
    PMC_int_val(key) = value;

    return;
}

/*

FUNCDOC:
Set the register C<value> in C<key>.

*/

PARROT_API
void
key_set_register(SHIM_INTERP, PMC *key /*NN*/, INTVAL value,
                 INTVAL flag)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_register_FLAG | flag;
    PMC_int_val(key) = value;

    return;
}

/*

FUNCDOC:
Set the number C<value> in C<key>.

*/

PARROT_API
void
key_set_number(SHIM_INTERP, PMC *key /*NN*/, FLOATVAL value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_number_FLAG;
    PMC_num_val(key) = value;

    return;
}

/*

FUNCDOC:
Set the string C<value> in C<key>.

*/

PARROT_API
void
key_set_string(SHIM_INTERP, PMC *key /*NN*/, STRING *value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_string_FLAG;
    PMC_str_val(key) = value;

    return;
}

/*

FUNCDOC: key_set_pmc
Set the PMC C<value> in C<key>.

*/

PARROT_API
void
key_set_pmc(Interp *interp, PMC *key /*NN*/, PMC *value)
{
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |= KEY_pmc_FLAG;
    /*
     * XXX leo
     * what for is this indirection?
     */
    real_exception(interp, NULL, 1, "this is broken - see slice.pmc");
    PMC_pmc_val(key) = value;

    return;
}

/*

FUNCDOC: key_type
Returns the type of C<key>.

*/

PARROT_API
INTVAL
key_type(SHIM_INTERP, const PMC *key /*NN*/)
{
    return (PObj_get_FLAGS(key) & KEY_type_FLAGS) & ~KEY_register_FLAG;
}

PARROT_API
INTVAL
key_integer(Interp *interp, PMC *key /*NN*/)
{
    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_hash_iterator_FLAGS:
    case KEY_integer_FLAG:
        return PMC_int_val(key);
    case KEY_integer_FLAG | KEY_register_FLAG:
        return REG_INT(PMC_int_val(key));
    case KEY_pmc_FLAG | KEY_register_FLAG:
        {
        PMC * const reg = REG_PMC(PMC_int_val(key));
        return VTABLE_get_integer(interp, reg);
        }
    case KEY_string_FLAG:
        return string_to_int(interp, PMC_str_val(key));
    case KEY_string_FLAG | KEY_register_FLAG:
        {
        STRING * const s_reg = REG_STR(PMC_int_val(key));
        return string_to_int(interp, s_reg);
        }
    default:
        /* TODO check for slice_FLAGs */
        return VTABLE_get_integer(interp, key);
    }
}

PARROT_API
FLOATVAL
key_number(Interp *interp, PMC *key /*NN*/)
{
    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_number_FLAG:
        return PMC_num_val(key);
    case KEY_number_FLAG | KEY_register_FLAG:
        return REG_NUM(PMC_int_val(key));
    case KEY_pmc_FLAG:
        return VTABLE_get_number(interp, key);
                                                 /*  PMC_pmc_val(key)); */
    case KEY_pmc_FLAG | KEY_register_FLAG:
        {
        PMC * const reg = REG_PMC(PMC_int_val(key));
        return VTABLE_get_number(interp, reg);
        }
    default:
        real_exception(interp, NULL, INVALID_OPERATION, "Key not a number!\n");
        return (FLOATVAL)0;
    }
}

PARROT_API
STRING *
key_string(Interp *interp /*NN*/, PMC *key /*NN*/)
{
    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_string_FLAG:
        return PMC_str_val(key);
    case KEY_string_FLAG | KEY_register_FLAG:
        return REG_STR(PMC_int_val(key));
                                                   /*   PMC_pmc_val(key)); */
    case KEY_pmc_FLAG | KEY_register_FLAG:
        {
        PMC * const reg = REG_PMC(PMC_int_val(key));
        return VTABLE_get_string(interp, reg);
        }
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

FUNCDOC: key_pmc
These functions return the integer/number/string/PMC values of C<key> if
possible. Otherwise they throws an exceptions.

*/

PARROT_API
PMC *
key_pmc(Interp *interp, PMC *key /*NN*/)
{
    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_pmc_FLAG | KEY_register_FLAG:
        return REG_PMC(PMC_int_val(key));
    default:
        return key; /* PMC_pmc_val(key); */
    }
}

/*

FUNCDOC: key_next
Returns the next key if C<key> is in a sequence of linked keys.

*/

PARROT_API
PMC *
key_next(SHIM_INTERP, PMC *key /*NN*/)
{
    return key->pmc_ext ? (PMC *)PMC_data(key) : NULL;
}

/*

FUNCDOC: key_append
Appends C<key2> to C<key1>.

Note that if C<key1> is not the last key in a sequence linked keys then
the last key will be found and C<key2> appended to that.

Returns C<key1>.

*/

PARROT_API
PMC *
key_append(SHIM_INTERP, PMC *key1 /*NN*/, PMC *key2 /*NN*/)
{
    PMC *tail = key1;

    while (PMC_data(tail)) {
        tail = (PMC *)PMC_data(tail);
    }

    PMC_data(tail) = key2;

    return key1;
}

/*

FUNCDOC: key_mark
Marks C<key> as live.

*/

PARROT_API
void
key_mark(Interp *interp /*NN*/, PMC *key /*NN*/)
{
    const UINTVAL flags = PObj_get_FLAGS(key) & KEY_type_FLAGS;

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

PARROT_API
STRING *
key_set_to_string(Interp *interp /*NN*/, PMC *key /*NULLOK*/)
{
    STRING * const semicolon = string_from_cstring(interp, " ; ", 3);
    STRING * const quote = string_from_cstring(interp, "'", 1);
    STRING * const value = string_from_cstring(interp, "[ ", 2);

    for (; key; key = (PMC *)PMC_data(key)) {
        switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
            case KEY_integer_FLAG:
                string_append(interp, value, string_from_int(interp, PMC_int_val(key)));
                break;
            case KEY_string_FLAG:
                string_append(interp, value, quote);
                string_append(interp, value, PMC_str_val(key));
                string_append(interp, value, quote);
                break;
            case KEY_pmc_FLAG:
                string_append(interp, value, VTABLE_get_string(interp, key));
                break;
            case KEY_integer_FLAG | KEY_register_FLAG:
                string_append(interp, value, string_from_int(interp, REG_INT(PMC_int_val(key))));
                break;
            case KEY_string_FLAG | KEY_register_FLAG:
                string_append(interp, value, quote);
                string_append(interp, value, REG_STR(PMC_int_val(key)));
                string_append(interp, value, quote);
                break;
            case KEY_pmc_FLAG | KEY_register_FLAG:
                {
                PMC * const reg = REG_PMC(PMC_int_val(key));
                string_append(interp, value, VTABLE_get_string(interp, reg));
                }
                break;
            default:
                string_append(interp, value, string_from_literal(interp, "Key type unknown"));
                break;
        }

        if (PMC_data(key))
            string_append(interp, value, semicolon);
    }
    string_append(interp, value, string_from_cstring(interp, " ]", 2));
    return value;
}

/*

=head1 SEE ALSO

F<include/parrot/key.h>.

=head1 HISTORY

Initial version by Jeff G. on 2001.12.05.

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
