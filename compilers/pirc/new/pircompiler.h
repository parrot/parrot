/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

#ifndef PARROT_PIR_PIRCOMPILER_H_GUARD
#define PARROT_PIR_PIRCOMPILER_H_GUARD

#include "pirsymbol.h"
#include "pircompunit.h"


#include "parrot/parrot.h"
#include "parrot/embed.h"


#define TRUE    1
#define FALSE   0

#include <stdio.h> /* for FILE * */


/* a cache stores can store objects to reuse; for now, only for invocation objects */
typedef struct cache {
    invocation inv_cache;

} cache;


typedef enum lexer_flags {
    LEXER_FLAG_WARNINGS = 1 << 0

} lexer_flags;

/* the number of memory pointers that are stored per block;
 * if the number is very big, then a lot of memory allocations can be done
 * before creating a new node in the list of allocated_mem_ptrs structures,
 * but for small programs with few memory allocations, this means an overhead.
 * Likewise, if the number is too small, this means a lot of allocation of these
 * blocks, as they're full quickly.
 *
 */
#define NUM_MEM_ALLOCS_PER_BLOCK    512

typedef struct allocated_mem_ptrs {
    void                      *ptrs[NUM_MEM_ALLOCS_PER_BLOCK]; /* to store the pointers */
    unsigned                   allocs_in_this_block; /* to count number of pointers in this block */
    struct allocated_mem_ptrs *next;

} allocated_mem_ptrs;


/* store the "globals" of the lexer in a structure which is passed around. */
typedef struct lexer_state {
    int            flags;          /* general flags, e.g. warnings level */
    int            parse_errors;
    char          *filename;       /* name of input file */
    FILE          *outfile;        /* name of output file */

    subroutine    *subs;           /* list of subs; always points to the current sub. */

    key           *current_ns;     /* keeps track of namespace */

    target        *curtarget;      /* access to current target node being parsed, if any */
    argument      *curarg;         /* access to current argument node being parsed, if any */

    int            curregister[4]; /* for register allocation */
    int            pir_reg_generator; /* for unique PIR register allocator, for temp. PIR regs. */

    unsigned       instr_counter;  /* to assign an index to each instruction */

    Interp        *interp;         /* parrot interpreter */

    cache          obj_cache;      /* cache for all sorts of objects to save memory allocations */
    hashtable      constants;
    hashtable      globals;
    hashtable      strings;        /* hashtable containing pointers to all parsed strings */

    allocated_mem_ptrs *mem_allocations; /* list of pointers to allocated memory */

} lexer_state;



/* constructor for a lexer_state object */
lexer_state *new_lexer(char * const filename, int flags);

void pirerror(lexer_state * const lexer, char const * const message, ...);

void release_resources(lexer_state *lexer);

char *dupstr(lexer_state * const lexer, char * const str);

char *dupstrn(lexer_state * const lexer, char * const str, size_t numchars);

bucket *new_bucket(lexer_state * const lexer);

void init_hashtable(lexer_state * const lexer, hashtable * table, unsigned size);

#define pir_mem_allocate_zeroed_typed(lxr, type) (type *)pir_mem_allocate_zeroed(lxr, sizeof (type))

void *pir_mem_allocate_zeroed(lexer_state * const lexer, size_t numbytes);

#endif /* PARROT_PIR_PIRCOMPILER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
