/* pic.h
 *  Copyright: 2005 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the pic subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_PIC_H_GUARD)
#define PARROT_PIC_H_GUARD

/*
 * one cache slot
 *
 * if types exceed 16 bits or for general MMD function calls an
 * extended cache slot is needed with more type entries
 */
typedef struct Parrot_pic_lru_t {
    INTVAL lr_type;			/* for MMD left << 16 | right type */
    union {
        funcptr_t real_function; 	/* the actual C code */
        PMC *sub; 			/* or a Sub PMC */
        PMC **pattr;                    /* attribute location */
    } f;
} Parrot_PIC_lru;

/*
 * PIC 3 more cache slots
 */
typedef struct Parrot_pic_t {
    Parrot_PIC_lru lru[3];              /* PIC - three more cache entries */
    INTVAL miss_count;			/* how many misses */
} Parrot_PIC;

/*
 * the main used MIC one cache slot - 4 words size
 */
typedef struct Parrot_mic_t {
    Parrot_PIC_lru lru;                 /* MIC - one cache */
    union {
        STRING *method;                 /* for callmethod */
        INTVAL func_nr;			/* MMD function number */
        STRING *attribute;              /* obj.attribute */
    } m;
    Parrot_PIC *pic;                    /* more cache entries */
} Parrot_MIC;

/*
 * memory is managed by this structure hanging off a
 * PackFile_ByteCode segment
 */
typedef struct Parrot_pic_store_t {
    struct Parrot_pic_store_t *prev;	/* prev pic_store */
    size_t usable;			/* size of usable memory: */
    Parrot_PIC *pic;		        /* from rear */
    Parrot_MIC **mic;			/* idx access to allocated MICs */
    size_t n_mics;			/* range check, debugging mainly */
} Parrot_PIC_store;

/* more or less private interfaces */
void parrot_PIC_prederef(Interp *, opcode_t op, void **pc_pred, int type);
void parrot_PIC_alloc_store(Interp *, struct PackFile_ByteCode *, size_t n);
void parrot_PIC_destroy(Interp *, struct PackFile_ByteCode *);
int  parrot_PIC_op_is_cached(Interp *, int op_code);
Parrot_MIC* parrot_PIC_alloc_mic(Interp*, size_t n);
Parrot_PIC* parrot_PIC_alloc_pic(Interp*);

#endif /* PARROT_PIC_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
