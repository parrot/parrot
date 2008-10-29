/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */

#ifndef PARROT_PIR_PIRREGALLOC_H_GUARD
#define PARROT_PIR_PIRREGALLOC_H_GUARD

struct symreg;

typedef struct live_interval {
    unsigned symreg;            /* the interval is for this variable */
    unsigned realreg;           /* the newly allocated register */
    unsigned startpoint;        /* start point of the live range of the variable */
    unsigned endpoint;          /* end point of the live range of the variable */


    /* pointer to the symbol or pir_reg, in order to update (re-color) the PASM register */
    struct   symreg  *syminfo;

    /* XXX check out whether we can set up a union. These pointers are sick of working too hard */
    /* for interval list */
    struct   live_interval *nexti;
    struct   live_interval *previ;

    /* for active list */
    struct   live_interval *nexta;
    struct   live_interval *preva;

} live_interval;

typedef struct free_reg {
    unsigned          regno;
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

struct lexer_state;

void linear_scan_register_allocation(struct lexer_state * const lexer);

#endif /* PARROT_PIR_PIRREGALLOC_H_GUARD */



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

