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

/* PObj flags */
typedef enum PObj {
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
    PObj_is_buffer_of_PMCs_ptr_FLAG = (1 << 24 | 1 << 25)

} PObj_flags;

/*
 * flag access macros:
 * directly using any flags is strongly deprecated, please use
 * these macros
 */
#define PObj_get_FLAGS(o) (o)->flags

#define PObj_flag_TEST(flag, o) ((o)->flags & PObj_ ## flag ## _FLAG)
#define PObj_flag_SET(flag, o) ((o)->flags |= PObj_ ## flag ## _FLAG)
#define PObj_flag_CLEAR(flag, o) \
        ((o)->flags &= ~(UINTVAL)(PObj_ ## flag ## _FLAG))

#define PObj_flags_SETTO(o, f) (o)->flags = (f)
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

#define PObj_active_destroy_TEST(o) PObj_flag_TEST(active_destroy, o)
#define PObj_active_destroy_SET(o) PObj_flag_SET(active_destroy, o)
#define PObj_active_destroy_CLEAR(o) PObj_flag_CLEAR(active_destroy, o)

/* some combinations */
#define PObj_is_cowed_TESTALL(o) ((o)->flags & \
            (PObj_COW_FLAG|PObj_constant_FLAG|PObj_external_FLAG))
#define PObj_is_cowed_SETALL(o) ((o)->flags |= \
            (PObj_COW_FLAG|PObj_constant_FLAG|PObj_external_FLAG))

#define PObj_is_external_TESTALL(o) ((o)->flags & \
            (UINTVAL)(PObj_COW_FLAG|PObj_bufstart_external_FLAG| \
		    PObj_external_FLAG|PObj_immobile_FLAG))
#define PObj_is_external_or_free_TESTALL(o) ((o)->flags & \
            (UINTVAL)(PObj_external_FLAG|PObj_on_free_list_FLAG))

#define PObj_is_external_CLEARALL(o) ((o)->flags &= \
            ~(UINTVAL)(PObj_COW_FLAG|PObj_bufstart_external_FLAG| \
		    PObj_external_FLAG|PObj_immobile_FLAG))

#define PObj_is_live_or_free_TESTALL(o) ((o)->flags & \
        (PMC_live_FLAG | PMC_on_free_list_FLAG | PMC_constant_FLAG))

/* compat macros */

/* Buffer flags */
typedef enum BUFFER_flag {
    BUFFER_private0_FLAG = PObj_private0_FLAG,
    BUFFER_private1_FLAG = PObj_private1_FLAG,
    BUFFER_private2_FLAG = PObj_private2_FLAG,
    BUFFER_private3_FLAG = PObj_private3_FLAG,
    BUFFER_private4_FLAG = PObj_private4_FLAG,
    BUFFER_private5_FLAG = PObj_private5_FLAG,
    BUFFER_private6_FLAG = PObj_private6_FLAG,
    BUFFER_private7_FLAG = PObj_private7_FLAG,
    BUFFER_immobile_FLAG = PObj_immobile_FLAG,
    BUFFER_external_FLAG = PObj_external_FLAG,
    BUFFER_sysmem_FLAG = PObj_sysmem_FLAG,
    BUFFER_COW_FLAG = PObj_COW_FLAG,
    BUFFER_live_FLAG = PObj_live_FLAG,
    BUFFER_needs_GC_FLAG = PObj_custom_GC_FLAG,
    BUFFER_on_free_list_FLAG = PObj_on_free_list_FLAG,
    BUFFER_constant_FLAG = PObj_constant_FLAG,
    BUFFER_report_FLAG =PObj_report_FLAG,
    BUFFER_bufstart_external_FLAG = PObj_bufstart_external_FLAG,
    BUFFER_strstart_FLAG = PObj_is_string_FLAG
} BUFFER_flags;


typedef enum {
    PMC_private0_FLAG = PObj_private0_FLAG,
    PMC_private1_FLAG = PObj_private1_FLAG,
    PMC_private2_FLAG = PObj_private2_FLAG,
    PMC_private3_FLAG = PObj_private3_FLAG,
    PMC_private4_FLAG = PObj_private4_FLAG,
    PMC_private5_FLAG = PObj_private5_FLAG,
    PMC_private6_FLAG = PObj_private6_FLAG,
    PMC_private7_FLAG = PObj_private7_FLAG,
    PMC_active_destroy_FLAG = PObj_active_destroy_FLAG,
    PMC_is_buffer_ptr_FLAG = PObj_is_buffer_ptr_FLAG,
    PMC_is_PMC_ptr_FLAG = PObj_is_PMC_ptr_FLAG,
    PMC_private_GC_FLAG = PObj_custom_GC_FLAG,
    PMC_custom_mark_FLAG = PObj_custom_mark_FLAG,
    PMC_live_FLAG = PObj_live_FLAG,
    PMC_on_free_list_FLAG = PObj_on_free_list_FLAG,
    PMC_constant_FLAG = PObj_constant_FLAG
} PMC_flags;

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
