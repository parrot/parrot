/* pobj.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Parrot Object data members and flags enum
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References: memory_internals.pod
 */

#if !defined(PARROT_POBJ_H_GUARD)
#define PARROT_POBJ_H_GUARD

#include "parrot/config.h"

/*
 * if define below is 1:
 *
 * live, on_free_list, special_PMC are kept in the pools arenas
 * this needs aligned memory
 */

#define ARENA_DOD_FLAGS 1

#if ARENA_DOD_FLAGS && ! defined(PARROT_HAS_SOME_MEMALIGN)
#  undef ARENA_DOD_FLAGS
#  define ARENA_DOD_FLAGS 0
#endif


typedef union UnionVal {
    struct {                    /* Buffers structure */
        void * _bufstart;
        size_t _buflen;
    } _b;
    struct {                    /* PMC unionval members */
        DPOINTER* _struct_val;   /* two ptrs, both are defines */
        PMC* _pmc_val;
    } _ptrs;
    INTVAL _int_val;
    FLOATVAL _num_val;
    struct parrot_string_t * _string_val;
} UnionVal;

#define UVal_ptr(u)       (u)._ptrs._struct_val
#define UVal_pmc(u)       (u)._ptrs._pmc_val
#define UVal_int(u)       (u)._int_val
#define UVal_num(u)       (u)._num_val
#define UVal_str(u)       (u)._string_val
#define UVal_bufstart(u)  (u)._b._bufstart
#define UVal_buflen(u)    (u)._b._buflen

/* BEGIN DEPRECATED UVAL ACCESSOR MACROS */
#define num_val _num_val
#define int_val _int_val
#define string_val _string_val
#define struct_val _ptrs._struct_val
#define pmc_val _ptrs._pmc_val

#define PMC_ptr1v(pmc) PMC_struct_val(pmc)
#define PMC_ptr2p(pmc) PMC_pmc_val(pmc)
/* END DEPRECATED UVAL ACCESSOR MACROS */

/* Parrot Object - base class for all others */
typedef struct pobj_t {
    UnionVal u;
    Parrot_UInt flags;
#if ! DISABLE_GC_DEBUG
    UINTVAL _pobj_version;
#endif /* ! DISABLE_GC_DEBUG */
} pobj_t;

/* plain Buffer is the smallest Parrot Obj */
typedef struct Buffer {
    pobj_t obj;
} Buffer;

typedef Buffer PObj;

#define PObj_bufstart(pmc)     (pmc)->obj.u._b._bufstart
#define PObj_buflen(pmc)       (pmc)->obj.u._b._buflen
#define PMC_struct_val(pmc)   (pmc)->obj.u._ptrs._struct_val
#define PMC_pmc_val(pmc)      (pmc)->obj.u._ptrs._pmc_val
#define PMC_int_val(pmc)      (pmc)->obj.u._int_val
#define PMC_num_val(pmc)      (pmc)->obj.u._num_val
#define PMC_str_val(pmc)      (pmc)->obj.u._string_val

/* BEGIN DEPRECATED BUFFER ACCESSORS */
/* macros for accessing old buffer members
 * #define bufstart obj.u._b._bufstart
 * #define buflen   obj.u._b._buflen
 * END DEPRECATED BUFFER ACCESSORS
 */

#if ! DISABLE_GC_DEBUG
/* BEGIN DEPRECATED POBJ ACCESSOR */
#  define pobj_version obj._pobj_version
/* END DEPRECATED POBJ ACCESSOR */
#  define PObj_version(pobj)  (pobj)->obj._pobj_version
#endif /* ! DISABLE_GC_DEBUG */

typedef enum {
		enum_stringrep_unknown = 0,
		enum_stringrep_one = 1,
		enum_stringrep_two = 2,
		enum_stringrep_four = 4
	} parrot_string_representation_t;

struct parrot_string_t {
    pobj_t obj;
    UINTVAL bufused;
    void *strstart;
    UINTVAL strlen;
	parrot_string_representation_t representation;
    UINTVAL hashval; /* cached hash value computation; not yet used */
};

    /* cache.* is intended to just be *shortcuts* to*/
    /* commonly-accessed data, *not* pointers to */
    /* completely different data.  That's why it's */
    /* referred to as a "cache". */

/* put data into the PMC_EXT structure */
#define PMC_DATA_IN_EXT 1

struct PMC {
    pobj_t obj;
    VTABLE *vtable;
#if ! PMC_DATA_IN_EXT
    DPOINTER *data;
#endif /* ! PMC_DATA_IN_EXT */
    struct PMC_EXT *pmc_ext;
};

struct _Sync;   /* forward decl */

struct PMC_EXT {
#if PMC_DATA_IN_EXT
    DPOINTER *data;
#endif /* PMC_DATA_IN_EXT */
    PMC *_metadata;      /* properties */
    /*
     * PMC access synchronization for shared PMCs
     * s. parrot/thread.h
     */
    struct _Sync *_synchronize;

    /* This flag determines the next PMC in the 'used' list during
       dead object detection in the GC. It is a linked list, which is
       only valid in trace_active_PMCs. Also, the linked list is
       guaranteed to have the tail element's next_for_GC point to itself,
       which makes much of the logic and checks simpler. We then have to
       check for PMC->next_for_GC == PMC to find the end of list. */
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
};

typedef struct PMC_EXT PMC_EXT;

#if PMC_DATA_IN_EXT
#  define PMC_data(pmc)       (pmc)->pmc_ext->data
#else
#  define PMC_data(pmc)       (pmc)->data
#endif /* PMC_DATA_IN_EXT */
#define PMC_metadata(pmc)     (pmc)->pmc_ext->_metadata
#define PMC_next_for_GC(pmc)  (pmc)->pmc_ext->_next_for_GC
#define PMC_sync(pmc)         (pmc)->pmc_ext->_synchronize
#define PMC_union(pmc)        (pmc)->obj.u

/* macro for accessing union data */
#define cache obj.u
#define next_for_GC pmc_ext->_next_for_GC
#define metadata pmc_ext->_metadata
#define synchronize pmc_ext->_synchronize

/* PObj flags */
typedef enum PObj_enum {
    /* This first 8 flags may be used privately by a Parrot Object.
     * It is suggested that you alias these within an individual
     * class's header file
     */
    PObj_private0_FLAG = 1 << 0,
    PObj_private1_FLAG = 1 << 1,
    PObj_private2_FLAG = 1 << 2,
    PObj_private3_FLAG = 1 << 3,
    PObj_private4_FLAG = 1 << 4,
    PObj_private5_FLAG = 1 << 5,
    PObj_private6_FLAG = 1 << 6,
    PObj_private7_FLAG = 1 << 7,

    /* Object specification FLAGs */

    /* PObj is a string */
    PObj_is_string_FLAG = 1 << 8,
    /* PObj is a PMC */
    PObj_is_PMC_FLAG = 1 << 9,
    /* the PMC has a PMC_EXT structure appended */
    PObj_is_PMC_EXT_FLAG = 1 << 10,
    /* the PMC is a shared PMC */
    PObj_is_PMC_shared_FLAG = 1 << 11,

    /* Memory management FLAGs */

    /* The contents of the buffer can't be moved by the GC */
    PObj_immobile_FLAG = 1 << 12,
    /* Marks the contents as coming from a non-Parrot source,
     * also used for COWed strings */
    PObj_external_FLAG = 1 << 13,
    /* real external bufstart string */
    PObj_bufstart_external_FLAG = 1 << 14,
    /* Mark the buffer as pointing to system memory */
    PObj_sysmem_FLAG = 1 << 15,

    /* PObj usage FLAGs, COW & GC */

    /* Mark the contents as Copy on write */
    PObj_COW_FLAG = 1 << 16,
    /* This is a constant--don't kill it! */
    PObj_constant_FLAG = 1 << 17,
    /* Private flag for the GC system. Set if the PObj's in use as
     * far as the GC's concerned */
    b_PObj_live_FLAG = 1 << 18,
    /* Mark the object as on the free list */
    b_PObj_on_free_list_FLAG = 1 << 19,

    /* DOD/GC FLAGS */

    /* Set to true if the PObj has a custom mark routine */
    PObj_custom_mark_FLAG = 1 << 20,
    /* Mark the buffer as needing GC */
    PObj_custom_GC_FLAG = 1 << 21,
    /* Set if the PObj has a destroy method that must be called */
    PObj_active_destroy_FLAG = 1 << 22,
    /* For debugging, report when this buffer gets moved around */
    PObj_report_FLAG = 1 << 23,

    /* PMC specific FLAGs */

    /* Set to true if the PMC data pointer points to something that
     * looks like a string or buffer pointer */
    PObj_is_buffer_ptr_FLAG = 1 << 24,
    /* Set to true if the data pointer points to a PMC */
    PObj_is_PMC_ptr_FLAG = 1 << 25,
    /* When both the is_PMC_ptr and is_buffer_ptr flags
       are set, we assume that data is pointing to a buffer of PMCs, and
       will run through that buffer and mark all the PMCs in it as live */
    PObj_is_buffer_of_PMCs_ptr_FLAG = (1 << 24 | 1 << 25),
    /* a PMC that needs special handling in DOD, i.e one that has either:
     * - metadata
     * - is_PMC_ptr_FLAG
     * - is_buffer_ptr_FLAG
     * - custom_mark_FLAG
     */
    b_PObj_is_special_PMC_FLAG = 1 << 26,

    /* true if this is connected by some route to a needs_early_DOD object */
    PObj_high_priority_DOD_FLAG = 1 << 27,
    PObj_needs_early_DOD_FLAG = (1 << 27 | 1 << 28),

    /* True if the PMC is a class */
    PObj_is_class_FLAG = 1 << 29,
    /* True if the PMC is a parrot object */
    PObj_is_object_FLAG = 1 << 30

} PObj_flags;

/*
 * flag access macros:
 * directly using any flags is strongly deprecated, please use
 * these macros
 */

#if ARENA_DOD_FLAGS
/*
 * these flags are stored in one nibble per object. 0x08 is unused.
 */
#  define d_PObj_live_FLAG              ((UINTVAL)0x01)
#  define d_PObj_on_free_list_FLAG      ((UINTVAL)0x02)
#  define d_PObj_is_special_PMC_FLAG    ((UINTVAL)0x04)

/*
 * arenas are constant sized ~32 byte object size, ~16K objects
 */
# define ARENA_SIZE (32*1024*16)
# define ARENA_ALIGN ARENA_SIZE
# define ARENA_MASK (~ (ARENA_SIZE-1) )

/*
 * ARENA_FLAG_SHIFT is log2 of the number of nibbles per UINTVAL, i.e. how
 * many object flag sets fit into a frame of arena->dod_flags.
 * ARENA_FLAG_MASK has its lowest ARENA_FLAG_SHIFT bits set.
 *
 * 32-bit systems have 32/4=8=2<<3 nibbles per word
 * 64-bit systems have 64/4=16=2<<4 nibbles per word
 */

#if INTVAL_SIZE == 4
# define ARENA_FLAG_SHIFT 3
# define ARENA_FLAG_MASK 0x7
# define ALL_LIVE_MASK 0x11111111
# define ALL_FREE_MASK 0x22222222
#elif INTVAL_SIZE == 8
# define ARENA_FLAG_SHIFT 4
# define ARENA_FLAG_MASK 0xf
# define ALL_LIVE_MASK 0x1111111111111111
# define ALL_FREE_MASK 0x2222222222222222
#else
# error Unsupported INTVAL_SIZE
#endif /* INTVAL_SIZE == 4 */
# define ARENA_OBJECTS(_pool) ( ARENA_SIZE / _pool->object_size )
# define ARENA_FLAG_SIZE(_pool) \
     (4*sizeof(INTVAL) + sizeof(INTVAL) * \
      ((ARENA_OBJECTS(_pool) >> ARENA_FLAG_SHIFT )) )

/*
 * since arenas are memaligned, the beginning of one can be found by zeroing
 * the low bits of any object in it
 */
# define GET_ARENA(o) \
     ((struct Small_Object_Arena *) (PTR2UINTVAL(o) & ARENA_MASK))

/*
 * objects are all same size, so to determine one's index we need only divide
 * its offset in the arena by that size
 */
# define GET_OBJ_N(arena, o) \
     ((PTR2UINTVAL(o) - PTR2UINTVAL((arena)->start_objects)) \
          / (arena)->object_size)

/*
 * see memory_internals.pod for discussion of flag packing format
 */
# define DOD_flag_TEST(flag, o) \
      GET_ARENA(o)->dod_flags[ GET_OBJ_N(GET_ARENA(o), o) >> \
      ARENA_FLAG_SHIFT ] & ((d_PObj_ ## flag ## _FLAG << \
      (( GET_OBJ_N(GET_ARENA(o), o) & ARENA_FLAG_MASK ) << 2)))

# define DOD_flag_SET(flag, o) \
  do { \
      struct Small_Object_Arena *_arena = GET_ARENA(o); \
      size_t _n = GET_OBJ_N(_arena, o); \
      _arena->dod_flags[ _n >> ARENA_FLAG_SHIFT ] |= \
         ((d_PObj_ ## flag ## _FLAG << (( _n & ARENA_FLAG_MASK ) << 2))); \
  } \
  while (0)
# define DOD_flag_CLEAR(flag, o) \
  do { \
      struct Small_Object_Arena *_arena = GET_ARENA(o); \
      size_t _n = GET_OBJ_N(_arena, o); \
      _arena->dod_flags[ _n >> ARENA_FLAG_SHIFT ] &= \
         ~((d_PObj_ ## flag ## _FLAG << (( _n & ARENA_FLAG_MASK ) << 2))); \
  } \
  while (0)

#  define PObj_live_FLAG              d_PObj_live_FLAG
#  define PObj_on_free_list_FLAG      d_PObj_on_free_list_FLAG
#  define PObj_is_special_PMC_FLAG    d_PObj_is_special_PMC_FLAG

#else

#  define PObj_live_FLAG              b_PObj_live_FLAG
#  define PObj_on_free_list_FLAG      b_PObj_on_free_list_FLAG
#  define PObj_is_special_PMC_FLAG    b_PObj_is_special_PMC_FLAG

#  define DOD_flag_TEST(flag, o)      PObj_flag_TEST(flag, o)
#  define DOD_flag_SET(flag, o)       PObj_flag_SET(flag, o)
#  define DOD_flag_CLEAR(flag, o)     PObj_flag_CLEAR(flag, o)

#endif /* ARENA_DOD_FLAGS */

#define PObj_get_FLAGS(o) ((o)->obj.flags)

#define PObj_flag_TEST(flag, o) (PObj_get_FLAGS(o) & PObj_ ## flag ## _FLAG)
#define PObj_flag_SET(flag, o) (PObj_get_FLAGS(o) |= PObj_ ## flag ## _FLAG)
#define PObj_flag_CLEAR(flag, o) \
        (PObj_get_FLAGS(o) &= ~(UINTVAL)(PObj_ ## flag ## _FLAG))

#define PObj_flags_SETTO(o, f) PObj_get_FLAGS(o) = (f)
#define PObj_flags_CLEARALL(o) PObj_flags_SETTO(o, 0)

#define PObj_COW_TEST(o) PObj_flag_TEST(COW, o)
#define PObj_COW_SET(o) PObj_flag_SET(COW, o)
#define PObj_COW_CLEAR(o) PObj_flag_CLEAR(COW, o)

#define PObj_constant_TEST(o) PObj_flag_TEST(constant, o)
#define PObj_constant_SET(o) PObj_flag_SET(constant, o)
#define PObj_constant_CLEAR(o) PObj_flag_CLEAR(constant, o)

#define PObj_external_TEST(o) PObj_flag_TEST(external, o)
#define PObj_external_SET(o) PObj_flag_SET(external, o)
#define PObj_external_CLEAR(o) PObj_flag_CLEAR(external, o)

#define PObj_bufstart_external_TEST(o) PObj_flag_TEST(bufstart_external, o)
#define PObj_bufstart_external_SET(o) PObj_flag_SET(bufstart_external, o)

#define PObj_report_TEST(o) PObj_flag_TEST(report, o)
#define PObj_report_SET(o) PObj_flag_SET(report, o)
#define PObj_report_CLEAR(o) PObj_flag_CLEAR(report, o)


#define PObj_on_free_list_TEST(o) DOD_flag_TEST(on_free_list, o)
#define PObj_on_free_list_SET(o) DOD_flag_SET(on_free_list, o)
#define PObj_on_free_list_CLEAR(o) DOD_flag_CLEAR(on_free_list, o)

#define PObj_live_TEST(o) DOD_flag_TEST(live, o)
#define PObj_live_SET(o) DOD_flag_SET(live, o)
#define PObj_live_CLEAR(o) DOD_flag_CLEAR(live, o)

#define PObj_is_string_TEST(o) PObj_flag_TEST(is_string, o)
#define PObj_is_string_SET(o) PObj_flag_SET(is_string, o)
#define PObj_is_string_CLEAR(o) PObj_flag_CLEAR(is_string, o)

#define PObj_immobile_TEST(o) PObj_flag_TEST(immobile, o)
#define PObj_immobile_SET(o) PObj_flag_SET(immobile, o)
#define PObj_immobile_CLEAR(o) PObj_flag_CLEAR(immobile, o)

#define PObj_sysmem_TEST(o) PObj_flag_TEST(sysmem, o)
#define PObj_sysmem_SET(o) PObj_flag_SET(sysmem, o)
#define PObj_sysmem_CLEAR(o) PObj_flag_CLEAR(sysmem, o)


#define PObj_special_SET(flag, o) do { \
    PObj_flag_SET(flag, o); \
    DOD_flag_SET(is_special_PMC, o); \
} while(0)

#define PObj_special_CLEAR(flag, o) do { \
    PObj_flag_CLEAR(flag, o); \
    if ((PObj_get_FLAGS(o) & \
                (PObj_active_destroy_FLAG | \
                 PObj_custom_mark_FLAG | \
                 PObj_is_PMC_ptr_FLAG | \
                 PObj_is_PMC_EXT_FLAG | \
                 PObj_needs_early_DOD_FLAG | \
                 PObj_is_buffer_of_PMCs_ptr_FLAG | \
                 PObj_is_buffer_ptr_FLAG))) \
        DOD_flag_SET(is_special_PMC, o); \
    else \
        DOD_flag_CLEAR(is_special_PMC, o); \
} while (0)

#define PObj_is_special_PMC_TEST(o) DOD_flag_TEST(is_special_PMC, o)
#define PObj_is_special_PMC_SET(o) DOD_flag_SET(is_special_PMC, o)

#define PObj_is_buffer_ptr_SET(o) PObj_special_SET(is_buffer_ptr, o)
#define PObj_is_buffer_ptr_CLEAR(o) PObj_special_CLEAR(is_buffer_ptr, o)

#define PObj_is_buffer_of_PMCs_ptr_SET(o) \
    PObj_special_SET(is_buffer_of_PMCs_ptr, o)
#define PObj_is_buffer_of_PMCs_ptr_CLEAR(o) \
    PObj_special_CLEAR(is_buffer_of_PMCs_ptr, o)

#define PObj_needs_early_DOD_TEST(o) PObj_flag_TEST(needs_early_DOD, o)
#define PObj_needs_early_DOD_SET(o) PObj_special_SET(needs_early_DOD, o)
#define PObj_needs_early_DOD_CLEAR(o) PObj_special_CLEAR(needs_early_DOD, o)

#define PObj_high_priority_DOD_TEST(o)   PObj_flag_TEST(high_priority_DOD, o)
#define PObj_high_priority_DOD_SET(o)     PObj_special_SET(high_priority_DOD, o)
#define PObj_high_priority_DOD_CLEAR(o) PObj_special_CLEAR(high_priority_DOD, o)

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


/* some combinations */
#define PObj_is_cowed_TESTALL(o) (PObj_get_FLAGS(o) & \
            (PObj_COW_FLAG|PObj_constant_FLAG|PObj_external_FLAG))
#define PObj_is_cowed_SETALL(o) (PObj_get_FLAGS(o) |= \
            (PObj_COW_FLAG|PObj_constant_FLAG|PObj_external_FLAG))

#define PObj_is_external_TESTALL(o) (PObj_get_FLAGS(o) & \
            (UINTVAL)(PObj_COW_FLAG|PObj_bufstart_external_FLAG| \
		    PObj_external_FLAG|PObj_immobile_FLAG))

#define PObj_is_external_or_free_TESTALL(o) (PObj_get_FLAGS(o) & \
            (UINTVAL)(PObj_external_FLAG|PObj_on_free_list_FLAG))

#define PObj_is_external_CLEARALL(o) (PObj_get_FLAGS(o) &= \
            ~(UINTVAL)(PObj_COW_FLAG|PObj_bufstart_external_FLAG| \
		    PObj_external_FLAG|PObj_immobile_FLAG))

#define PObj_is_live_or_free_TESTALL(o) (PObj_get_FLAGS(o) & \
        (PObj_live_FLAG | PObj_on_free_list_FLAG))

#define PObj_is_movable_TESTALL(o) (!(PObj_get_FLAGS(o) & \
        (PObj_immobile_FLAG |  \
         PObj_constant_FLAG | PObj_external_FLAG)))

#define PObj_custom_mark_destroy_SETALL(o) do { \
        PObj_custom_mark_SET(o); \
        PObj_active_destroy_SET(o); \
} while(0)

#endif /* PARROT_POBJ_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
