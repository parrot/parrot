/* oplib.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
 *  Overview:
 *     Header file for op libraries.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_OPLIB_H_GUARD
#define PARROT_OPLIB_H_GUARD

#include "parrot/config.h"
#include "parrot/op.h"


/*
** op_lib_t
*/

typedef struct op_lib_t {
    const char *name;
    const char *suffix;
    int         core_type;
    int         flags;
    int         major_version;
    int         minor_version;
    int         patch_version;
    opcode_t    op_count;
    op_info_t  *op_info_table;
    op_func_t  *op_func_table;
    int (*_op_code)(PARROT_INTERP, const char * name, int full);
} op_lib_t;

typedef enum {
    OP_FUNC_IS_ALLOCATED = 0x01,
    OP_INFO_IS_ALLOCATED = 0x02
} op_lib_flags_enum;

/* when init = true initialize, else de_initialize */
typedef op_lib_t *(*oplib_init_f)(PARROT_INTERP, long init);

#endif /* PARROT_OPLIB_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
