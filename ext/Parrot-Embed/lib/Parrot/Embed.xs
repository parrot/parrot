#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

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
make_interp( pTHX_ SV *parent, Parrot_Interp interp )
{
	Interpreter_struct *interp_struct;
	if (interp == NULL)
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
	if (pmc == NULL)
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
	SV *parent_sv = NULL;
	Parrot_Interp parent;
	Parrot_Interp interp;
	Parrot_PackFile pf;
CODE:
	if (items == 1)
	{
		parent = 0;
	}
	else if ( items == 2 && sv_derived_from( ST(1), "Parrot::Interpreter" ))
	{
		parent_sv = ST(1);
		parent    = get_interp( parent_sv );
	}
	else
	{
		Perl_croak( aTHX_ "Usage: Parrot::Interpreter->new( [ parent ] )" );
	}
	interp = Parrot_new( (Parrot_Interp)parent );
	pf     = PackFile_new( interp, 0 );
	Parrot_loadbc( interp, pf );

	/* Can't use RETVAL/OUTPUT here because typemap loses class variable */
	ST(0)  = sv_newmortal();
	sv_setref_pv( ST(0), class, (void*)make_interp( aTHX_ parent_sv, interp ) );

bool
load_file( interp, filename )
	Interpreter_struct *interp
	char *filename
PREINIT:
	Parrot_Interp real_interp;
	Parrot_PackFile pf;
CODE:
	real_interp = interp->interp;
	pf = Parrot_readbc( real_interp, filename );
	if (pf == NULL)
		Perl_croak( aTHX_ \
		"File '%s' not found in $parrot_interpreter->load_file()", filename );

	Parrot_loadbc( real_interp, pf );
	RETVAL = 1;
OUTPUT:
	RETVAL

PMC_struct*
find_global( interp, global, ... )
	Interpreter_struct *interp
	char *global
PREINIT:
	Parrot_Interp  real_interp;
	SV            *namespace;
	Parrot_STRING  p_namespace;
	Parrot_STRING  p_global;
	Parrot_PMC     pmc;
CODE:
	if ( items < 2 || items > 3 )
	{
		Perl_croak( aTHX_
			"Usage: $parrot_interpreter->find_global( name, [ namespace ] )");
	}

	real_interp     = interp->interp;
	p_global        = const_string( real_interp, global );

	if ( items == 3 )
		namespace   = ST(2);
	else
		namespace   = &PL_sv_undef;

	if (namespace  != &PL_sv_undef )
	{
		p_namespace = const_string( real_interp, SvPVX( namespace ) );
		pmc         = Parrot_find_global_s(real_interp, p_namespace, p_global);
	}
	else
		pmc         = Parrot_find_global_cur( real_interp, p_global );

	RETVAL = make_pmc( aTHX_ ST(0), pmc );
OUTPUT:
	RETVAL

PMC_struct*
compile( interp, code )
	Interpreter_struct *interp
	char * code
PREINIT:
	Parrot_Interp  real_interp;
	STRING        *code_type;
	STRING        *error;
	Parrot_PMC     out_pmc;
CODE:
	real_interp = interp->interp;  
	code_type   = const_string( real_interp, "PIR" );
	out_pmc     = Parrot_compile_string( real_interp, code_type, code, &error );
	RETVAL      = make_pmc( aTHX_ ST(0), out_pmc );
OUTPUT:
	RETVAL

void
DESTROY( interp )
	Interpreter_struct *interp
CODE:
	if ( interp->parent != NULL )
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
	Parrot_STRING arg_string;
CODE:
	pmc_actual = pmc->pmc;
	interp     = get_interp( pmc->interp );
	arg_string = const_string( interp, argument );
	out_pmc    = Parrot_call_sub( interp, pmc_actual, signature, arg_string );
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

	if ( interp != NULL )
		SvREFCNT_dec( interp );

	Parrot_unregister_pmc( interp, pmc->pmc );
