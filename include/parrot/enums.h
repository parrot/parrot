/* enums.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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
    STACK_ENTRY_DESTINATION = 6
} Stack_entry_type;

typedef enum {
    NO_STACK_ENTRY_FLAGS     = 0,
    STACK_ENTRY_CLEANUP_FLAG = 1 << 0
} Stack_entry_flags;

typedef enum {
    NO_STACK_CHUNK_FLAGS     = 0,
    STACK_CHUNK_COW_FLAG     = 1 << 0
} Stack_chunk_flags;


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
