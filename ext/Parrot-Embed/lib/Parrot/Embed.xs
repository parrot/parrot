#define PERL_NO_GET_CONTEXT
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#define get_interp( i ) (INT2PTR(Interpreter_struct*, SvIV( SvRV( (SV*)i ) )))->interp

typedef Parrot_Interp Parrot_Interpreter;

typedef struct Interpreter_struct
{
    SV            *parent;
    Parrot_Interp  interp;
} Interpreter_struct;

typedef struct PMC_struct
{
    SV         *interp;
    Parrot_PMC  pmc;
} PMC_struct;


Interpreter_struct*
make_interp( pTHX_ SV *parent, PARROT_INTERP )
{
    Interpreter_struct *interp_struct;

    if (!interp)
        return NULL;

    New( 0, interp_struct, 1, Interpreter_struct );

    SvREFCNT_inc( parent );
    interp_struct->parent = parent;
    interp_struct->interp = interp;

    return interp_struct;
}


PMC_struct*
make_pmc( pTHX_ SV *interp, Parrot_PMC pmc )
{
    PMC_struct *pmc_struct;

    if (!pmc)
        return NULL;

    New( 0, pmc_struct, 1, PMC_struct );

    SvREFCNT_inc( interp );
    pmc_struct->interp = interp;
    pmc_struct->pmc    = pmc;

    Parrot_register_pmc( get_interp( interp ), pmc );

    return pmc_struct;
}


MODULE = Parrot::Embed PACKAGE = Parrot::Interpreter

Parrot_Interp
new( class, ... )
    char *class
PREINIT:
    SV             *parent_sv = NULL;
    Parrot_Interp   parent;
    Parrot_Interp   interp;
    Parrot_PackFile pf;
CODE:
    if (items == 1)
        parent = 0;
    else if ( items == 2 && sv_derived_from( ST(1), "Parrot::Interpreter" ))
    {
        parent_sv = ST(1);
        parent    = get_interp( parent_sv );
    }
    else
        Perl_croak( aTHX_ "Usage: Parrot::Interpreter->new( [ parent ] )" );

    interp = Parrot_new( (Parrot_Interp)parent );
    pf     = PackFile_new( interp, 0 );
    Parrot_pbc_load( interp, pf );

    /* Can't use RETVAL/OUTPUT here because typemap loses class variable */
    ST(0)  = sv_newmortal();
    sv_setref_pv( ST(0), class, (void*)make_interp( aTHX_ parent_sv, interp ) );


bool
load_file( interp, filename )
    Interpreter_struct *interp
    char               *filename
PREINIT:
    Parrot_Interp   real_interp;
    Parrot_PackFile pf;
CODE:
    real_interp = interp->interp;
    pf          = Parrot_pbc_read( real_interp, filename, 0 );

    if (!pf)
        Perl_croak( aTHX_
        "File '%s' not found in $parrot_interpreter->load_file()", filename );

    Parrot_pbc_load( real_interp, pf );
    RETVAL = 1;
OUTPUT:
    RETVAL


PMC_struct*
find_global( interp, global, ... )
    Interpreter_struct *interp
    char               *global
PREINIT:
    SV            *namespace;
    Parrot_Interp  real_interp;
    Parrot_String  p_namespace;
    Parrot_String  p_global;
    Parrot_PMC     pmc;
CODE:
    if ( items < 2 || items > 3 )
        Perl_croak( aTHX_
            "Usage: $parrot_interpreter->find_global( name, [ namespace ] )");

    real_interp     = interp->interp;
    p_global        = Parrot_str_new_constant( real_interp, global );

    if (items == 3)
        namespace   = ST(2);
    else
        namespace   = &PL_sv_undef;

    if (namespace  != &PL_sv_undef )
    {
        char *ns_copy = savepv(SvPV_nolen(namespace));
        char *ns_str  = ns_copy;
        char *prev    = ns_str;
        PMC  *ns      = NULL;

        while (*ns_str++)
        {
            STRING *ns_part;

            if (! (*ns_str == ':' && *(ns_str + 1) == ':'))
                continue;

            *ns_str = 0;
            ns_str += 2;

            if (!ns)
                ns = Parrot_ns_find_current_namespace_global(real_interp,
                    Parrot_str_new_constant(real_interp, prev));
            else
                ns = Parrot_ns_find_namespace_global(real_interp, ns,
                    Parrot_str_new_constant(real_interp, prev));
            prev    = ns_str;
        }

        if (!ns)
            ns = Parrot_ns_find_current_namespace_global(real_interp,
                Parrot_str_new_constant(real_interp, prev));
        else
            ns = Parrot_ns_find_namespace_global(real_interp, ns,
                Parrot_str_new_constant(real_interp, prev));

        pmc          = Parrot_ns_find_namespace_global(real_interp, ns, p_global);
        Safefree(ns_copy);
    }
    else
        pmc         = Parrot_ns_find_current_namespace_global( real_interp, p_global );

    RETVAL = make_pmc( aTHX_ ST(0), pmc );
OUTPUT:
    RETVAL


PMC_struct*
compile( interp, code )
    Interpreter_struct *interp
    char               *code
PREINIT:
    STRING        *code_type;
    STRING        *error;
    Parrot_Interp  real_interp;
    Parrot_PMC     out_pmc;
CODE:
    real_interp = interp->interp;
    code_type   = Parrot_str_new_constant( real_interp, "PIR" );
    out_pmc     = Parrot_compile_string( real_interp, code_type, code, &error );
    RETVAL      = make_pmc( aTHX_ ST(0), out_pmc );
OUTPUT:
    RETVAL


void
DESTROY( interp )
    Interpreter_struct *interp
CODE:
    if (interp->parent)
        SvREFCNT_dec( interp->parent );

    Parrot_destroy( interp->interp );

MODULE = Parrot::Embed PACKAGE = Parrot::PMC


PMC_struct*
invoke( pmc, signature, argument )
    PMC_struct *pmc
    const char *signature
    const char *argument
PREINIT:
    Parrot_PMC    pmc_actual;
    Parrot_PMC    out_pmc;
    Parrot_Interp interp;
    Parrot_String arg_string;
CODE:
    pmc_actual = pmc->pmc;
    interp     = get_interp( pmc->interp );
    arg_string = Parrot_str_new_constant( interp, argument );
    Parrot_pcc_invoke_sub_from_c_args( interp, pmc_actual, signature, arg_string, &out_pmc );
    RETVAL     = make_pmc( aTHX_ pmc->interp, out_pmc );
OUTPUT:
    RETVAL


char *
get_string( pmc )
    PMC_struct *pmc
CODE:
    RETVAL = Parrot_PMC_get_cstring( get_interp( pmc->interp ), pmc->pmc );
OUTPUT:
    RETVAL

void
DESTROY( pmc )
    PMC_struct *pmc
PREINIT:
    Parrot_Interp interp;
CODE:
    interp = get_interp( pmc->interp );

    if (interp)
        SvREFCNT_dec( interp );

    Parrot_unregister_pmc( interp, pmc->pmc );
