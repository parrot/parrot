/* builtin.h
 *  Copyright: 2005 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for builtins.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_BUILTIN_H_GUARD)
#define PARROT_BUILTIN_H_GUARD

void Parrot_init_builtins(Interp *);
int  Parrot_is_builtin(Interp *, char *func, char *sig);
PMC* Parrot_find_builtin(Interp *interpreter, STRING *func);
const char * Parrot_builtin_get_c_namespace(Interp *, int bi);
int Parrot_builtin_is_class_method(Interp *, int bi);

#endif /* PARROT_BUILTIN_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

