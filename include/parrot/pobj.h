/* pobj.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Parrot Object data members and flags enum
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_POBJ_H_GUARD)
#define PARROT_POBJ_H_GUARD

#include "parrot/config.h"

typedef union UnionVal {
    INTVAL int_val;             /* PMC unionval members */
    FLOATVAL num_val;
    DPOINTER* struct_val;
    struct parrot_string_t * string_val;
    PMC* pmc_val;
    struct {                    /* Buffers structure */
        void * bufstart;
        size_t buflen;
    } b;
} UnionVal;

/* Parrot Object - base class for all others */
typedef struct pobj_t {
    UnionVal u;
    Parrot_UInt flags;
#if ! DISABLE_GC_DEBUG
    UINTVAL version;
#endif
} pobj_t;

/* plain Buffer is the smallest Parrot Obj */
typedef struct Buffer {
    pobj_t obj;
} Buffer;

typedef Buffer PObj;

/* macros for accessing old buffer members */
#define bufstart obj.u.b.bufstart
#define buflen   obj.u.b.buflen
#if ! DISABLE_GC_DEBUG
#  define version obj.version
#endif

struct parrot_string_t {
    pobj_t obj;
    UINTVAL bufused;
    void *strstart;
    UINTVAL strlen;
    const ENCODING *encoding;
    const CHARTYPE *type;
    INTVAL language;
};

    /* cache.* is intended to just be *shortcuts* to*/
    /* commonly-accessed data, *not* pointers to */
    /* completely different data.  That's why it's */
    /* referred to as a "cache". */
struct PMC {
    pobj_t obj;
    VTABLE *vtable;
    DPOINTER *data;
    PMC *metadata;

    SYNC *synchronize;
    /* This flag determines the next PMC in the 'used' list during
       dead object detection in the GC. It is a linked list, which is
       only valid in trace_active_PMCs. Also, the linked list is
       guaranteed to have the tail element's next_for_GC point to itself,
       which makes much of the logic and checks simpler. We then have to
       check for PMC->next_for_GC == PMC to find the end of list. */
    PMC *next_for_GC;         /* Yeah, the GC data should be out of
                                 band, but that makes things really
                                 slow when actually marking things for
                                 the GC runs. Unfortunately putting
                                 this here makes marking things clear
                                 for the GC pre-run slow as well, as
                                 we need to touch all the PMC
                                 structs. (Though we will for flag
                                 setting anyway) We can potentially
                                 make this a pointer to the real GC
                                 stuff, which'd merit an extra
                                 dereference when setting, but let us
                                 memset the actual GC data in a big
                                 block */
};

/* macro for accessing union data */
#define cache obj.u

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
    PObj_is_reserved1_FLAG = 1 << 10,
    PObj_is_reserved2_FLAG = 1 << 11,

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
    PObj_live_FLAG = 1 << 18,
    /* Mark the object as on the free list */
    PObj_on_free_list_FLAG = 1 << 19,

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
    PObj_is_special_PMC_FLAG = 1 << 26

} PObj_flags;

/*
 * flag access macros:
 * directly using any flags is strongly deprecated, please use
 * these macros
 */


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

#define PObj_on_free_list_TEST(o) PObj_flag_TEST(on_free_list, o)
#define PObj_on_free_list_SET(o) PObj_flag_SET(on_free_list, o)
#define PObj_on_free_list_CLEAR(o) PObj_flag_CLEAR(on_free_list, o)

#define PObj_live_TEST(o) PObj_flag_TEST(live, o)
#define PObj_live_SET(o) PObj_flag_SET(live, o)
#define PObj_live_CLEAR(o) PObj_flag_CLEAR(live, o)

#define PObj_is_string_TEST(o) PObj_flag_TEST(is_string, o)
#define PObj_is_string_SET(o) PObj_flag_SET(is_string, o)
#define PObj_is_string_CLEAR(o) PObj_flag_CLEAR(is_string, o)


#define PObj_special_SET(flag, o) do { \
    PObj_flag_SET(flag, o); \
    PObj_flag_SET(is_special_PMC, o); \
} while(0)
#define PObj_special_CLEAR(flag, o) do { \
    PObj_flag_CLEAR(flag, o); \
    if ((PObj_get_FLAGS(o) & (PObj_active_destroy_FLAG | PObj_is_PMC_ptr_FLAG | \
                PObj_is_buffer_ptr_FLAG)) || \
            (PObj_is_PMC_TEST(o) && ((struct PMC*)(o))->metadata)) \
        PObj_flag_SET(is_special_PMC, o); \
    else \
        PObj_flag_CLEAR(is_special_PMC, o); \
} while (0)
#define PObj_is_special_PMC_TEST(o) PObj_flag_TEST(is_special_PMC, o)
#define PObj_is_special_PMC_SET(o) PObj_flag_SET(is_special_PMC, o)

#define PObj_is_buffer_ptr_SET(o) PObj_special_SET(is_buffer_ptr, o)
#define PObj_is_buffer_ptr_CLEAR(o) PObj_special_CLEAR(is_buffer_ptr, o)

#define PObj_custom_mark_SET(o)   PObj_special_SET(custom_mark, o)

#define PObj_active_destroy_SET(o) PObj_flag_SET(active_destroy, o)
#define PObj_active_destroy_TEST(o) PObj_flag_TEST(active_destroy, o)
#define PObj_active_destroy_CLEAR(o) PObj_flag_CLEAR(active_destroy, o)

#define PObj_is_PMC_TEST(o) PObj_flag_TEST(is_PMC, o)
#define PObj_is_SPMC_TEST(o) PObj_flag_TEST(is_SPMC, o)
#define PObj_is_any_PMC_TESTALL(o) (PObj_get_FLAGS(o) & \
            (PObj_is_PMC_FLAG|PObj_is_SPMC_FLAG))


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
        (PObj_immobile_FLAG | PObj_on_free_list_FLAG | \
         PObj_constant_FLAG | PObj_external_FLAG)))

#define PObj_custom_mark_destroy_SETALL(o) do { \
        PObj_custom_mark_SET(o); \
        PObj_active_destroy_SET(o); \
} while(0)

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
