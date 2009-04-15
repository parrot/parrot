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

typedef union UnionVal {
    struct _b {                                  /* One Buffer structure */
        void *     _bufstart;
        size_t     _buflen;
    } _b;
    struct _ptrs {                                  /* or two pointers, both are defines */
        DPOINTER * _struct_val;
        PMC *      _pmc_val;
    } _ptrs;
    struct _i {
        INTVAL _int_val;                      /* or 2 intvals */
        INTVAL _int_val2;
    } _i;
    FLOATVAL _num_val;                       /* or one float */
    struct parrot_string_t * _string_val;    /* or a pointer to a string */
} UnionVal;

#define UVal_ptr(u)       (u)._ptrs._struct_val
#define UVal_pmc(u)       (u)._ptrs._pmc_val
#define UVal_int(u)       (u)._i._int_val
#define UVal_int2(u)      (u)._i._int_val2
#define UVal_num(u)       (u)._num_val
#define UVal_str(u)       (u)._string_val

/* Parrot Object - base class for all others */
typedef struct pobj_t {
    UnionVal u;
    Parrot_UInt flags;
} pobj_t;

/* plain Buffer is the smallest Parrot Obj */
typedef struct Buffer {
    UnionVal    cache;
    Parrot_UInt flags;
} Buffer;

typedef Buffer PObj;

#define PObj_bufstart(pmc)    (pmc)->cache._b._bufstart
#define PObj_buflen(pmc)      (pmc)->cache._b._buflen

/* See src/gc/resources.c. the basic idea is that buffer memory is
   set up as follows:
                    +-----------------+
                    |  ref_count   |f |    # GC header
  obj->bufstart  -> +-----------------+
                    |  data           |
                    v                 v

The actual set-up is more involved because of padding.  obj->bufstart must
be suitably aligned for any UnionVal.  (Perhaps it should be a Buffer
there instead.)  The start of the memory region (as returned by malloc()
is also suitably aligned for any use.  If, for example, malloc() returns
objects aligned on 8-byte boundaries, and obj->bufstart is also aligned
on 8-byte boundaries, then there should be 4 bytes of padding.  It is
handled differently in the two files resources.c and res_lea.c.
In resources.c, the buffer is carved out of a larger memory pool.  In
res_lea.c, each buffer is individually allocated.

                     src/gc/resources.c:       src/gc/res_lea.c:

ptr from malloc ->  +------------------+      +------------------+
                      [other blocks?]         | INTVAL ref_count |
                    | INTVAL ref_count |      | possible padding |
obj->bufstart   ->  +------------------+      +------------------+
                    |     data         |      |      data        |
                    v                  v      v                  v

*/
typedef struct Buffer_alloc_unit {
    INTVAL ref_count;
    UnionVal buffer[1]; /* Guarantee it's suitably aligned */
} Buffer_alloc_unit;

/* Given a pointer to the buffer, find the ref_count and the actual start of
   the allocated space. Setting ref_count is clunky because we avoid lvalue
   casts. */
#ifdef GC_IS_MALLOC       /* see src/gc/res_lea.c */
#  define Buffer_alloc_offset    (offsetof(Buffer_alloc_unit, buffer))
#  define PObj_bufallocstart(b)  ((char *)PObj_bufstart(b) - Buffer_alloc_offset)
#  define PObj_bufrefcount(b)    (((Buffer_alloc_unit *)PObj_bufallocstart(b))->ref_count)
#  define PObj_bufrefcountptr(b) (&PObj_bufrefcount(b))
#else                     /* see src/gc/resources.c */
#  define Buffer_alloc_offset sizeof (INTVAL)
#  define PObj_bufallocstart(b)  ((char *)PObj_bufstart(b) - Buffer_alloc_offset)
#  define PObj_bufrefcount(b)    (*(INTVAL *)PObj_bufallocstart(b))
#  define PObj_bufrefcountptr(b) ((INTVAL *)PObj_bufallocstart(b))
#endif

typedef enum {
    enum_stringrep_unknown = 0,
    enum_stringrep_one     = 1,
    enum_stringrep_two     = 2,
    enum_stringrep_four    = 4
} parrot_string_representation_t;

struct parrot_string_t {
    UnionVal    cache;
    Parrot_UInt flags;
    char       *strstart;
    UINTVAL     bufused;
    UINTVAL     strlen;
    UINTVAL     hashval; /* cached hash value computation */

    /*    parrot_string_representation_t representation;*/
    const struct _encoding *encoding;
    const struct _charset  *charset;
};

/* note that cache and flags are isomorphic with Buffer and PObj */
struct PMC {
    UnionVal        cache;
    Parrot_UInt     flags;
    VTABLE         *vtable;
    DPOINTER       *data;
    struct PMC_EXT *pmc_ext;
};

struct _Sync;   /* forward decl */

typedef struct PMC_EXT {
    PMC *_metadata;      /* properties */
    /*
     * PMC access synchronization for shared PMCs
     * s. parrot/thread.h
     */
    struct _Sync *_synchronize;

    /* This flag determines the next PMC in the 'used' list during
       dead object detection in the GC. It is a linked list, which is
       only valid in trace_active_PMCs. Also, the linked list is
       guaranteed to have the tail element's _next_for_GC point to itself,
       which makes much of the logic and checks simpler. We then have to
       check for PMC->_next_for_GC == PMC to find the end of list. */
    PMC *_next_for_GC;

    /* Yeah, the GC data should be out of
       band, but that makes things really slow when actually marking
       things for the GC runs. Unfortunately putting this here makes
       marking things clear for the GC pre-run slow as well, as we need
       to touch all the PMC structs. (Though we will for flag setting
       anyway) We can potentially make this a pointer to the real GC
       stuff, which'd merit an extra dereference when setting, but let
       us memset the actual GC data in a big block
    */
} PMC_EXT;

#ifdef NDEBUG
#  define PMC_ext_checked(pmc)             (pmc)->pmc_ext
#else
#  define PMC_ext_checked(pmc)             (PARROT_ASSERT((pmc)->pmc_ext), (pmc)->pmc_ext)
#endif /* NDEBUG */
#define PMC_data(pmc)                   (pmc)->data
#define PMC_data_typed(pmc, type) (type)(pmc)->data
/* do not allow PMC_data2 as lvalue */
#define PMC_data0(pmc)            (1 ? (pmc)->data : 0)
#define PMC_data0_typed(pmc)      (type)(1 ? (pmc)->data : 0)
#define PMC_metadata(pmc)     PMC_ext_checked(pmc)->_metadata
#define PMC_next_for_GC(pmc)  PMC_ext_checked(pmc)->_next_for_GC
#define PMC_sync(pmc)         PMC_ext_checked(pmc)->_synchronize

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
    /* the PMC has a PMC_EXT structure appended */
    PObj_is_PMC_EXT_FLAG        = POBJ_FLAG(10),
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
    /* Mark the contents as Copy on write */
    PObj_COW_FLAG               = POBJ_FLAG(16),
    /* the Buffer may have COW copies */
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
    PObj_active_destroy_FLAG    = POBJ_FLAG(22),
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

#define PObj_COW_TEST(o) PObj_flag_TEST(COW, o)
#define PObj_COW_SET(o) PObj_flag_SET(COW, o)
#define PObj_COW_CLEAR(o) PObj_flag_CLEAR(COW, o)

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
                (PObj_active_destroy_FLAG | \
                 PObj_custom_mark_FLAG | \
                 PObj_is_PMC_EXT_FLAG | \
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

#define PObj_active_destroy_SET(o) PObj_flag_SET(active_destroy, o)
#define PObj_active_destroy_TEST(o) PObj_flag_TEST(active_destroy, o)
#define PObj_active_destroy_CLEAR(o) PObj_flag_CLEAR(active_destroy, o)

#define PObj_is_class_SET(o) PObj_flag_SET(is_class, o)
#define PObj_is_class_TEST(o) PObj_flag_TEST(is_class, o)
#define PObj_is_class_CLEAR(o) PObj_flag_CLEAR(is_class, o)

#define PObj_is_object_SET(o) PObj_flag_SET(is_object, o)
#define PObj_is_object_TEST(o) PObj_flag_TEST(is_object, o)
#define PObj_is_object_CLEAR(o) PObj_flag_CLEAR(is_object, o)

#define PObj_is_PMC_TEST(o) PObj_flag_TEST(is_PMC, o)

#define PObj_is_PMC_EXT_TEST(o) PObj_flag_TEST(is_PMC_EXT, o)
#define PObj_is_PMC_EXT_SET(o) PObj_special_SET(is_PMC_EXT, o)

#define PObj_is_PMC_shared_TEST(o) PObj_flag_TEST(is_PMC_shared, o)
#define PObj_is_PMC_shared_SET(o)  PObj_flag_SET(is_PMC_shared, o)
#define PObj_is_PMC_shared_CLEAR(o) PObj_flag_CLEAR(is_PMC_shared, o)

#define PObj_is_shared_TEST(o) PObj_flag_TEST(is_shared, o)
#define PObj_is_shared_SET(o)  PObj_flag_SET(is_shared, o)
#define PObj_is_shared_CLEAR(o) PObj_flag_CLEAR(is_shared, o)

/* some combinations */
#define PObj_is_cowed_TESTALL(o) (PObj_get_FLAGS(o) & \
            (PObj_COW_FLAG|PObj_constant_FLAG|PObj_external_FLAG))
#define PObj_is_cowed_SETALL(o) (PObj_get_FLAGS(o) |= \
            (PObj_COW_FLAG|PObj_constant_FLAG|PObj_external_FLAG))

#define PObj_is_external_or_free_TESTALL(o) (PObj_get_FLAGS(o) & \
            (UINTVAL)(PObj_external_FLAG|PObj_on_free_list_FLAG))

#define PObj_is_external_CLEARALL(o) (PObj_get_FLAGS(o) &= \
            ~(UINTVAL)(PObj_COW_FLAG| \
                       PObj_external_FLAG|PObj_sysmem_FLAG))

#define PObj_is_live_or_free_TESTALL(o) (PObj_get_FLAGS(o) & \
        (PObj_live_FLAG | PObj_on_free_list_FLAG))

#define PObj_is_movable_TESTALL(o) (!(PObj_get_FLAGS(o) & \
        (PObj_sysmem_FLAG | PObj_on_free_list_FLAG | \
         PObj_constant_FLAG | PObj_external_FLAG)))

#define PObj_custom_mark_destroy_SETALL(o) do { \
        PObj_custom_mark_SET(o); \
        PObj_active_destroy_SET(o); \
} while (0)

#endif /* PARROT_POBJ_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
