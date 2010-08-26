/* string.h
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

#ifndef PARROT_STRING_H_GUARD
#define PARROT_STRING_H_GUARD

#include "parrot/core_types.h"
#include "parrot/config.h"

#ifdef PARROT_IN_CORE

#include "parrot/pobj.h"
#include "parrot/parrot.h"

typedef struct parrot_string_t STRING;

typedef enum Forward_flag {
    Buffer_moved_FLAG   = 1 << 0,
    Buffer_shared_FLAG  = 1 << 1
} Forward_flags;

/* String iterator */
typedef struct string_iterator_t {
    UINTVAL bytepos;
    UINTVAL charpos;
} String_iter;

#define STRING_ITER_INIT(i, iter) \
    (iter)->charpos = (iter)->bytepos = 0
#define STRING_ITER_GET(i, str, iter, offset) \
    ((str)->encoding)->iter_get((i), (str), (iter), (offset))
#define STRING_ITER_SKIP(i, str, iter, skip) \
    ((str)->encoding)->iter_skip((i), (str), (iter), (skip))
#define STRING_ITER_GET_AND_ADVANCE(i, str, iter) \
    ((str)->encoding)->iter_get_and_advance((i), (str), (iter))
#define STRING_ITER_SET_AND_ADVANCE(i, str, iter, c) \
    ((str)->encoding)->iter_set_and_advance((i), (str), (iter), (c))
#define STRING_ITER_SET_POSITION(i, str, iter, pos) \
    ((str)->encoding)->iter_set_position((i), (str), (iter), (pos))

#define STREQ(x, y)  (strcmp((x), (y))==0)
#define STRNEQ(x, y) (strcmp((x), (y))!=0)

/* stringinfo parameters */

/* &gen_from_def(stringinfo.pasm) */

#define STRINGINFO_HEADER   1
#define STRINGINFO_STRSTART 2
#define STRINGINFO_BUFLEN   3
#define STRINGINFO_FLAGS    4
#define STRINGINFO_BUFUSED  5
#define STRINGINFO_STRLEN   6

/* &end_gen */

#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
