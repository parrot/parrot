/* string_funcs.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_STRING_FUNCS_H_GUARD
#define PARROT_STRING_FUNCS_H_GUARD

#include "parrot/compiler.h"

#ifdef PARROT_IN_CORE

/* Declarations of accessors */

#define CSTRING_WITH_LEN(s) (s ""), (sizeof(s)-1)
#define string_from_literal(i,s) string_from_cstring((i),CSTRING_WITH_LEN(s))

/* HEADERIZER BEGIN: src/string.c */

PARROT_API STRING * const_string( PARROT_INTERP, const char *buffer /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API STRING * int_to_str( PARROT_INTERP,
    char *tc /*NN*/,
    HUGEINTVAL num,
    char base )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API STRING * Parrot_make_COW_reference( PARROT_INTERP,
    STRING *s /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API STRING* Parrot_reuse_COW_reference( Interp *interp,
    STRING *s /*NN*/,
    STRING *d /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API const char * Parrot_string_cstring( Interp *interp,
    const STRING *str /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__pure__
        __attribute__warn_unused_result__;

PARROT_API INTVAL Parrot_string_find_cclass( PARROT_INTERP,
    INTVAL flags,
    STRING *s,
    UINTVAL offset,
    UINTVAL count )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API INTVAL Parrot_string_find_not_cclass( PARROT_INTERP,
    INTVAL flags,
    STRING *s /*NULLOK*/,
    UINTVAL offset,
    UINTVAL count )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API INTVAL Parrot_string_is_cclass( PARROT_INTERP,
    INTVAL flags,
    STRING *s,
    UINTVAL offset )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API STRING* Parrot_string_trans_charset( PARROT_INTERP,
    STRING *src /*NULLOK*/,
    INTVAL charset_nr,
    STRING *dest /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API STRING* Parrot_string_trans_encoding( PARROT_INTERP,
    STRING *src /*NULLOK*/,
    INTVAL encoding_nr,
    STRING *dest /*NULLOK*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_unmake_COW( PARROT_INTERP, STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API STRING * string_append( PARROT_INTERP,
    STRING *a /*NULLOK*/,
    STRING *b /*NULLOK*/ )
        __attribute__nonnull__(1);

PARROT_API STRING * string_bitwise_and( PARROT_INTERP,
    STRING *s1 /*NULLOK*/,
    STRING *s2 /*NULLOK*/,
    STRING **dest /*NULLOK*/ )
        __attribute__nonnull__(1);

PARROT_API STRING * string_bitwise_not( PARROT_INTERP,
    STRING *s /*NULLOK*/,
    STRING **dest /*NULLOK*/ )
        __attribute__nonnull__(1);

PARROT_API STRING * string_bitwise_or( PARROT_INTERP,
    STRING *s1 /*NULLOK*/,
    STRING *s2 /*NULLOK*/,
    STRING **dest /*NULLOK*/ )
        __attribute__nonnull__(1);

PARROT_API STRING * string_bitwise_xor( PARROT_INTERP,
    STRING *s1 /*NULLOK*/,
    STRING *s2 /*NULLOK*/,
    STRING **dest /*NULLOK*/ )
        __attribute__nonnull__(1);

PARROT_API INTVAL string_bool( PARROT_INTERP, const STRING *s /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API UINTVAL string_capacity( Interp *interp, const STRING *s /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__pure__
        __attribute__warn_unused_result__;

PARROT_API STRING * string_chopn( PARROT_INTERP,
    STRING *s /*NN*/,
    INTVAL n,
    int in_place )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API STRING * string_chr( PARROT_INTERP, UINTVAL character )
        __attribute__nonnull__(1);

PARROT_API INTVAL string_compare( PARROT_INTERP,
    const STRING *s1 /*NULLOK*/,
    const STRING *s2 /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__pure__
        __attribute__warn_unused_result__;

PARROT_API STRING * string_compose( PARROT_INTERP, STRING *src /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API INTVAL string_compute_strlen( PARROT_INTERP, STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API STRING * string_concat( PARROT_INTERP,
    STRING *a /*NULLOK*/,
    STRING *b /*NULLOK*/,
    UINTVAL Uflags )
        __attribute__nonnull__(1);

PARROT_API STRING * string_copy( PARROT_INTERP, STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API void string_cstring_free( char *p /*NULLOK*/ );
PARROT_API void string_deinit( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API STRING * string_downcase( PARROT_INTERP, const STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__
        __attribute__malloc__;

PARROT_API void string_downcase_inplace( PARROT_INTERP, STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API INTVAL string_equal( PARROT_INTERP,
    const STRING *s1 /*NULLOK*/,
    const STRING *s2 /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API STRING * string_escape_string( PARROT_INTERP,
    const STRING *src /*NULLOK*/ )
        __attribute__nonnull__(1);

PARROT_API STRING * string_escape_string_delimited( PARROT_INTERP,
    const STRING *src /*NULLOK*/,
    UINTVAL limit )
        __attribute__nonnull__(1);

PARROT_API STRING * string_from_cstring( PARROT_INTERP,
    const char * const buffer /*NULLOK*/,
    const UINTVAL len )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API STRING * string_from_int( PARROT_INTERP, INTVAL i )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API STRING * string_from_num( PARROT_INTERP, FLOATVAL f )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API STRING * string_grow( PARROT_INTERP,
    STRING *s /*NN*/,
    INTVAL addlen )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API size_t string_hash( PARROT_INTERP,
    STRING *s /*NULLOK*/,
    size_t seed )
        __attribute__nonnull__(1);

PARROT_API STRING * string_increment( PARROT_INTERP,
    const STRING *s /*NULLOK*/ )
        __attribute__nonnull__(1);

PARROT_API INTVAL string_index( PARROT_INTERP,
    const STRING *s /*NN*/,
    UINTVAL idx )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API void string_init( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API STRING* string_join( PARROT_INTERP, STRING *j /*NULLOK*/, PMC *ar )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API UINTVAL string_length( Interp *interp, const STRING *s /*NULLOK*/ )
        __attribute__pure__
        __attribute__warn_unused_result__;

PARROT_API STRING * string_make( PARROT_INTERP,
    const char *buffer /*NULLOK*/,
    UINTVAL len,
    const char *charset_name /*NULLOK*/,
    UINTVAL flags )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API STRING * string_make_direct( PARROT_INTERP,
    const char *buffer /*NULLOK*/,
    UINTVAL len,
    ENCODING *encoding /*NN*/,
    CHARSET *charset /*NN*/,
    UINTVAL flags )
        __attribute__nonnull__(1)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        __attribute__warn_unused_result__;

PARROT_API STRING * string_make_empty( PARROT_INTERP,
    parrot_string_representation_t representation,
    UINTVAL capacity )
        __attribute__nonnull__(1);

PARROT_API INTVAL string_max_bytes( Interp *interp,
    const STRING *s /*NN*/,
    INTVAL nchars )
        __attribute__nonnull__(2);

PARROT_API STRING* string_nprintf( PARROT_INTERP,
    STRING *dest,
    INTVAL bytelen,
    const char *format /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

PARROT_API INTVAL string_ord( PARROT_INTERP,
    const STRING *s /*NULLOK*/,
    INTVAL idx )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API void string_pin( PARROT_INTERP, STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API const char* string_primary_encoding_for_representation( PARROT_INTERP,
    parrot_string_representation_t representation )
        __attribute__nonnull__(1);

PARROT_API STRING* string_printf( PARROT_INTERP,
    const char *format /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API CHARSET * string_rep_compatible( Interp *interp,
    const STRING *a /*NN*/,
    const STRING *b /*NN*/,
    ENCODING **e /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__warn_unused_result__;

PARROT_API STRING * string_repeat( PARROT_INTERP,
    const STRING *s /*NN*/,
    UINTVAL num,
    STRING **d /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API STRING * string_replace( PARROT_INTERP,
    STRING *src /*NN*/,
    INTVAL offset,
    INTVAL length,
    STRING *rep /*NN*/,
    STRING **d /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5);

PARROT_API STRING * string_set( PARROT_INTERP,
    STRING *dest /*NULLOK*/,
    STRING *src /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_API PMC* string_split( PARROT_INTERP,
    STRING *delim /*NN*/,
    STRING *str /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

PARROT_API INTVAL string_str_index( PARROT_INTERP,
    const STRING *s /*NN*/,
    const STRING *s2 /*NN*/,
    INTVAL start )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

PARROT_API STRING * string_substr( PARROT_INTERP,
    STRING *src /*NN*/,
    INTVAL offset,
    INTVAL length,
    STRING **d /*NULLOK*/,
    int replace_dest )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API STRING * string_titlecase( PARROT_INTERP, const STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__
        __attribute__malloc__;

PARROT_API void string_titlecase_inplace( PARROT_INTERP, STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API char * string_to_cstring( Interp *interp,
    const STRING *s /*NULLOK*/ )
        __attribute__malloc__
        __attribute__warn_unused_result__;

PARROT_API INTVAL string_to_int( Interp *interp, const STRING *s /*NULLOK*/ )
        __attribute__warn_unused_result__;

PARROT_API FLOATVAL string_to_num( PARROT_INTERP, const STRING *s /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API STRING * string_unescape_cstring( PARROT_INTERP,
    const char *cstring /*NN*/,
    char delimiter,
    const char *enc_char /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API void string_unpin( PARROT_INTERP, STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API STRING * string_upcase( PARROT_INTERP, const STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__
        __attribute__malloc__;

PARROT_API void string_upcase_inplace( PARROT_INTERP, STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API STRING* uint_to_str( PARROT_INTERP,
    char *tc /*NN*/,
    UHUGEINTVAL num,
    char base,
    int minus )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

/* HEADERIZER END: src/string.c */

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_FUNCS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
