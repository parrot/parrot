/* py_func.h
 *  Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Pythpon functions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_PY_FUNC_H_GUARD)
#define PARROT_PY_FUNC_H_GUARD

void Parrot_py_fill(Interp *interpreter, PMC *arr, PMC *seq);
void Parrot_py_fill_dict(Interp *interpreter, PMC *dict, PMC *seq);
void Parrot_py_init(Interp *interpreter);
PMC* Parrot_py_get_slice(Interp*, PMC*, PMC* key);
PMC* Parrot_py_set_slice(Interp*, PMC*, PMC* key, PMC* src);

#endif   /* PARROT_PY_FUNC_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
