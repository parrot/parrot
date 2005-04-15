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

/* Some internal notes. Parrot will die a horrible and bizarre death
   if the stack start pointer's not set and a DOD run is
   triggered. The pointer *will* be set by the interpreter if the
   interpreter calls code which calls these functions, so most
   extension code is safe, no problem.

   The problem comes in if these routines are called from *outside*
   an interpreter. This happens when an embedding application calls
   them to do stuff with PMCs, STRINGS, interpreter contents, and
   suchlike things. This is perfectly legal -- in fact it's what
   we've documented should be done -- but the problem is that the
   stack base pointer will be NULL. This is Very Bad.

   To deal with this there are two macros that are defined to handle
   the problem.

   PARROT_CALLIN_START(interpreter) will figure out if the stack
   anchor needs setting and, if so, will set it. It must *always*
   come immediately after the last variable declared in the block
   making the calls into the interpreter, as it declares a variable
   and has some code.

   PARROT_CALLIN_END(interpreter) will put the stack anchor back to
   the way it was, and should always be the last statement before a
   return. (If you have multiple returns have it in multiple times)

   Not doing this is a good way to introduce bizarre heisenbugs, so
   just do it. This is the only place they ought to have to be put
   in, and most of the functions are already written, so it's not
   like it's an onerous requirement.

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
    Parrot_STRING retval;
    PARROT_CALLIN_START(interp);
    retval = VTABLE_get_string(interp, pmc);
    PARROT_CALLIN_END(interp);
    return retval;
}

/*

=item C<Parrot_STRING
Parrot_PMC_get_string_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key)>

Return the integer keyed string value of the passed-in PMC

=cut

*/

Parrot_STRING Parrot_PMC_get_string_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    Parrot_STRING retval;
    PARROT_CALLIN_START(interp);
    retval = VTABLE_get_string_keyed_int(interp, pmc, key);
    PARROT_CALLIN_END(interp);
    return retval;
}


/*

=item C<void *Parrot_PMC_get_pointer(Parrot_INTERP interp, Parrot_PMC pmc)>

Returns a pointer. Used for PMCs that hold pointers to arbitrary data
PMC.

=cut

*/

void *Parrot_PMC_get_pointer(Parrot_INTERP interp, Parrot_PMC pmc) {
    void *retval;
    PARROT_CALLIN_START(interp);
    retval = VTABLE_get_pointer(interp, pmc);
    PARROT_CALLIN_END(interp);
    return retval;
}

/*

=item C<void *
Parrot_PMC_get_pointer_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                              Parrot_Int key)>

Return the keyed, signed integer value of the value in the PMC.

=cut

*/

void *Parrot_PMC_get_pointer_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    void *retval;
    PARROT_CALLIN_START(interp);
    retval = VTABLE_get_pointer_keyed_int(interp, pmc, key);
    PARROT_CALLIN_END(interp);
    return retval;
}

/*

=item C<Parrot_PMC
Parrot_PMC_get_pmc_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key)>

Return the integer keyed PMC value of the passed-in PMC

=cut

*/

Parrot_PMC Parrot_PMC_get_pmc_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    Parrot_PMC retval;
    PARROT_CALLIN_START(interp);
    retval = VTABLE_get_pmc_keyed_int(interp, pmc, key);
    PARROT_CALLIN_END(interp);
    return retval;
}

/*

=item C<Parrot_Int
Parrot_PMC_get_intval(Parrot_INTERP interp, Parrot_PMC pmc)>

Return the signed integer value of the value in the PMC.

=cut

*/

Parrot_Int Parrot_PMC_get_intval(Parrot_INTERP interp, Parrot_PMC pmc) {
    Parrot_Int retval;
    PARROT_CALLIN_START(interp);
    retval = VTABLE_get_integer(interp, pmc);
    PARROT_CALLIN_END(interp);
    return retval;
}

/*

=item C<Parrot_Int
Parrot_PMC_get_intval_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                             Parrot_Int key)>

Return the keyed, signed integer value of the value in the PMC.

=cut

*/

Parrot_Int Parrot_PMC_get_intval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    Parrot_Int retval;
    PARROT_CALLIN_START(interp);
    retval = VTABLE_get_integer_keyed_int(interp, pmc, key);
    PARROT_CALLIN_END(interp);
    return retval;
}

/*

=item C<Parrot_Float
Parrot_PMC_get_numval(Parrot_INTERP interp, Parrot_PMC pmc)>

Return the floating-point value of the PMC.

=cut

*/

Parrot_Float Parrot_PMC_get_numval(Parrot_INTERP interp, Parrot_PMC pmc) {
    Parrot_Float retval;
    PARROT_CALLIN_START(interp);
    retval =  VTABLE_get_number(interp, pmc);
    PARROT_CALLIN_END(interp);
    return retval;
}

/*

=item C<Parrot_Float
Parrot_PMC_get_numval_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                             Parrot_Int key)>

Return the keyed, signed integer value of the value in the PMC.

=cut

*/

Parrot_Float Parrot_PMC_get_numval_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    Parrot_Float retval;
    PARROT_CALLIN_START(interp);
    retval =  VTABLE_get_number_keyed_int(interp, pmc, key);
    PARROT_CALLIN_END(interp);
    return retval;
}

/*

=item C<char *
Parrot_PMC_get_cstring_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                              Parrot_Int key)>

Return a null-terminated string that represents the string value of the PMC.

=cut

*/

char *Parrot_PMC_get_cstring_intkey(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int key) {
    STRING *intermediate;
    char *retval;
    PARROT_CALLIN_START(interp);
    intermediate = VTABLE_get_string_keyed_int(interp, pmc, key);
    retval =  string_to_cstring(interp, intermediate);
    PARROT_CALLIN_END(interp);
    return retval;
}

/*

=item C<char *Parrot_PMC_get_cstring(Parrot_INTERP interp, Parrot_PMC pmc)>

Return a null-terminated string that represents the string value of the PMC.

=cut

*/

char *Parrot_PMC_get_cstring(Parrot_INTERP interp, Parrot_PMC pmc) {
    STRING *intermediate;
    char *retval;
    PARROT_CALLIN_START(interp);
    intermediate = VTABLE_get_string(interp, pmc);
    retval = string_to_cstring(interp, intermediate);
    PARROT_CALLIN_END(interp);
    return retval;
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
    PARROT_CALLIN_START(interp);
    retval = string_to_cstring(interp, VTABLE_get_string(interp, pmc));
    *length = strlen(retval);
    PARROT_CALLIN_END(interp);
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
    PARROT_CALLIN_START(interp);
    retval = string_to_cstring(interp, VTABLE_get_string_keyed_int(interp, pmc, key));
    *length = strlen(retval);
    PARROT_CALLIN_END(interp);
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
    PARROT_CALLIN_START(interp);
    VTABLE_set_string_native(interp, pmc, value);
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_string_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                              Parrot_Int key, Parrot_STRING value)>

Assign the passed-in Parrot string to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_string_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                                  Parrot_Int key, Parrot_STRING value) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_string_keyed_int(interp, pmc, key, value);
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_pointer(Parrot_INTERP interp, Parrot_PMC pmc, void *value)>

Assign the passed-in pointer to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_pointer(Parrot_INTERP interp, Parrot_PMC pmc, void *value) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_pointer(interp, pmc, value);
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_pmc_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                           Parrot_Int key, Parrot_PMC value)>

Assign the passed-in pmc to the passed-in slot of the passed-in PMC.

=cut

*/

void Parrot_PMC_set_pmc_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                               Parrot_Int key, Parrot_PMC value) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_pmc_keyed_int(interp, pmc, key, value);
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_pointer_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                              Parrot_Int key, void *value)>

Assign the passed-in pointer to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_pointer_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                                   Parrot_Int key, void *value) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_pointer_keyed_int(interp, pmc, key, value);
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_intval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int value)>

Assign the passed-in Parrot integer to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_intval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Int value) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_integer_native(interp, pmc, value);
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_intval_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                             Parrot_Int key, Parrot_Int value)>

Assign the passed-in Parrot integer to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_intval_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                                  Parrot_Int key, Parrot_Int value) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_integer_keyed_int(interp, pmc, key, value);
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_numval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Float value)>

Assign the passed-in Parrot number to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_numval(Parrot_INTERP interp, Parrot_PMC pmc, Parrot_Float value) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_number_native(interp, pmc, value);
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_numval_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                             Parrot_Int key, Parrot_Float value)>

Assign the passed-in Parrot number to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_numval_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                                  Parrot_Int key, Parrot_Float value) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_number_keyed_int(interp, pmc, key, value);
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_cstring(Parrot_INTERP interp, Parrot_PMC pmc, const char *value)>

Assign the passed-in null-terminated C string to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_cstring(Parrot_INTERP interp, Parrot_PMC pmc, const char *value) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_string_native(interp, pmc, string_from_cstring(interp, value, 0));
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_cstring_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                              Parrot_Int key, const char *value)>

Assign the passed-in null-terminated C string to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_cstring_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                                   Parrot_Int key, const char *value) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_string_keyed_int(interp, pmc, key, string_from_cstring(interp, value, 0));
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_cstringn(Parrot_INTERP interp, Parrot_PMC pmc,
                        const char *value, Parrot_Int length)>

Assign the passed-in length-noted string  to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_cstringn(Parrot_INTERP interp, Parrot_PMC pmc, const char *value, Parrot_Int length) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_string_native(interp, pmc, string_from_cstring(interp, value, length));
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_PMC_set_cstringn_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                               Parrot_Int key,
                               const char *value, Parrot_Int length)>

Assign the passed-in length-noted string to the passed-in PMC.

=cut

*/

void Parrot_PMC_set_cstringn_intkey(Parrot_INTERP interp, Parrot_PMC pmc,
                                    Parrot_Int key,
                                    const char *value, Parrot_Int length) {
    PARROT_CALLIN_START(interp);
    VTABLE_set_string_keyed_int(interp, pmc, key, string_from_cstring(interp, value, length));
    PARROT_CALLIN_END(interp);
}

/*

=item C<Parrot_PMC Parrot_PMC_new(Parrot_INTERP interp, Parrot_Int type)>

Create and return a new PMC.

=cut

*/

Parrot_PMC Parrot_PMC_new(Parrot_INTERP interp, Parrot_Int type) {
    Parrot_PMC newpmc;
    PARROT_CALLIN_START(interp);
    newpmc = pmc_new_noinit(interp, type);
    VTABLE_init(interp, newpmc);
    PARROT_CALLIN_END(interp);
    return newpmc;
}

/*

=item C<Parrot_Int Parrot_PMC_typenum(Parrot_INTERP interp, const char *class)>

Returns the internal identifier that represents the named class.

=cut

*/

Parrot_Int Parrot_PMC_typenum(Parrot_INTERP interp, const char *class) {
    Parrot_Int retval;
    PARROT_CALLIN_START(interp);
    retval = pmc_type(interp, string_from_cstring(interp, class, 0));
    PARROT_CALLIN_END(interp);
    return retval;
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

=item C<void*
Parrot_call_sub(Parrot_INTERP interpreter, Parrot_PMC sub,
            const char *signature, ...)>

Call a parrot subroutine the given function signature. The first char in
C<signature> denotes the return value. Next chars are arguments.

The return value of this function can be void or a pointer type.

Signature chars are:

    v ... void return
    I ... Parrot_Int
    N ... Parrot_Float
    S ... Parrot_STRING
    P ... Parrot_PMC

=item C<Parrot_Int>
Parrot_call_sub_ret_int(Parrot_INTERP interpreter, Parrot_PMC sub,
            const char *signature, ...)>

=item C<Parrot_Float>
Parrot_call_sub_ret_float(Parrot_INTERP interpreter, Parrot_PMC sub,
            const char *signature, ...)>

Like above, with Parrot_Int or Parrot_Float return result.

=cut

*/

void*
Parrot_call_sub(Parrot_INTERP interpreter, Parrot_PMC sub,
                 const char *signature, ...)
{
    va_list ap;
    void *result;

    PARROT_CALLIN_START(interpreter);

    va_start(ap, signature);
    result = Parrot_runops_fromc_arglist(interpreter, sub, signature, ap);
    va_end(ap);

    PARROT_CALLIN_END(interpreter);
    return result;
}

Parrot_Int
Parrot_call_sub_ret_int(Parrot_INTERP interpreter, Parrot_PMC sub,
                 const char *signature, ...)
{
    va_list ap;
    Parrot_Int result;

    PARROT_CALLIN_START(interpreter);

    va_start(ap, signature);
    result = Parrot_runops_fromc_arglist_reti(interpreter, sub, signature, ap);
    va_end(ap);

    PARROT_CALLIN_END(interpreter);
    return result;
}

Parrot_Float
Parrot_call_sub_ret_float(Parrot_INTERP interpreter, Parrot_PMC sub,
                 const char *signature, ...)
{
    va_list ap;
    Parrot_Float result;

    PARROT_CALLIN_START(interpreter);

    va_start(ap, signature);
    result = Parrot_runops_fromc_arglist_retf(interpreter, sub, signature, ap);
    va_end(ap);

    PARROT_CALLIN_END(interpreter);
    return result;
}

/*

=item C<void* Parrot_call_method(Parrot_INTERP interp, Parrot_PMC sub,
        Parrot_PMC object, Parrot_STRING method, const char *signature, ...)>

=item C<Parrot_Int Parrot_call_method_ret_int(Parrot_INTERP interp,
    Parrot_PMC sub, Parrot_PMC object, Parrot_STRING method,
    const char *signature, ...)>

=item C<Parrot_Float Parrot_call_method_ret_float(Parrot_INTERP interp,
    Parrot_PMC sub, Parrot_PMC object, Parrot_STRING method,
    const char *signature, ...)>

Call a parrot method for the given object.

=cut

*/

void *
Parrot_call_method(Parrot_INTERP interpreter, Parrot_PMC sub, Parrot_PMC obj,
                        Parrot_STRING method, const char *signature, ...)
{
    void *result;
    va_list ap;

    PARROT_CALLIN_START(interpreter);
    va_start(ap, signature);
    result = Parrot_run_meth_fromc_arglist(interpreter, sub,
            obj, method, signature, ap);
    va_end(ap);
    PARROT_CALLIN_END(interpreter);
    return result;
}

Parrot_Int
Parrot_call_method_ret_int(Parrot_INTERP interpreter, Parrot_PMC sub,
        Parrot_PMC obj, Parrot_STRING method, const char *signature, ...)
{
    Parrot_Int result;
    va_list ap;

    PARROT_CALLIN_START(interpreter);
    va_start(ap, signature);
    result = Parrot_run_meth_fromc_arglist_reti(interpreter, sub,
            obj, method, signature, ap);
    va_end(ap);
    PARROT_CALLIN_END(interpreter);
    return result;
}

Parrot_Float
Parrot_call_method_ret_float(Parrot_INTERP interpreter, Parrot_PMC sub,
        Parrot_PMC obj, Parrot_STRING method, const char *signature, ...)
{
    Parrot_Float result;
    va_list ap;

    PARROT_CALLIN_START(interpreter);
    va_start(ap, signature);
    result = Parrot_run_meth_fromc_arglist_retf(interpreter, sub,
            obj, method, signature, ap);
    va_end(ap);
    PARROT_CALLIN_END(interpreter);
    return result;
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
                                const char * const encoding_name,
                                Parrot_Int flags)>

Create a new Parrot string from a passed-in buffer. Pass in a 0 for
flags for right now.

A copy of the buffer is made.

=cut

*/

Parrot_STRING Parrot_new_string(Parrot_INTERP interpreter,
                                char *buffer, int length,
                                const char * const encoding_name,
                                Parrot_Int flags) {
    Parrot_STRING retval;
    PARROT_CALLIN_START(interpreter);
    retval = string_make(interpreter, buffer, length, encoding_name, flags);
    PARROT_CALLIN_END(interpreter);
    return retval;
}

/*

=item C<Parrot_Const_Encoding
Parrot_find_encoding(Parrot_INTERP interpreter, char *encoding_name)>

Find the magic token for an encoding, by name.

=cut

*/
/*
Parrot_Const_Encoding Parrot_find_encoding(Parrot_INTERP interpreter, char *encoding_name) {
    return Parrot_encoding_lookup(encoding_name);
}
*/
/*

=item C<Parrot_Language
Parrot_find_language(Parrot_INTERP interpreter, char *language)>

Find the magic language token for a language, by language name.

=cut

*/

Parrot_Language Parrot_find_language(Parrot_INTERP interpreter, char *language) {
    return 0;
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
Parrot_register_pmc(Parrot_INTERP interp, Parrot_PMC pmc)
{
    PARROT_CALLIN_START(interp);
    dod_register_pmc(interp, pmc);
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_unregister_pmc(Parrot_INTERP interpreter, Parrot_PMC pmc)>

Remove a reference of the PMC from the interpreters DOD registry. If the
reference count reaches zero, the PMC will be destroyed during the next
DOD run.

=cut

*/

void
Parrot_unregister_pmc(Parrot_INTERP interp, Parrot_PMC pmc)
{
    PARROT_CALLIN_START(interp);
    dod_unregister_pmc(interp, pmc);
    PARROT_CALLIN_END(interp);
}

/*

=item C<void
Parrot_pmc_set_vtable(Parrot_INTERP interpreter, Parrot_PMC pmc,
                      Parrot_VTABLE vtable)>

Replaces the vtable of the PMC.

=cut

*/

void
Parrot_PMC_set_vtable(Parrot_INTERP interpreter, Parrot_PMC pmc,
                      Parrot_VTABLE vtable)
{
    pmc->vtable = vtable;
}

/*

=item C<Parrot_VTABLE
Parrot_get_vtable(Parrot_INTERP interpreter, Parrot_Int id)>

Returns the vtable corresponding to the given PMC ID.

=cut

*/

Parrot_VTABLE
Parrot_get_vtable(Parrot_INTERP interpreter, Parrot_Int id)
{
    return Parrot_base_vtables[id];
}

/*

=back

=head1 SEE ALSO

See F<include/parrot/extend.h> and F<docs/pdds/pdd11_extending.pod>.

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
