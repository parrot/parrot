#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/extend.h"

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
