#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

typedef Parrot_Interp Parrot_Interpreter;

MODULE = Parrot::Embed PACKAGE = Parrot::Interpreter

Parrot_Interpreter
new( class, ... )
	char * class
INIT:
	Parrot_Interpreter parent;
	Parrot_Interp interp;
	Parrot_PackFile pf;
CODE:
	if (items == 1)
	{
		parent = 0;
	}
	else if ( items == 2 )
	{
		parent = INT2PTR( Parrot_Interpreter, SvIV( SvRV( ST(1) ) ) );
	}
	else
	{
		Perl_croak( aTHX_ "Usage: Parrot::Interpreter->new( [ parent ] )" );
	}
	interp = Parrot_new( (Parrot_Interp)parent );
	pf     = PackFile_new( interp, 0 );
	Parrot_loadbc( interp, pf );
	ST(0)  = sv_newmortal();

	sv_setref_pv( ST(0), class, (void*)interp);

bool
load_file( interp, filename )
	Parrot_Interpreter interp
	char *filename
INIT:
	Parrot_PackFile pf;
CODE:
	pf = Parrot_readbc( interp, filename );
	if (pf == NULL)
		Perl_croak( aTHX_ \
		"File '%s' not found in $parrot_interpreter->load_file()", filename );

	Parrot_loadbc( interp, pf );
	RETVAL = 1;
OUTPUT:
	RETVAL

Parrot_PMC
find_global( interp, global, ... )
	Parrot_Interpreter   interp
	char * global
INIT:
	SV            * namespace;
	Parrot_STRING   p_namespace;
	Parrot_STRING   p_global;
CODE:
	if ( items < 2 || items > 3 )
	{
		Perl_croak( aTHX_
			"Usage: $parrot_interpreter->find_global( name, [ namespace ] )");
	}

	p_global        = const_string( interp, global );

	if ( items == 3 )
		namespace   = ST(2);
	else
		namespace   = &PL_sv_undef;

	if (namespace  != &PL_sv_undef )
	{
		p_namespace = const_string( interp, SvPVX( namespace ) );
		RETVAL      = Parrot_find_global_s( interp, p_namespace, p_global );
	}
	else
		RETVAL      = Parrot_find_global_cur( interp, p_global );
OUTPUT:
	RETVAL

Parrot_PMC
invoke( interp, Sub_PMC, signature, argument )
	Parrot_Interpreter   interp
	Parrot_PMC           Sub_PMC
	const char         * signature
	const char         * argument
INIT:
	Parrot_STRING   arg_string;
CODE:
	arg_string = const_string( interp, argument );
	RETVAL     = Parrot_call_sub( interp, Sub_PMC, signature, arg_string );
OUTPUT:
	RETVAL

Parrot_PMC
compile( interp, code )
	Parrot_Interpreter interp
	char * code
INIT:
	STRING *code_type;
	STRING *error;
CODE:
	code_type = const_string( interp, "PIR" );
	RETVAL    = Parrot_compile_string( interp, code_type, code, &error );
OUTPUT:
	RETVAL

void
DESTROY( interp )
	Parrot_Interpreter interp
CODE:
	Parrot_destroy( interp );

MODULE = Parrot::Embed PACKAGE = Parrot::PMC

char *
get_string( pmc, interp )
	Parrot_PMC         pmc
	Parrot_Interpreter interp
CODE:
	RETVAL = Parrot_PMC_get_cstring( interp, pmc );
OUTPUT:
	RETVAL

MODULE = Parrot::Embed PACKAGE = Parrot::Embed

Parrot_Interp
create_interpreter( ... )
INIT:
	Parrot_Interp parent;
	Parrot_Interp interp;
	Parrot_PackFile pf;
CODE:
	if (items == 0)
	{
		parent = 0;
	}
	else if ( items == 1 )
	{
		parent = INT2PTR( Parrot_Interp, SvIV( ST(0) ) );
	}
	else
	{
		Perl_croak( aTHX_
			"Usage: Parrot::Embed::create_interpreter( [ parent ] )" );
	}
	interp = Parrot_new( parent );
	pf     = PackFile_new( interp, 0 );
	Parrot_loadbc( interp, pf );
	RETVAL = interp;
OUTPUT:
	RETVAL

Parrot_STRING
create_string( interp, string )
	Parrot_Interp   interp
	SV            * string
INIT:
	int length;
CODE:
	length = SvLEN( string );
	RETVAL = const_string( interp, SvPVX( string ) );
OUTPUT:
	RETVAL

Parrot_PackFile
read_bytecode( interp, filename )
	Parrot_Interp interp
	char * filename
CODE:
	RETVAL = Parrot_readbc( interp, filename );
OUTPUT:
	RETVAL

void
load_bytecode( interp, packfile )
	Parrot_Interp   interp
	Parrot_PackFile packfile
CODE:
	Parrot_loadbc( interp, packfile );

Parrot_PMC
find_global( interp, ... )
	Parrot_Interp   interp
INIT:
	SV            * namespace;
	Parrot_STRING   p_namespace;
	Parrot_STRING   p_global;
CODE:
	if ( items < 2 || items > 3 )
	{
		Perl_croak( aTHX_
			"Usage: Parrot::Embed::find_global( interp, name, [ namespace ] )");
	}

	p_global        = const_string( interp, SvPVX( ST(1) ) );

	if ( items == 3 )
		namespace   = ST(2);
	else
		namespace   = &PL_sv_undef;

	if (namespace  != &PL_sv_undef )
	{
		p_namespace = const_string( interp, SvPVX( namespace ) );
		RETVAL      = Parrot_find_global_s( interp, p_namespace, p_global );
	}
	else
	{
		RETVAL      = Parrot_find_global_cur( interp, p_global );
	}
OUTPUT:
	RETVAL

Parrot_PMC
call_sub( interp, sub, signature, argument )
	Parrot_Interp   interp
	Parrot_PMC      sub
	const char    * signature
	const char    * argument
INIT:
	Parrot_STRING   arg_string;
CODE:
	arg_string = const_string( interp, argument );
	RETVAL     = Parrot_call_sub( interp, sub, signature, arg_string );
OUTPUT:
	RETVAL

char *
get_string_from_pmc( interp, pmc )
	Parrot_Interp interp
	Parrot_PMC    pmc
CODE:
	RETVAL = Parrot_PMC_get_cstring( interp, pmc );
OUTPUT:
	RETVAL

Parrot_PMC
compile_string( interp, code )
	Parrot_Interp interp
	char * code
INIT:
	STRING *code_type;
	STRING *error;
CODE:
	code_type = const_string( interp, "PIR" );
	RETVAL    = Parrot_compile_string( interp, code_type, code, &error );
OUTPUT:
	RETVAL
