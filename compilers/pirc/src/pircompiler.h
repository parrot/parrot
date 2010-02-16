/*
 * $Id$
 * Copyright (C) 2007-2009, Parrot Foundation.
 */

#ifndef PARROT_PIR_PIRCOMPILER_H_GUARD
#define PARROT_PIR_PIRCOMPILER_H_GUARD

#include "pirsymbol.h"
#include "pircompunit.h"
#include "pirmacro.h"
#include "pirregalloc.h"
#include "parrot/parrot.h"
#include "parrot/embed.h"


#include <stdio.h> /* for FILE * */


/* a cache stores can store objects to reuse; for now, only for invocation objects */
typedef struct cache {
    invocation inv_cache;

} cache;


typedef enum lexer_flags {
    LEXER_FLAG_WARNINGS            = 1 << 0, /* print warnings */
    LEXER_FLAG_NOSTRENGTHREDUCTION = 1 << 1, /* skip strength reduction */
    LEXER_FLAG_VERBOSE             = 1 << 2, /* be verbose */
    LEXER_FLAG_EMIT_PASM           = 1 << 3, /* emit runnable pasm code */
    LEXER_FLAG_PREPROCESS          = 1 << 4, /* preprocess code only */
    LEXER_FLAG_HEREDOCONLY         = 1 << 5, /* preprocess heredocs only */
    LEXER_FLAG_NOOUTPUT            = 1 << 6, /* don't print anything on success, except 'ok' */
    LEXER_FLAG_REGALLOC            = 1 << 7, /* use register allocation optimizer */
    LEXER_FLAG_PASMFILE            = 1 << 8, /* the input is PASM, not PIR code */
    LEXER_FLAG_OUTPUTPBC           = 1 << 9  /* generate PBC file */

} lexer_flags;

/* the number of memory pointers that are stored per block;
 * if the number is very big, then a lot of memory allocations can be done
 * before creating a new node in the list of allocated_mem_ptrs structures,
 * but for small programs with few memory allocations, this means an overhead.
 * Likewise, if the number is too small, this means a lot of allocation of these
 * blocks, as they're full quickly. XXX maybe make this runtime configurable?
 *
 */
#define NUM_MEM_ALLOCS_PER_BLOCK    512

typedef struct allocated_mem_ptrs {
    void                      *ptrs[NUM_MEM_ALLOCS_PER_BLOCK]; /* to store the pointers */
    unsigned                   allocs_in_this_block; /* to count number of pointers in this block */
    struct allocated_mem_ptrs *next;

} allocated_mem_ptrs;


/* struct to represent a global label reference; the contained instruction
 * will be changed, if the label can be found during global label fixup.
 */
typedef struct global_fixup {
    instruction *instr;    /* the instruction that will be patched, if possible */
    char const  *label;    /* the label to which this instruction refers */

    struct global_fixup *next;

} global_fixup;


/* Taken from pirlexer.h, needed for declaration of yyscanner in lexer_state. */
#ifndef YY_TYPEDEF_YY_SCANNER_T
#  define YY_TYPEDEF_YY_SCANNER_T

typedef void * yyscan_t;

#endif

/* macros can store up to 4K characters, after which the buffer must be resized.
 * This value is the default, and can be changed through PIRC's command line option.
 */
#define INIT_MACRO_SIZE     4096


/* store the "globals" of the lexer in a structure which is passed around.
 * as there's only 1 lexer_state, Size Doesn't Matter (really), so the large
 * number of fields is not a problem.
 */
typedef struct lexer_state {
    int            flags;          /* general flags, e.g. warnings level */
    unsigned       parse_errors;
    char const    *filename;       /* name of input file */
    FILE          *outfile;        /* output file */
    int            linenr;         /* Flex' line counting su^W^W doesn't work well. */

    subroutine    *subs;           /* list of subs; always points to the current sub. */

    key           *current_ns;     /* keeps track of namespace */

    target        *curtarget;      /* access to current target node being parsed, if any */
    argument      *curarg;         /* access to current argument node being parsed, if any */

    int            curregister[NUM_PARROT_TYPES]; /* for register allocation */
    int            pir_reg_generator; /* for unique PIR register allocator, for temp. PIR regs. */

    unsigned       stmt_counter;   /* to count "logical" statements, even if multi-line. */

    Interp        *interp;         /* parrot interpreter */

    cache          obj_cache;      /* cache for all sorts of objects to save memory allocations */
    hashtable      constants;
    hashtable      globals;
    hashtable      strings;        /* hashtable containing pointers to all parsed strings */

    global_fixup  *global_refs;    /* list of instructions that need to be fixed up, as they
                                    * reference global labels.
                                    */
    allocated_mem_ptrs *mem_allocations; /* list of pointers to allocated memory */

    yyscan_t       yyscanner;      /* sometimes when we only have a lexer, we want yyscanner
                                    * as well. Useful for if we need yyscanner, but only have
                                    * lexer.
                                    */

    /* macro stuff */
    macro_table              *macros;        /* macro definitions; they are organized in
                                              * C<macro_table>s, which are just symbol tables,
                                              * representing scopes. Tables can be stacked,
                                              * so it's easy to add a nested scope and pop it off
                                              * after you're done with it.
                                              */

    int                       num_digits;    /* keep track of number of digits needed for id_gen */
    int                       id_gen;        /* for generating unique identifiers */
    int                       unique_id;     /* current unique id */
    unsigned                  macro_size;    /* initial macro body buffr size */

    struct yy_buffer_state   *buffer;  /* for saving buffer state when scanning a .macro_const */

    /* register allocation */
    lsr_allocator            *lsr;

    /* bytecode generation */
    struct bytecode          *bc;
    unsigned                  codesize;

    annotation               *annotations;
    unsigned                  num_annotations;
    
    /* XXX Temporary STRING pointer, for the conversion of all lexer code to use
    STRINGs instead of c strings (char pointers). Cannot change yylval union yet,
    as it's better to have duplicated functionality, then removing the old c strings 
    stuff*/
    STRING    *sval;

} lexer_state;

/* accessor for current macro; always first on the list. */
#define CURRENT_MACRO(X)    (X)->macros->definitions

/* same trick as in parrot's memory system, for "automagic" casting */
#define pir_mem_allocate_zeroed_typed(lxr, type) (type *)pir_mem_allocate_zeroed(lxr, sizeof (type))

/* use pir_mem_allocate functions if you don't want to worry about freeing it; all memory
 * allocated will be freed after the compilation. If you only need some memory temporarily
 * and freeing can be done soon after (manually), then use parrot's mem_sys_allocate().
 */

/* HEADERIZER BEGIN: compilers/pirc/src/pircompiler.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
char const * dupstr(
    ARGIN(lexer_state * const lexer),
    ARGIN(char * const source))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
char const * dupstrn(
    ARGIN(lexer_state * const lexer),
    ARGIN(char * const source),
    size_t slen)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void init_hashtable(
    ARGIN(lexer_state * const lexer),
    ARGIN(hashtable * const table),
    unsigned size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
bucket * new_bucket(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
lexer_state * new_lexer(PARROT_INTERP,
    ARGIN_NULLOK(char * const filename),
    int flags)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
void * pir_mem_allocate(ARGIN(lexer_state * const lexer), size_t numbytes)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
void * pir_mem_allocate_zeroed(
    ARGIN(lexer_state * const lexer),
    size_t numbytes)
        __attribute__nonnull__(1);

void pirwarning(
    ARGIN(lexer_state * const lexer),
    int lineno,
    ARGIN(char const * const message),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

void release_resources(ARGIN(lexer_state *lexer))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_dupstr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(source))
#define ASSERT_ARGS_dupstrn __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(source))
#define ASSERT_ARGS_init_hashtable __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(table))
#define ASSERT_ARGS_new_bucket __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_new_lexer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pir_mem_allocate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_pir_mem_allocate_zeroed __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_pirwarning __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(message))
#define ASSERT_ARGS_release_resources __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/pirc/src/pircompiler.c */


#endif /* PARROT_PIR_PIRCOMPILER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
