/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */
#ifndef PARROT_PIR_MACRO_H_GUARD
#define PARROT_PIR_MACRO_H_GUARD

typedef struct macro_def {
    char *name;
    char *body;
    int   line_defined;

    struct macro_def *next;

} macro_def;


typedef struct list {
    char *item;

    struct list *next;

} list;


#endif /* PARROT_PIR_MACRO_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
