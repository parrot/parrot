/* string.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
 *  Overview:
 *     This is the api header for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_STRING_H_GUARD
#define PARROT_STRING_H_GUARD

#include "parrot/core_types.h"
#include "parrot/config.h"

#ifdef PARROT_IN_CORE

#include "parrot/compiler.h"
#include "parrot/pobj.h"
#include "parrot/cclass.h"

#define STREQ(x, y)  (strcmp((x), (y))==0)
#define STRNEQ(x, y) (strcmp((x), (y))!=0)

#define STRING_length(src) ((src) ? (src)->strlen : 0U)
#define STRING_byte_length(src) ((src) ? (src)->bufused : 0U)
#define STRING_max_bytes_per_codepoint(src) ((src)->encoding)->max_bytes_per_codepoint

#define STRING_equal(interp, lhs, rhs) ((lhs)->encoding)->equal((interp), (lhs), (rhs))
#define STRING_compare(interp, lhs, rhs) ((lhs)->encoding)->compare((interp), (lhs), (rhs))
#define STRING_index(interp, src, search, offset) ((src)->encoding)->index((interp), (src), (search), (offset))
#define STRING_rindex(interp, src, search, offset) ((src)->encoding)->rindex((interp), (src), (search), (offset))
#define STRING_hash(i, src, seed) ((src)->encoding)->hash((i), (src), (seed))

#define STRING_scan(i, src) ((src)->encoding)->scan((i), (src))
#define STRING_ord(i, src, offset) ((src)->encoding)->ord((i), (src), (offset))
#define STRING_substr(i, src, offset, count) ((src)->encoding)->substr((i), (src), (offset), (count))

#define STRING_is_cclass(interp, flags, src, offset) ((src)->encoding)->is_cclass((interp), (flags), (src), (offset))
#define STRING_find_cclass(interp, flags, src, offset, count) ((src)->encoding)->find_cclass((interp), (flags), (src), (offset), (count))
#define STRING_find_not_cclass(interp, flags, src, offset, count) ((src)->encoding)->find_not_cclass((interp), (flags), (src), (offset), (count))

#define STRING_get_graphemes(interp, src, offset, count) ((src)->encoding)->get_graphemes((interp), (src), (offset), (count))
#define STRING_compose(interp, src) ((src)->encoding)->compose((interp), (src))
#define STRING_decompose(interp, src) ((src)->encoding)->decompose((interp), (src))

#define STRING_upcase(interp, src) ((src)->encoding)->upcase((interp), (src))
#define STRING_downcase(interp, src) ((src)->encoding)->downcase((interp), (src))
#define STRING_titlecase(interp, src) ((src)->encoding)->titlecase((interp), (src))
#define STRING_upcase_first(interp, src) ((src)->encoding)->upcase_first((interp), (src))
#define STRING_downcase_first(interp, src) ((src)->encoding)->downcase_first((interp), (src))
#define STRING_titlecase_first(interp, src) ((src)->encoding)->titlecase_first((interp), (src))

#define STRING_ITER_INIT(i, iter) (iter)->charpos = (iter)->bytepos = 0
#define STRING_iter_get(i, str, iter, offset) ((str)->encoding)->iter_get((i), (str), (iter), (offset))
#define STRING_iter_skip(i, str, iter, skip) ((str)->encoding)->iter_skip((i), (str), (iter), (skip))
#define STRING_iter_get_and_advance(i, str, iter) ((str)->encoding)->iter_get_and_advance((i), (str), (iter))
#define STRING_iter_set_and_advance(i, str, iter, c) ((str)->encoding)->iter_set_and_advance((i), (str), (iter), (c))

/* stringinfo parameters */

/* &gen_from_def(stringinfo.pasm) */

#define STRINGINFO_HEADER   1
#define STRINGINFO_STRSTART 2
#define STRINGINFO_BUFLEN   3
#define STRINGINFO_FLAGS    4
#define STRINGINFO_BUFUSED  5
#define STRINGINFO_STRLEN   6

/* &end_gen */

typedef struct parrot_string_t STRING;

/* String iterator */
typedef struct string_iterator_t {
    UINTVAL bytepos;
    UINTVAL charpos;
} String_iter;

typedef struct _Parrot_String_Bounds {
    UINTVAL bytes;
    INTVAL  chars;
    INTVAL  delim;
} Parrot_String_Bounds;

/* constructors */
typedef STRING * (*str_vtable_to_encoding_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*str_vtable_chr_t)(PARROT_INTERP, UINTVAL codepoint);

typedef INTVAL   (*str_vtable_equal_t)(PARROT_INTERP, ARGIN(const STRING *lhs), ARGIN(const STRING *rhs));
typedef INTVAL   (*str_vtable_compare_t)(PARROT_INTERP, ARGIN(const STRING *lhs), ARGIN(const STRING *rhs));
typedef INTVAL   (*str_vtable_index_t)(PARROT_INTERP, ARGIN(const STRING *src), ARGIN(const STRING *search_string), INTVAL offset);
typedef INTVAL   (*str_vtable_rindex_t)(PARROT_INTERP, ARGIN(const STRING *src), ARGIN(const STRING *search_string), INTVAL offset);
typedef size_t   (*str_vtable_hash_t)(PARROT_INTERP, ARGIN(const STRING *s), size_t hashval);

typedef void     (*str_vtable_scan_t)(PARROT_INTERP, ARGMOD(STRING *src));
typedef INTVAL   (*str_vtable_partial_scan_t)(PARROT_INTERP, ARGIN(const char *buf), ARGMOD(Parrot_String_Bounds *bounds));
typedef UINTVAL  (*str_vtable_ord_t)(PARROT_INTERP, ARGIN(const STRING *src), INTVAL offset);
typedef STRING * (*str_vtable_substr_t)(PARROT_INTERP, ARGIN(const STRING *src), INTVAL offset, INTVAL count);

/* character classes */
typedef INTVAL   (*str_vtable_is_cclass_t)(PARROT_INTERP, INTVAL, ARGIN(const STRING *src), UINTVAL offset);
typedef INTVAL   (*str_vtable_find_cclass_t)(PARROT_INTERP, INTVAL, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count);
typedef INTVAL   (*str_vtable_find_not_cclass_t)(PARROT_INTERP, INTVAL, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count);

/* graphemes */
typedef STRING * (*str_vtable_get_graphemes_t)(PARROT_INTERP, ARGIN(const STRING *src), UINTVAL offset, UINTVAL count);
typedef STRING * (*str_vtable_compose_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*str_vtable_decompose_t)(PARROT_INTERP, ARGIN(const STRING *src));

/* case conversion, TODO: move to single function with a flag */
typedef STRING * (*str_vtable_upcase_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*str_vtable_downcase_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*str_vtable_titlecase_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*str_vtable_upcase_first_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*str_vtable_downcase_first_t)(PARROT_INTERP, ARGIN(const STRING *src));
typedef STRING * (*str_vtable_titlecase_first_t)(PARROT_INTERP, ARGIN(const STRING *src));

/* iterator functions */
typedef UINTVAL  (*str_vtable_iter_get_t)(PARROT_INTERP, ARGIN(const STRING *str),
                    ARGIN(const String_iter *i), INTVAL offset);
typedef void     (*str_vtable_iter_skip_t)(PARROT_INTERP, ARGIN(const STRING *str),
                    ARGIN(String_iter *i), INTVAL skip);
typedef UINTVAL  (*str_vtable_iter_get_and_advance_t)(PARROT_INTERP,
                    ARGIN(const STRING *str), ARGMOD(String_iter *i));
typedef void     (*str_vtable_iter_set_and_advance_t)(PARROT_INTERP, ARGIN(STRING *str),
                    ARGMOD(String_iter *i), UINTVAL c);

struct _str_vtable {
    int         num;
    const char *name;
    STRING     *name_str;
    UINTVAL     bytes_per_unit;
    UINTVAL     max_bytes_per_codepoint;

    str_vtable_to_encoding_t            to_encoding;
    str_vtable_chr_t                    chr;

    str_vtable_equal_t                  equal;
    str_vtable_compare_t                compare;
    str_vtable_index_t                  index;
    str_vtable_rindex_t                 rindex;
    str_vtable_hash_t                   hash;

    str_vtable_scan_t                   scan;
    str_vtable_partial_scan_t           partial_scan;
    str_vtable_ord_t                    ord;
    str_vtable_substr_t                 substr;

    str_vtable_is_cclass_t              is_cclass;
    str_vtable_find_cclass_t            find_cclass;
    str_vtable_find_not_cclass_t        find_not_cclass;

    str_vtable_get_graphemes_t          get_graphemes;
    str_vtable_compose_t                compose;
    str_vtable_decompose_t              decompose;

    str_vtable_upcase_t                 upcase;
    str_vtable_downcase_t               downcase;
    str_vtable_titlecase_t              titlecase;
    str_vtable_upcase_first_t           upcase_first;
    str_vtable_downcase_first_t         downcase_first;
    str_vtable_titlecase_first_t        titlecase_first;

    str_vtable_iter_get_t               iter_get;
    str_vtable_iter_skip_t              iter_skip;
    str_vtable_iter_get_and_advance_t   iter_get_and_advance;
    str_vtable_iter_set_and_advance_t   iter_set_and_advance;
};

typedef struct _str_vtable STR_VTABLE;

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
