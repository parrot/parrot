#!perl

use strict;
use warnings;

use Test::More tests => 31;
use File::Spec;

my $hello_pbc = File::Spec->catfile( 't', 'greet.pbc' );

my $module = 'Parrot::Interpreter';
use_ok( 'Parrot::Embed' ) or exit;

can_ok( $module, 'new'  );
my $interp = $module->new();
ok( $interp, 'new() should return a valid interpreter' );
isa_ok( $interp, $module );

my $interp2 = $module->new( $interp );
ok( $interp, 'new() should return a valid interpreter, given a parent interp' );
isa_ok( $interp, $module );

isnt( $$interp, $$interp2, '... but different interpreters' );

{
	local @Subclass::ISA = $module;
	my $sc = Subclass->new( $interp2 );
	isa_ok( $sc, $module );
	isa_ok( $sc, 'Subclass' );
}

can_ok( $module, 'load_file' );
my $result = eval { $interp->load_file( 'no file here' ) };
my $except = $@;
ok( ! $result, 'load_file() should return false unless it can load a file' );
like( $except, qr/File 'no file here' not found/, '... throwing exception' );
$result = eval { $interp->load_file( $hello_pbc ) };
$except = $@;
ok( $result,     '... returning true if it could load the file' );
is( $except, '', '... throwing no exeption if so' );

can_ok( $module, 'find_global'         );
my $global_greet = $interp->find_global( 'greet' );
ok( $global_greet,
	'find_global() should return non-namespaced global, if found' );
isa_ok( $global_greet, 'Parrot::PMC' );

ok( ! $interp->find_global( 'goat' ),
	'... or nothing, if there is no non-namespaced global of that name' );

my $else_greet   = $interp->find_global( 'greet', 'Elsewhere' );
ok( $else_greet, '... or a namespaced global, if it exists in the namespace' );
isnt( $$global_greet, $$else_greet,
	'... and definitely the namespaced version' );

ok( ! $interp->find_global( 'goat', 'Elsewhere' ),
	'... but again, not if there is no global of that name there' );

can_ok( $global_greet, 'invoke'            );
my $pmc = $global_greet->invoke( 'PS', 'Bob' );
ok( $pmc, 'invoke() should return a PMC, given that signature' );

is( $pmc->get_string(), 'Hello, Bob!',
	'... containing a string returned in the PMC' );

can_ok( $module, 'compile'      );
my $eval = $interp->compile( <<END_PIR );
.sub foo
	.param pmc    in_string

	.local string string_s
	string_s  = in_string
	string_s .= ' FOO '

	.return( string_s )
.end
END_PIR

ok( $eval, 'compile() should compile PIR code and return a PMC' );
isa_ok( $eval, 'Parrot::PMC' );

TODO:
{
	local $TODO = 'compile_string() returns wrong results';
	ok( ! $interp->compile( 'blah' ), '... but only for valid PIR' );
}

$pmc    = $else_greet->invoke( 'P', '' );
is( $pmc->get_string(), 'Hiya!', '... calling the passed-in subroutine' );

my $foo = $interp->find_global( 'foo' );
$pmc    = $foo->invoke( 'PS', 'BAR' );
is( $pmc->get_string(), 'BAR FOO ',
	'... and compiled sub should work just like any other Sub pmc' );

{
	my $die_interp = $module->new( $interp );
	eval { $die_interp->load_file( $hello_pbc ) };
	$foo = $die_interp->find_global( 'greet' );
}

$pmc    = $foo->invoke( 'PS', 'out of scope' );
is( $pmc->get_string(), 'Hello, out of scope!',
		'... even if interpreter object has gone out of scope' );
