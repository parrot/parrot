/*
Copyright (C) 2001-2008, Parrot Foundation.
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
#include "parrot/key.h"
#include "key.str"
#include "pmc/pmc_key.h"

/* HEADERIZER HFILE: include/parrot/key.h */

/*

=item C<PMC * key_new>

Returns a new C<Key> PMC.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
key_new(PARROT_INTERP)
{
    ASSERT_ARGS(key_new)
    return pmc_new(interp, enum_class_Key);
}


/*

=item C<PMC * key_new_integer>

Returns a new integer C<Key> PMC with value C<value>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
key_new_integer(PARROT_INTERP, INTVAL value)
{
    ASSERT_ARGS(key_new_integer)
    PMC * const key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_integer_FLAG;
    PMC_int_val(key)     = value;

    return key;
}


/*

=item C<PMC * key_new_number>

Returns a new number C<Key> PMC with value C<value>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
key_new_number(PARROT_INTERP, FLOATVAL value)
{
    ASSERT_ARGS(key_new_number)
    PMC * const key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_number_FLAG;
    VTABLE_set_number_native(interp, key, value);

    return key;
}


/*

=item C<PMC * key_new_string>

Returns a new string C<Key> PMC with value C<value>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
key_new_string(PARROT_INTERP, ARGIN(STRING *value))
{
    ASSERT_ARGS(key_new_string)
    PMC * const key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_string_FLAG;
    PMC_str_val(key)     = value;

    return key;
}


/*

=item C<PMC * key_new_cstring>

Returns a new string C<Key> PMC with value C<value> converted to a
C<STRING>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
key_new_cstring(PARROT_INTERP, ARGIN_NULLOK(const char *value))
{
    ASSERT_ARGS(key_new_cstring)
    return key_new_string(interp, Parrot_str_new(interp, value, 0));
}


/*

=item C<PMC * key_new_pmc>

Returns a new PMC C<Key> PMC with value C<value>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
key_new_pmc(PARROT_INTERP, ARGIN(PMC *value))
{
    ASSERT_ARGS(key_new_pmc)
    PMC * const key = pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_pmc_FLAG;
    Parrot_ex_throw_from_c_args(interp, NULL, 1, "this is broken - see slice.pmc");
}


/*

=item C<void key_set_integer>

Set the integer C<value> in C<key>.

=cut

*/

PARROT_EXPORT
void
key_set_integer(SHIM_INTERP, ARGMOD(PMC *key), INTVAL value)
{
    ASSERT_ARGS(key_set_integer)
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |=  KEY_integer_FLAG;
    PMC_int_val(key)     = value;

    return;
}


/*

=item C<void key_set_register>

Set the register C<value> in C<key>.

=cut

*/

PARROT_EXPORT
void
key_set_register(SHIM_INTERP, ARGMOD(PMC *key), INTVAL value, INTVAL flag)
{
    ASSERT_ARGS(key_set_register)
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |=  KEY_register_FLAG | flag;
    PMC_int_val(key)     = value;

    return;
}


/*

=item C<void key_set_number>

Set the number C<value> in C<key>.

=cut

*/

PARROT_EXPORT
void
key_set_number(PARROT_INTERP, ARGMOD(PMC *key), FLOATVAL value)
{
    ASSERT_ARGS(key_set_number)
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |=  KEY_number_FLAG;
    VTABLE_set_number_native(interp, key, value);

    return;
}


/*

=item C<void key_set_string>

Set the string C<value> in C<key>.

=cut

*/

PARROT_EXPORT
void
key_set_string(SHIM_INTERP, ARGMOD(PMC *key), ARGIN(STRING *value))
{
    ASSERT_ARGS(key_set_string)
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |=  KEY_string_FLAG;
    PMC_str_val(key)     = value;

    return;
}


/*

=item C<void key_set_pmc>

Set the PMC C<value> in C<key>.

=cut

*/

PARROT_EXPORT
void
key_set_pmc(PARROT_INTERP, ARGMOD(PMC *key), ARGIN(PMC *value))
{
    ASSERT_ARGS(key_set_pmc)
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |=  KEY_pmc_FLAG;

    /*
     * XXX leo
     * what for is this indirection?
     */
    Parrot_ex_throw_from_c_args(interp, NULL, 1, "this is broken - see slice.pmc");
}


/*

=item C<INTVAL key_type>

Returns the type of C<key>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
key_type(SHIM_INTERP, ARGIN(const PMC *key))
{
    ASSERT_ARGS(key_type)
    return (PObj_get_FLAGS(key) & KEY_type_FLAGS) & ~KEY_register_FLAG;
}


/*

=item C<INTVAL key_integer>

Translates a key value into an integer.
Takes an interpreter name and pointer to a key.
Returns an integer value corresponding to the key.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
key_integer(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(key_integer)
    if (VTABLE_isa(interp, key, CONST_STRING(interp, "Key"))) {
        switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
        case KEY_hash_iterator_FLAGS:
        case KEY_integer_FLAG:
            return PMC_int_val(key);
        case KEY_integer_FLAG | KEY_register_FLAG:
            return REG_INT(interp, PMC_int_val(key));
        case KEY_pmc_FLAG | KEY_register_FLAG:
            {
            PMC * const reg = REG_PMC(interp, PMC_int_val(key));
            return VTABLE_get_integer(interp, reg);
            }
        case KEY_string_FLAG:
            return Parrot_str_to_int(interp, PMC_str_val(key));
        case KEY_string_FLAG | KEY_register_FLAG:
            {
            STRING * const s_reg = REG_STR(interp, PMC_int_val(key));
            return Parrot_str_to_int(interp, s_reg);
            }
        case KEY_string_FLAG | KEY_start_slice_FLAG:
        case KEY_string_FLAG | KEY_inf_slice_FLAG:
            {
            STRING * const s_key = VTABLE_get_string(interp, key);
            return Parrot_str_to_int(interp, s_key);
            }
        case KEY_start_slice_FLAG:
        case KEY_inf_slice_FLAG:
        default:
            break;
        }
    }

    return VTABLE_get_integer(interp, key);
}


/*

=item C<FLOATVAL key_number>

Translates a key value into a number.
Takes an interpreter name and pointer to a key.
Returns a number value corresponding to the key.
Throws an exception if the key is not a valid number.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
FLOATVAL
key_number(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(key_number)
    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_number_FLAG:
        return VTABLE_get_number(interp, key);
    case KEY_number_FLAG | KEY_register_FLAG:
        return REG_NUM(interp, PMC_int_val(key));
    case KEY_pmc_FLAG:
        return VTABLE_get_number(interp, key);
                                                 /*  PMC_pmc_val(key)); */
    case KEY_pmc_FLAG | KEY_register_FLAG:
        {
        PMC * const reg = REG_PMC(interp, PMC_int_val(key));
        return VTABLE_get_number(interp, reg);
        }
    default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Key not a number!\n");
    }
}


/*

=item C<STRING * key_string>

Translates a key value into a string.  Takes an interpreter name and pointer to
a key.  Returns a string value corresponding to the key.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
key_string(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(key_string)
    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
        /* remember to COW strings instead of returning them directly */
        case KEY_string_FLAG:
        {
            STRING *s = PMC_str_val(key);
            if (s)
                s = Parrot_str_new_COW(interp, s);
            return s;
        }
        case KEY_string_FLAG | KEY_register_FLAG:
        {
            STRING *s = REG_STR(interp, PMC_int_val(key));
            if (s)
                s = Parrot_str_new_COW(interp, s);
            return s;
        }
                                               /*   PMC_pmc_val(key)); */
        case KEY_pmc_FLAG | KEY_register_FLAG:
        {
            PMC * const reg = REG_PMC(interp, PMC_int_val(key));
            return VTABLE_get_string(interp, reg);
        }
        case KEY_integer_FLAG:
            return Parrot_str_from_int(interp, PMC_int_val(key));
        case KEY_integer_FLAG | KEY_register_FLAG:
            return Parrot_str_from_int(interp, REG_INT(interp, PMC_int_val(key)));
        default:
        case KEY_pmc_FLAG:
            return VTABLE_get_string(interp, key);
    }
}


/*

=item C<PMC * key_pmc>

These functions return the integer/number/string/PMC values of C<key> if
possible. Otherwise they throw exceptions.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
key_pmc(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(key_pmc)
    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
    case KEY_pmc_FLAG | KEY_register_FLAG:
        return REG_PMC(interp, PMC_int_val(key));
    default:
        return key; /* PMC_pmc_val(key); */
    }
}


/*

=item C<PMC * key_next>

Returns the next key if C<key> is in a sequence of linked keys.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
key_next(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(key_next)
    PMC *next_key;

    if (VTABLE_isa(interp, key, CONST_STRING(interp, "Key")) && key->pmc_ext) {
        GETATTR_Key_next_key(interp, key, next_key);
        return next_key;
    }
    else {
        return NULL;
    }
}


/*

=item C<PMC * key_append>

Appends C<key2> to C<key1>.

Note that if C<key1> is not the last key in a sequence of linked keys then the
last key will be found and C<key2> appended to that.

Returns C<key1>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
PMC *
key_append(PARROT_INTERP, ARGMOD(PMC *key1), ARGIN(PMC *key2))
{
    ASSERT_ARGS(key_append)
    PMC *tail = key1;
    PMC *tail_next;

    GETATTR_Key_next_key(interp, tail, tail_next);

    while (tail_next) {
        tail = tail_next;
        GETATTR_Key_next_key(interp, tail, tail_next);
    }

    SETATTR_Key_next_key(interp, tail, key2);

    return key1;
}


/*

=item C<void key_mark>

Marks C<key> as live.

=cut

*/

PARROT_EXPORT
void
key_mark(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(key_mark)
    const UINTVAL flags = PObj_get_FLAGS(key) & KEY_type_FLAGS;
    PMC          *next_key;

    if (flags == KEY_string_FLAG)
        pobject_lives(interp, (PObj *)PMC_str_val(key));

    /*
     * KEY_hash_iterator_FLAGS denote a hash key iteration, PMC_data() is
     * the bucket_index and not the next key component
     * Note to self: shoot whoever thought this was a good idea.
     */
    if (flags == KEY_hash_iterator_FLAGS)
        return;

    /* if iteration hasn't started, above flag isn't set yet */
    GETATTR_Key_next_key(interp, key, next_key);
    if (next_key && (void *)next_key != (void *)INITBucketIndex)
        pobject_lives(interp, (PObj *)next_key);

}


/*

=item C<STRING * key_set_to_string>

Translates a series of key values into strings, quoted or bracketed if
appropriate.  Takes an interpreter name and pointer to a key.  Returns a
string value corresponding to the key.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
key_set_to_string(PARROT_INTERP, ARGIN_NULLOK(PMC *key))
{
    ASSERT_ARGS(key_set_to_string)
    STRING * const semicolon = CONST_STRING(interp, " ; ");
    STRING * const quote     = CONST_STRING(interp, "'");
    STRING        *value     = Parrot_str_new(interp, "[ ", 2);
    PMC           *next_key;

    for (;key;) {
        switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
            case KEY_integer_FLAG:
                value = Parrot_str_append(interp, value,
                    Parrot_str_from_int(interp, PMC_int_val(key)));
                break;
            case KEY_string_FLAG:
                value = Parrot_str_append(interp, value, quote);
                value = Parrot_str_append(interp, value, PMC_str_val(key));
                value = Parrot_str_append(interp, value, quote);
                break;
            case KEY_pmc_FLAG:
                value = Parrot_str_append(interp, value,
                    VTABLE_get_string(interp, key));
                break;
            case KEY_integer_FLAG | KEY_register_FLAG:
                value = Parrot_str_append(interp, value,
                        Parrot_str_from_int(interp,
                            REG_INT(interp, PMC_int_val(key))));
                break;
            case KEY_string_FLAG | KEY_register_FLAG:
                value = Parrot_str_append(interp, value, quote);
                value = Parrot_str_append(interp, value,
                    REG_STR(interp, PMC_int_val(key)));
                value = Parrot_str_append(interp, value, quote);
                break;
            case KEY_pmc_FLAG | KEY_register_FLAG:
                {
                PMC * const reg = REG_PMC(interp, PMC_int_val(key));
                value           = Parrot_str_append(interp, value,
                                    VTABLE_get_string(interp, reg));
                }
                break;
            default:
                value = Parrot_str_append(interp, value, CONST_STRING(interp, "Key type unknown"));
                break;
        }

        GETATTR_Key_next_key(interp, key, next_key);
        if (next_key)
            value = Parrot_str_append(interp, value, semicolon);

        GETATTR_Key_next_key(interp, key, key);
    }

    value = Parrot_str_append(interp, value, Parrot_str_new(interp, " ]", 2));
    return value;
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
