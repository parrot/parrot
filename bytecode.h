/* bytecode.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The bytecode api is used to retrieve information from the bytecode
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_BYTECODE_H_GUARD)
#define PARROT_BYTECODE_H_GUARD

void*
init_bytecode(void* program_code);

IV Parrot_num_string_constants;
VAR_SCOPE STRING** Parrot_string_constants;

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
