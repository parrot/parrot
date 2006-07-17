/* string_funcs.h
 *  Copyright (C) 2001-2006, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This is the api header for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_STRING_FUNCS_H_GUARD)
#define PARROT_STRING_FUNCS_H_GUARD

#include "parrot/compiler.h"

#ifdef PARROT_IN_CORE

/* Declarations of accessors */

/* HEADERIZER BEGIN: src/string.c */
PARROT_API STRING * Parrot_make_COW_reference( Interp *interpreter,
	STRING *s );

PARROT_API STRING* Parrot_reuse_COW_reference( Interp *interpreter,
	STRING *s,
	STRING *d /*NN*/ );

PARROT_API const char * Parrot_string_cstring( Interp *interpreter,
	const STRING *str /*NN*/ );

PARROT_API INTVAL Parrot_string_find_cclass( Interp *interpreter,
	PARROT_CCLASS_FLAGS flags,
	STRING *s,
	UINTVAL offset,
	UINTVAL count );

PARROT_API INTVAL Parrot_string_find_not_cclass( Interp *interpreter,
	PARROT_CCLASS_FLAGS flags,
	STRING *s,
	UINTVAL offset,
	UINTVAL count );

PARROT_API INTVAL Parrot_string_is_cclass( Interp *interpreter,
	PARROT_CCLASS_FLAGS flags,
	STRING *s,
	UINTVAL offset );

PARROT_API STRING* Parrot_string_trans_charset( Interp *interpreter,
	STRING *src,
	INTVAL charset_nr,
	STRING *dest );

PARROT_API STRING* Parrot_string_trans_encoding( Interp *interpreter,
	STRING *src,
	INTVAL encoding_nr,
	STRING *dest );

PARROT_API void Parrot_unmake_COW( Interp *interpreter,
	STRING *s /*NN*/ );

PARROT_API STRING * const_string( Interp *interpreter,
	const char *buffer /*NN*/ );

PARROT_API STRING * string_append( Interp *interpreter,
	STRING *a,
	STRING *b /*NN*/,
	UINTVAL Uflags );

PARROT_API STRING * string_bitwise_and( Interp *interpreter,
	STRING *s1,
	STRING *s2,
	STRING **dest );

PARROT_API STRING * string_bitwise_not( Interp *interpreter,
	STRING *s,
	STRING **dest );

PARROT_API STRING * string_bitwise_or( Interp *interpreter,
	STRING *s1,
	STRING *s2,
	STRING **dest );

PARROT_API STRING * string_bitwise_xor( Interp *interpreter,
	STRING *s1,
	STRING *s2,
	STRING **dest );

PARROT_API INTVAL string_bool( Interp *interpreter,
	const STRING *s );

PARROT_API UINTVAL string_capacity( Interp *interpreter,
	const STRING *s /*NN*/ );

PARROT_API STRING * string_chopn( Interp *interpreter,
	STRING *s,
	INTVAL n,
	int in_place );

PARROT_API STRING * string_chr( Interp *interpreter,
	UINTVAL character );

PARROT_API INTVAL string_compare( Interp *interpreter,
	STRING *s1,
	STRING *s2 );

PARROT_API STRING * string_compose( Interp * interpreter,
	STRING *src );

PARROT_API INTVAL string_compute_strlen( Interp *interpreter,
	STRING *s /*NN*/ );

PARROT_API STRING * string_concat( Interp *interpreter,
	STRING *a,
	STRING *b,
	UINTVAL Uflags );

PARROT_API STRING * string_copy( Interp *interpreter,
	STRING *s );

PARROT_API void string_cstring_free( void *ptr );

PARROT_API void string_deinit( Parrot_Interp interpreter );

PARROT_API STRING * string_downcase( Interp *interpreter,
	const STRING *s );

PARROT_API void string_downcase_inplace( Interp *interpreter,
	STRING *s );

PARROT_API INTVAL string_equal( Interp *interpreter,
	STRING *s1,
	STRING *s2 );

PARROT_API STRING * string_escape_string( Interp * interpreter,
	STRING *src );

PARROT_API STRING * string_escape_string_delimited( Interp * interpreter,
	STRING *src,
	UINTVAL limit );

PARROT_API STRING * string_from_const_cstring( Interp *interpreter,
	const void *buffer,
	UINTVAL len );

PARROT_API STRING * string_from_cstring( Interp *interpreter,
	const void *buffer,
	UINTVAL len );

PARROT_API STRING * string_from_int( Interp * interpreter,
	INTVAL i );

PARROT_API STRING * string_from_num( Interp * interpreter,
	FLOATVAL f );

PARROT_API STRING * string_grow( Interp * interpreter,
	STRING * s,
	INTVAL addlen );

PARROT_API size_t string_hash( Interp * interpreter,
	STRING *s,
	size_t seed );

PARROT_API STRING * string_increment( Interp *interpreter,
	const STRING *s );

PARROT_API INTVAL string_index( Interp * interpreter,
	const STRING *s,
	UINTVAL idx );

PARROT_API void string_init( Parrot_Interp interpreter );

PARROT_API STRING*  string_join( Interp *interpreter,
	STRING *j,
	PMC *ar );

PARROT_API UINTVAL string_length( Interp * interpreter,
	const STRING *s );

PARROT_API STRING * string_make( Interp *interpreter,
	const void *buffer,
	UINTVAL len,
	const char *charset_name,
	UINTVAL flags );

PARROT_API STRING * string_make_direct( Interp *interpreter,
	const void *buffer,
	UINTVAL len,
	ENCODING *encoding,
	CHARSET *charset,
	UINTVAL flags );

PARROT_API STRING * string_make_empty( Interp *interpreter,
	parrot_string_representation_t representation,
	UINTVAL capacity );

PARROT_API INTVAL string_max_bytes( Interp *interpreter,
	STRING *s,
	INTVAL nchars );

PARROT_API STRING* string_nprintf( Interp *interpreter,
	STRING *dest,
	INTVAL bytelen,
	const char *format,
	... );

PARROT_API INTVAL string_ord( Interp *interpreter,
	const STRING *s,
	INTVAL idx );

PARROT_API void string_pin( Interp * interpreter,
	STRING * s );

PARROT_API const char* string_primary_encoding_for_representation( Interp *interpreter,
	parrot_string_representation_t representation );

PARROT_API STRING* string_printf( Interp *interpreter,
	const char *format,
	... );

PARROT_API CHARSET * string_rep_compatible ( Interp *interpreter,
	STRING *a /*NN*/,
	const STRING *b /*NN*/,
	ENCODING **e /*NN*/ );

PARROT_API STRING * string_repeat( Interp *interpreter,
	const STRING *s,
	UINTVAL num,
	STRING **d );

PARROT_API STRING * string_replace( Interp *interpreter,
	STRING *src,
	INTVAL offset,
	INTVAL length,
	STRING *rep,
	STRING **d );

PARROT_API STRING * string_set( Interp *interpreter,
	STRING *dest /*NN*/,
	STRING *src );

PARROT_API PMC*  string_split( Interp *interpreter,
	STRING *delim,
	STRING *str );

PARROT_API INTVAL string_str_index( Interp *interpreter,
	const STRING *s,
	const STRING *s2,
	INTVAL start );

PARROT_API STRING * string_substr( Interp *interpreter,
	STRING *src,
	INTVAL offset,
	INTVAL length,
	STRING **d,
	int replace_dest );

PARROT_API STRING * string_titlecase( Interp *interpreter,
	const STRING *s );

PARROT_API void string_titlecase_inplace( Interp *interpreter,
	STRING *s );

PARROT_API char * string_to_cstring( Interp * interpreter,
	STRING * s );

PARROT_API INTVAL string_to_int( Interp *interpreter,
	const STRING *s );

PARROT_API FLOATVAL string_to_num( Interp *interpreter,
	const STRING *s );

PARROT_API STRING * string_unescape_cstring( Interp * interpreter,
	const char *cstring,
	char delimiter,
	const char *enc_char );

PARROT_API void string_unpin( Interp * interpreter,
	STRING * s );

PARROT_API STRING * string_upcase( Interp *interpreter,
	const STRING *s );

PARROT_API void string_upcase_inplace( Interp *interpreter,
	STRING *s );
/* HEADERIZER END: src/string.c */

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_FUNCS_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
