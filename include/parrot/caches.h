/* caches.h
 *  Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Cache and direct freelist handling for various items.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_CACHES_H_GUARD)
#define PARROT_CACHES_H_GUARD

#define DISABLE_METH_CACHE 0
#define DISABLE_RETC_RECYCLING 0

/*
 * object method cache entry
 */
typedef struct _meth_cache_entry {
    void * strstart;    /* string address */
    PMC  * pmc;         /* the method sub pmc */
    struct _meth_cache_entry *next;
} Meth_cache_entry;

/*
 * method cache, continuation freelist, stack chunk freelist
 */
typedef struct _Caches {
    UINTVAL mc_size;            /* sizeof table */
    Meth_cache_entry ***idx;    /* bufstart idx */
    /* PMC **hash */            /* for non-constant keys */
    PMC *retc_free_list;        /* recycled return continuations */
    void *stack_chunk_cache;    /* stack chunk recycling */
} Caches;

void init_object_cache(Parrot_Interp interpreter);
void add_to_retc_free_list(Parrot_Interp, PMC*);
PMC *get_retc_from_free_list(Parrot_Interp);
void mark_object_cache(Parrot_Interp);
void mark_stack_not_reusable(Parrot_Interp, struct Parrot_Context *ctx);


#endif   /* header guard */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
