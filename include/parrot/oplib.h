/* oplib.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Header file for op libraries.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_OPLIB_H_GUARD)
#define PARROT_OPLIB_H_GUARD

#include "parrot/config.h"
#include "parrot/op.h"


/*
** op_lib_t
*/

typedef struct {
    char *      name;
    INTVAL      major_version;
    INTVAL      minor_version;
    INTVAL      patch_version;
    INTVAL      op_count;
    op_info_t * op_info_table;
    void *      op_func_table;
} op_lib_t;

typedef op_lib_t * (*oplib_init_f)(void);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
