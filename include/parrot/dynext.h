/* dynext.h
*
* $Id$
*
*   Parrot dynamic extensions
*/

#if !defined(DYNEXT_H_GUARD)
#define DYNEXT_H_GUARD


/* dynamic lib/oplib/PMC loading */
PMC *Parrot_load_lib(Interp *interpreter, STRING *lib, PMC *initializer);

#endif

