#ifndef PARROT_BCG_REG_ALLOC_H_GUARD
#define PARROT_BCG_REG_ALLOC_H_GUARD

#include "bcg.h"
#include "bcg_private.h"

/* TODO standardize register allocation API to support different allocators.*/
void reg_alloc_vanilla(BCG_info * bcg_info, bcg_unit * unit);

#endif /* PARROT_BCG_REG_ALLOC_H_GUARD */
