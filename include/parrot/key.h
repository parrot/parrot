/* key.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the pmc subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_KEY_H_GUARD)
#define PARROT_KEY_H_GUARD

#include "parrot/parrot.h"

typedef enum {
    KEY_integer_FLAG = PObj_private0_FLAG,
    KEY_number_FLAG = PObj_private1_FLAG,
    KEY_string_FLAG = PObj_private2_FLAG,
    KEY_pmc_FLAG = PObj_private3_FLAG,
    KEY_register_FLAG = PObj_private4_FLAG,

    KEY_start_slice_FLAG = PObj_private5_FLAG,
    KEY_end_slice_FLAG = PObj_private6_FLAG,
    KEY_inf_slice_FLAG = PObj_private7_FLAG,

    KEY_type_FLAGS = KEY_integer_FLAG |
                     KEY_number_FLAG |
                     KEY_string_FLAG |
                     KEY_pmc_FLAG |
                     KEY_register_FLAG

} KEY_flags;

PMC *key_new(Interp *interpreter);
PMC *key_new_integer(Interp *interpreter, INTVAL value);
PMC *key_new_number(Interp *interpreter, FLOATVAL value);
PMC *key_new_string(Interp *interpreter, STRING *value);
PMC *key_new_cstring(Interp *interpreter, const char *value);
PMC *key_new_pmc(Interp *interpreter, PMC *value);

void key_set_integer(Interp *interpreter, PMC *key, INTVAL value);
void key_set_number(Interp *interpreter, PMC *key, FLOATVAL value);
void key_set_register(Interp *interpreter, PMC *key, INTVAL value,
        INTVAL flag);
void key_set_string(Interp *interpreter, PMC *key, STRING *value);
void key_set_pmc(Interp *interpreter, PMC *key, PMC *value);

INTVAL key_type(Interp *interpreter, PMC *key);
INTVAL key_integer(Interp *interpreter, PMC *key);
FLOATVAL key_number(Interp *interpreter, PMC *key);
STRING *key_string(Interp *interpreter, PMC *key);
PMC *key_pmc(Interp *interpreter, PMC *key);
PMC *key_next(Interp *interpreter, PMC *key);

PMC *key_append(Interp *interpreter, PMC *key1, PMC *key2);

void key_mark(Interp *interpreter, PMC *key);

#endif /* PARROT_KEY_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
