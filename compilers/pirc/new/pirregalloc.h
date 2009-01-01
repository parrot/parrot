/*
 * $Id$
 * Copyright (C) 2008-2009, The Perl Foundation.
 */

#ifndef PARROT_PIR_PIRREGALLOC_H_GUARD
#define PARROT_PIR_PIRREGALLOC_H_GUARD



typedef enum interval_flags {
    INTERVAL_FLAG_UNIQUE_REG   = 1 << 0

} interval_flag;

/* A live interval represents the live span of a variable. Register optimization
 * is done on the registers assigned by the vanilla register allocator, which
 * just allocates a new register when needed. The symreg field contains this
 * register.
 *
 * The realreg field is the final register. Note that this is a signed integer;
 * Initially, all PASM registers (so, the real actual registers) are set to -1
 * in the data structures. This is to indicate that no register was allocated.
 * This is fine, because we will never need 2^32 registers anywway.
 *
 * Live interval objects can be on one of two lists: the interval list, or the active
 * list.
 */
typedef struct live_interval {
    unsigned        symreg;            /* the interval is for this variable */
    int             realreg;           /* the newly allocated register */
    unsigned        startpoint;        /* start point of the live range of the variable */
    unsigned        endpoint;          /* end point of the live range of the variable */


    /* pointer to the symbol or pir_reg, in order to update (re-color) the PASM register */
    int            *color;
    interval_flag   flags;

/*    union next_union { */
        struct   live_interval *nexti;
        struct   live_interval *nexta;
/*    } next; */


/*    union prev_union { */
        struct   live_interval *previ;
        struct   live_interval *preva;
/*    } prev; */

    /* pointer to next on the cached objects list. */
    struct live_interval *nextc;

} live_interval;

/* structure to store a second-hand register, so we can re-use it later. */
typedef struct free_reg {
    unsigned          regno;
    struct free_reg * next;

} free_reg;

/* forward declaration */
struct lexer_state;

typedef struct linear_scan_register_allocator {
    unsigned       r[4];
    /* a list of active variables; (1 list per type) */
    live_interval *active[4];
    /* list of variables; (1 list per type) */
    live_interval *intervals[4];
    /* reusable registers; were used by variables, which are now "dead"; (1 list per type) */
    free_reg      *free_regs[4];

    /* list of cached intervals; don't malloc/free objects, but keep them on a list
     * and re-used malloc()ed objects. Only free them when destroying the lsr.
     */
    live_interval *cached_intervals;

    /* list of free_reg objects that we can re-use, to save memory allocations. */
    free_reg      *cached_regs;

    struct lexer_state *lexer;

} lsr_allocator;

lsr_allocator *new_linear_scan_register_allocator(struct lexer_state *lexer);

void destroy_linear_scan_regiser_allocator(lsr_allocator *lsr);

live_interval * new_live_interval(lsr_allocator * const lsr, unsigned firstuse, pir_type type);

void linear_scan_register_allocation(lsr_allocator * const lsr);

#endif /* PARROT_PIR_PIRREGALLOC_H_GUARD */



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

