/* pobj.h
 *  Copyright (C) 2001-2011, Parrot Foundation.
 *  Overview:
 *     Parrot Object data members and flags enum
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References: memory_internals.pod (out of date as of 8/2010).
 */

#ifndef PARROT_POBJ_H_GUARD
#define PARROT_POBJ_H_GUARD

#include "parrot/config.h"

/* This is the base Parrot object structure. Every object begins with
   this slot, then has additional slots as required. */

typedef struct pobj_t {
    Parrot_UInt flags;                  /* Lots of flags (see below). */
} PObj;

/* This is a buffer header object, "inheriting" from PObj. */

typedef struct buffer_t {
    Parrot_UInt flags;
    void *     _bufstart;               /* Pointer to start of buffer data
                                           (not buffer prolog). */
    size_t     _buflen;                 /* Length of buffer data. */
} Buffer;

typedef enum Forward_flag {
    Buffer_moved_FLAG   = 1 << 0,
    Buffer_shared_FLAG  = 1 << 1
} Forward_flags;

/* Use these macros to access the two buffer header slots. */

#define Buffer_bufstart(buffer)    (buffer)->_bufstart
#define Buffer_buflen(buffer)      (buffer)->_buflen

/* A buffer header object points to a buffer in a Memory_Block.
   The buffer includes a prolog, but _bufstart points to the data
   portion. Here is how it works:

    Buffer header                         buffer
   +-------------------+                 +------------------------+
   |       flags       |                 |  (possible padding)    | }
   +-------------------+                 +---------------------+--+  > prolog
   |      _bufstart    | ------+         |    *Memory_Block    |fl| }
   +-------------------+       |         +---------------------+--+
   |      _buflen      |       +-------> |    data portion        |
   +-------------------+                 |                        |
                                         ~                        ~
                                         |                        |
                                         +------------------------+

   The buffer prolog consists of possible padding and a pointer to the
   Memory_Block containing the buffer. There are two flags in the low-order
   bits of the pointer (see string.h). Padding is only required if the
   alignment of the data portion is higher than that of a pointer.
   This was not the case as of 8/2010.
*/

/* These macros let us address the prolog of a buffer. */

#define Buffer_prolog_offset (sizeof (void*))
#define Buffer_bufprolog(b) ((char *)Buffer_bufstart(b) - Buffer_prolog_offset)

/* This macro gives us the address of the buffer prolog treated as
   a pointer to the flags. */

#define Buffer_bufflagsptr(b) ((INTVAL *)Buffer_bufprolog(b))

/* These macros give us the Memory_Block pointer and pointer-pointer,
   eliminating the flags. */

#define Buffer_pool(b) ((Memory_Block *)( *(INTVAL*)(Buffer_bufprolog(b)) & ~3 ))
#define Buffer_poolptr(b) ((Memory_Block **)Buffer_bufprolog(b))


/* Here is the Parrot string header object, "inheriting" from Buffer. */

struct parrot_string_t {
    Parrot_UInt flags;
    void *     _bufstart;
    size_t     _buflen;
    char       *strstart;               /* Pointer to start of string
                                           (not necessarily at _bufstart). */
    UINTVAL     bufused;                /* Length of string in bytes. */
    UINTVAL     strlen;                 /* Length of string in characters. */
    UINTVAL     hashval;                /* Cached hash value. */

    /*    parrot_string_representation_t representation;*/
    const struct _str_vtable *encoding; /* Pointer to string vtable. */
};

/* Here is the Parrot PMC object, "inheriting" from PObj. */

struct PMC {
    Parrot_UInt    flags;
    VTABLE         *vtable;             /* Pointer to vtable. */
    DPOINTER       *data;               /* Pointer to attribute structure. */
    PMC            *_metadata;          /* Pointer to metadata PMC. */
};

/* Use these macros to access the data and metadata. */

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
    /* PObj is a copy of a string that doesn't own the string buffer */
    PObj_is_string_copy_FLAG    = POBJ_FLAG(10),
    /* the PMC is a shared PMC */
    PObj_is_PMC_shared_FLAG     = POBJ_FLAG(11), /* Same as PObj_is_shared_FLAG */
    /* PObj is otherwise shared */
    PObj_is_shared_FLAG         = POBJ_FLAG(11), /* Same as PObj_is_PMC_shared_FLAG */

/* Memory management FLAGs */
    /* This is a constant--don't kill it! */
    PObj_constant_FLAG          = POBJ_FLAG(12),
    /* Marks the contents as coming from a non-Parrot source */
    PObj_external_FLAG          = POBJ_FLAG(13),
    /* Mark the buffer as pointing to system memory */
    PObj_sysmem_FLAG            = POBJ_FLAG(14),

/* PObj usage FLAGs, COW & GC */
    /* The Buffer allows COW copies, and may have some. */
    PObj_is_COWable_FLAG        = POBJ_FLAG(15),
    /* Private flag for the GC system. Set if the PObj's in use as
     * far as the GC's concerned */
    b_PObj_live_FLAG            = POBJ_FLAG(16),
    /* Mark the object as on the free list */
    b_PObj_on_free_list_FLAG    = POBJ_FLAG(17),

/* GC FLAGS */
    /* Set to true if the PObj has a custom mark routine */
    PObj_custom_mark_FLAG       = POBJ_FLAG(18),
    /* Set if the PObj has a destroy method that must be called */
    PObj_custom_destroy_FLAG    = POBJ_FLAG(19),
    /* For debugging, report when this buffer gets moved around */
    PObj_report_FLAG            = POBJ_FLAG(20),

    /* Flags used by generation GC to determine generation object belong */
    PObj_GC_generation_0_FLAG   = POBJ_FLAG(22),
    PObj_GC_generation_1_FLAG   = POBJ_FLAG(23),
    PObj_GC_generation_2_FLAG   = POBJ_FLAG(24),

    /* Object was marked dirty by write barrier */
    PObj_GC_on_dirty_list_FLAG  = POBJ_FLAG(25),

    /* Object requires write barrier */
    PObj_GC_need_write_barrier_FLAG = POBJ_FLAG(26),

    /* Object on C stack will require implicit put to dirty list in GMS */
    PObj_GC_soil_root_FLAG      = POBJ_FLAG(27),

    /* For simplify some cleanup/setup */
    PObj_GC_all_generation_FLAGS = PObj_GC_generation_0_FLAG
                                 | PObj_GC_generation_1_FLAG
                                 | PObj_GC_generation_2_FLAG,

    PObj_GC_all_FLAGS            = PObj_GC_all_generation_FLAGS
                                 | PObj_GC_on_dirty_list_FLAG
                                 | PObj_GC_need_write_barrier_FLAG,

/* PMC specific FLAGs */
    /* true if this is connected by some route to a needs_early_gc object */
    PObj_needs_early_gc_FLAG    = POBJ_FLAG(28),

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

#define PObj_is_string_copy_TEST(o) PObj_flag_TEST(is_string_copy, o)
#define PObj_is_string_copy_SET(o) PObj_flag_SET(is_string_copy, o)
#define PObj_is_string_copy_CLEAR(o) PObj_flag_CLEAR(is_string_copy, o)

#define PObj_sysmem_TEST(o) PObj_flag_TEST(sysmem, o)
#define PObj_sysmem_SET(o) PObj_flag_SET(sysmem, o)
#define PObj_sysmem_CLEAR(o) PObj_flag_CLEAR(sysmem, o)


#define PObj_needs_early_gc_TEST(o) PObj_flag_TEST(needs_early_gc, o)
#define PObj_needs_early_gc_SET(o) PObj_flag_SET(needs_early_gc, o)
#define PObj_needs_early_gc_CLEAR(o) PObj_flag_CLEAR(needs_early_gc, o)

#define PObj_high_priority_gc_TEST(o)   PObj_flag_TEST(high_priority_gc, o)
#define PObj_high_priority_gc_SET(o)     PObj_flag_SET(high_priority_gc, o)
#define PObj_high_priority_gc_CLEAR(o) PObj_flag_CLEAR(high_priority_gc, o)

#define PObj_custom_mark_SET(o)   PObj_flag_SET(custom_mark, o)
#define PObj_custom_mark_CLEAR(o)   PObj_flag_CLEAR(custom_mark, o)
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

#define PObj_GC_on_dirty_list_TEST(o)  PObj_flag_TEST(GC_on_dirty_list, o)
#define PObj_GC_on_dirty_list_SET(o)   PObj_flag_SET(GC_on_dirty_list, o)
#define PObj_GC_on_dirty_list_CLEAR(o) PObj_flag_CLEAR(GC_on_dirty_list, o)

#define PObj_GC_need_write_barrier_TEST(o)  PObj_flag_TEST(GC_need_write_barrier, o)
#define PObj_GC_need_write_barrier_SET(o)   PObj_flag_SET(GC_need_write_barrier, o)
#define PObj_GC_need_write_barrier_CLEAR(o) PObj_flag_CLEAR(GC_need_write_barrier, o)

#define PObj_GC_soil_root_TEST(o)  PObj_flag_TEST(GC_soil_root, o)
#define PObj_GC_soil_root_SET(o)   PObj_flag_SET(GC_soil_root, o)
#define PObj_GC_soil_root_CLEAR(o) PObj_flag_CLEAR(GC_soil_root, o)


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

#define PObj_is_growable_TESTALL(o) (!(PObj_get_FLAGS(o) & \
        (PObj_sysmem_FLAG | PObj_is_string_copy_FLAG | \
         PObj_constant_FLAG | PObj_external_FLAG)))

#define PObj_custom_mark_destroy_SETALL(o) do { \
        PObj_custom_mark_SET(o); \
        PObj_custom_destroy_SET(o); \
} while (0)

#define PObj_gc_CLEAR(o) (PObj_get_FLAGS(o) \
    &= ~PObj_custom_destroy_FLAG \
     & ~PObj_custom_mark_FLAG \
     & ~PObj_live_FLAG)

#endif /* PARROT_POBJ_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
