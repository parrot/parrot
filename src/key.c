/*
Copyright (C) 2001-2010, Parrot Foundation.

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
#include "pmc/pmc_callcontext.h"

/* HEADERIZER HFILE: include/parrot/key.h */

/*

=item C<PMC * Parrot_key_new(PARROT_INTERP)>

Returns a new C<Key> PMC.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_key_new(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_key_new)
    return Parrot_pmc_new(interp, enum_class_Key);
}


/*

=item C<PMC * Parrot_key_new_integer(PARROT_INTERP, INTVAL value)>

Returns a new integer C<Key> PMC with value C<value>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_key_new_integer(PARROT_INTERP, INTVAL value)
{
    ASSERT_ARGS(Parrot_key_new_integer)
    PMC * const key = Parrot_pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_integer_FLAG;
    SETATTR_Key_int_key(interp, key, value);

    return key;
}


/*

=item C<PMC * Parrot_key_new_string(PARROT_INTERP, STRING *value)>

Returns a new string C<Key> PMC with value C<value>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_key_new_string(PARROT_INTERP, ARGIN(STRING *value))
{
    ASSERT_ARGS(Parrot_key_new_string)
    PMC * const key = Parrot_pmc_new(interp, enum_class_Key);

    PObj_get_FLAGS(key) |= KEY_string_FLAG;
    SETATTR_Key_str_key(interp, key, value);

    return key;
}


/*

=item C<PMC * Parrot_key_new_cstring(PARROT_INTERP, const char *value)>

Returns a new string C<Key> PMC with value C<value> converted to a
C<STRING>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_key_new_cstring(PARROT_INTERP, ARGIN_NULLOK(const char *value))
{
    ASSERT_ARGS(Parrot_key_new_cstring)
    return Parrot_key_new_string(interp, Parrot_str_new(interp, value, 0));
}

/*

=item C<void Parrot_key_set_integer(PARROT_INTERP, PMC *key, INTVAL value)>

Set the integer C<value> in C<key>.

=cut

*/

PARROT_EXPORT
void
Parrot_key_set_integer(PARROT_INTERP, ARGMOD(PMC *key), INTVAL value)
{
    ASSERT_ARGS(Parrot_key_set_integer)
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |=  KEY_integer_FLAG;
    SETATTR_Key_int_key(interp, key, value);

    return;
}


/*

=item C<void Parrot_key_set_register(PARROT_INTERP, PMC *key, INTVAL value,
INTVAL flag)>

Set the register C<value> in C<key>.

=cut

*/

PARROT_EXPORT
void
Parrot_key_set_register(PARROT_INTERP, ARGMOD(PMC *key), INTVAL value, INTVAL flag)
{
    ASSERT_ARGS(Parrot_key_set_register)
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |=  KEY_register_FLAG | flag;
    SETATTR_Key_int_key(interp, key, value);

    return;
}


/*

=item C<void Parrot_key_set_string(PARROT_INTERP, PMC *key, STRING *value)>

Set the string C<value> in C<key>.

=cut

*/

PARROT_EXPORT
void
Parrot_key_set_string(PARROT_INTERP, ARGMOD(PMC *key), ARGIN(STRING *value))
{
    ASSERT_ARGS(Parrot_key_set_string)
    PObj_get_FLAGS(key) &= ~KEY_type_FLAGS;
    PObj_get_FLAGS(key) |=  KEY_string_FLAG;
    SETATTR_Key_str_key(interp, key, value);

    return;
}

/*

=item C<INTVAL Parrot_key_type(PARROT_INTERP, const PMC *key)>

Returns the type of C<key>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_key_type(SHIM_INTERP, ARGIN(const PMC *key))
{
    ASSERT_ARGS(Parrot_key_type)
    return (PObj_get_FLAGS(key) & KEY_type_FLAGS) & ~KEY_register_FLAG;
}


/*

=item C<INTVAL Parrot_key_integer(PARROT_INTERP, PMC *key)>

Translates a key value into an integer.
Takes an interpreter name and pointer to a key.
Returns an integer value corresponding to the key.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_key_integer(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(Parrot_key_integer)
    INTVAL   int_key;
    STRING  *str_key;

    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
      case KEY_integer_FLAG:
        GETATTR_Key_int_key(interp, key, int_key);
        return int_key;
      case KEY_integer_FLAG | KEY_register_FLAG:
        GETATTR_Key_int_key(interp, key, int_key);
        return REG_INT(interp, int_key);

      case KEY_pmc_FLAG | KEY_register_FLAG:
        {
            PMC *reg;
            GETATTR_Key_int_key(interp, key, int_key);
            reg = REG_PMC(interp, int_key);
            return VTABLE_get_integer(interp, reg);
        }

      case KEY_string_FLAG:
        GETATTR_Key_str_key(interp, key, str_key);
        return Parrot_str_to_int(interp, str_key);
      case KEY_string_FLAG | KEY_register_FLAG:
        {
            STRING *s_reg;
            GETATTR_Key_int_key(interp, key, int_key);
            s_reg = REG_STR(interp, int_key);
            return Parrot_str_to_int(interp, s_reg);
        }

      default:
            break;
    }

    return VTABLE_get_integer(interp, key);
}


/*

=item C<STRING * Parrot_key_string(PARROT_INTERP, PMC *key)>

Translates a key value into a string.  Takes an interpreter name and pointer to
a key.  Returns a string value corresponding to the key.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING *
Parrot_key_string(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(Parrot_key_string)

    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
        /* remember to COW strings instead of returning them directly */
      case KEY_string_FLAG:
        {
            STRING *s;
            GETATTR_Key_str_key(interp, key, s);
            return s;
        }
      case KEY_string_FLAG | KEY_register_FLAG:
        {
            INTVAL int_key;
            GETATTR_Key_int_key(interp, key, int_key);
            return REG_STR(interp, int_key);
        }
      case KEY_pmc_FLAG | KEY_register_FLAG:
        {
            INTVAL int_key;
            PMC *reg;
            GETATTR_Key_int_key(interp, key, int_key);
            reg = REG_PMC(interp, int_key);
            return VTABLE_get_string(interp, reg);
        }
      case KEY_integer_FLAG:
        {
            INTVAL int_key;
            GETATTR_Key_int_key(interp, key, int_key);
            return Parrot_str_from_int(interp, int_key);
        }
      case KEY_integer_FLAG | KEY_register_FLAG:
        {
            INTVAL int_key;
            GETATTR_Key_int_key(interp, key, int_key);
            return Parrot_str_from_int(interp, REG_INT(interp, int_key));
        }
      default:
      case KEY_pmc_FLAG:
        return VTABLE_get_string(interp, key);
    }
}


/*

=item C<PMC * Parrot_key_pmc(PARROT_INTERP, PMC *key)>

These functions return the integer/number/string/PMC values of C<key> if
possible. Otherwise they throw exceptions.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_key_pmc(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(Parrot_key_pmc)
    INTVAL int_key;

    switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
      case KEY_pmc_FLAG | KEY_register_FLAG:
        GETATTR_Key_int_key(interp, key, int_key);
        return REG_PMC(interp, int_key);
      default:
        return key;
    }
}


/*

=item C<PMC * Parrot_key_next(PARROT_INTERP, PMC *key)>

Returns the next key if C<key> is in a sequence of linked keys.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_key_next(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(Parrot_key_next)

    if (key->vtable->base_type == enum_class_Key || VTABLE_isa(interp, key, CONST_STRING(interp, "Key"))) {
        PMC *next_key;
        GETATTR_Key_next_key(interp, key, next_key);
        return next_key;
    }

    return NULL;
}


/*

=item C<PMC * Parrot_key_append(PARROT_INTERP, PMC *key1, PMC *key2)>

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
Parrot_key_append(PARROT_INTERP, ARGMOD(PMC *key1), ARGIN(PMC *key2))
{
    ASSERT_ARGS(Parrot_key_append)
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

=item C<void Parrot_key_mark(PARROT_INTERP, PMC *key)>

Marks C<key> as live.

=cut

*/

PARROT_EXPORT
void
Parrot_key_mark(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(Parrot_key_mark)
    PMC          *next_key;
    const UINTVAL flags = PObj_get_FLAGS(key) & KEY_type_FLAGS;

    if (flags == KEY_string_FLAG) {
        STRING *str_key;
        GETATTR_Key_str_key(interp, key, str_key);
        Parrot_gc_mark_STRING_alive(interp, str_key);
    }

    /* Mark next key */
    if ((flags == KEY_string_FLAG) || (flags == KEY_pmc_FLAG)) {
        GETATTR_Key_next_key(interp, key, next_key);
        Parrot_gc_mark_PMC_alive(interp, next_key);
    }

}


/*

=item C<STRING * Parrot_key_set_to_string(PARROT_INTERP, PMC *key)>

Translates a series of key values into strings, quoted or bracketed if
appropriate.  Takes an interpreter name and pointer to a key.  Returns a
string value corresponding to the key.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_key_set_to_string(PARROT_INTERP, ARGIN_NULLOK(PMC *key))
{
    ASSERT_ARGS(Parrot_key_set_to_string)
    STRING * const semicolon = CONST_STRING(interp, " ; ");
    STRING * const quote     = CONST_STRING(interp, "'");
    STRING * const P         = CONST_STRING(interp, "P");
    STRING * const S         = CONST_STRING(interp, "S");
    STRING * const I         = CONST_STRING(interp, "I");
    STRING        *value     = Parrot_str_new(interp, "[ ", 2);
    PMC           *next_key;
    INTVAL         int_key;
    STRING        *str_key;

    while (key != NULL) {
        switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
          case KEY_integer_FLAG:
            GETATTR_Key_int_key(interp, key, int_key);
            value = Parrot_str_concat(interp, value,
                        Parrot_str_from_int(interp, int_key));
            break;
          case KEY_string_FLAG:
            GETATTR_Key_str_key(interp, key, str_key);
            value = Parrot_str_concat(interp, value, quote);
            value = Parrot_str_concat(interp, value, str_key);
            value = Parrot_str_concat(interp, value, quote);
            break;
          case KEY_pmc_FLAG:
            value = Parrot_str_concat(interp, value,
                        VTABLE_get_string(interp, key));
            break;
          case KEY_integer_FLAG | KEY_register_FLAG:
            GETATTR_Key_int_key(interp, key, int_key);
            value = Parrot_str_concat(interp, value, I);
            value = Parrot_str_concat(interp, value, Parrot_str_from_int(interp, int_key));
            break;
          case KEY_string_FLAG | KEY_register_FLAG:
            GETATTR_Key_int_key(interp, key, int_key);
            value = Parrot_str_concat(interp, value, S);
            value = Parrot_str_concat(interp, value, Parrot_str_from_int(interp, int_key));
            break;
          case KEY_pmc_FLAG | KEY_register_FLAG:
            GETATTR_Key_int_key(interp, key, int_key);
            value = Parrot_str_concat(interp, value, P);
            value = Parrot_str_concat(interp, value, Parrot_str_from_int(interp, int_key));
            break;
          default:
            value = Parrot_str_concat(interp, value, CONST_STRING(interp, "Key type unknown"));
            break;
        }

        GETATTR_Key_next_key(interp, key, next_key);
        if (next_key)
            value = Parrot_str_concat(interp, value, semicolon);

        GETATTR_Key_next_key(interp, key, key);
    }

    value = Parrot_str_concat(interp, value, Parrot_str_new(interp, " ]", 2));
    return value;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/key.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
