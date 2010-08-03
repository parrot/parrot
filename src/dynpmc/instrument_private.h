/* instrument_private.h
 *  Copyright (C) 2010, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This header defines common data structures used by Instrument.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_INSTRUMENT_PRIVATE_H_GUARD
#define PARROT_INSTRUMENT_PRIVATE_H_GUARD

/*
 * Structures for the linked list data type.
 * TODO: Await merge to trunk of bacek's list. Then we use that instead.
 */

typedef struct probe_node_t {
    struct probe_node_t *next, *prev;
    PMC                 *list_obj;
} probe_node_t;

typedef struct probe_list_t {
    probe_node_t *head, *tail;
    INTVAL        count;
} probe_list_t;

#endif /* PARROT_INSTRUMENT_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
