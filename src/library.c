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

    a = string_from_cstring(interpreter, "_parrotlib", 10);
    b = string_from_cstring(interpreter, "__lib_init", 10);
    pmc = Parrot_find_global(interpreter, a, b);
    if (!pmc) {
	internal_exception(1,"_parrotlib::__lib_init not found");
	abort();
    }
    pmc = Parrot_runops_fromc_args_save(interpreter, pmc, "Pv");
    VTABLE_set_pmc_keyed_int(interpreter, interpreter->iglobals,
	    IGLOBALS_RUNTIME_LIBRARY, pmc);
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
    PMC *sub, *rt;
    STRING *str, *name;
    char *csig;

    if (!init_done) {	
	library_init(interpreter);
        init_done = 1;
    }
    
    assert(interpreter->iglobals);
    rt = VTABLE_get_pmc_keyed_int(interpreter, interpreter->iglobals,
            IGLOBALS_RUNTIME_LIBRARY);
    if (!rt) {
	Parrot_unblock_DOD(interpreter);
	internal_exception(1, "_parrotlib not initialized");
	abort();
    }

    name = string_from_cstring(interpreter, func_name, strlen(func_name));
    
    str = rt->vtable->get_string_keyed_str(interpreter, rt, name);
    if (!str || string_length(interpreter, str) == 0) {
	Parrot_unblock_DOD(interpreter);
	internal_exception(1, "unkown _parrotlib method '%s'", func_name);
	abort();
    }
    csig = string_to_cstring(interpreter, str);
    
    str = string_from_cstring(interpreter, "_parrotlib", 10 );
    sub = Parrot_find_global(interpreter, str, name);
    
    va_start(args, func_name);
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
