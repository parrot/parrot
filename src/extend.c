/* embed.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The Parrot extension interface. These are the functions that
 *     parrot extensions (i.e. parrot subroutines written in C, or
 *     some other compiled language, rather than in parrot bytecode)
 *     may access. 
 *
 *     There is a deliberate distancing from the internals here. Don't
 *     go peeking inside -- you've as much access as bytecode does,
 *     but no more, so we can provide backwards compatibility for as
 *     long as we possibly can.
 *  Data Structure and Algorithms:
 *     See include/parrot/extend.h and docs/extend.pod.
 *  History:
 *     Initial version by Dan Sugalski
 *  Notes:
 *  References:
 */


#include "parrot/parrot.h"
#include "parrot/extend.h"

/*=for api extend Parrot_PMC_get_string
 *
 * Return an opaque string that represents the string contained in the
 * PMC.
 */

Parrot_STRING Parrot_PMC_get_string(Parrot_INTERP interp, Parrot_PMC pmc) {
  return VTABLE_get_string(interp, pmc);
}

/*=for api extend Parrot_PMC_get_intval
 *
 * Return the signed integer value of the value in the PMC
 */

Parrot_Int Parrot_PMC_get_intval(Parrot_INTERP interp, Parrot_PMC pmc) {
    return VTABLE_get_integer(interp, pmc);
}

/*=for api extend Parrot_PMC_get_numval
 *
 * Return the floating-point value of the PMC
 */

Parrot_Float Parrot_PMC_get_numval(Parrot_INTERP interp, Parrot_PMC pmc) {
    return VTABLE_get_number(interp, pmc);
}

/*=for api extend Parrot_PMC_get_cstring
 *
 * Return a null-terminated string that represents the string value of
 * the PMC.
 */
char *Parrot_PMC_get_cstring(Parrot_INTERP interp, Parrot_PMC pmc) {
    STRING *retval;
    retval = VTABLE_get_string(interp, pmc);
    return string_to_cstring(interp, retval);
}

/*=for api extend Parrot_PMC_get_cstringn
 *
 * Return a null-terminated string for the PMC, along with the
 * length.
 *
 * Yes, right now this is a bit of a cheat. It needs fixing, but
 * without disturbing the interface.
 */
char *Parrot_PMC_get_cstringn(Parrot_INTERP interp, Parrot_PMC pmc, INTVAL *length) {
    char *retval;
    retval = string_to_cstring(interp, VTABLE_get_string(interp, pmc));
    *length = strlen(retval);
    return retval;
}

/*=for api extend Parrot_PMC_set_string
 *
 * Assign the passed-in parrot string to the passed-in PMC
 */
void Parrot_PMC_set_string(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_STRING value) {
    VTABLE_set_string_native(interp, pmc, value);
}

/*=for api extend Parrot_PMC_set_intval
 *
 * Assign the passed-in parrot integer to the passed-in PMC
 */
void Parrot_PMC_set_intval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int value) {
    VTABLE_set_integer_native(interp, pmc, value);
}

/*=for api extend Parrot_PMC_set_numval
 *
 * Assign the passed-in parrot number to the passed-in PMC
 */
void Parrot_PMC_set_numval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Float value) {
    VTABLE_set_number_native(interp, pmc, value);
}

/*=for api extend Parrot_PMC_set_cstring
 *
 * Assign the passed-in null-terminated C string to the passed-in PMC
 */
void Parrot_PMC_set_cstring(Parrot_INTERP interp, Parrot_PMC pmc, char *value) {
    VTABLE_set_string_native(interp, pmc, string_from_cstring(interp, value, 0));
}

/*=for api extend Parrot_PMC_set_cstringn
 *
 * Assign the passed-in length-noted string  to the passed-in PMC
 */
void Parrot_PMC_set_cstringn(Parrot_INTERP interp, Parrot_PMC pmc, char *value, Parrot_Int length) {
    VTABLE_set_string_native(interp, pmc, string_from_cstring(interp, value, length));
}

/*=for api extend Parrot_PMC_new
 *
 * Create and return a new PMC
 */
Parrot_PMC Parrot_PMC_new(Parrot_INTERP interp, Parrot_Int type) {
    Parrot_PMC newpmc;
    newpmc = pmc_new_noinit(interp, type);
    VTABLE_init(interp, newpmc);
    return newpmc;
}

/*=for api extend Parrot_PMC_typenum
 *
 * Returns the internal identifier that represents the named class
 */
Parrot_Int Parrot_PMC_typenum(Parrot_INTERP interp, char *class) {
    return pmc_type(interp, string_from_cstring(interp, class, 0));
}

/*=for api extend Parrot_free_cstring
 *
 * Deallocate a C string that the interpreter has handed to you
 */
void Parrot_free_cstring(char *string) {
    string_cstring_free(string);
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
