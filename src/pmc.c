/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/pmc.c - The base vtable calling functions

=head1 DESCRIPTION

=head2 Functions

*/

#include "parrot/parrot.h"
#include <assert.h>
#include "pmc.str"

/* HEADERIZER HFILE: include/parrot/pmc.h */

/* HEADERIZER BEGIN: static */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC* create_class_pmc( PARROT_INTERP, INTVAL type )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC* get_new_pmc_header( PARROT_INTERP,
    INTVAL base_type,
    UINTVAL flags )
        __attribute__nonnull__(1);

/* HEADERIZER END: static */


PMC * PMCNULL;

/*

FUNCDOC: pmc_new
Creates a new PMC of type C<base_type> (which is an index into the list
of PMC types declared in C<vtables> in
F<include/parrot/pmc.h>). Once the PMC has been successfully created and
its vtable pointer initialized, we call its C<init> method to perform
any other necessary initialization.

*/

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC *
pmc_new(PARROT_INTERP, INTVAL base_type)
{
    PMC * const pmc = pmc_new_noinit(interp, base_type);
    VTABLE_init(interp, pmc);
    return pmc;
}

/*

FUNCDOC: pmc_reuse
Reuse an existing PMC, turning it into an empty PMC of the new
type. Any required internal structure will be put in place (such as
the extension area) and the PMC will be ready to go. This will throw
an exception if the PMC is constant or of a singleton type (such as
the environment PMC) or is being turned into a PMC of a singleton
type.

*/

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC*
pmc_reuse(PARROT_INTERP, NOTNULL(PMC *pmc), INTVAL new_type,
          SHIM(UINTVAL flags))
{
    INTVAL has_ext, new_flags;
    VTABLE *new_vtable;

    if (pmc->vtable->base_type == new_type)
        return pmc;

    new_vtable = interp->vtables[new_type];

    /* Singleton/const PMCs/types are not eligible */

    if ((pmc->vtable->flags | new_vtable->flags)
        & (VTABLE_PMC_IS_SINGLETON | VTABLE_IS_CONST_FLAG))
    {
        /* First, is the destination a singleton? No joy for us there */
        if (new_vtable->flags & VTABLE_PMC_IS_SINGLETON)
            real_exception(interp, NULL, ALLOCATION_ERROR,
                               "Parrot VM: Can't turn to a singleton type!\n");

        /* First, is the destination a constant? No joy for us there */
        if (new_vtable->flags & VTABLE_IS_CONST_FLAG)
            real_exception(interp, NULL, ALLOCATION_ERROR,
                               "Parrot VM: Can't turn to a constant type!\n");

        /* Is the source a singleton? */
        if (pmc->vtable->flags & VTABLE_PMC_IS_SINGLETON)
            real_exception(interp, NULL, ALLOCATION_ERROR,
                               "Parrot VM: Can't modify a singleton\n");

        /* Is the source constant? */
        if (pmc->vtable->flags & VTABLE_IS_CONST_FLAG)
            real_exception(interp, NULL, ALLOCATION_ERROR,
                               "Parrot VM: Can't modify a constant\n");
    }

    /* Do we have an extension area? */
    has_ext = (PObj_is_PMC_EXT_TEST(pmc) && pmc->pmc_ext);

    /* Do we need one? */
    if (new_vtable->flags & VTABLE_PMC_NEEDS_EXT) {
        if (!has_ext) {
            /* If we need an ext area, go allocate one */
            add_pmc_ext(interp, pmc);
        }
        new_flags = PObj_is_PMC_EXT_FLAG;
    }
    else {
        if (has_ext) {
            /* if the PMC has a PMC_EXT structure,
             * return it to the pool/arena
             */
            Small_Object_Pool * const ext_pool =
                interp->arena_base->pmc_ext_pool;
            if (PObj_is_PMC_shared_TEST(pmc) && PMC_sync(pmc)) {
                MUTEX_DESTROY(PMC_sync(pmc)->pmc_lock);
                mem_internal_free(PMC_sync(pmc));
                PMC_sync(pmc) = NULL;
            }
            ext_pool->add_free_object(interp, ext_pool, pmc->pmc_ext);
        }
        pmc->pmc_ext = NULL;
#if ! PMC_DATA_IN_EXT
        PMC_data(pmc) = NULL;
#endif
        new_flags = 0;
    }

    /* we are a PMC + maybe is_PMC_EXT */
    PObj_flags_SETTO(pmc, PObj_is_PMC_FLAG | new_flags);

    /* Set the right vtable */
    pmc->vtable = new_vtable;

    /* Call the base init for the redone pmc */
    VTABLE_init(interp, pmc);

    return pmc;
}

/*

FUNCDOC: get_new_pmc_header
Gets a new PMC header.

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC*
get_new_pmc_header(PARROT_INTERP, INTVAL base_type, UINTVAL flags)
{
    PMC *pmc;
    VTABLE *vtable = interp->vtables[base_type];

    if (!vtable) {
        /* This is usually because you either didn't call init_world early
         * enough, you added a new PMC class without adding
         * Parrot_(classname)_class_init to init_world, or you forgot
         * to run 'make realclean' after adding a new PMC class.
         */
        PANIC(interp, "Null vtable used");
    }

    /* we only have one global Env object, living in the interp */
    if (vtable->flags & VTABLE_PMC_IS_SINGLETON) {
        /*
         * singletons (monadic objects) exist only once, the interface
         * with the class is:
         * - get_pointer: return NULL or a pointer to the single instance
         * - set_pointer: set the only instance once
         *
         * - singletons are created in the constant pmc pool
         */
        PMC *pmc = (PMC *)(vtable->get_pointer)(interp, NULL);
        /* LOCK */
        if (!pmc) {
            pmc = new_pmc_header(interp, PObj_constant_FLAG);
            assert(pmc);
            pmc->vtable = vtable;
            pmc->real_self = pmc;
            VTABLE_set_pointer(interp, pmc, pmc);
        }
        return pmc;
    }
    if (vtable->flags & VTABLE_IS_CONST_PMC_FLAG) {
        flags |= PObj_constant_FLAG;
    }
    else if (vtable->flags & VTABLE_IS_CONST_FLAG) {
        /* put the normal vtable in, so that the pmc can be initialized first
         * parrot or user code has to set the _ro property then,
         * to morph the PMC to the const variant
         * This assumes that a constant PMC enum is one bigger then
         * the normal one.
         */

        /*
         * XXX not yet we can't assure that all contents in the
         * const PMC is const too
         * see e.g. t/pmc/sarray_13.pir
         */
#if 0
        flags |= PObj_constant_FLAG;
#endif
        --base_type;
        vtable = interp->vtables[base_type];
    }
    if (vtable->flags & VTABLE_PMC_NEEDS_EXT) {
        flags |= PObj_is_PMC_EXT_FLAG;
        if (vtable->flags & VTABLE_IS_SHARED_FLAG)
            flags |= PObj_is_PMC_shared_FLAG;
    }

    pmc = new_pmc_header(interp, flags);
    if (!pmc)
        real_exception(interp, NULL, ALLOCATION_ERROR,
                "Parrot VM: PMC allocation failed!\n");

    pmc->vtable = vtable;
    pmc->real_self = pmc;

#if GC_VERBOSE
    if (Interp_flags_TEST(interp, PARROT_TRACE_FLAG)) {
        /* XXX make a more verbose trace flag */
        fprintf(stderr, "\t=> new %p type %d\n", pmc, (int)base_type);
    }
#endif
    return pmc;
}


/*

FUNCDOC: pmc_new_noinit
Creates a new PMC of type C<base_type> (which is an index into the list
of PMC types declared in C<vtables> in
F<include/parrot/pmc.h>). Unlike C<pmc_new()>, C<pmc_new_noinit()> does
not call its C<init> method.  This allows separate allocation and
initialization for continuations.

*/

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC *
pmc_new_noinit(PARROT_INTERP, INTVAL base_type)
{
    PMC * const pmc = get_new_pmc_header(interp, base_type, 0);

    return pmc;
}

/*

FUNCDOC: constant_pmc_new_noinit
Creates a new constant PMC of type C<base_type>.

*/

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC *
constant_pmc_new_noinit(PARROT_INTERP, INTVAL base_type)
{
    PMC * const pmc = get_new_pmc_header(interp, base_type,
            PObj_constant_FLAG);
    return pmc;
}

/*

FUNCDOC: constant_pmc_new
Creates a new constant PMC of type C<base_type>, the call C<init>.

*/

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC *
constant_pmc_new(PARROT_INTERP, INTVAL base_type)
{
    PMC * const pmc = get_new_pmc_header(interp, base_type,
            PObj_constant_FLAG);
    VTABLE_init(interp, pmc);
    return pmc;
}

/*

FUNCDOC: pmc_new_init
As C<pmc_new()>, but passes C<init> to the PMC's C<init_pmc()> method.

*/

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC *
pmc_new_init(PARROT_INTERP, INTVAL base_type, NULLOK(PMC *init))
{
    PMC * const pmc = pmc_new_noinit(interp, base_type);

    VTABLE_init_pmc(interp, pmc, init);

    return pmc;
}

/*

FUNCDOC: constant_pmc_new_init
As C<constant_pmc_new>, but passes C<init> to the PMC's C<init_pmc> method.

*/

PARROT_API
PARROT_CANNOT_RETURN_NULL
PMC *
constant_pmc_new_init(PARROT_INTERP, INTVAL base_type, NULLOK(PMC *init))
{
    PMC * const pmc = get_new_pmc_header(interp, base_type, PObj_constant_FLAG);
    VTABLE_init_pmc(interp, pmc, init);
    return pmc;
}

/*

FUNCDOC: pmc_register
This segment handles PMC registration and such.

*/

PARROT_API
INTVAL
pmc_register(PARROT_INTERP, NOTNULL(STRING *name))
{
    INTVAL type;
    PMC *classname_hash;
    /* If they're looking to register an existing class, return that
       class' type number */
    type = pmc_type(interp, name);

    if (type > enum_type_undef) {
        return type;
    }
    if (type < enum_type_undef) {
        real_exception(interp, NULL, 1, "native type with name '%s' already exists - "
                "can't register PMC", data_types[type].name);
        return 0;
    }

    classname_hash = interp->class_hash;
    type = interp->n_vtable_max++;
    /* Have we overflowed the table? */
    if (type >= interp->n_vtable_alloced) {
        parrot_realloc_vtables(interp);
    }
    /* set entry in name->type hash */
    VTABLE_set_integer_keyed_str(interp, classname_hash, name, type);
    return type;
}

/*

FUNCDOC: pmc_type
Returns the PMC type for C<name>.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
INTVAL
pmc_type(PARROT_INTERP, NOTNULL(STRING *name))
{
    PMC * const classname_hash = interp->class_hash;
    PMC * const item = (PMC *)VTABLE_get_pointer_keyed_str(interp, classname_hash, name);

    /* nested namespace with same name */
    if (item->vtable->base_type == enum_class_NameSpace)
        return 0;
    if (!PMC_IS_NULL(item))
        return VTABLE_get_integer(interp, item);

    return Parrot_get_datatype_enum(interp, name);
}

/*

FUNCDOC: pmc_type_p
Returns the PMC type for C<name>.

*/

PARROT_API
INTVAL
pmc_type_p(PARROT_INTERP, NOTNULL(PMC *name))
{
    PMC * const classname_hash = interp->class_hash;
    PMC * const item = (PMC *)VTABLE_get_pointer_keyed(interp, classname_hash, name);

    if (!PMC_IS_NULL(item))
        return VTABLE_get_integer(interp, item);
    return 0;
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC*
create_class_pmc(PARROT_INTERP, INTVAL type)
{
    /*
     * class interface - a PMC is its own class
     * put an instance of this PMC into class
     *
     * create a constant PMC
     */
    PMC * const _class = get_new_pmc_header(interp, type,
                                           PObj_constant_FLAG);
    /* If we are a second thread, we may get the same object as the
     * original because we have a singleton. Just set the singleton to
     * be our class object, but don't mess with its vtable.
     */
    if ((interp->vtables[type]->flags & VTABLE_PMC_IS_SINGLETON)
        && (_class == _class->vtable->pmc_class)) {
        interp->vtables[type]->pmc_class = _class;
        return _class;
    }
    if (PObj_is_PMC_EXT_TEST(_class)) {
        /* if the PMC has a PMC_EXT structure,
         * return it to the pool/arena
         * we don't need it - basically only the vtable is important
         */
        Small_Object_Pool * const ext_pool =
            interp->arena_base->pmc_ext_pool;
        if (PMC_sync(_class)) {
            MUTEX_DESTROY(PMC_sync(_class)->pmc_lock);
            mem_internal_free(PMC_sync(_class));
            PMC_sync(_class) = NULL;
        }
        ext_pool->add_free_object(interp, ext_pool, _class->pmc_ext);
    }
    _class->pmc_ext = NULL;
    DOD_flag_CLEAR(is_special_PMC, _class);
    PMC_pmc_val(_class)   = (PMC *)0xdeadbeef;
    PMC_struct_val(_class)= (void*)0xdeadbeef;

    PObj_is_PMC_shared_CLEAR(_class);

    interp->vtables[type]->pmc_class = _class;

    return _class;
}

/*

FUNCDOC: Parrot_create_mro
Create the MRO (method resolution order) array for this type.

*/

PARROT_API
void
Parrot_create_mro(PARROT_INTERP, INTVAL type)
{
    STRING *class_name, *isa;
    INTVAL pos, parent_type, total;
    PMC *_class, *mro;

    VTABLE *vtable = interp->vtables[type];

    /* multithreaded: has already mro */
    if (vtable->mro)
        return;
    mro = pmc_new(interp, enum_class_ResizablePMCArray);
    vtable->mro = mro;
    if (vtable->ro_variant_vtable) {
        vtable->ro_variant_vtable->mro = mro;
    }
    class_name = vtable->whoami;
    isa = vtable->isa_str;
    total = (INTVAL)string_length(interp, isa);
    for (pos = 0; ;) {
        INTVAL len = string_length(interp, class_name);
        pos += len + 1;
        parent_type = pmc_type(interp, class_name);
        if (!parent_type)   /* abstract classes don't have a vtable */
            break;
        vtable = interp->vtables[parent_type];
        if (!vtable->_namespace) {
            /* need a namespace Hash, anchor at parent, name it */
            PMC * const ns = pmc_new(interp,
                    Parrot_get_ctx_HLL_type(interp, enum_class_NameSpace));
            vtable->_namespace = ns;
            /* anchor at parent, aka current_namespace, that is 'parrot' */
            VTABLE_set_pmc_keyed_str(interp,
                    CONTEXT(interp->ctx)->current_namespace,
                    class_name, ns);
        }
        _class = vtable->pmc_class;
        if (!_class) {
            _class = create_class_pmc(interp, parent_type);
        }
        VTABLE_push_pmc(interp, mro, _class);
        if (pos >= total)
            break;
        len = string_str_index(interp, isa,
                CONST_STRING(interp, " "), pos);
        if (len == -1)
            len = total;
        class_name = string_substr(interp, isa, pos,
                len - pos, NULL, 0);
    }
}

/*

=head2 DOD registry interface

FUNCDOC: dod_register_pmc
Registers the PMC with the interpreter's DOD registery.

*/

PARROT_API
void
dod_register_pmc(PARROT_INTERP, PMC* pmc)
{
    /* Better not trigger a DOD run with a potentially unanchored PMC */
    Parrot_block_DOD(interp);

    if (!interp->DOD_registry)
        interp->DOD_registry = pmc_new(interp, enum_class_AddrRegistry);
    VTABLE_set_pmc_keyed(interp, interp->DOD_registry, pmc, PMCNULL);
    Parrot_unblock_DOD(interp);

}

/*

FUNCDOC: dod_unregister_pmc
Unregisters the PMC from the interpreter's DOD registry.

*/

void
dod_unregister_pmc(PARROT_INTERP, NOTNULL(PMC* pmc))
{
    if (!interp->DOD_registry)
        return; /* XXX or signal exception? */
    VTABLE_delete_keyed(interp, interp->DOD_registry, pmc);
}


/*

=head2 PMC Proxy related things

FUNCDOC: Parrot_create_pmc_proxy
Creates a PMC Proxy for the supplied class number and puts it into the array
of proxies.

*/

PARROT_API
void
Parrot_create_pmc_proxy(PARROT_INTERP, int type_num)
{
    PMC *proxy;
    Parrot_PMCProxy *proxy_info;

    /* Ensure that it's a valid type number. */
    if (type_num > interp->n_vtable_max || type_num < 0) {
        real_exception(interp, NULL, 1,
            "Attempt to create PMC Proxy for invalid type number!");
    }

    /* Create PMC proxy object and set up number, name and namespcae. */
    proxy = pmc_new(interp, enum_class_PMCProxy);
    proxy_info = PARROT_PMCPROXY(proxy);
    proxy_info->id = type_num;
    proxy_info->name = interp->vtables[type_num]->whoami;
    proxy_info->_namespace = interp->vtables[type_num]->_namespace;

    /* XXX Parents and MRO still todo. */

    /* Enter it in the list of proxy objects. */
    VTABLE_set_pmc_keyed_int(interp, interp->pmc_proxies, type_num, proxy);
}



/*

=head1 SEE ALSO

F<include/parrot/vtable.h>.

C<5.1.0.14.2.20011008152120.02158148@pop.sidhe.org>
(http://www.nntp.perl.org/group/perl.perl6.internals/5516).

=head1 HISTORY

Initial version by Simon on 2001.10.20.

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
