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

/* Buffer flags */
typedef enum BUFFER_flag {
    /* bits the GC can keep its dirty mitts off of */
    BUFFER_private0_FLAG = 1 << 0,
    BUFFER_private1_FLAG = 1 << 1,
    BUFFER_private2_FLAG = 1 << 2,
    BUFFER_private3_FLAG = 1 << 3,
    BUFFER_private4_FLAG = 1 << 4,
    BUFFER_private5_FLAG = 1 << 5,
    BUFFER_private6_FLAG = 1 << 6,
    BUFFER_private7_FLAG = 1 << 7,
    /* The contents of the buffer can't be moved by the GC */
    BUFFER_immobile_FLAG = 1 << 8,
    /* Marks the contents as coming from a non-Parrot source,
     * also used for COWed strings */
    BUFFER_external_FLAG = 1 << 9,
    /* Mark the buffer as pointing to system memory */
    BUFFER_sysmem_FLAG = 1 << 10,
    /* Mark the contents as Copy on write */
    BUFFER_COW_FLAG = 1 << 11,
    /* Private flag for the GC system. Set if the buffer's in use as
     * far as the GC's concerned */
    BUFFER_live_FLAG = 1 << 12,
    /* Mark the bufffer as needing GC */
    BUFFER_needs_GC_FLAG = 1 << 13,
    /* Mark the buffer as on the free list */
    BUFFER_on_free_list_FLAG = 1 << 14,
    /* This is a constant--don't kill it! */
    BUFFER_constant_FLAG = 1 << 15,
    /* For debugging, report when this buffer gets moved around */
    BUFFER_report_FLAG = 1 << 16,
    /* real external bufstart string */
    BUFFER_bufstart_external_FLAG = 1 << 17,
    BUFFER_unused_FLAG = 1 << 18,
    /* Buffer header has a strstart which needs to be updated with bufstart */
    BUFFER_strstart_FLAG = 1 << 19
} BUFFER_flags;

/*
 * flag access macros:
 * directly using any flags is strongly deprecated, please use
 * these macros
 */
#define PObj_get_FLAGS(o) (o)->flags

#define PObj_flag_TEST(flag, o) ((o)->flags & BUFFER_ ## flag ## _FLAG)
#define PObj_flag_SET(flag, o) ((o)->flags |= BUFFER_ ## flag ## _FLAG)
#define PObj_flag_CLEAR(flag, o) \
        ((o)->flags &= ~(UINTVAL)(BUFFER_ ## flag ## _FLAG))

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

/* some combinations */
#define PObj_is_cowed_TESTALL(o) ((o)->flags & \
            (BUFFER_COW_FLAG|BUFFER_constant_FLAG|BUFFER_external_FLAG))
#define PObj_is_cowed_SETALL(o) ((o)->flags |= \
            (BUFFER_COW_FLAG|BUFFER_constant_FLAG|BUFFER_external_FLAG))

#define PObj_is_external_TESTALL(o) ((o)->flags & \
            (UINTVAL)(BUFFER_COW_FLAG|BUFFER_bufstart_external_FLAG| \
		    BUFFER_external_FLAG|BUFFER_immobile_FLAG))
#define PObj_is_external_CLEARALL(o) ((o)->flags &= \
            ~(UINTVAL)(BUFFER_COW_FLAG|BUFFER_bufstart_external_FLAG| \
		    BUFFER_external_FLAG|BUFFER_immobile_FLAG))

/* compat macros */
#define PObj_external_FLAG BUFFER_external_FLAG

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
