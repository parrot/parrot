/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/library.c - Interface to Parrot's bytecode library

=head1 DESCRIPTION

This file contains a C function to access parrot's bytecode library functions.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

/*

=item C<static void
library_init(Parrot_Interp interpreter)>

internal helper function - loads the parrotlib bytecode

=cut

*/

static void
library_init(Parrot_Interp interpreter)
{
    /* XXX TODO: file location not known at runtime, should
       be linked with parrot (or use the upcoming config system) */
    Parrot_load_bytecode_direct(interpreter, "runtime/parrot/include/parrotlib.pbc");
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
    INTVAL resume = interpreter->resume_flag;

    if (!init_done) {	
	library_init(interpreter);

        init_done = 1;
    }
    
    name = string_from_cstring(interpreter, func_name, strlen(func_name));
    
    /* get the sub pmc */
    str = string_from_cstring(interpreter, "_parrotlib", 10 );
    sub = Parrot_find_global(interpreter, str, name);
    if (!sub) {
        interpreter->resume_flag = resume;
	internal_exception(1, "unkown parrotlib method '%s'", func_name);
	abort();
    }

    /* get the signature */
    str = string_from_cstring(interpreter, "signature", 9 );
    prop = VTABLE_getprop(interpreter, sub, str);
    if (!prop) {
        interpreter->resume_flag = resume;
	internal_exception(1, "parrotlib method '%s' has no signature", func_name);
	abort();
    }
    str = VTABLE_get_string(interpreter, prop);
    csig = string_to_cstring(interpreter, str);
    
    /* call the bytecode method */
    va_start(args, func_name);
    ret = Parrot_runops_fromc_arglist_save(interpreter, sub, csig, args);
    va_end(args);
    
    /* done */
    interpreter->resume_flag = resume;
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
