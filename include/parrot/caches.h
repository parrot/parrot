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
 * register save freelist handling for runops_fromc
 */
typedef struct _reg_store {
    struct IReg int_reg;
    struct NReg num_reg;
    struct SReg string_reg;
    struct PReg pmc_reg;
} reg_store;

typedef struct _regsave {
    struct _regsave *prev;       /* free list ptr */
    struct _regsave *next;       /* mark list ptr */
    reg_store      regs;
    size_t size;                 /* saved size */
} regsave;

typedef struct _regs_cache {
    regsave *reg_save_top;   /* the free list */
    regsave *reg_save_mark;  /* the mark list */
} Regs_cache;

/*
 * method cache, continuation freelist, stack chunk freelist, regsave cache
 */
typedef struct _Caches {
    UINTVAL mc_size;            /* sizeof table */
    Meth_cache_entry ***idx;    /* bufstart idx */
    /* PMC **hash */            /* for non-constant keys */

    Regs_cache regs_cache;      /* runops_fromc reg save cache */
} Caches;

void init_object_cache(Parrot_Interp interpreter);
void mark_object_cache(Parrot_Interp);
void mark_stack_reusable(Parrot_Interp, struct Parrot_Context *ctx);
void mark_saved_regs(Parrot_Interp interpreter);


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
