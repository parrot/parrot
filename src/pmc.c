/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/pmc.c - The base vtable calling functions

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
static PMC* get_new_pmc_header(Parrot_Interp, INTVAL base_type, UINTVAL flags);


#if PARROT_CATCH_NULL
PMC * PMCNULL;
Parrot_mutex init_null_mutex;

/*

=item C<PMC *
pmc_init_null(Interp * interpreter)>

Initializes C<PMCNULL>, C<Null> PMC.

=cut

*/

PMC *
pmc_init_null(Interp * interpreter)
{
    LOCK(init_null_mutex);
    if(!PMCNULL)
       PMCNULL = get_new_pmc_header(interpreter, enum_class_Null,
               PObj_constant_FLAG);
    PMCNULL->vtable = Parrot_base_vtables[enum_class_Null];
    UNLOCK(init_null_mutex);
    return PMCNULL;
}
#endif

/*

=item C<PMC *
pmc_new(Interp *interpreter, INTVAL base_type)>

Creates a new PMC of type C<base_type> (which is an index into the list
of PMC types declared in C<Parrot_base_vtables> in
F<include/parrot/pmc.h>). Once the PMC has been successfully created and
its vtable pointer initialized, we call its C<init> method to perform
any other necessary initialization.

=cut

*/

PMC *
pmc_new(Interp *interpreter, INTVAL base_type)
{
    PMC *pmc = pmc_new_noinit(interpreter, base_type);
    VTABLE_init(interpreter, pmc);
    return pmc;
}

/*

=item C<PMC *
pmc_reuse(Interp *interpreter, PMC *pmc, INTVAL new_type,
          UINTVAL flags)

Reuse an existing PMC, turning it into an empty PMC of the new
type. Any required internal structure will be put in place (such as
the extension area) and the PMC will be ready to go. This will throw
an exception if the PMC is constant or of a singleton type (such as
the environment PMC) or is being turned into a PMC of a singleton
type.

=cut

*/

PMC*
pmc_reuse(Interp *interpreter, PMC *pmc, INTVAL new_type,
          UINTVAL flags)
{
    INTVAL has_ext = 0, needs_ext = 0;
    PMC_EXT hold_ext;

    /* First, is the destination a singleton? No joy for us there */
    if (Parrot_base_vtables[new_type]->flags & VTABLE_PMC_IS_SINGLETON) {
         internal_exception(ALLOCATION_ERROR,
                            "Parrot VM: Can't turn to a singleton type!\n");
        return NULL;
    }

    /* First, is the destination a constant? No joy for us there */
    if (Parrot_base_vtables[new_type]->flags & VTABLE_IS_CONST_FLAG) {
         internal_exception(ALLOCATION_ERROR,
                            "Parrot VM: Can't turn to a constant type!\n");
        return NULL;
    }

    /* Is the source a singleton? */
    if (pmc->vtable->flags & VTABLE_PMC_IS_SINGLETON) {
         internal_exception(ALLOCATION_ERROR,
                            "Parrot VM: Can't modify a singleton\n");
        return NULL;
    }

    /* Is the source constant? */
    if (pmc->vtable->flags & VTABLE_IS_CONST_FLAG) {
         internal_exception(ALLOCATION_ERROR,
                            "Parrot VM: Can't modify a constant\n");
        return NULL;
    }

    /* Do we have an extension area? */
    if (PObj_is_PMC_EXT_TEST(pmc)) {
        has_ext = 1;
    }

    /* Do we need one? */
    if (Parrot_base_vtables[new_type]->flags & VTABLE_PMC_NEEDS_EXT) {
        needs_ext = 1;
    }


    /* Unconditionally free and potentially reallocate the ext area,
       for simplicity. Not the most efficient way to do this */
    if (has_ext && pmc->pmc_ext) {
        /* if the PMC has a PMC_EXT structure,
         * return it to the pool/arena
         */
        struct Small_Object_Pool *ext_pool =
            interpreter->arena_base->pmc_ext_pool;
        ext_pool->add_free_object(interpreter, ext_pool, pmc->pmc_ext);
    }

    PObj_flags_CLEARALL(pmc);
#if ! PMC_DATA_IN_EXT
    PMC_data(pmc) = NULL;
#endif

    /* If we need an ext area, go allocate one */
    if (needs_ext) {
        add_pmc_ext(interpreter, pmc);
    }

    /* Set the right vtable */
    pmc->vtable = Parrot_base_vtables[new_type];
    /* Call the base init for the redone pmc */
    VTABLE_init(interpreter, pmc);
    return pmc;
}

/*

=item C<static PMC*
get_new_pmc_header(Interp *interpreter, INTVAL base_type,
    UINTVAL flags)>

Gets a new PMC header.

=cut

*/

static PMC*
get_new_pmc_header(Interp *interpreter, INTVAL base_type,
    UINTVAL flags)
{
    PMC *pmc;
    VTABLE *vtable = Parrot_base_vtables[base_type];

    if (!vtable) {
        /* This is usually because you either didn't call init_world early
         * enough or you added a new PMC class without adding
         * Parrot_(classname)_class_init to init_world. */
        PANIC("Null vtable used");
    }

    if (vtable->flags & VTABLE_IS_CONST_FLAG) {
        /* put the normal vtable in, so that the pmc can be initialized first
         * parrot or user code has to set the _ro property then,
         * to morph the PMC to the const variant
         * This assumes that a constant PMC enum is one bigger then
         * the normal one.
         */
        flags = PObj_constant_FLAG;
        --base_type;
        vtable = Parrot_base_vtables[base_type];
    }
    if (vtable->flags & VTABLE_PMC_NEEDS_EXT) {
        flags |= PObj_is_PMC_EXT_FLAG;
        if (vtable->flags & VTABLE_IS_SHARED_FLAG)
            flags |= PObj_is_PMC_shared_FLAG;
    }

    pmc = new_pmc_header(interpreter, flags);
    if (!pmc) {
        internal_exception(ALLOCATION_ERROR,
                "Parrot VM: PMC allocation failed!\n");
        return NULL;
    }

    pmc->vtable = vtable;
    /*
     * class interface - a PMC is it's own class
     * XXX use a separate vtable entry?
     * A ParrotObject has already the ParrotClass PMC in data
     */
    if (!vtable->data) {
        /* can't put this PMC in: if it needs timely destruction
         * it'll not get destroyed, so put in another PMC
         *
         * we should do that in pmc_register, but this doesn't
         * work for dynamic PMCs, which don't have a vtable
         * when they call pmc_register
         */
        PMC *class = vtable->data = new_pmc_header(interpreter, PObj_constant_FLAG);
        class->vtable = vtable;
    }

#if GC_VERBOSE
    if (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG)) {
        /* XXX make a more verbose trace flag */
        fprintf(stderr, "\t=> new %p type %d\n", pmc, (int)base_type);
    }
#endif
    return pmc;
}


/*

=item C<PMC *
pmc_new_noinit(Interp *interpreter, INTVAL base_type)>

Creates a new PMC of type C<base_type> (which is an index into the list
of PMC types declared in C<Parrot_base_vtables> in
F<include/parrot/pmc.h>). Unlike C<pmc_new()>, C<pmc_new_noinit()> does
not call its C<init> method.  This allows separate allocation and
initialization for continuations.

=cut

*/

PMC *
pmc_new_noinit(Interp *interpreter, INTVAL base_type)
{
    PMC *pmc;
    /* we only have one global Env object, living in the interpreter */
    if (Parrot_base_vtables[base_type]->flags & VTABLE_PMC_IS_SINGLETON) {
        if (base_type == enum_class_Env) {
            /* XXX need probably a lock around this code
             */
            pmc = VTABLE_get_pmc_keyed_int(interpreter, interpreter->iglobals,
                    (INTVAL)IGLOBALS_ENV_HASH);
            if (!pmc) {
                pmc = get_new_pmc_header(interpreter, base_type,
                        PObj_constant_FLAG);
                VTABLE_set_pmc_keyed_int(interpreter, interpreter->iglobals,
                        (INTVAL)IGLOBALS_ENV_HASH, pmc);
            /* UNLOCK */}
            return pmc;
        }
        /*
         * singletons (monadic objects) exist only once, the interface
         * with the class is:
         * - get_pointer: return NULL or a pointer to the single instance
         * - set_pointer: set the only instance once
         *
         * - singletons are created in the constant pmc pool
         */
        pmc = (Parrot_base_vtables[base_type]->get_pointer)(interpreter, NULL);
        /* LOCK */
        if (!pmc) {
            pmc = get_new_pmc_header(interpreter, base_type,
                    PObj_constant_FLAG);
            VTABLE_set_pointer(interpreter, pmc, pmc);
        }
        return pmc;
    }
    pmc = get_new_pmc_header(interpreter, base_type, 0);
    return pmc;
}

/*

=item C<PMC *
constant_pmc_new_noinit(Interp *interpreter, INTVAL base_type)>

Creates a new constant PMC of type C<base_type>.

=cut

*/

PMC *
constant_pmc_new_noinit(Interp *interpreter, INTVAL base_type)
{
    PMC *pmc = get_new_pmc_header(interpreter, base_type,
            PObj_constant_FLAG);
    return pmc;
}

/*

=item C<PMC *
constant_pmc_new(Interp *interpreter, INTVAL base_type)>

Creates a new constant PMC of type C<base_type>, the call C<init>.

=cut

*/

PMC *
constant_pmc_new(Interp *interpreter, INTVAL base_type)
{
    PMC *pmc = get_new_pmc_header(interpreter, base_type,
            PObj_constant_FLAG);
    VTABLE_init(interpreter, pmc);
    return pmc;
}

/*

=item C<PMC *
pmc_new_init(Interp *interpreter, INTVAL base_type, PMC *init)>

As C<pmc_new()>, but passes C<init> to the PMC's C<init_pmc()> method.

=cut

*/

PMC *
pmc_new_init(Interp *interpreter, INTVAL base_type, PMC *init)
{
    PMC *pmc = pmc_new_noinit(interpreter, base_type);

    VTABLE_init_pmc(interpreter, pmc, init);

    return pmc;
}

/*

=item C<PMC *
constant_pmc_new_init(Interp *interpreter, INTVAL base_type,
        PMC *init)>

As C<constant_pmc_new>, but passes C<init> to the PMC's C<init_pmc> method.

=cut

*/

PMC *
constant_pmc_new_init(Interp *interpreter, INTVAL base_type,
        PMC *init)
{
    PMC *pmc = get_new_pmc_header(interpreter, base_type, 1);
    VTABLE_init_pmc(interpreter, pmc, init);
    return pmc;
}

/*

=item C<INTVAL
pmc_register(Parrot_Interp interp, STRING *name)>

This segment handles PMC registration and such.

=cut

*/

INTVAL
pmc_register(Parrot_Interp interp, STRING *name)
{
    INTVAL type;
    PMC *classname_hash;
    /* If they're looking to register an existing class, return that
       class' type number */
    if ((type = pmc_type(interp, name)) > enum_type_undef) {
        return type;
    }
    if (type < enum_type_undef) {
        internal_exception(1, "native type with name '%s' already exists - "
                "can't register PMC", data_types[type].name);
        return 0;
    }

    /* We don't have one, so lets add one. We need to get a lock for
       this, though */
    LOCK(class_count_mutex);
    /* Try again, just in case */
    if ((type = pmc_type(interp, name)) != enum_type_undef) {
        UNLOCK(class_count_mutex);
        return type;
    }

    classname_hash = interp->class_hash;
    type = enum_class_max++;
    /* Have we overflowed the table? */
    if (enum_class_max > class_table_size - 1) {
        VTABLE **new_vtable_table;
        /* 10 bigger seems reasonable, though it's only a pointer
           table and we could get bigger without blowing much memory
        */
        INTVAL new_max = class_table_size + 10;
        INTVAL new_size = new_max * sizeof(VTABLE *);
        new_vtable_table = mem_sys_realloc(Parrot_base_vtables, new_size);
        /* XXX Should set all the empty slots to the null PMC's
           vtable pointer */
        Parrot_base_vtables = new_vtable_table;
        class_table_size = new_max;
    }

    VTABLE_set_integer_keyed_str(interp, classname_hash, name, type);

    UNLOCK(class_count_mutex);
    return type;
}

/*

=item C<INTVAL
pmc_type(Parrot_Interp interp, STRING *name)>

Returns the PMC type for C<name>.

=cut

*/

INTVAL
pmc_type(Parrot_Interp interp, STRING *name)
{
    INTVAL return_val;
    int w = PARROT_WARNINGS_test(interp, PARROT_WARNINGS_UNDEF_FLAG);
    PMC *classname_hash;
    /*
     * turn undef warns on - the compiler uses this function to
     * probe for PMC types
     */
    PARROT_WARNINGS_off(interp, PARROT_WARNINGS_UNDEF_FLAG);
    classname_hash = interp->class_hash;

    return_val = VTABLE_get_integer_keyed_str(interp, classname_hash, name);
    if (w)
        PARROT_WARNINGS_on(interp, PARROT_WARNINGS_UNDEF_FLAG);

    if (return_val == enum_type_undef) {
	return_val = Parrot_get_datatype_enum(interp, name);
    }
    return return_val;

}

/*

=item C<static size_t
key_hash_int(Interp *interp, Hash *hash, void *value)>

Simply returns C<value>. C<hash> is ignored.

Used in C<dod_register_pmc()>.

=cut

*/

static size_t
key_hash_int(Interp *interp, Hash *hash, void *value)
{
    UNUSED(interp);
    UNUSED(hash);
    return (size_t) value;
}

/*

=item C<static int
int_compare(Parrot_Interp interp, void *a, void *b)>

Returns whether C<a != b>.

Used in C<dod_register_pmc()>.

=cut

*/

static int
int_compare(Parrot_Interp interp, void *a, void *b)
{
    UNUSED(interp);
    return a != b;
}

/*

=back

=head2 DOD registry interface

=over 4

=item C<void
dod_register_pmc(Parrot_Interp interpreter, PMC* pmc)>

Registers the PMC with the interpreter's DOD registery.

=cut

*/

void
dod_register_pmc(Parrot_Interp interpreter, PMC* pmc)
{
    Hash *hash;
    HashBucket *bucket;

    /* Better not trigger a DOD run with a potentially unanchored PMC */
    Parrot_block_DOD(interpreter);

    if (!interpreter->DOD_registry) {
        PMC *registry;
        registry = interpreter->DOD_registry = pmc_new_noinit(interpreter,
                enum_class_PerlHash);
        new_hash_x(interpreter, &hash, enum_type_int, 0, Hash_key_type_int,
                int_compare, key_hash_int, pobject_lives);
        PObj_custom_mark_SET(registry);
        PMC_struct_val(registry) = hash;
    }
    else
        hash = PMC_struct_val(interpreter->DOD_registry);

    bucket = hash_get_bucket(interpreter, hash, pmc);
    if (bucket)
        LVALUE_CAST(long, bucket->value) ++;
    else
        hash_put(interpreter, hash, pmc, (void *) 1);
    Parrot_unblock_DOD(interpreter);

}

/*

=item C<void
dod_unregister_pmc(Parrot_Interp interpreter, PMC* pmc)>

Unregisters the PMC from the interpreter's DOD registery.

=cut

*/

void
dod_unregister_pmc(Parrot_Interp interpreter, PMC* pmc)
{
    Hash *hash;
    HashBucket *bucket;

    if (!interpreter->DOD_registry)
        return; /* XXX or signal exception? */
    hash = PMC_struct_val(interpreter->DOD_registry);

    bucket = hash_get_bucket(interpreter, hash, pmc);
    if (bucket) {
        if ((long) bucket->value == 1L)
            hash_delete(interpreter, hash, pmc);
        else
            LVALUE_CAST(long, bucket->value) --;
    }
}

/*

=back

=head1 SEE ALSO

F<include/parrot/vtable.h>.

<5.1.0.14.2.20011008152120.02158148@pop.sidhe.org>
(http://www.nntp.perl.org/group/perl.perl6.internals/5516).

=head1 HISTORY

Initial version by Simon on 2001.10.20.

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
