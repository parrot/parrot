#ifndef _anyop_h
#define _anyop_h

#include "parrot/parrot.h"

struct Oplib {
    op_lib_t * oplib;
    char * name;
};

typedef struct {
    short lib;
    short op;
} op_t;

extern op_t NULLOP;

int same_op(op_t a, op_t b);
void op_load_file(const char * file);
void op_load_lib(const char * oplib, int major, int minor, int rev);
op_t op_find_exact(const char * name);
op_t op_findv(const char * name, int nargs, char * type, short * dir);
op_t op_find(const char * name, int nargs, ...);
void op_dump();
op_info_t * op_info(op_t op);
void print_op_info(FILE * file, op_info_t * info);
void op_close_lib(void);

#endif /* _anyop_h */
