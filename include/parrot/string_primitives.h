/* string_funcs.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_STRING_PRIMITIVES_H_GUARD
#define PARROT_STRING_PRIMITIVES_H_GUARD

#ifdef PARROT_IN_CORE

/* HEADERIZER BEGIN: src/string_primitives.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_CONST_FUNCTION
INTVAL Parrot_char_digit_value(SHIM_INTERP, UINTVAL character);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char * str_dup(ARGIN(const char *old))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char * str_dup_remove_quotes(ARGIN(const char *old))
        __attribute__nonnull__(1);

PARROT_EXPORT
void string_set_data_directory(PARROT_INTERP, ARGIN(const char *dir))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
Parrot_UInt4 string_unescape_one(PARROT_INTERP,
    ARGMOD(UINTVAL *offset),
    ARGMOD(STRING *string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*offset)
        FUNC_MODIFIES(*string);

#define ASSERT_ARGS_Parrot_char_digit_value
#define ASSERT_ARGS_str_dup assert(old);
#define ASSERT_ARGS_str_dup_remove_quotes assert(old);
#define ASSERT_ARGS_string_set_data_directory assert(interp); \
                                              assert(dir);
#define ASSERT_ARGS_string_unescape_one assert(interp); \
                                        assert(offset); \
                                        assert(string);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/string_primitives.c */

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_PRIMITIVES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
