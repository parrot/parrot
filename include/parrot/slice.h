/* slice.h
 *  Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for slices.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_SLICE_H_GUARD)
#define PARROT_SLICE_H_GUARD

#ifdef PARROT_IN_CORE

typedef struct {
    INTVAL i;
    STRING *s;
} RUnion;

#define RVal_int(u) u.i
#define RVal_str(u) u.s

typedef struct _parrot_range_t {
    int type;                   /* enum_type_INTVAL or STRING */
    RUnion start;             /* start of this range */
    RUnion end;               /* end of this range */
    RUnion step;              /* step of this range */
    RUnion cur;               /* current value */
    struct _parrot_range_t *next;       /* next in chain */
} parrot_range_t;

#endif /* PARROT_IN_CORE */
#endif /* PARROT_SLICE_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
