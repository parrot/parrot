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
#include "parrot/avl_tree.h"

typedef struct parrot_string_t STRING;

typedef enum Forward_flag {
    Buffer_moved_FLAG = 1 << 0
} Forward_flags;

/* String iterator */
typedef struct string_iterator_t {
    const STRING *str;
    UINTVAL bytepos;
    UINTVAL charpos;
    UINTVAL (*get_and_advance)(PARROT_INTERP, struct string_iterator_t *i);
    void (*set_and_advance)(PARROT_INTERP, struct string_iterator_t *i, UINTVAL c);
    void (*set_position)(PARROT_INTERP, struct string_iterator_t *i, UINTVAL pos);
} String_iter;

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


typedef struct avl_string_node_t AVLStringNode;

/* AVL node. */
/* We duplicate valuable information to avoid messing with STRING
 * and simplify lookups */
struct avl_string_node_t
{
    const char              *str;
    size_t                   length;
    const struct _encoding  *encoding;
    const struct _charset   *charset;

    STRING                  *value;

    TREE_ENTRY(avl_string_node_t)   tree;
};


#endif /* PARROT_IN_CORE */
#endif /* PARROT_STRING_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
