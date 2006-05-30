/* enums.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  Overview:
 *     enums shared by much of the stack-handling code
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_ENUMS_H_GUARD)
#define PARROT_ENUMS_H_GUARD

typedef enum {
    NO_STACK_ENTRY_TYPE     = 0,
    STACK_ENTRY_INT         = 1,
    STACK_ENTRY_FLOAT       = 2,
    STACK_ENTRY_STRING      = 3,
    STACK_ENTRY_PMC         = 4,
    STACK_ENTRY_POINTER     = 5,
    STACK_ENTRY_DESTINATION = 6,
    STACK_ENTRY_MARK        = 7,
    STACK_ENTRY_ACTION      = 8
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

/* &gen_from_enum(call_bits.pasm) */
typedef enum {
    /* 4 low bits are argument types */
    PARROT_ARG_INTVAL           = 0x000,
    PARROT_ARG_STRING           = 0x001,
    PARROT_ARG_PMC              = 0x002,
    PARROT_ARG_FLOATVAL         = 0x003,
    PARROT_ARG_TYPE_MASK        = 0x00f,
    /* argument meaning and conversion bits */
    PARROT_ARG_CONSTANT         = 0x010,
    /* bits a user has to define */
    PARROT_ARG_FLATTEN          = 0x020,       /* .flatten_arg */
    PARROT_ARG_SLURPY_ARRAY     = PARROT_ARG_FLATTEN,  /* i.e. foldup  */
    PARROT_ARG_MAYBE_FLATTEN    = 0x040, /* flatten, if slurping and the
                                           argument is array */
    PARROT_ARG_OPTIONAL         = 0x080,
    PARROT_ARG_OPT_FLAG         = 0x100, /* prev optional was set */
    PARROT_ARG_NAME             = 0x200  /* this String is an arg name */
    /* more to come soon */

} Call_bits_enum_t;

/* &end_gen */

#endif /* PARROT_ENUMS_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
