/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/library.c - Interface to Parrot's bytecode library

=head1 DESCRIPTION

tdb

=head2 Functions

tdb

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

static void
library_init(Parrot_Interp interpreter)
{
    PMC *pmc;
    STRING *a, *b;

    /* XXX TODO: file location not known at runtime, should
       be linked with parrot (or use the upcoming config system) */
    Parrot_load_bytecode_direct(interpreter, "runtime/parrot/include/parrotlib.pbc");

#if 0
    a = string_from_cstring(interpreter, "_parrotlib", 10);
    b = string_from_cstring(interpreter, "__lib_init", 10);
    pmc = Parrot_find_global(interpreter, a, b);
    if (!pmc) {
	internal_exception(1,"_parrotlib::__lib_init not found");
	abort();
    }
    pmc = Parrot_runops_fromc_args_save(interpreter, pmc, "vv");
    VTABLE_set_pmc_keyed_int(interpreter, interpreter->iglobals,
	    IGLOBALS_RUNTIME_LIBRARY, pmc);
#endif
}

/*

=item C<void*
Parrot_library_query(Parrot_Interp, const char *func_name, ...)>

Runs the library function with the specified function name and returns
the result.

=cut

*/

void*
Parrot_library_query(Parrot_Interp interpreter, const char *func_name, ...)
{
    static int init_done = 0;
    va_list args;
    void *ret;
    PMC *sub, *prop;
    STRING *str, *name;
    char *csig;
    va_start(args, func_name);

    if (!init_done) {	
	library_init(interpreter);
        init_done = 1;
    }
    
    name = string_from_cstring(interpreter, func_name, strlen(func_name));
    
    str = string_from_cstring(interpreter, "_parrotlib", 10 );
    sub = Parrot_find_global(interpreter, str, name);
    if (!sub) {
	internal_exception(1, "unkown _parrotlib method '%s'", func_name);
	abort();
    }

    /* get the signature */
    str = string_from_cstring(interpreter, "signature", 9 );
    prop = VTABLE_getprop(interpreter, sub, str);
    if (!prop) {
	internal_exception(1, "_parrotlib method '%s' has no signature", func_name);
	abort();
    }
    str = VTABLE_get_string(interpreter, prop);
    csig = string_to_cstring(interpreter, str);
    
    ret = Parrot_runops_fromc_arglist_save(interpreter, sub, csig, args);
    va_end(args);
    
    return ret;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/library.h>

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
