/* extend.c
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

/*=for api extend Parrot_PMC_get_pointer
 *
 * Returns a pointer. Used for PMCs that hold pointers to arbitrary data
 * PMC.
 */

void *Parrot_PMC_get_pointer(Parrot_INTERP interp, Parrot_PMC pmc) {
    return VTABLE_get_pointer(interp, pmc);
}

/*=for api extend Parrot_PMC_get_pointer_intkey
 *
 * Return the keyed, signed integer value of the value in the PMC
 */

void *Parrot_PMC_get_pointer_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    return VTABLE_get_pointer_keyed_int(interp, pmc, key);
}

/*=for api extend Parrot_PMC_get_pmc_intkey
 *
 * Return the integer keyed PMC value of the passed-in PMC
 */

Parrot_PMC Parrot_PMC_get_pmc_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    return VTABLE_get_pmc_keyed_int(interp, pmc, key);
}

/*=for api extend Parrot_PMC_get_intval
 *
 * Return the signed integer value of the value in the PMC
 */

Parrot_Int Parrot_PMC_get_intval(Parrot_INTERP interp, Parrot_PMC pmc) {
    return VTABLE_get_integer(interp, pmc);
}

/*=for api extend Parrot_PMC_get_intval_intkey
 *
 * Return the keyed, signed integer value of the value in the PMC
 */

Parrot_Int Parrot_PMC_get_intval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    return VTABLE_get_integer_keyed_int(interp, pmc, key);
}

/*=for api extend Parrot_PMC_get_numval
 *
 * Return the floating-point value of the PMC
 */

Parrot_Float Parrot_PMC_get_numval(Parrot_INTERP interp, Parrot_PMC pmc) {
    return VTABLE_get_number(interp, pmc);
}

/*=for api extend Parrot_PMC_get_numval_intkey
 *
 * Return the keyed, signed integer value of the value in the PMC
 */

Parrot_Float Parrot_PMC_get_numval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    return VTABLE_get_number_keyed_int(interp, pmc, key);
}

/*=for api extend Parrot_PMC_get_cstring_intkey
 *
 * Return a null-terminated string that represents the string value of
 * the PMC.
 */
char *Parrot_PMC_get_cstring_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    STRING *retval;
    retval = VTABLE_get_string_keyed_int(interp, pmc, key);
    return string_to_cstring(interp, retval);
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
char *Parrot_PMC_get_cstringn(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int *length) {
    char *retval;
    retval = string_to_cstring(interp, VTABLE_get_string(interp, pmc));
    *length = strlen(retval);
    return retval;
}

/*=for api extend Parrot_PMC_get_cstringn_intkey
 *
 * Return a null-terminated string for the PMC, along with the
 * length.
 *
 * Yes, right now this is a bit of a cheat. It needs fixing, but
 * without disturbing the interface.
 */
char *Parrot_PMC_get_cstringn_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int *length, Parrot_Int key) {
    char *retval;
    retval = string_to_cstring(interp, VTABLE_get_string_keyed_int(interp, pmc, key));
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

/*=for api extend Parrot_PMC_set_string
 *
 * Assign the passed-in parrot string to the passed-in PMC
 */
void Parrot_PMC_set_string_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_STRING value, Parrot_Int key) {
    VTABLE_set_string_keyed_int(interp, pmc, key, value);
}

/*=for api extend Parrot_PMC_set_pointer
 *
 * Assign the passed-in pointer to the passed-in PMC
 */
void Parrot_PMC_set_pointer(Parrot_INTERP interp, Parrot_PMC pmc, void *value) {
    VTABLE_set_pointer(interp, pmc, value);
}

/*=for api extend Parrot_PMC_set_pmc_intkey
 *
 * Assign the passed-in pmc to the passed-in slot of the passed-in PMC
 */
void Parrot_PMC_set_pmc_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_PMC value, Parrot_Int key) {
    VTABLE_set_pmc_keyed_int(interp, pmc, key, value);
}

/*=for api extend Parrot_PMC_set_pointer
 *
 * Assign the passed-in pointer to the passed-in PMC
 */
void Parrot_PMC_set_pointer_intkey(Parrot_INTERP interp, Parrot_PMC pmc, void *value, Parrot_Int key) {
    VTABLE_set_pointer_keyed_int(interp, pmc, key, value);
}

/*=for api extend Parrot_PMC_set_intval
 *
 * Assign the passed-in parrot integer to the passed-in PMC
 */
void Parrot_PMC_set_intval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int value) {
    VTABLE_set_integer_native(interp, pmc, value);
}

/*=for api extend Parrot_PMC_set_intval_intkey
 *
 * Assign the passed-in parrot integer to the passed-in PMC
 */
void Parrot_PMC_set_intval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int value, Parrot_Int key) {
    VTABLE_set_integer_keyed_int(interp, pmc, key, value);
}

/*=for api extend Parrot_PMC_set_numval
 *
 * Assign the passed-in parrot number to the passed-in PMC
 */
void Parrot_PMC_set_numval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Float value) {
    VTABLE_set_number_native(interp, pmc, value);
}

/*=for api extend Parrot_PMC_set_numval
 *
 * Assign the passed-in parrot number to the passed-in PMC
 */
void Parrot_PMC_set_numval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Float value, Parrot_Int key) {
    VTABLE_set_number_keyed_int(interp, pmc, key, value);
}

/*=for api extend Parrot_PMC_set_cstring
 *
 * Assign the passed-in null-terminated C string to the passed-in PMC
 */
void Parrot_PMC_set_cstring(Parrot_INTERP interp, Parrot_PMC pmc, const char *value) {
    VTABLE_set_string_native(interp, pmc, string_from_cstring(interp, value, 0));
}

/*=for api extend Parrot_PMC_set_cstring
 *
 * Assign the passed-in null-terminated C string to the passed-in PMC
 */
void Parrot_PMC_set_cstring_intkey(Parrot_INTERP interp, Parrot_PMC pmc, const char *value, Parrot_Int key) {
    VTABLE_set_string_keyed_int(interp, pmc, key, string_from_cstring(interp, value, 0));
}

/*=for api extend Parrot_PMC_set_cstringn
 *
 * Assign the passed-in length-noted string  to the passed-in PMC
 */
void Parrot_PMC_set_cstringn(Parrot_INTERP interp, Parrot_PMC pmc, const char *value, Parrot_Int length) {
    VTABLE_set_string_native(interp, pmc, string_from_cstring(interp, value, length));
}

/*=for api extend Parrot_PMC_set_cstringn
 *
 * Assign the passed-in length-noted string  to the passed-in PMC
 */
void Parrot_PMC_set_cstringn_intkey(Parrot_INTERP interp, Parrot_PMC pmc, const char *value, Parrot_Int length, Parrot_Int key) {
    VTABLE_set_string_keyed_int(interp, pmc, key, string_from_cstring(interp, value, length));
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
Parrot_Int Parrot_PMC_typenum(Parrot_INTERP interp, const char *class) {
    return pmc_type(interp, string_from_cstring(interp, class, 0));
}

Parrot_PMC Parrot_PMC_null() {
    return PMCNULL;
}


/*=for api extend Parrot_free_cstring
 *
 * Deallocate a C string that the interpreter has handed to you
 */
void Parrot_free_cstring(char *string) {
    string_cstring_free(string);
}

/* =for api extend Parrot_call
 *
 * Call a parrot subroutine, with PMC parameters
 */
void Parrot_call(Parrot_INTERP interpreter, Parrot_PMC sub,
                 Parrot_Int argcount, ...) {
    Parrot_Int inreg = 0;
    va_list ap;

    va_start(ap, argcount);

    /* Will all the arguments fit into registers? */
    if (argcount < 12) {
        for (inreg = 0; inreg < argcount; inreg++) {
            REG_PMC(inreg + 5) = va_arg(ap, Parrot_PMC);
        }
    } else {
        /* Nope, so we need an overflow array */
        Parrot_PMC overflow;
        Parrot_Int ocount;
        overflow = Parrot_PMC_new(interpreter,
                                  Parrot_PMC_typenum(interpreter, "Array"));
        Parrot_PMC_set_intval(interpreter, overflow, argcount - 11);
        for (inreg = 0; inreg < 11; inreg++) {
            REG_PMC(inreg + 5) = va_arg(ap, Parrot_PMC);
        }
        REG_PMC(3) = overflow;
        for (ocount = 0; ocount < argcount - 11; ocount++) {
            VTABLE_set_pmc_keyed_int(interpreter, overflow, ocount,
                                     (Parrot_PMC)va_arg(ap, Parrot_PMC));
        }
    }
    va_end(ap);

    Parrot_runops_fromc(interpreter, sub);

}

/*=for api extend Parrot_call_method
 *
 * Call a parrot method, with PMC parameters
 */
void Parrot_call_method(Parrot_INTERP interp, Parrot_PMC sub,
                        Parrot_STRING method, Parrot_Int argcount, ...) {
}


/*=for api extend Parrot_get_intreg
 *
 * Return the value of an integer register
 */
Parrot_Int Parrot_get_intreg(Parrot_INTERP interpreter, Parrot_Int regnum) {
    return REG_INT(regnum);
}

/*=for api extend Parrot_get_numreg
 *
 * Return the value of a numeric register
 */
Parrot_Float Parrot_get_numreg(Parrot_INTERP interpreter, Parrot_Int regnum) {
    return REG_NUM(regnum);
}

/*=for api extend Parrot_get_strreg
 *
 * Return the value of a string register
 */
Parrot_STRING Parrot_get_strreg(Parrot_INTERP interpreter, Parrot_Int regnum) {
    return REG_STR(regnum);
}

/*=for api extend Parrot_get_pmcreg
 *
 * Return the value of a PMC register
 */
Parrot_PMC Parrot_get_pmcreg(Parrot_INTERP interpreter, Parrot_Int regnum) {
    return REG_PMC(regnum);
}

/*=for api extend Parrot_set_intreg
 *
 * Set the value of an I register
 */
void Parrot_set_intreg(Parrot_INTERP interpreter, Parrot_Int regnum, Parrot_Int value) {
    REG_INT(regnum) = value;
}

/*=for api extend Parrot_set_numreg
 *
 * Set the value of an N register
 */
void Parrot_set_numreg(Parrot_INTERP interpreter, Parrot_Int regnum, Parrot_Float value) {
    REG_NUM(regnum) = value;
}

/*=for api extend Parrot_set_strreg
 *
 * Set the value of an S register
 */
void Parrot_set_strreg(Parrot_INTERP interpreter, Parrot_Int regnum, Parrot_STRING value) {
    REG_STR(regnum) = value;
}

/*=for api extend Parrot_set_pmcreg
 *
 * Set the value of a P  register
 */
void Parrot_set_pmcreg(Parrot_INTERP interpreter, Parrot_Int regnum, Parrot_PMC value) {
    REG_PMC(regnum) = value;
}

/*=for api extend Parrot_new_string
 *
 * Create a new Parrot string from a passed-in buffer. If the
 * encoding, charset, or langage are 0, then use the default. Pass in
 * a 0 for flags for right now.
 *
 * A copy of the buffer is made.
 *
 */
Parrot_STRING Parrot_new_string(Parrot_INTERP interpreter,
                                char *buffer, int length,
                                Parrot_Encoding encoding,
                                Parrot_CharType charset,
                                Parrot_Language language,
                                Parrot_Int flags) {
    return string_make(interpreter, buffer, length, encoding, flags, charset);
}

/*=for api extend Parrot_find_encoding
 *
 * Find the magic token for an encoding, by name
 */
Parrot_Const_Encoding Parrot_find_encoding(Parrot_INTERP interpreter, char *encoding_name) {
    return Parrot_encoding_lookup(encoding_name);
}

/*=for api extend Parrot_find_language
 *
 * Find the magic language token for a language, by language name
 *
 */
Parrot_Language Parrot_find_language(Parrot_INTERP interpreter, char *langauge) {
    return 0;
}

/*=for api extend Parrot_find_chartype
 *
 * Find the magic token for a chartype, by name
 *
 */
Parrot_Const_CharType Parrot_find_chartype(Parrot_INTERP interpreter, char *chartype) {
    return Parrot_chartype_lookup(chartype);
}

/*=for api extend Parrot_register_pmc
 *
 * Add a reference of the PMC to the interpreters DOD registry.
 * This prevents PMCs only known to extension from getting destroyed
 * during DOD runs.
 *
 */

void
Parrot_register_pmc(Parrot_INTERP interpreter, Parrot_PMC pmc)
{
    dod_register_pmc(interpreter, pmc);
}

/*=for api extend Parrot_unregister_pmc
 *
 * Remove a reference of the PMC from the interpreters DOD registry
 * If the register count reaches zero, the PMC will be destroyed during
 * the next DOD run.
 *
 */

void
Parrot_unregister_pmc(Parrot_INTERP interpreter, Parrot_PMC pmc)
{
    dod_unregister_pmc(interpreter, pmc);
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
