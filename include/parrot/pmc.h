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
    enum_class_int,
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
