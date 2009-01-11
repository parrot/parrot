/* enums.h
 * $Id$
 *  Copyright (C) 2001-2008, The Perl Foundation.
 *  Overview:
 *     enums shared by much of the stack-handling code
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_ENUMS_H_GUARD
#define PARROT_ENUMS_H_GUARD

typedef enum {
    NO_STACK_ENTRY_TYPE     = 0,
    STACK_ENTRY_MARK        = 1,
    STACK_ENTRY_DESTINATION = 2,
    STACK_ENTRY_ACTION      = 3,
    STACK_ENTRY_PMC         = 4
} Stack_entry_type;

typedef enum {
    NO_STACK_ENTRY_FLAGS     = 0,
    STACK_ENTRY_CLEANUP_FLAG = 1 << 0
} Stack_entry_flags;

typedef enum {
    NO_STACK_CHUNK_FLAGS     = 0,
    STACK_CHUNK_COW_FLAG     = 1 << 0
} Stack_chunk_flags;


/* &gen_from_enum(iterator.pasm) */
typedef enum {
    ITERATE_FROM_START,
    ITERATE_FROM_START_KEYS,
    ITERATE_GET_NEXT,
    ITERATE_GET_PREV,
    ITERATE_FROM_END
} Iterator_action_t;

/* &end_gen */

/* &gen_from_enum(call_bits.pasm lib/Parrot/Pmc2c/PCCMETHOD_BITS.pl) */
typedef enum {
    /* 4 low bits are argument types */
    PARROT_ARG_INTVAL           = 0x000,  /* 0 */
    PARROT_ARG_STRING           = 0x001,  /* 1 */
    PARROT_ARG_PMC              = 0x002,  /* 2 */
    PARROT_ARG_FLOATVAL         = 0x003,  /* 3 */
    PARROT_ARG_TYPE_MASK        = 0x00f,
    /* argument meaning and conversion bits */
    PARROT_ARG_CONSTANT         = 0x010,  /* 16 */
    /* bits a user has to define */
    PARROT_ARG_FLATTEN          = 0x020,       /* .flatten_arg */
    PARROT_ARG_SLURPY_ARRAY     = PARROT_ARG_FLATTEN,  /* i.e. foldup  */
    /* unused - 0x040 */
    PARROT_ARG_OPTIONAL         = 0x080, /* 128 */
    PARROT_ARG_OPT_FLAG         = 0x100, /* 256 prev optional was set */
    PARROT_ARG_NAME             = 0x200, /* 512 this String is an arg name */
    PARROT_ARG_INVOCANT         = 0x400  /* 1024 this PMC is an invocant */
    /* more to come soon */

} Call_bits_enum_t;

/* &end_gen */

#define PARROT_ARG_INTVAL_ISSET(o)        ((o) & PARROT_ARG_INTVAL)
#define PARROT_ARG_STRING_ISSET(o)        ((o) & PARROT_ARG_STRING)
#define PARROT_ARG_PMC_ISSET(o)           ((o) & PARROT_ARG_PMC)
#define PARROT_ARG_FLOATVAL_ISSET(o)      ((o) & PARROT_ARG_FLOATVAL)
#define PARROT_ARG_TYPE_MASK_MASK(o)      ((o) & PARROT_ARG_TYPE_MASK)
#define PARROT_ARG_TYPE(o)                PARROT_ARG_TYPE_MASK_MASK(o)
#define PARROT_ARG_CONSTANT_ISSET(o)      ((o) & PARROT_ARG_CONSTANT)
#define PARROT_ARG_FLATTEN_ISSET(o)       ((o) & PARROT_ARG_FLATTEN)
#define PARROT_ARG_SLURPY_ARRAY_ISSET(o)  ((o) & PARROT_ARG_SLURPY_ARRAY)
#define PARROT_ARG_OPTIONAL_ISSET(o)      ((o) & PARROT_ARG_OPTIONAL)
#define PARROT_ARG_OPT_FLAG_ISSET(o)      ((o) & PARROT_ARG_OPT_FLAG)
#define PARROT_ARG_NAME_ISSET(o)          ((o) & PARROT_ARG_NAME)
#define PARROT_ARG_INVOCANT_ISSET(o)      ((o) & PARROT_ARG_INVOCANT)


#endif /* PARROT_ENUMS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
