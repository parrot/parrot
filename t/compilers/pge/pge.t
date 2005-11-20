#! perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );
use Test::More;
use Parrot::Test qw/ no_plan /;
use Parrot::Test::PGE;


=head1 NAME

t/library/pge.t - Parrot Grammar Engine basic tests

=head1 SYNOPSIS

	% prove -Ilib t/library/pge.t

=cut


## definition of PGE public api
## data format like: filename => { 'namespace' => [list of subs], ... },
my $ns_subs = {
	'PGE.pir' =>
		{ 'PGE' => [qw/ /], },
	'PGE/Exp.pir' => {
		'PGE::Exp' => [qw/ serno as_pir /],
	},
	'PGE/Library.pir' =>
		{ 'PGE::Rule' => [qw/ ident name /], },
	'PGE/Match.pir' => {
		'PGE::Match' => [qw/
			next from to __get_bool __get_integer __get_number
			__get_string __get_pmc_keyed_int __set_pmc_keyed_int
			__delete_keyed_int __defined_keyed_int get_hash get_array
		/],
	},
	'PGE/OPTable.pir' =>
		{ 'PGE::OPTable' => [qw/ addtok parse /], },
	'PGE/P6Rule.pir' => {
		'PGE' => [qw/ /],
		'PGE::Exp' => [qw/ /],
		'PGE::P6Rule' => [qw/ /],
		'PGE::Rule' => [qw/ p6rule /], ## TODO deprecated
	},
	'PGE/Rule.pir' => {
		'PGE::Rule' => [qw/
			null fail upper lower alpha digit xdigit space
			print graph blank cntrl punct alnum sp lt gt dot ws before
			/],
		},
	'PGE/TokenHash.pir' => {
		'PGE::TokenHash' => [qw/ /],
	},
};

## populate_namespaces -- populate many namespaces with a subname
## data format like: subname => [qw/ list of namespaces /],
## my $p6r_subs = { p6analyze => [qw/ Literal /], };
## populate_namespaces( $ns_subs, $p6r_subs, 'PGE/P6Rule.pir', 'PGE::Exp' );
sub populate_namespaces
{
	my( $outdata_ref, $indata_ref, $filekey, $nsprefix )= @_;
	for my $key ( sort keys %$indata_ref )
	{
		push @{ $outdata_ref->{$filekey}{$nsprefix . '::' . $_} } => $key
			for @{ $indata_ref->{$key} };
	}
}


my $PRE= <<'PRE';
.sub 'main' :main
	load_bytecode 'PGE.pbc'
PRE
my $POST= <<'POST';
	goto OK
NOK:print "not "
OK: print "ok"
END:print "\n"
.end
POST


# 1
pir_output_is(<<'CODE'.$POST, <<OUT, 'load_bytecode PGE.pbc');
.sub 'main' :main
	load_bytecode 'PGE.pbc'
CODE
ok
OUT


# 2
pir_output_is(<<'CODE'.$POST, <<OUT, 'load_bytecode PGE.pbc 2x');
.sub 'main' :main
	load_bytecode 'PGE.pbc'
	load_bytecode 'PGE.pbc'
CODE
ok
OUT


## compiler registration
for my $compiler (qw/ PGE::P6Rule PGE::P5Regexp PGE::Glob /)
{
	pir_output_is(<<"CODE".$POST, <<OUT, 'compreg "$compiler"');
.sub 'main' :main
	load_bytecode 'PGE.pbc'
	\$P0 = compreg '$compiler'
CODE
ok
OUT
}


## public api tests
for my $file (sort keys %$ns_subs)
{
	for my $ns (sort keys %{ $ns_subs->{$file} })
	{
		for my $sub ( sort @{ $ns_subs->{$file}{$ns} } )
		{
			## find_global
			pir_output_is(<<CODE.$POST, <<OUT, 'find_global $file: ($ns:: $sub)');
.sub 'main' :main
	load_bytecode 'PGE.pbc'
	.local pmc sub
	sub = find_global '$ns', '$sub'
CODE
ok
OUT

			## TODO: test pod exists for subs
		}
	}
}


