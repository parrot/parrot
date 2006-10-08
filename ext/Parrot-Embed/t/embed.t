#!perl

use strict;
use warnings;

use Test::More tests => 27;
use File::Spec;

my $hello_pbc = File::Spec->catfile( 't', 'greet.pbc' );

my $module = 'Parrot::Embed';
use_ok( $module ) or exit;

diag( "Testing Parrot::Embed $Parrot::Embed::VERSION, Perl $], $^X" );

can_ok( $module, 'create_interpreter'  );
my $interp = Parrot::Embed::create_interpreter( 0 );
ok( $interp, 'create_interpreter() should return a valid interpreter' );

my $i2     = Parrot::Embed::create_interpreter( $interp );
isnt( $interp, $i2, '... but not always the same one' );

eval { Parrot::Embed::create_interpreter( 0, 1, 2 ) };
like( $@, qr/Usage: .+create_interpreter/,
	'... and should croak when given invalid arguments' );

can_ok( $module, 'read_bytecode'       );
my $bc = Parrot::Embed::read_bytecode( $interp, $hello_pbc );
ok( $bc, 'read_bytecode() should work on valid file' );

TODO:
{
	local $TODO = 'Cannot catch Parrot exceptions yet';

	# XXX - can you not see that I am serious?
	close STDERR;

	eval { Parrot::Embed::read_bytecode( $interp, $0 ) };
	like( $@, qr/Can't unpack packfile/, '... but not on non-PBC file' );

	eval { Parrot::Embed::read_bytecode( $interp, 'not_a_file' ) };
	like( $@, qr/Can't unpack packfile/, '... or a non-existent file' );
}

can_ok( $module, 'load_bytecode'       );
eval { Parrot::Embed::load_bytecode( $interp, $bc ) };
is( $@, '', 'load_bytecode() should work on read bytecode' );

TODO:
{
	local $TODO = 'Cannot catch Parrot exceptions yet';

	eval { Parrot::Embed::load_bytecode( $interp, undef ) };
	like( $@, qr/Invalid packfile/, '... but not on non-packfile' );

}

can_ok( $module, 'find_global'         );
my $global_greet = Parrot::Embed::find_global( $interp, 'greet' );
ok( $global_greet,
	'find_global() should return non-namespaced global, if found' );

ok( ! Parrot::Embed::find_global( $interp, 'goat' ),
	'... or nothing, if there is no non-namespaced global of that name' );

my $else_greet   = Parrot::Embed::find_global( $interp, 'greet', 'Elsewhere' );
ok( $else_greet, '... or a namespaced global, if it exists in the namespace' );
isnt( $global_greet, $else_greet, '... and definitely the namespaced version' );

ok( ! Parrot::Embed::find_global( $interp, 'goat', 'Elsewhere' ),
	'... but again, not if there is no global of that name there' );

can_ok( $module, 'call_sub'            );
my $pmc = Parrot::Embed::call_sub( $interp, $global_greet, 'PS', 'Bob' );
ok( $pmc, 'call_sub() should return a PMC, given that signature' );

can_ok( $module, 'get_string_from_pmc' );
is( Parrot::Embed::get_string_from_pmc( $interp, $pmc ), 'Hello, Bob!',
	'... containing a string returned as a PMC' );

$pmc    = Parrot::Embed::call_sub( $interp, $else_greet, 'P', '' );
is( Parrot::Embed::get_string_from_pmc( $interp, $pmc ), 'Hiya!',
	'... calling the passed-in subroutine' );

can_ok( $module, 'compile_string'      );
my $eval = Parrot::Embed::compile_string( $interp, <<END_PIR );
.sub foo
	.param pmc    in_string

	.local string string_s
	string_s  = in_string
	string_s .= ' FOO '

	.return( string_s )
.end
END_PIR
ok( $eval, 'compile_string() should compile PIR code and return a PMC' );

TODO:
{
	local $TODO = 'compile_string() returns wrong results';
	ok( ! Parrot::Embed::compile_string( $i2, 'blah' ),
		'... but only for valid PIR' );
}

my $foo = Parrot::Embed::find_global( $interp, 'foo' );
$pmc    = Parrot::Embed::call_sub( $interp, $foo, 'PS', 'BAR' );
is( Parrot::Embed::get_string_from_pmc( $interp, $pmc ), 'BAR FOO ',
	'... and compiled sub should work just like any other Sub pmc' );
