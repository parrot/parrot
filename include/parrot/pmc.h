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
    enum_class_PerlUndef,
    enum_class_PerlInt,
    enum_class_PerlNum,
    enum_class_PerlString,
    enum_class_PerlArray,
    enum_class_PerlHash,
    enum_class_ParrotPointer,
    enum_class_max
};
VAR_SCOPE VTABLE Parrot_base_vtables[enum_class_max];

struct PMC {
  VTABLE *vtable;
  INTVAL flags;
  DPOINTER *data;
  union {
    INTVAL int_val;
    FLOATVAL num_val;
    DPOINTER *struct_val;
  } cache;
  SYNC *synchronize;
};

/* PMC flag bits */

typedef enum {
    /* the first 8 bits are for private use by individual vtable
     * classes. It is suggested that you alias these within an individual
     * class's header file
     */
    PMC_private0_FLAG   = 2 << 0,
    PMC_private1_FLAG   = 2 << 1,
    PMC_private2_FLAG   = 2 << 2,
    PMC_private3_FLAG   = 2 << 3,
    PMC_private4_FLAG   = 2 << 4,
    PMC_private5_FLAG   = 2 << 5,
    PMC_private6_FLAG   = 2 << 6,
    PMC_private7_FLAG   = 2 << 7,

    /* The rest of the flags are for use by Parrot */
    PMC_active_destroy_FLAG	= 2 << 8,
    PMC_is_container_FLAG	= 2 << 9,
    PMC_is_buffer_ptr_FLAG	= 2 << 10,
    PMC_is_PMC_ptr_FLAG		= 2 << 11,
    PMC_private_GC_FLAG		= 2 << 12
} PMC_flags;

/* XXX add various bit test macros once we have need of them */

/* Prototypes */
PMC* pmc_new(struct Parrot_Interp *interpreter, INTVAL base_type);

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
