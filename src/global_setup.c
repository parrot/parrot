/*
Copyright (C) 2001-2008, Parrot Foundation.
$Id$

=head1 NAME

src/global_setup.c - Global setup

=head1 DESCRIPTION

Performs all the global setting up of things. This includes the very
few global variables that Parrot totes around.

I<What are these global variables?>

=head2 Functions

=over 4

=cut

*/

#define INSIDE_GLOBAL_SETUP
#include "parrot/parrot.h"
#include "global_setup.str"

/* These functions are defined in the auto-generated file core_pmcs.c */
/* XXX Get it into some public place */
extern void Parrot_initialize_core_pmcs(PARROT_INTERP, int pass);
void Parrot_register_core_pmcs(PARROT_INTERP, PMC* registry);

static const unsigned char* parrot_config_stored = NULL;
static unsigned int parrot_config_size_stored = 0;

/* HEADERIZER HFILE: include/parrot/global_setup.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void parrot_global_setup_2(PARROT_INTERP)
        __attribute__nonnull__(1);

static void parrot_set_config_hash_interpreter(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_parrot_global_setup_2 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_parrot_set_config_hash_interpreter \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<void Parrot_set_config_hash_internal(const unsigned char* parrot_config,
unsigned int parrot_config_size)>

Called by Parrot_set_config_hash with the serialised hash which
will be used in subsequently created Interpreters.

=cut

*/

PARROT_EXPORT
void
Parrot_set_config_hash_internal(ARGIN(const unsigned char* parrot_config),
                                 unsigned int parrot_config_size)
{
    ASSERT_ARGS(Parrot_set_config_hash_internal)
    parrot_config_stored      = parrot_config;
    parrot_config_size_stored = parrot_config_size;
}

/*

=item C<static void parrot_set_config_hash_interpreter(PARROT_INTERP)>

Used internally to associate the config hash with an Interpreter
using the last registered config data.

=cut

*/

static void
parrot_set_config_hash_interpreter(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_set_config_hash_interpreter)
    PMC *iglobals = interp->iglobals;

    PMC *config_hash = NULL;

    if (parrot_config_size_stored > 1) {
        STRING * const config_string =
            Parrot_str_new_init(interp,
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

=item C<void init_world_once(PARROT_INTERP)>

Call init_world() if it hasn't been called before.

C<interp> should be the root interpreter created in C<Parrot_new(NULL)>.

=cut

*/

void
init_world_once(PARROT_INTERP)
{
    ASSERT_ARGS(init_world_once)
    if (!interp->world_inited) {
        /* init_world() sets up some vtable stuff.
         * It must only be called once.
         */

        interp->world_inited = 1;
        init_world(interp);
    }
}


/*

=item C<void init_world(PARROT_INTERP)>

This is the actual initialization code called by C<init_world_once()>.

It sets up the Parrot system, running any platform-specific init code if
necessary, then initializing the string subsystem, and setting up the
base vtables and core PMCs.

C<interp> should be the root interpreter created in C<Parrot_new(NULL)>.

=cut

*/

void
init_world(PARROT_INTERP)
{
    ASSERT_ARGS(init_world)
    PMC *iglobals, *self, *pmc;

#ifdef PARROT_HAS_PLATFORM_INIT_CODE
    Parrot_platform_init_code();
#endif

    /* Call base vtable class constructor methods */
    parrot_global_setup_2(interp);
    Parrot_initialize_core_pmcs(interp, 1);

    iglobals = interp->iglobals;
    VTABLE_set_pmc_keyed_int(interp, iglobals,
            (INTVAL)IGLOBALS_CLASSNAME_HASH, interp->class_hash);

    self           = pmc_new_noinit(interp, enum_class_ParrotInterpreter);
    VTABLE_set_pointer(interp, self, interp);
    /* PMC_data(self) = interp; */

    VTABLE_set_pmc_keyed_int(interp, iglobals,
            (INTVAL)IGLOBALS_INTERPRETER, self);

    parrot_set_config_hash_interpreter(interp);

    /* lib search paths */
    parrot_init_library_paths(interp);

    /* load_bytecode and dynlib loaded hash */
    pmc = pmc_new(interp, enum_class_Hash);
    VTABLE_set_pmc_keyed_int(interp, iglobals, IGLOBALS_PBC_LIBS, pmc);

    pmc = pmc_new(interp, enum_class_Hash);
    VTABLE_set_pmc_keyed_int(interp, iglobals, IGLOBALS_DYN_LIBS, pmc);

    pmc = pmc_new(interp, enum_class_Hash);
    VTABLE_set_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FUNCS, pmc);
    Parrot_nci_load_core_thunks(interp);
    Parrot_nci_load_extra_thunks(interp);
}

/*

=item C<static void parrot_global_setup_2(PARROT_INTERP)>

called from inmidst of PMC bootstrapping between pass 0 and 1

=cut

*/

static void
parrot_global_setup_2(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_global_setup_2)
    PMC *classname_hash, *iglobals;
    int  i;

    create_initial_context(interp);

    /* create the namespace root stash */
    interp->root_namespace = pmc_new(interp, enum_class_NameSpace);
    Parrot_init_HLL(interp);

    Parrot_pcc_set_namespace(interp, CURRENT_CONTEXT(interp),
        VTABLE_get_pmc_keyed_int(interp, interp->HLL_namespace, 0));

    /* We need a class hash */
    interp->class_hash = classname_hash = pmc_new(interp, enum_class_NameSpace);
    Parrot_register_core_pmcs(interp, classname_hash);

    /* init the interpreter globals array */
    iglobals         = pmc_new(interp, enum_class_FixedPMCArray);
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
