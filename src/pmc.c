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
#include <assert.h>
#include "pmc.str"

static PMC* get_new_pmc_header(Parrot_Interp, INTVAL base_type, UINTVAL flags);


PMC * PMCNULL;

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
          UINTVAL flags)>

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
    INTVAL has_ext = 0, new_flags = 0;

    if (pmc->vtable->base_type == new_type)
        return pmc;

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
    if (PObj_is_PMC_EXT_TEST(pmc) && pmc->pmc_ext) {
        has_ext = 1;
    }

    /* Do we need one? */
    if (Parrot_base_vtables[new_type]->flags & VTABLE_PMC_NEEDS_EXT) {

        if (!has_ext) {
            /* If we need an ext area, go allocate one */
            add_pmc_ext(interpreter, pmc);
        }
        new_flags = PObj_is_PMC_EXT_FLAG;
    }
    else {
        if (has_ext) {
            /* if the PMC has a PMC_EXT structure,
             * return it to the pool/arena
             */
            struct Small_Object_Pool *ext_pool =
                interpreter->arena_base->pmc_ext_pool;
            ext_pool->add_free_object(interpreter, ext_pool, pmc->pmc_ext);
        }
        pmc->pmc_ext = NULL;
#if ! PMC_DATA_IN_EXT
        PMC_data(pmc) = NULL;
#endif
    }

    /* we are a PMC + maybe is_PMC_EXT */
    PObj_flags_SETTO(pmc, PObj_is_PMC_FLAG | new_flags);

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

    /* we only have one global Env object, living in the interpreter */
    if (vtable->flags & VTABLE_PMC_IS_SINGLETON) {
        /*
         * singletons (monadic objects) exist only once, the interface
         * with the class is:
         * - get_pointer: return NULL or a pointer to the single instance
         * - set_pointer: set the only instance once
         *
         * - singletons are created in the constant pmc pool
         */
        pmc = (vtable->get_pointer)(interpreter, NULL);
        /* LOCK */
        if (!pmc) {
            pmc = new_pmc_header(interpreter, PObj_constant_FLAG);
            pmc->vtable = vtable;
            VTABLE_set_pointer(interpreter, pmc, pmc);
        }
        return pmc;
    }
    if (vtable->flags & VTABLE_IS_CONST_FLAG) {
        /* put the normal vtable in, so that the pmc can be initialized first
         * parrot or user code has to set the _ro property then,
         * to morph the PMC to the const variant
         * This assumes that a constant PMC enum is one bigger then
         * the normal one.
         */

        /*
         * XXX not yet we can't assure that all contents in the
         * const PMC is const too
         * see e.g. t/pmc/sarray_13.imc
         */
#if 0
        flags = PObj_constant_FLAG;
#endif
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
        INTVAL i;
        new_vtable_table = mem_sys_realloc(Parrot_base_vtables, new_size);
        /* Should set all the empty slots to the null PMC's
           vtable pointer */
        for (i = class_table_size; i < new_max; ++i)
            new_vtable_table[i] = NULL;
        Parrot_base_vtables = new_vtable_table;
        class_table_size = new_max;
    }
    /* set entry in name->type hash */
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
    HashBucket *bucket;
    PMC *classname_hash = interp->class_hash;

    bucket = hash_get_bucket(interp, PMC_struct_val(classname_hash), name);
    if (bucket)
        return PMC_int_val((PMC*) bucket->value);
    return Parrot_get_datatype_enum(interp, name);

}

static PMC*
create_class_pmc(Interp *interpreter, INTVAL type)
{
    PMC *class;
    /*
     * class interface - a PMC is its own class
     * put an instance of this PMC into class
     *
     * create a constant PMC
     */
    class = get_new_pmc_header(interpreter, type, PObj_constant_FLAG);
    if (PObj_is_PMC_EXT_TEST(class)) {
        /* if the PMC has a PMC_EXT structure,
         * return it to the pool/arena
         * we don't need it - basically only the vtable is important
         */
        struct Small_Object_Pool *ext_pool =
            interpreter->arena_base->pmc_ext_pool;
        ext_pool->add_free_object(interpreter, ext_pool,
                class->pmc_ext);
    }
    class->pmc_ext = NULL;
    DOD_flag_CLEAR(is_special_PMC, class);
    PMC_pmc_val(class)   = (void*)0xdeadbeef;
    PMC_struct_val(class)= (void*)0xdeadbeef;

    Parrot_base_vtables[type]->class = class;

    return class;
}

/*

=item C<void Parrot_create_mro(Interp *interpreter, INTVAL type)>

Create the MRO (method resolution order) array for this type.

=cut

*/

void
Parrot_create_mro(Interp *interpreter, INTVAL type)
{
    VTABLE *vtable;
    STRING *class_name;
    INTVAL pos, len, parent_type, total;
    PMC *class, *mro;

    vtable = Parrot_base_vtables[type];
    /* multithreaded: has already mro */
    if (vtable->mro)
        return;
    mro = pmc_new(interpreter, enum_class_ResizablePMCArray);
    vtable->mro = mro;
    class_name = vtable->whoami;
    total = (INTVAL)string_length(interpreter, vtable->isa_str);
    for (pos = 0; ;) {
        len = string_length(interpreter, class_name);
        pos += len + 1;
        parent_type = pmc_type(interpreter, class_name);
        if (!parent_type)   /* abstract classes don't have a vtable */
            break;
        class = Parrot_base_vtables[parent_type]->class;
        if (!class) {
            class = create_class_pmc(interpreter, parent_type);
        }
        VTABLE_push_pmc(interpreter, mro, class);
        if (pos >= total)
            break;
        len = string_str_index(interpreter, vtable->isa_str,
                CONST_STRING(interpreter, " "), pos);
        if (len == -1)
            len = total;
        class_name = string_substr(interpreter, vtable->isa_str, pos,
                len - pos, NULL, 0);
    }
}

/*

=item C<static size_t
key_hash_int(Interp *interp, void *value, size_t seed)>

Simply returns C<value>. C<hash> is ignored.

Used in C<dod_register_pmc()>.

=cut

*/

static size_t
key_hash_int(Interp *interp, void *value, size_t seed)
{
    UNUSED(interp);
    return (size_t)value ^ seed;
}

/*

=item C<static int
int_compare(Parrot_Interp interp, void *a, void *b)>

Returns whether C<a != b>.

Used in C<dod_register_pmc()>.

=cut

*/

static int
int_compare(Interp *interp, void *a, void *b)
{
    UNUSED(interp);
    return a != b;
}

static void
pobject_lives_fn(Interp *interp, PObj *o)
{
    pobject_lives(interp, o);
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
                enum_class_Hash);
        new_hash_x(interpreter, &hash, enum_type_int, Hash_key_type_int,
                int_compare, key_hash_int);
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

C<5.1.0.14.2.20011008152120.02158148@pop.sidhe.org>
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
