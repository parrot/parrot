/* library.h
 *  Copyright: 2004 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *      Contains accessor functions for the _parrotlib bytecode interface
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_LIBRARY_H_GUARD)
#define PARROT_LIBRARY_H_GUARD

void* Parrot_library_query(Parrot_Interp, const char *func_name, ...);
STRING* Parrot_library_fallback_locate(Parrot_Interp interp, const char *file_name, const char **incl);

#endif /* PARROT_LIBRARY_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
