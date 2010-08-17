/* oplib.h
 *  Copyright (C) 2001-2003, Parrot Foundation.
 *  SVN Info
 *     $Id$
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
    int      core_type;
    int      flags;
    int      major_version;
    int      minor_version;
    int      patch_version;
    size_t      op_count;
    op_info_t * op_info_table;
    op_func_t * op_func_table;
    int (*op_code)(PARROT_INTERP, const char * name, int full);
} op_lib_t;

typedef enum {
    OP_FUNC_IS_ALLOCATED = 0x01,
    OP_INFO_IS_ALLOCATED = 0x02
} op_lib_flags_enum;

/* when init = true initialize, else de_initialize */
typedef op_lib_t *(*oplib_init_f)(PARROT_INTERP, long init);

/* core.ops special opcode numbers */
typedef enum {
    CORE_OPS_end,               /* halt the runloop */
    CORE_OPS_noop,              /* do nothing */
    CORE_OPS_check_events,      /* explicit event check */
    CORE_OPS_check_events__,    /* inserted into op dispatch when an event
                                   got scheduled */
    CORE_OPS_wrapper__          /* inserted by dynop_register for new ops */
        /* 2 more reserved */
} special_core_ops_enum;


#endif /* PARROT_OPLIB_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
