/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */
#ifndef PARROT_PIR_MACRO_H_GUARD
#define PARROT_PIR_MACRO_H_GUARD

typedef struct list {
    char const  *item;

    struct list *next;

} list;


typedef struct macro_def {
    char const       *name;
    char const       *body;
    int               line_defined;
    list             *parameters;

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
typedef struct constant_table {
    macro_def *definitions;
    /* constant tables are linked through this pointer,
     * and organized as a stack. If a constant is not found
     * in this table, then the previous table is tried, and so on,
     * while there is a previous table.
     */
    struct constant_table *prev;

} constant_table;


#endif /* PARROT_PIR_MACRO_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
