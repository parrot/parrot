/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/extend.c - Parrot extension interface

=head1 DESCRIPTION

These are the functions that parrot extensions (i.e. parrot subroutines
written in C, or some other compiled language, rather than in parrot
bytecode) may access.

There is a deliberate distancing from the internals here. Don't go
peeking inside -- you've as much access as bytecode does, but no more,
so we can provide backwards compatibility for as long as we possibly
can.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/extend.h"

/*

=item C<Parrot_STRING 
Parrot_PMC_get_string(Parrot_INTERP interp, Parrot_PMC pmc)>

Return an opaque string that represents the string contained in the PMC.

=cut

*/

Parrot_STRING Parrot_PMC_get_string(Parrot_INTERP interp, Parrot_PMC pmc) {
  return VTABLE_get_string(interp, pmc);
}

/*

=item C<Parrot_STRING 
Parrot_PMC_get_string_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key)>

Return the integer keyed string value of the passed-in PMC

=cut

*/

Parrot_STRING Parrot_PMC_get_string_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
  return VTABLE_get_string_keyed_int(interp, pmc, key);
}


/*

=item C<void *Parrot_PMC_get_pointer(Parrot_INTERP interp, Parrot_PMC pmc)>

Returns a pointer. Used for PMCs that hold pointers to arbitrary data
PMC.

=cut

*/

void *Parrot_PMC_get_pointer(Parrot_INTERP interp, Parrot_PMC pmc) {
    return VTABLE_get_pointer(interp, pmc);
}

/*

=item C<void *
Parrot_PMC_get_pointer_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                              Parrot_Int key)>

Return the keyed, signed integer value of the value in the PMC.

=cut

*/

void *Parrot_PMC_get_pointer_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    return VTABLE_get_pointer_keyed_int(interp, pmc, key);
}

/*

=item C<Parrot_PMC 
Parrot_PMC_get_pmc_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key)>

Return the integer keyed PMC value of the passed-in PMC

=cut

*/

Parrot_PMC Parrot_PMC_get_pmc_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    return VTABLE_get_pmc_keyed_int(interp, pmc, key);
}

/*

=item C<Parrot_Int 
Parrot_PMC_get_intval(Parrot_INTERP interp, Parrot_PMC pmc)>

Return the signed integer value of the value in the PMC.

=cut

*/

Parrot_Int Parrot_PMC_get_intval(Parrot_INTERP interp, Parrot_PMC pmc) {
    return VTABLE_get_integer(interp, pmc);
}

/*

=item C<Parrot_Int 
Parrot_PMC_get_intval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                             Parrot_Int key)>

Return the keyed, signed integer value of the value in the PMC.

=cut

*/

Parrot_Int Parrot_PMC_get_intval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    return VTABLE_get_integer_keyed_int(interp, pmc, key);
}

/*

=item C<Parrot_Float 
Parrot_PMC_get_numval(Parrot_INTERP interp, Parrot_PMC pmc)>

Return the floating-point value of the PMC.

=cut

*/

Parrot_Float Parrot_PMC_get_numval(Parrot_INTERP interp, Parrot_PMC pmc) {
    return VTABLE_get_number(interp, pmc);
}

/*

=item C<Parrot_Float 
Parrot_PMC_get_numval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                             Parrot_Int key)>

Return the keyed, signed integer value of the value in the PMC.

=cut

*/

Parrot_Float Parrot_PMC_get_numval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    return VTABLE_get_number_keyed_int(interp, pmc, key);
}

/*

=item C<char *
Parrot_PMC_get_cstring_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                              Parrot_Int key)>

Return a null-terminated string that represents the string value of the PMC.

=cut

*/

char *Parrot_PMC_get_cstring_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    STRING *retval;
    retval = VTABLE_get_string_keyed_int(interp, pmc, key);
    return string_to_cstring(interp, retval);
}

/*

=item C<char *Parrot_PMC_get_cstring(Parrot_INTERP interp, Parrot_PMC pmc)>

Return a null-terminated string that represents the string value of the PMC.

=cut

*/

char *Parrot_PMC_get_cstring(Parrot_INTERP interp, Parrot_PMC pmc) {
    STRING *retval;
    retval = VTABLE_get_string(interp, pmc);
    return string_to_cstring(interp, retval);
}

/*

=item C<char *
Parrot_PMC_get_cstringn(Parrot_INTERP interp, Parrot_PMC pmc, 
                        Parrot_Int *length)>

Return a null-terminated string for the PMC, along with the length.

Yes, right now this is a bit of a cheat. It needs fixing, but without
disturbing the interface.

=cut

*/

char *Parrot_PMC_get_cstringn(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int *length) {
    char *retval;
    retval = string_to_cstring(interp, VTABLE_get_string(interp, pmc));
    *length = strlen(retval);
    return retval;
}

/*

=item C<char *
Parrot_PMC_get_cstringn_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                               Parrot_Int *length, Parrot_Int key)>

Return a null-terminated string for the PMC, along with the length.

Yes, right now this is a bit of a cheat. It needs fixing, but without
disturbing the interface.

=cut

*/

char *Parrot_PMC_get_cstringn_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int *length, Parrot_Int key) {
    char *retval;
    retval = string_to_cstring(interp, VTABLE_get_string_keyed_int(interp, pmc, key));
    *length = strlen(retval);
    return retval;
}

/*

=item C<void 
Parrot_PMC_set_string(Parrot_INTERP interp, Parrot_PMC pmc, 
                      Parrot_STRING value)>

Assign the passed-in Parrot string to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_string(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_STRING value) {
    VTABLE_set_string_native(interp, pmc, value);
}

/*

=item C<void 
Parrot_PMC_set_string_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                             Parrot_STRING value, Parrot_Int key)>

Assign the passed-in Parrot string to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_string_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_STRING value, Parrot_Int key) {
    VTABLE_set_string_keyed_int(interp, pmc, key, value);
}

/*

=item C<void 
Parrot_PMC_set_pointer(Parrot_INTERP interp, Parrot_PMC pmc, void *value)>

Assign the passed-in pointer to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_pointer(Parrot_INTERP interp, Parrot_PMC pmc, void *value) {
    VTABLE_set_pointer(interp, pmc, value);
}

/*

=item C<void 
Parrot_PMC_set_pmc_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                          Parrot_PMC value, Parrot_Int key)>

Assign the passed-in pmc to the passed-in slot of the passed-in PMC.

=cut

*/

void Parrot_PMC_set_pmc_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_PMC value, Parrot_Int key) {
    VTABLE_set_pmc_keyed_int(interp, pmc, key, value);
}

/*

=item C<void 
Parrot_PMC_set_pointer_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                              void *value, Parrot_Int key)>

Assign the passed-in pointer to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_pointer_intkey(Parrot_INTERP interp, Parrot_PMC pmc, void *value, Parrot_Int key) {
    VTABLE_set_pointer_keyed_int(interp, pmc, key, value);
}

/*

=item C<void 
Parrot_PMC_set_intval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int value)>

Assign the passed-in Parrot integer to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_intval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int value) {
    VTABLE_set_integer_native(interp, pmc, value);
}

/*

=item C<void 
Parrot_PMC_set_intval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                             Parrot_Int value, Parrot_Int key)>

Assign the passed-in Parrot integer to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_intval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int value, Parrot_Int key) {
    VTABLE_set_integer_keyed_int(interp, pmc, key, value);
}

/*

=item C<void 
Parrot_PMC_set_numval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Float value)>

Assign the passed-in Parrot number to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_numval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Float value) {
    VTABLE_set_number_native(interp, pmc, value);
}

/*

=item C<void 
Parrot_PMC_set_numval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                             Parrot_Float value, Parrot_Int key)>

Assign the passed-in Parrot number to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_numval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Float value, Parrot_Int key) {
    VTABLE_set_number_keyed_int(interp, pmc, key, value);
}

/*

=item C<void 
Parrot_PMC_set_cstring(Parrot_INTERP interp, Parrot_PMC pmc, const char *value)>

Assign the passed-in null-terminated C string to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_cstring(Parrot_INTERP interp, Parrot_PMC pmc, const char *value) {
    VTABLE_set_string_native(interp, pmc, string_from_cstring(interp, value, 0));
}

/*

=item C<void 
Parrot_PMC_set_cstring_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                              const char *value, Parrot_Int key)>

Assign the passed-in null-terminated C string to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_cstring_intkey(Parrot_INTERP interp, Parrot_PMC pmc, const char *value, Parrot_Int key) {
    VTABLE_set_string_keyed_int(interp, pmc, key, string_from_cstring(interp, value, 0));
}

/*

=item C<void 
Parrot_PMC_set_cstringn(Parrot_INTERP interp, Parrot_PMC pmc, 
                        const char *value, Parrot_Int length)>

Assign the passed-in length-noted string  to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_cstringn(Parrot_INTERP interp, Parrot_PMC pmc, const char *value, Parrot_Int length) {
    VTABLE_set_string_native(interp, pmc, string_from_cstring(interp, value, length));
}

/*

=item C<void 
Parrot_PMC_set_cstringn_intkey(Parrot_INTERP interp, Parrot_PMC pmc, 
                               const char *value, Parrot_Int length, 
                               Parrot_Int key)>

Assign the passed-in length-noted string to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_cstringn_intkey(Parrot_INTERP interp, Parrot_PMC pmc, const char *value, Parrot_Int length, Parrot_Int key) {
    VTABLE_set_string_keyed_int(interp, pmc, key, string_from_cstring(interp, value, length));
}

/*

=item C<Parrot_PMC Parrot_PMC_new(Parrot_INTERP interp, Parrot_Int type)>

Create and return a new PMC.

=cut

*/

Parrot_PMC Parrot_PMC_new(Parrot_INTERP interp, Parrot_Int type) {
    Parrot_PMC newpmc;
    newpmc = pmc_new_noinit(interp, type);
    VTABLE_init(interp, newpmc);
    return newpmc;
}

/*

=item C<Parrot_Int Parrot_PMC_typenum(Parrot_INTERP interp, const char *class)>

Returns the internal identifier that represents the named class.

=cut

*/

Parrot_Int Parrot_PMC_typenum(Parrot_INTERP interp, const char *class) {
    return pmc_type(interp, string_from_cstring(interp, class, 0));
}

/*

=item C<Parrot_PMC Parrot_PMC_null()>

Returns the special C<NULL> PMC.

=cut

*/

Parrot_PMC Parrot_PMC_null() {
    return PMCNULL;
}

/*

=item C<void Parrot_free_cstring(char *string)>

Deallocate a C string that the interpreter has handed to you.

=cut

*/

void Parrot_free_cstring(char *string) {
    string_cstring_free(string);
}

/*

=item C<void 
Parrot_call(Parrot_INTERP interpreter, Parrot_PMC sub,
            Parrot_Int argcount, ...)>

Call a parrot subroutine, with PMC parameters.

=cut

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

/*

=item C<void Parrot_call_method(Parrot_INTERP interp, Parrot_PMC sub,
                        Parrot_STRING method, Parrot_Int argcount, ...)>

Call a parrot method, with PMC parameters.

XXX Not implemented yet.

=cut

*/

void Parrot_call_method(Parrot_INTERP interp, Parrot_PMC sub,
                        Parrot_STRING method, Parrot_Int argcount, ...) {
}

/*

=item C<Parrot_Int 
Parrot_get_intreg(Parrot_INTERP interpreter, Parrot_Int regnum)>

Return the value of an integer register.

=cut

*/

Parrot_Int Parrot_get_intreg(Parrot_INTERP interpreter, Parrot_Int regnum) {
    return REG_INT(regnum);
}

/*

=item C<Parrot_Float 
Parrot_get_numreg(Parrot_INTERP interpreter, Parrot_Int regnum)>

Return the value of a numeric register.

=cut

*/

Parrot_Float Parrot_get_numreg(Parrot_INTERP interpreter, Parrot_Int regnum) {
    return REG_NUM(regnum);
}

/*

=item C<Parrot_STRING 
Parrot_get_strreg(Parrot_INTERP interpreter, Parrot_Int regnum)>

Return the value of a string register.

=cut

*/

Parrot_STRING Parrot_get_strreg(Parrot_INTERP interpreter, Parrot_Int regnum) {
    return REG_STR(regnum);
}

/*

=item C<Parrot_PMC 
Parrot_get_pmcreg(Parrot_INTERP interpreter, Parrot_Int regnum)>

Return the value of a PMC register.

=cut

*/

Parrot_PMC Parrot_get_pmcreg(Parrot_INTERP interpreter, Parrot_Int regnum) {
    return REG_PMC(regnum);
}

/*

=item C<void 
Parrot_set_intreg(Parrot_INTERP interpreter, Parrot_Int regnum, 
                  Parrot_Int value)>

Set the value of an I register.

=cut

*/

void Parrot_set_intreg(Parrot_INTERP interpreter, Parrot_Int regnum, Parrot_Int value) {
    REG_INT(regnum) = value;
}

/*

=item C<void 
Parrot_set_numreg(Parrot_INTERP interpreter, Parrot_Int regnum, 
                  Parrot_Float value)>

Set the value of an N register.

=cut

*/

void Parrot_set_numreg(Parrot_INTERP interpreter, Parrot_Int regnum, Parrot_Float value) {
    REG_NUM(regnum) = value;
}

/*

=item C<void 
Parrot_set_strreg(Parrot_INTERP interpreter, Parrot_Int regnum, 
                  Parrot_STRING value)>

Set the value of an S register.

=cut

*/

void Parrot_set_strreg(Parrot_INTERP interpreter, Parrot_Int regnum, Parrot_STRING value) {
    REG_STR(regnum) = value;
}

/*

=item C<void 
Parrot_set_pmcreg(Parrot_INTERP interpreter, Parrot_Int regnum, 
                  Parrot_PMC value) >

Set the value of a P register.

=cut

*/

void Parrot_set_pmcreg(Parrot_INTERP interpreter, Parrot_Int regnum, Parrot_PMC value) {
    REG_PMC(regnum) = value;
}

/*=for api extend Parrot_new_string
 *
 */
/*

=item C<Parrot_STRING Parrot_new_string(Parrot_INTERP interpreter,
                                char *buffer, int length,
                                Parrot_Encoding encoding,
                                Parrot_CharType charset,
                                Parrot_Language language,
                                Parrot_Int flags)>

Create a new Parrot string from a passed-in buffer. If the encoding,
charset, or language are 0, then use the default. Pass in a 0 for flags
for right now.

A copy of the buffer is made.

=cut

*/

Parrot_STRING Parrot_new_string(Parrot_INTERP interpreter,
                                char *buffer, int length,
                                Parrot_Encoding encoding,
                                Parrot_CharType charset,
                                Parrot_Language language,
                                Parrot_Int flags) {
    return string_make(interpreter, buffer, length, encoding, flags, charset);
}

/*

=item C<Parrot_Const_Encoding 
Parrot_find_encoding(Parrot_INTERP interpreter, char *encoding_name)>

Find the magic token for an encoding, by name.

=cut

*/

Parrot_Const_Encoding Parrot_find_encoding(Parrot_INTERP interpreter, char *encoding_name) {
    return Parrot_encoding_lookup(encoding_name);
}

/*

=item C<Parrot_Language 
Parrot_find_language(Parrot_INTERP interpreter, char *langauge)>

Find the magic language token for a language, by language name.

=cut

*/

Parrot_Language Parrot_find_language(Parrot_INTERP interpreter, char *langauge) {
    return 0;
}

/*

=item C<Parrot_Const_CharType 
Parrot_find_chartype(Parrot_INTERP interpreter, char *chartype)>

Find the magic token for a chartype, by name.

=cut

*/

Parrot_Const_CharType Parrot_find_chartype(Parrot_INTERP interpreter, char *chartype) {
    return Parrot_chartype_lookup(chartype);
}

/*

=item C<void
Parrot_register_pmc(Parrot_INTERP interpreter, Parrot_PMC pmc)>

Add a reference of the PMC to the interpreters DOD registry. This
prevents PMCs only known to extension from getting destroyed during DOD
runs.

=cut

*/

void
Parrot_register_pmc(Parrot_INTERP interpreter, Parrot_PMC pmc)
{
    dod_register_pmc(interpreter, pmc);
}

/*

=item C<void
Parrot_unregister_pmc(Parrot_INTERP interpreter, Parrot_PMC pmc)>

Remove a reference of the PMC from the interpreters DOD registry If the
reference count reaches zero, the PMC will be destroyed during the next
DOD run.

=cut

*/

void
Parrot_unregister_pmc(Parrot_INTERP interpreter, Parrot_PMC pmc)
{
    dod_unregister_pmc(interpreter, pmc);
}

/*

=back

=head1 SEE ALSO

See F<include/parrot/extend.h> and F<docs/extend.pod>.

=head1 HISTORY

Initial version by Dan Sugalski.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
