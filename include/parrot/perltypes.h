/* perltypes.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Header to be shared among Perl PMC classes
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

/*
 * Change PMC "thing" to scalar type "type", updating vtable and flags
 * as necessary.
 */

#define CHANGE_TYPE(thing, type) do { \
    if ((thing)->vtable == &Parrot_base_vtables[enum_class_PerlString]) { \
	(thing)->flags &= ~(UINTVAL)PMC_is_buffer_ptr_FLAG; \
    } \
    (thing)->vtable = &Parrot_base_vtables[enum_class_ ## type]; \
    if (enum_class_ ## type == enum_class_PerlString) { \
         (thing)->flags = PMC_is_buffer_ptr_FLAG; \
    } \
} while (0)

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
