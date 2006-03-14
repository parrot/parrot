#! perl
# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More 'no_plan';


=head1 NAME

t/perl/Parrot_Test.t - Parrot::Test unit tests

=head1 SYNOPSIS

    % prove t/perl/Parrot_Test.t

=head1 DESCRIPTION

These tests cover the basic functionality of C<Parrot::Test>.

=cut


BEGIN
{
    my $pre_env = exists $ENV{PARROT_TEST} ? $ENV{PARROT_TEST} : undef;
    use_ok('Parrot::Test') or die;
    my $post_env = exists $ENV{PARROT_TEST} ? $ENV{PARROT_TEST} : undef;
    if( defined $pre_env )
    { is( $post_env, $pre_env, 'PARROT_TEST env unchanged' ); }
    else
    { is( $post_env, 1, 'PARROT_TEST env set' ); }
}


can_ok('Parrot::Test', $_) for qw/
    language_output_is language_output_like language_output_isnt
    example_output_is
    output_is          output_like          output_isnt
    pasm_output_is     pasm_output_like     pasm_output_isnt
    past_output_is     past_output_like     past_output_isnt
    pir_output_is      pir_output_like      pir_output_isnt
    pir_2_pasm_is      pir_2_pasm_like      pir_2_pasm_isnt
    pbc_output_is      pbc_output_like      pbc_output_isnt
    c_output_is        c_output_like        c_output_isnt
    plan
    skip
    slurp_file
    run_command
/;


## TODO run_command


## per_test
is( Parrot::Test::per_test(), undef, 'per_test() invalid args' );
is( Parrot::Test::per_test(undef, undef), undef, 'per_test() invalid args' );
is( Parrot::Test::per_test(0, undef), undef, 'per_test() invalid args' );
is( Parrot::Test::per_test(undef, 0), undef, 'per_test() invalid args' );

### TODO generate_code, plan, skip, slurp_file, _generate_functions, (generated functions), example_output_is

# vim: expandtab shiftwith=4
