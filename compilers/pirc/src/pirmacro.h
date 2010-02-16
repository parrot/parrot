/*
 * $Id$
 * Copyright (C) 2008-2009, Parrot Foundation.
 */
#ifndef PARROT_PIR_PIRMACRO_H_GUARD
#define PARROT_PIR_PIRMACRO_H_GUARD


/* struct to represent macro parameter declaration, or,
 * a macro argument, or, a .macro_local.
 */
typedef struct macro_param {
    char const         *name;
    struct macro_param *next;

} macro_param;


/* struct to represent a macro definition; it has a name (.macro <name>),
 * a body, which is a string buffer containing the macro definition.
 * C<cursor> is used to write into this buffer; C<linedefined> stores the
 * linenumber at which the macro definition started.
 * C<parameters> is a list of macro parameters; C<macrolocals> is a list
 * of declared C<.macro_local>s.
 * C<buffersize> contains the size of the buffer; if the buffer is full
 * its size is doubled.
 */
typedef struct macro_def {
    char const       *name;
    char             *body;
    char             *cursor;  /* to write into the body buffer */
    int               takes_args;  /* flag to indicate whether this is a .macro or .macro_const */

    int               linedefined;
    macro_param      *parameters;
    macro_param      *macrolocals;

    unsigned          buffersize;

    struct macro_def *next; /* macro definitions are stored in a list */

} macro_def;


/* A constant table represents a "scope" for macro and constants.
 * All .macro_const and .macro definitions are stored in the "global"
 * table, but when expanding a macro, the parameter values are stored
 * in a "local" table, which is "pushed" onto a conceptual stack.
 * This conceptual stack is implemented by linking the tables together.
 * When searching in a table, the table elements are search first, and
 * when the element is not found, the element is looked for in the
 * table pointed to by the "prev" field.
 */
typedef struct macro_table {
    macro_def *definitions;

    /* when a macro's buffer is being scanned, yyscan_t's YY_CURRENT_BUFFER must be stored
     * somewhere; this is the buffer that wat being scanned before the macro expansion.
     * This way, we can switch back to this buffer after scanning the macro's body.
     * Note that macro_table's are only used for real macros, not .macro_const'ants.
     */
    struct yy_buffer_state *prev_buff;

    /* store current line number here; when popping this table, it's restored. */
    int lineno;

    /* store scope number; when popping this table, it's restored. */
    int scopeno;

    /* a pointer to the macro_def of which this is the symbol table */
    macro_def *thismacro;

    /* constant tables are linked through this pointer,
     * and organized as a stack. If a constant is not found
     * in this table, then the previous table is tried, and so on,
     * while there is a previous table.
     */
    struct macro_table *prev;

} macro_table;


/* HEADERIZER BEGIN: compilers/pirc/src/pirmacro.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void add_macro_param(
    ARGIN*macro_def * const macro),
    ARGIN(char const * const name))
        __attribute__nonnull__(2);

void declare_macro_local(
    ARGIN(macro_def * const macro),
    ARGIN(char const * const name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void delete_macro_table(ARGMOD(macro_table * table))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(* table);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
macro_def * find_macro(
    ARGIN(macro_table * const table),
    ARGIN(char const * const name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
int is_macro_local(
    ARGIN(macro_def * const macro),
    ARGIN(char const * const name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_MALLOC
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
macro_def * new_macro(
    ARGIN(macro_table * const table),
    ARGIN(char const * const name),
    int lineno,
    int takes_args,
    unsigned initsize)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void new_macro_const(
    ARGIN(macro_table * const table),
    ARGIN(char const * const name),
    ARGIN(char const * const value),
    int lineno)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
macro_param * new_macro_param(ARGIN(char const * const value))
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
macro_table * new_macro_table(ARGIN(macro_table * const current))
        __attribute__nonnull__(1);

void store_macro_char(ARGIN(macro_def * const macro), char c)
        __attribute__nonnull__(1);

void store_macro_string(
    ARGIN(macro_def * const macro),
    ARGIN(char const * const str),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_add_macro_param __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_declare_macro_local __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(macro) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_delete_macro_table __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(table))
#define ASSERT_ARGS_find_macro __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(table) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_is_macro_local __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(macro) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_new_macro __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(table) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_new_macro_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(table) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(value))
#define ASSERT_ARGS_new_macro_param __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(value))
#define ASSERT_ARGS_new_macro_table __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(current))
#define ASSERT_ARGS_store_macro_char __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(macro))
#define ASSERT_ARGS_store_macro_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(macro) \
    , PARROT_ASSERT_ARG(str))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/pirc/src/pirmacro.c */

#endif /* PARROT_PIR_PIRMACRO_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

