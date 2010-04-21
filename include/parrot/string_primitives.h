/* string_funcs.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
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

/* HEADERIZER BEGIN: src/string/primitives.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_CONST_FUNCTION
INTVAL Parrot_char_digit_value(SHIM_INTERP, UINTVAL character);

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
    ARGIN(const STRING *string))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*offset);

#define ASSERT_ARGS_Parrot_char_digit_value __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_str_dup_remove_quotes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(old))
#define ASSERT_ARGS_string_set_data_directory __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(dir))
#define ASSERT_ARGS_string_unescape_one __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(offset) \
    , PARROT_ASSERT_ARG(string))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/string/primitives.c */

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_PRIMITIVES_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
