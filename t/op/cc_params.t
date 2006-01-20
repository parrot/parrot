#!perl
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: calling.t 11261 2006-01-19 14:01:27Z leo $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test 'no_plan';


=head1 NAME

t/op/cc_params.t - Parrot Calling Conventions parameter matching tests

=head1 SYNOPSIS

	% prove t/op/cc_params.t

=head1 DESCRIPTION

Tests Parrot calling conventions for parameter matching and mismatching.

=cut


my $t_testbody = <<'TESTBODY';
.sub 'test' :main
    .include 'errors.pasm'
    errorson .PARROT_ERRORS_PARAM_COUNT_FLAG
    errorson .PARROT_ERRORS_RESULT_COUNT_FLAG

@INIT_ARGS@
@INIT_RESULTS@

    (@LIST_RESULTS@) = '@FUNC@'(@LIST_ARGS@)
    print "ok\n"
.end

.sub '@FUNC@'
@INIT_PARAMS@
@INIT_RETURNS@
@CHECK_PARAMS@
    .return(@LIST_RETURNS@)
.end
TESTBODY

my $t_expbody = <<'EXPBODY';
@CHECK_RESULTS@
EXPBODY


## loop over test cases
## expected in
for my $c_args (0..1)
{
	## expected out
	for my $c_results (0..1)
	{
		## got in
		for my $c_params (0..( $c_args ? 2 : 1 ))
		{
			## got out
			for my $c_returns (0..( $c_results ? 2 : 1 ))
			{
				my $td = TemplateData->new;

				## initialize template keys
				for( $t_testbody =~ m/@(\w+)@/g )
				{ $td->addkey($_) }

				for( $t_expbody =~ m/@(\w+)@/g )
				{ $td->addkey($_) }

				## initialize template data
				$td->initialize( $c_args, $c_params, $c_returns, $c_results );

				## generate tests and results
				my $testbody = $td->generate( $t_testbody );
				my $expbody =  $td->generate( $t_expbody );
				my $testhead = create_test_header(
					$c_args, $c_results, $c_params, $c_returns,
				);

				## execute tests
				pir_output_like( $testbody, "/$expbody/", $testhead );
			}
		}
	}
}



exit;



sub create_test_header
{
	return 'param mismatch: args:' . shift() . ' results:' . shift()
		. ' params:' . shift() . ' returns:' . shift();

}



package TemplateData;


sub new { bless {} => shift; }
sub addkey { my $self = shift; $self->{$_} = '' for @_ }
sub keys { sort keys %{+shift} }


sub create_args
{
	my $self = shift;
	my $num = shift;

	$self->{C_ARGS} = $num;

	if( $self->{C_ARGS} )
	{
		$self->{_ARGS} = [ map { 'arg' . $_ } 1..$num ];
		$self->{LIST_ARGS} = join ', ' => @{ $self->{_ARGS} };
		$self->{INIT_ARGS} =
			'    .local int ' . $self->{LIST_ARGS} . $/;
		$self->{INIT_ARGS} .= "    ${ $self->{_ARGS} }[$_] = $_$/"
			for 0..$#{ $self->{_ARGS} };
	}
}


sub create_params
{
	my $self = shift;
	my $num = shift;

	$self->{C_PARAMS} = $num;

	if( $self->{C_PARAMS} )
	{
		$self->{_PARAMS} = [ map { 'param' . $_ } 1..$num ];
		$self->{LIST_PARAMS} = join ', ' => @{ $self->{_PARAMS} };
		$self->{INIT_PARAMS} = join( "\n" =>
			map { '    .param int ' . ${ $self->{_PARAMS} }[$_] }
				0..$#{ $self->{_PARAMS} }
		);
	}
}


sub create_returns
{
	my $self = shift;
	my $num = shift;

	$self->{C_RETURNS} = $num;

	if( $self->{C_RETURNS} )
	{
		$self->{_RETURNS} = [ map { 'return' . $_ } 1..$num ];
		$self->{LIST_RETURNS} = join ', ' => @{ $self->{_RETURNS} };
		$self->{INIT_RETURNS} =
			'    .local int ' . $self->{LIST_RETURNS} . $/;
		$self->{INIT_RETURNS} .= "    ${ $self->{_RETURNS} }[$_] = $_$/"
			for 0..$#{ $self->{_RETURNS} };
	}
}


sub create_results
{
	my $self = shift;
	my $num = shift;

	$self->{C_RESULTS} = $num;

	if( $self->{C_RESULTS} )
	{
		$self->{_RESULTS} = [ map { 'result' . $_ } 1..$num ];
		$self->{LIST_RESULTS} = join ', ' => @{ $self->{_RESULTS} };
		$self->{INIT_RESULTS} =
			join "\n" => (map { '    .local int ' . $_ } @{ $self->{_RESULTS} });
	}
}


sub create_func {
	my $self = shift;
	my( $c_args, $c_params, $c_returns, $c_results ) = @_;

	$self->{FUNC} =
		'args' . $c_args . '_results' . $c_results
		. '__params' . $c_params . '_returns' . $c_returns;
}


sub create_check_results
{
	my $self = shift;
	my( $c_args, $c_params, $c_returns, $c_results ) = @_;

	$self->{CHECK_RESULTS} =
		(( $c_args == $c_params) and ($c_results == $c_returns ))
			? 'ok'
			: 'too (many|few) arguments passed .*';
}


sub initialize
{
	my $self = shift;
	my( $c_args, $c_params, $c_returns, $c_results ) = @_;

	$self->create_args( $c_args );
	$self->create_params( $c_params );
	$self->create_returns( $c_returns );
	$self->create_results( $c_results );
	
	$self->create_func( $c_args, $c_params, $c_returns, $c_results );

	$self->create_check_results( $c_args, $c_params, $c_returns, $c_results );
}


sub generate
{
	my $self = shift;
	my( $template ) = @_;

	for( $template =~ m/@(\w+)@/g )
	{
		my $replacement =
			( exists $self->{$_} and defined $self->{$_} ) ? $self->{$_} : '';

		$template =~ s/@(\w+)@/$replacement/;
	}
	return $template;
}

