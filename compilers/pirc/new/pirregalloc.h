/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */

#ifndef PARROT_PIR_PIRREGALLOC_H_GUARD
#define PARROT_PIR_PIRREGALLOC_H_GUARD


typedef enum live_flags {
    LIVE_FLAG_NOSTART = 1 << 0,
    LIVE_FLAG_NOFREE  = 1 << 1 /* set if the register should not be freed */

} live_flag;


typedef struct live_interval {
    unsigned symreg;            /* the interval is for this variable */
    unsigned realreg;           /* the newly allocated register */
    unsigned startpoint;        /* start point of the live range of the variable */
    unsigned endpoint;          /* end point of the live range of the variable */

    int      flags;

    struct   live_interval *next;
    struct   live_interval *prev;

} live_interval;

typedef struct free_reg {
    unsigned regno;
    struct free_reg * next;


} free_reg;



typedef struct lin_reg_allocator {
    unsigned       R;
    live_interval *active;
    live_interval *intervals;
    free_reg      *free_regs;

} lin_reg_allocator;

lin_reg_allocator *new_lin_reg_allocator(void);

live_interval * new_live_interval(unsigned firstuse_location);

void add_live_interval(lin_reg_allocator *lra, live_interval *i);

#endif /* PARROT_PIR_PIRREGALLOC_H_GUARD */



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

