/* pmc.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the pmc subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_PMC_H_GUARD)
#define PARROT_PMC_H_GUARD

enum {
    enum_class_Array,
    enum_class_PerlUndef,
    enum_class_PerlInt,
    enum_class_PerlNum,
    enum_class_PerlString,
    enum_class_PerlArray,
    enum_class_PerlHash,
    enum_class_ParrotPointer,
    enum_class_IntQueue,
    enum_class_max = 100
};
VAR_SCOPE VTABLE Parrot_base_vtables[enum_class_max];
VAR_SCOPE PMC *Parrot_base_classname_hash;

struct PMC {
    VTABLE *vtable;
    INTVAL flags;
    DPOINTER *data;
    union {                   /* cache.* is intended to just be *shortcuts* to*/
        INTVAL int_val;       /* commonly-accessed data, *not* pointers to */
        FLOATVAL num_val;     /* completely different data.  That's why it's */
        DPOINTER *struct_val; /* referred to as a "cache". */
    } cache;
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

/* PMC flag bits */


/* Flag bit notes: When both the is_PMC_ptr and is_buffer_ptr flags
   are set, we assume that data is pointing to a buffer of PMCs, and
   will run through that buffer and mark all the PMCs in it as live */
typedef enum {
    /* the first 8 bits are for private use by individual vtable
     * classes. It is suggested that you alias these within an individual
     * class's header file
     */
    PMC_private0_FLAG = 1 << 0,
    PMC_private1_FLAG = 1 << 1,
    PMC_private2_FLAG = 1 << 2,
    PMC_private3_FLAG = 1 << 3,
    PMC_private4_FLAG = 1 << 4,
    PMC_private5_FLAG = 1 << 5,
    PMC_private6_FLAG = 1 << 6,
    PMC_private7_FLAG = 1 << 7,

    /* The rest of the flags are for use by Parrot */

    /* Set if the PMC has a destroy method that must be called */
    PMC_active_destroy_FLAG = 1 << 8,
    /* Set if the PMC can hold multiple PMCs. (Hash, array, list,
     * whatever) */
    PMC_is_container_FLAG = 1 << 9,
    /* Set to true if the PMC data pointer points to something that
     * looks like a string or buffer pointer */
    PMC_is_buffer_ptr_FLAG = 1 << 10,
    /* Set to true if the data pointer points to a PMC */
    PMC_is_PMC_ptr_FLAG = 1 << 11,
    /* Set to true if the PMC has a private GC function. For PMCs the
     * GC system can't snoop into */
    PMC_private_GC_FLAG = 1 << 12,
    /* Set to true if the PMC has a custom mark routine */
    PMC_custom_mark_FLAG = 1 << 13,
    /* Are we live? */
    PMC_live_FLAG = 1 << 14,
    /* Are we on the free list */
    PMC_on_free_list_FLAG = 1 << 15,
    /* Our refcount */
    PMC_refcount_field = 1 << 16 | 1 << 17,
    /* Constant flag */
    PMC_constant_FLAG = 1 << 18,
    /* Immortal flag, for ensuring a PMC survives DOD. Used internally
	 * by the GC: should not be used in PMC code. */
    PMC_immortal_FLAG = 1 << 19
} PMC_flags;

/* XXX add various bit test macros once we have need of them */

/* Prototypes */
PMC *pmc_new(struct Parrot_Interp *interpreter, INTVAL base_type);
PMC *pmc_new_sized(struct Parrot_Interp *interpreter, INTVAL base_type,
                        INTVAL size);

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
