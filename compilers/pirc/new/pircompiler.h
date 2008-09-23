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



/* store the "globals" of the lexer in a structure which is passed around. */
typedef struct lexer_state {
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

    global_label  *globals;        /* global identifiers */
    constant      *constants;      /* global constants */

    Interp        *interp;         /* parrot interpreter */

    cache          obj_cache;      /* cache for all sorts of objects to save memory allocations */
    hashtable      strings;        /* hashtable containing pointers to all parsed strings */

} lexer_state;



/* constructor for a lexer_state object */
lexer_state *new_lexer(char * const filename);

void pirerror(lexer_state * const lexer, char const * const message, ...);

void release_resources(lexer_state *lexer);

char *dupstr(lexer_state * const lexer, char * const str);

char *dupstrn(lexer_state * const lexer, char * const str, size_t numchars);

#endif /* PARROT_PIR_PIRCOMPILER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
