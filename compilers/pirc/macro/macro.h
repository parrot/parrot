#ifndef MACRO_H
#define MACRO_H

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


#endif
