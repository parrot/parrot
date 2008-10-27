/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */
#ifndef PARROT_PIR_PIRMACRO_H_GUARD
#define PARROT_PIR_PIRMACRO_H_GUARD



typedef struct macro_param {
    char const         *name;
    struct macro_param *next;

} macro_param;


typedef struct macro_def {
    char const       *name;
    char             *body;
    char             *cursor;  /* to write into the body buffer */
    int               takes_args;  /* flag to indicate whether this is a .macro or .macro_const */

    int               linedefined;
    macro_param      *parameters;
    macro_param      *macrolocals;

    unsigned          buffersize;

    struct macro_def *next;

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



typedef struct file_state {

    struct yy_buffer_state *buffer;
    char const *            filename;
    int                     lineno;

    struct file_state      *prev;

} file_state;


macro_def *new_macro(macro_table * const table, char const * const name, int lineno, int takes_args);

void add_macro_param(macro_def * const macro, char const * const name);

void new_macro_const(macro_table * const table, char const * const name,
                        char const * const value, int lineno);


macro_def *find_macro(macro_table * const table, char const * const name);

macro_table * new_macro_table(macro_table * const current);

void store_macro_char(macro_def * const macro, char c) ;

void store_macro_string(macro_def * const macro, char const * const str, ...);

macro_param * new_macro_param(char const * const value);

void declare_macro_local(macro_def * const macro, char const * const name);

int is_macro_local(macro_def * const macro, char const * const name);

#endif /* PARROT_PIR_PIRMACRO_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

