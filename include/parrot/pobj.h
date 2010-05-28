/* pobj.h
 *  Copyright (C) 2001-2005, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Parrot Object data members and flags enum
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References: memory_internals.pod
 */

#ifndef PARROT_POBJ_H_GUARD
#define PARROT_POBJ_H_GUARD

#include "parrot/config.h"

/* Parrot Object - base class for all others */
typedef struct pobj_t {
    Parrot_UInt flags;
} PObj;

typedef struct buffer_t {
    Parrot_UInt flags;
    void *     _bufstart;
    size_t     _buflen;
} Buffer;

#define Buffer_bufstart(buffer)    (buffer)->_bufstart
#define Buffer_buflen(buffer)      (buffer)->_buflen

/* See src/gc/alloc_resources.c. the basic idea is that buffer memory is
   set up as follows:
                    +-----------------+
                    |  ref_count   |f |    # GC header
  obj->bufstart  -> +-----------------+
                    |  data           |
                    v                 v

The actual set-up is more involved because of padding.  obj->bufstart must
be suitably aligned. The start of the memory region (as returned by malloc())
is suitably aligned for any use.  If, for example, malloc() returns
objects aligned on 8-byte boundaries, and obj->bufstart is also aligned
on 8-byte boundaries, then there should be 4 bytes of padding.

ptr from malloc ->  +------------------+
                      [other blocks?]  |
                    | INTVAL ref_count |
obj->bufstart   ->  +------------------+
                    |     data         |
                    v                  v

*/

/* Given a pointer to the buffer, find the ref_count and the actual start of
   the allocated space. Setting ref_count is clunky because we avoid lvalue
   casts. */
#define Buffer_alloc_offset sizeof (void*)
#define Buffer_bufallocstart(b)  ((char *)Buffer_bufstart(b) - Buffer_alloc_offset)
#define Buffer_bufrefcountptr(b) ((INTVAL *)Buffer_bufallocstart(b))
#define Buffer_pool(b) ((Memory_Block *)( *(INTVAL*)(Buffer_bufallocstart(b)) & ~3 ))
#define Buffer_poolptr(b) ((Memory_Block **)Buffer_bufallocstart(b))


typedef enum {
    enum_stringrep_unknown = 0,
    enum_stringrep_one     = 1,
    enum_stringrep_two     = 2,
    enum_stringrep_four    = 4
} parrot_string_representation_t;

struct parrot_string_t {
    Parrot_UInt flags;
    void *     _bufstart;
    size_t     _buflen;
    char       *strstart;
    UINTVAL     bufused;
    UINTVAL     strlen;
    UINTVAL     hashval; /* cached hash value computation */

    /*    parrot_string_representation_t representation;*/
    const struct _encoding *encoding;
    const struct _charset  *charset;
    void                   *extra;
};

/* note that cache and flags are isomorphic with Buffer and PObj */
struct PMC {
    Parrot_UInt     flags;
    VTABLE         *vtable;
    DPOINTER       *data;

    PMC *_metadata;      /* properties */
};

#define PMC_data(pmc)                   (pmc)->data
#define PMC_data_typed(pmc, type) (type)(pmc)->data
#define PMC_metadata(pmc)         ((pmc)->_metadata)

#define POBJ_FLAG(n) ((UINTVAL)1 << (n))
/* PObj flags */
typedef enum PObj_enum {
    /* This first 8 flags may be used privately by a Parrot Object.
     * You should alias these within an individual class's header file.
     *
     * Note:  If the meanings of these flags are changed, then the symbolic
     * names kept in flag_bit_names (see src/packdump.c) must also be updated.
     */
    PObj_private0_FLAG          = POBJ_FLAG(0),
    PObj_private1_FLAG          = POBJ_FLAG(1),
    PObj_private2_FLAG          = POBJ_FLAG(2),
    PObj_private3_FLAG          = POBJ_FLAG(3),
    PObj_private4_FLAG          = POBJ_FLAG(4),
    PObj_private5_FLAG          = POBJ_FLAG(5),
    PObj_private6_FLAG          = POBJ_FLAG(6),
    PObj_private7_FLAG          = POBJ_FLAG(7),

/* Object specification FLAGs */
    /* PObj is a string */
    PObj_is_string_FLAG         = POBJ_FLAG(8),
    /* PObj is a PMC */
    PObj_is_PMC_FLAG            = POBJ_FLAG(9),
    /* the PMC is a shared PMC */
    PObj_is_PMC_shared_FLAG     = POBJ_FLAG(11), /* Same as PObj_is_shared_FLAG */
    /* PObj is otherwise shared */
    PObj_is_shared_FLAG         = POBJ_FLAG(11), /* Same as PObj_is_PMC_shared_FLAG */

/* Memory management FLAGs */
    /* This is a constant--don't kill it! */
    PObj_constant_FLAG          = POBJ_FLAG(12),
    /* Marks the contents as coming from a non-Parrot source */
    PObj_external_FLAG          = POBJ_FLAG(13),
    /* the Buffer is aligned to BUFFER_ALIGNMENT boundaries */
    PObj_aligned_FLAG           = POBJ_FLAG(14),
    /* Mark the buffer as pointing to system memory */
    PObj_sysmem_FLAG            = POBJ_FLAG(15),

/* PObj usage FLAGs, COW & GC */
    /* The Buffer allows COW copies, and may have some. */
    PObj_is_COWable_FLAG        = POBJ_FLAG(17),
    /* Private flag for the GC system. Set if the PObj's in use as
     * far as the GC's concerned */
    b_PObj_live_FLAG            = POBJ_FLAG(18),
    /* Mark the object as on the free list */
    b_PObj_on_free_list_FLAG    = POBJ_FLAG(19),

/* GC FLAGS */
    /* Set to true if the PObj has a custom mark routine */
    PObj_custom_mark_FLAG       = POBJ_FLAG(20),
    /* Mark the buffer as needing GC */
    PObj_custom_GC_FLAG         = POBJ_FLAG(21),
    /* Set if the PObj has a destroy method that must be called */
    PObj_custom_destroy_FLAG    = POBJ_FLAG(22),
    /* For debugging, report when this buffer gets moved around */
    PObj_report_FLAG            = POBJ_FLAG(23),

/* PMC specific FLAGs */
    /* call object finalizer */
    PObj_need_finalize_FLAG     = POBJ_FLAG(25),
    /* a PMC that needs special handling in GC, i.e one that has either:
     * - metadata
     * - data_is_PMC_array_FLAG
     * - custom_mark_FLAG
     */
    b_PObj_is_special_PMC_FLAG  = POBJ_FLAG(26),

    /* true if this is connected by some route to a needs_early_gc object */
    PObj_high_priority_gc_FLAG  = POBJ_FLAG(27),
    PObj_needs_early_gc_FLAG    = (POBJ_FLAG(27) | POBJ_FLAG(28)),

    /* True if the PMC is a class */
    PObj_is_class_FLAG          = POBJ_FLAG(29),
    /* True if the PMC is a parrot object */
    PObj_is_object_FLAG         = POBJ_FLAG(30)

} PObj_flags;
#undef POBJ_FLAG

/*
 * flag access macros:
 * directly using any flags is STRONGLY discouraged, please use
 * these macros
 */

#  define PObj_live_FLAG              b_PObj_live_FLAG
#  define PObj_on_free_list_FLAG      b_PObj_on_free_list_FLAG
#  define PObj_is_special_PMC_FLAG    b_PObj_is_special_PMC_FLAG

#  define gc_flag_TEST(flag, o)      PObj_flag_TEST(flag, o)
#  define gc_flag_SET(flag, o)       PObj_flag_SET(flag, o)
#  define gc_flag_CLEAR(flag, o)     PObj_flag_CLEAR(flag, o)

#define PObj_get_FLAGS(o) ((o)->flags)

#define PObj_flag_TEST(flag, o) (PObj_get_FLAGS(o) & PObj_ ## flag ## _FLAG)
#define PObj_flag_SET(flag, o) (PObj_get_FLAGS(o) |= PObj_ ## flag ## _FLAG)
#define PObj_flag_CLEAR(flag, o) \
        (PObj_get_FLAGS(o) &= ~(UINTVAL)(PObj_ ## flag ## _FLAG))

#define PObj_flags_SETTO(o, f) PObj_get_FLAGS(o) = (f)
#define PObj_flags_CLEARALL(o) PObj_flags_SETTO((o), 0)

#define PObj_is_COWable_TEST(o) PObj_flag_TEST(is_COWable, o)
#define PObj_is_COWable_SET(o) PObj_flag_SET(is_COWable, o)

#define PObj_aligned_TEST(o) PObj_flag_TEST(aligned, o)
#define PObj_aligned_SET(o) PObj_flag_SET(aligned, o)

#define PObj_constant_TEST(o) PObj_flag_TEST(constant, o)
#define PObj_constant_SET(o) PObj_flag_SET(constant, o)
#define PObj_constant_CLEAR(o) PObj_flag_CLEAR(constant, o)

#define PObj_external_TEST(o) PObj_flag_TEST(external, o)
#define PObj_external_SET(o) PObj_flag_SET(external, o)
#define PObj_external_CLEAR(o) PObj_flag_CLEAR(external, o)

#define PObj_report_TEST(o) PObj_flag_TEST(report, o)
#define PObj_report_SET(o) PObj_flag_SET(report, o)
#define PObj_report_CLEAR(o) PObj_flag_CLEAR(report, o)


#define PObj_on_free_list_TEST(o) gc_flag_TEST(on_free_list, o)
#define PObj_on_free_list_SET(o) gc_flag_SET(on_free_list, o)
#define PObj_on_free_list_CLEAR(o) gc_flag_CLEAR(on_free_list, o)

#define PObj_live_TEST(o) gc_flag_TEST(live, o)
#define PObj_live_SET(o) gc_flag_SET(live, o)
#define PObj_live_CLEAR(o) gc_flag_CLEAR(live, o)

#define PObj_is_string_TEST(o) PObj_flag_TEST(is_string, o)
#define PObj_is_string_SET(o) PObj_flag_SET(is_string, o)
#define PObj_is_string_CLEAR(o) PObj_flag_CLEAR(is_string, o)

#define PObj_sysmem_TEST(o) PObj_flag_TEST(sysmem, o)
#define PObj_sysmem_SET(o) PObj_flag_SET(sysmem, o)
#define PObj_sysmem_CLEAR(o) PObj_flag_CLEAR(sysmem, o)


#define PObj_special_SET(flag, o) do { \
    PObj_flag_SET(flag, o); \
    gc_flag_SET(is_special_PMC, o); \
} while (0)

#define PObj_special_CLEAR(flag, o) do { \
    PObj_flag_CLEAR(flag, o); \
    if ((PObj_get_FLAGS(o) & \
                (PObj_custom_destroy_FLAG | \
                 PObj_custom_mark_FLAG | \
                 PObj_needs_early_gc_FLAG))) \
        gc_flag_SET(is_special_PMC, o); \
    else \
        gc_flag_CLEAR(is_special_PMC, o); \
} while (0)

#define PObj_is_special_PMC_TEST(o) gc_flag_TEST(is_special_PMC, o)
#define PObj_is_special_PMC_SET(o) gc_flag_SET(is_special_PMC, o)

#define PObj_needs_early_gc_TEST(o) PObj_flag_TEST(needs_early_gc, o)
#define PObj_needs_early_gc_SET(o) PObj_special_SET(needs_early_gc, o)
#define PObj_needs_early_gc_CLEAR(o) PObj_special_CLEAR(needs_early_gc, o)

#define PObj_high_priority_gc_TEST(o)   PObj_flag_TEST(high_priority_gc, o)
#define PObj_high_priority_gc_SET(o)     PObj_special_SET(high_priority_gc, o)
#define PObj_high_priority_gc_CLEAR(o) PObj_special_CLEAR(high_priority_gc, o)

#define PObj_custom_mark_SET(o)   PObj_special_SET(custom_mark, o)
#define PObj_custom_mark_CLEAR(o)   PObj_special_CLEAR(custom_mark, o)
#define PObj_custom_mark_TEST(o)   PObj_flag_TEST(custom_mark, o)

#define PObj_custom_destroy_SET(o)   PObj_flag_SET(custom_destroy,   o)
#define PObj_custom_destroy_TEST(o)  PObj_flag_TEST(custom_destroy,  o)
#define PObj_custom_destroy_CLEAR(o) PObj_flag_CLEAR(custom_destroy, o)

#define PObj_is_class_SET(o) PObj_flag_SET(is_class, o)
#define PObj_is_class_TEST(o) PObj_flag_TEST(is_class, o)
#define PObj_is_class_CLEAR(o) PObj_flag_CLEAR(is_class, o)

#define PObj_is_object_SET(o) PObj_flag_SET(is_object, o)
#define PObj_is_object_TEST(o) PObj_flag_TEST(is_object, o)
#define PObj_is_object_CLEAR(o) PObj_flag_CLEAR(is_object, o)

#define PObj_is_PMC_TEST(o) PObj_flag_TEST(is_PMC, o)

#define PObj_is_PMC_shared_TEST(o) PObj_flag_TEST(is_PMC_shared, o)
#define PObj_is_PMC_shared_SET(o)  PObj_flag_SET(is_PMC_shared, o)
#define PObj_is_PMC_shared_CLEAR(o) PObj_flag_CLEAR(is_PMC_shared, o)

#define PObj_is_shared_TEST(o) PObj_flag_TEST(is_shared, o)
#define PObj_is_shared_SET(o)  PObj_flag_SET(is_shared, o)
#define PObj_is_shared_CLEAR(o) PObj_flag_CLEAR(is_shared, o)

/* some combinations */
#define PObj_is_external_or_free_TESTALL(o) (PObj_get_FLAGS(o) & \
            (UINTVAL)(PObj_external_FLAG|PObj_on_free_list_FLAG))

#define PObj_is_external_CLEARALL(o) (PObj_get_FLAGS(o) &= \
            ~(UINTVAL)(PObj_external_FLAG|PObj_sysmem_FLAG))

#define PObj_is_live_or_free_TESTALL(o) (PObj_get_FLAGS(o) & \
        (PObj_live_FLAG | PObj_on_free_list_FLAG))

#define PObj_is_movable_TESTALL(o) (!(PObj_get_FLAGS(o) & \
        (PObj_sysmem_FLAG | PObj_on_free_list_FLAG | \
         PObj_constant_FLAG | PObj_external_FLAG)))

#define PObj_custom_mark_destroy_SETALL(o) do { \
        PObj_custom_mark_SET(o); \
        PObj_custom_destroy_SET(o); \
} while (0)

#define PObj_gc_CLEAR(o) (PObj_get_FLAGS(o) \
    &= ~PObj_custom_destroy_FLAG \
     | ~PObj_custom_mark_FLAG \
     | ~PObj_live_FLAG)

#endif /* PARROT_POBJ_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
