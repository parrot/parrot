/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/global.c - Access to global PMCs

=head1 DESCRIPTION

tdb

=head2 Functions

tdb

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "global.str"

/*

=item C<PMC *
Parrot_find_global(Parrot_Interp interpreter, STRING *class, STRING *globalname)>

If C<class> is NULL search global stash. If C<globalname> is NULL, return the
stash PMC.

Return NULL if the global isn't found or the global.

=item C<PMC *
Parrot_get_global(Parrot_Interp interpreter, STRING *class, STRING *globalname)>

If the global exists, return it. If not either throw an exception or return an
C<Undef> depending on the interpreter's error settings.

=cut

*/

PMC *
Parrot_find_global(Parrot_Interp interpreter, STRING *class, STRING *globalname)
{
    PMC *stash;
    STRING *ns_name;
#if 1
    /*
     * we are cheating a bit and use Hash internals to avoid
     * hash lookup duplication
     */
    HashBucket *b;
#ifdef FIND_DEBUG
    PIO_printf(interpreter, "find_global class '%Ss' meth '%Ss\n",
            class, globalname);
#endif
    stash = interpreter->globals->stash_hash;
    if (class) {
        ns_name = string_concat(interpreter,
                string_from_cstring(interpreter, "\0", 1),
                class, 0);
        b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(stash), ns_name);
        if (!b)
            return NULL;
        stash = b->value;
        if (!globalname)
            return stash;
        b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(stash), globalname);
        if (!b)
            return NULL;
        return VTABLE_get_pmc_keyed_int(interpreter, stash,
                PMC_int_val((PMC*)b->value));
    }
    if (!globalname)
        return stash;
    b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(stash), globalname);
    if (!b)
        return NULL;
    return b->value;

#else
    if (class) {
        ns_name = string_concat(interpreter,
                string_from_cstring(interpreter, "\0", 1),
                class, 0);
        if (!VTABLE_exists_keyed_str(interpreter,
                                     interpreter->globals->stash_hash,
                                     ns_name)) {
            return NULL;
        }
        stash = VTABLE_get_pmc_keyed_str(interpreter,
                                         interpreter->globals->stash_hash,
                                         ns_name);
    }
    else {
        stash = interpreter->globals->stash_hash;
    }
    if (!globalname)
        return stash;
    if (!VTABLE_exists_keyed_str(interpreter, stash, globalname)) {
        return NULL;
    }
    return VTABLE_get_pmc_keyed_str(interpreter,
            stash, globalname);
#endif
}

PMC *
Parrot_get_global(Parrot_Interp interpreter, STRING *class,
        STRING *name, void *next)
{
    PMC *g = Parrot_find_global(interpreter, class, name);
    if (g)
        return g;
    if (PARROT_ERRORS_test(interpreter, PARROT_ERRORS_GLOBALS_FLAG))  {
        real_exception(interpreter, next, E_NameError,
               Interp_flags_TEST(interpreter, PARROT_PYTHON_MODE) ?
                "global name '%Ss' is not defined" :
                "Global '%Ss' not found",
                name);
    }

    return pmc_new(interpreter, enum_class_Undef);
}

/*

=item C<PMC* Parrot_global_namespace(Interp *, PMC *globals, STRING *ns)>

Return the stash hash of the given namespace in C<globals>.
If it doesn't exist yet, add it to the stash C<globals>.

=cut

*/

PMC*
Parrot_global_namespace(Interp *interpreter, PMC *globals, STRING *class)
{
    PMC *stash;
    STRING *ns_name;

    /*
     * this routine is called by PackFile_ConstTable_unpack too, which
     * creates const table entries for global subs. During that the
     * constant isn't yet created. Triggering a DOD run in the hash
     * lookup dies then during mark_1_seg.
     */
    Parrot_block_DOD(interpreter);
    ns_name = string_concat(interpreter,
            string_from_cstring(interpreter, "\0", 1),
            class, 0);
    if (!VTABLE_exists_keyed_str(interpreter, globals, ns_name)) {
        stash = pmc_new(interpreter, enum_class_OrderedHash);
        VTABLE_set_pmc_keyed_str(interpreter, globals, ns_name, stash);
    }
    else {
        stash = VTABLE_get_pmc_keyed_str(interpreter, globals, ns_name);
    }
    Parrot_unblock_DOD(interpreter);
    return stash;
}

/*

=item C<void
Parrot_store_global(Parrot_Interp, STRING *class, STRING *globalname, PMC *)>

Store the given PMC as global C<globalname> in the namespace C<class>. If
C<class> is NULL, the top-level global namespace is used.

=cut

*/

void
Parrot_store_global(Interp *interpreter, STRING *class,
        STRING *globalname, PMC *pmc)
{
    PMC *globals = interpreter->globals->stash_hash;
    PMC *stash;
    if (class) {
        stash = Parrot_global_namespace(interpreter, globals, class);
        if (globalname->strlen > 2 &&
                string_ord(interpreter, globalname, 0) == '_' &&
                string_ord(interpreter, globalname, 1) == '_')
            Parrot_invalidate_method_cache(interpreter, class);
    }
    else
        stash = globals;
    VTABLE_set_pmc_keyed_str(interpreter, stash, globalname, pmc);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/global.h>

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
