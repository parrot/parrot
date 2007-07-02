/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/global_setup.c - Global setup

=head1 DESCRIPTION

Performs all the global setting up of things. This includes the (very
few) global variables that Parrot totes around.

I<What are these global variables?>

=head2 Functions

*/

#define INSIDE_GLOBAL_SETUP
#include "parrot/parrot.h"
#include "global_setup.str"

/* These functions are defined in the auto-generated file core_pmcs.c */
/* XXX Get it into some public place */
extern void Parrot_initialize_core_pmcs(Interp *interp);
void Parrot_register_core_pmcs(Interp *interp, PMC* registry);

static const unsigned char* parrot_config_stored = NULL;
static unsigned int parrot_config_size_stored = 0;

/* HEADERIZER HFILE: include/parrot/global_setup.h */

/* HEADERIZER BEGIN: static */

static void parrot_set_config_hash_interpreter( Interp* interp /*NN*/ )
        __attribute__nonnull__(1);

/* HEADERIZER END: static */


/*

FUNCDOC: Parrot_set_config_hash_internal

Called by Parrot_set_config_hash with the serialised hash which
will be used in subsequently created Interpreters

*/

PARROT_API
void
Parrot_set_config_hash_internal(const unsigned char* parrot_config /*NN*/,
                                 unsigned int parrot_config_size)
{
    parrot_config_stored      = parrot_config;
    parrot_config_size_stored = parrot_config_size;
}

/*

FUNCDOC: parrot_set_config_hash_interpreter

Used internally to associate the config hash with an Interpreter
using the last registered config data.

*/

static void
parrot_set_config_hash_interpreter(Interp* interp /*NN*/)
{
    PMC *iglobals = interp->iglobals;

    PMC *config_hash = NULL;

    if (parrot_config_size_stored > 1) {
        STRING * const config_string =
            string_make_direct(interp,
                               (const char *)parrot_config_stored, parrot_config_size_stored,
                               PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET,
                               PObj_external_FLAG|PObj_constant_FLAG);

        config_hash = Parrot_thaw(interp, config_string);
    }
    else {
        config_hash = pmc_new(interp, enum_class_Hash);
    }

    VTABLE_set_pmc_keyed_int(interp, iglobals,
                             (INTVAL) IGLOBALS_CONFIG_HASH, config_hash);
}


/*

FUNCDOC: init_world(Interp *interp)>

This is the actual initialization code called by C<Parrot_init()>.

It sets up the Parrot system, running any platform-specific init code if
necessary, then initializing the string subsystem, and setting up the
base vtables and core PMCs.

C<interp> should be the root interpreter returned by C<Parrot_new(NULL)>.

*/

void
init_world(Interp *interp /*NN*/)
{
    PMC *iglobals;
    PMC *self, *pmc;
    int i;

#ifdef PARROT_HAS_PLATFORM_INIT_CODE
    Parrot_platform_init_code();
#endif

    parrot_alloc_vtables(interp);

    /* Call base vtable class constructor methods */
    Parrot_initialize_core_pmcs(interp);

    /* We have a Proxy PMC for each of the PMCs; now need to attach that to
     * the class slot for the namespace each of the PMCs reference. */
    for (i = 0; i <= interp->n_vtable_max; i++)
        if (interp->vtables[i])
            Parrot_PCCINVOKE(interp, interp->vtables[i]->_namespace,
                string_from_literal(interp, "set_class"), "P->",
                VTABLE_get_pmc_keyed_int(interp, interp->pmc_proxies, i));

    iglobals = interp->iglobals;
    VTABLE_set_pmc_keyed_int(interp, iglobals,
            (INTVAL)IGLOBALS_CLASSNAME_HASH, interp->class_hash);
    self = pmc_new_noinit(interp, enum_class_ParrotInterpreter);
    PMC_data(self) = interp;
    VTABLE_set_pmc_keyed_int(interp, iglobals,
            (INTVAL) IGLOBALS_INTERPRETER, self);

    parrot_set_config_hash_interpreter(interp);

    /*
     * lib search paths
     */
    parrot_init_library_paths(interp);
    /*
     * load_bytecode and dynlib loaded hash
     */
    pmc = pmc_new(interp, enum_class_Hash);
    VTABLE_set_pmc_keyed_int(interp, iglobals,
            IGLOBALS_PBC_LIBS, pmc);
    pmc = pmc_new(interp, enum_class_Hash);
    VTABLE_set_pmc_keyed_int(interp, iglobals,
            IGLOBALS_DYN_LIBS, pmc);
}

/*
 * called from inmidst of PMC bootstrapping between pass 0 and 1
 */


void
parrot_global_setup_2(Interp *interp /*NN*/)
{
    PMC *classname_hash, *iglobals;
    int i;
    PMC *parrot_ns;

    /* create the namespace root stash */
    interp->root_namespace = pmc_new(interp, enum_class_NameSpace);

    interp->HLL_info = constant_pmc_new(interp,
                                             enum_class_ResizablePMCArray);
    interp->HLL_namespace = constant_pmc_new(interp,
                                                  enum_class_ResizablePMCArray);

    Parrot_register_HLL(interp, const_string(interp, "parrot"), NULL);

    parrot_ns = VTABLE_get_pmc_keyed_int(interp,
                                         interp->HLL_namespace, 0);
    CONTEXT(interp->ctx)->current_namespace = parrot_ns;

    /* We need a class hash */
    interp->class_hash = classname_hash =
        pmc_new(interp, enum_class_NameSpace);
    Parrot_register_core_pmcs(interp, classname_hash);
    /* Also a PMC array to store PMC Proxy objects. */
    interp->pmc_proxies = pmc_new(interp, enum_class_ResizablePMCArray);
    /* init the interpreter globals array */
    iglobals = pmc_new(interp, enum_class_SArray);
    interp->iglobals = iglobals;
    VTABLE_set_integer_native(interp, iglobals, (INTVAL)IGLOBALS_SIZE);
    /* clear the array */
    for (i = 0; i < (INTVAL)IGLOBALS_SIZE; i++)
        VTABLE_set_pmc_keyed_int(interp, iglobals, i, NULL);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
