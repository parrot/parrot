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

/* turn off this hack, we need something better */
#define DISABLE_RETC_RECYCLING 1

/*
 * object method cache entry
 */
typedef struct _meth_cache_entry {
    void * strstart;    /* string address */
    PMC  * pmc;         /* the method sub pmc */
    struct _meth_cache_entry *next;
} Meth_cache_entry;

/*
 * method cache, continuation freelist, stack chunk freelist, regsave cache
 */
typedef struct _Caches {
    UINTVAL mc_size;            /* sizeof table */
    Meth_cache_entry ***idx;    /* bufstart idx */
    /* PMC **hash */            /* for non-constant keys */
    struct Stack_Chunk * frame_cache; /* register frame cache */
    PMC* retc_cache;            /* return contiunations recyling */
} Caches;

void init_object_cache(Parrot_Interp interpreter);
void mark_object_cache(Parrot_Interp);

#endif   /* PARROT_CACHES_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
