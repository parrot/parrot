#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 02-get_test_prog_args.t

use strict;
use warnings;

use lib qw( lib );
use Test::More;
eval {
    use Parrot::Config qw( %PConfig );
};
plan( skip_all => 't/harness only runs once configuration has completed' )
    if $@;
plan( tests => 12 );
use Carp;
use Parrot::Harness::Options qw( get_test_prog_args );

my ($args, $optsref);
my ($gc_debug, $run_exec);

$optsref = {
    'd'     => 1,
    'g'     => 1,
    'D'     => 40,
};
($gc_debug, $run_exec) = (0,0);
$args = get_test_prog_args($optsref, $gc_debug, $run_exec);
like($args, qr/-d/, "Got expected option");
like($args, qr/-D40/, "Got expected option");

$optsref = {
    'd'     => 1,
    'g'     => 1,
    'D'     => 40,
    'O'     => 2,
};
($gc_debug, $run_exec) = (0,0);
$args = get_test_prog_args($optsref, $gc_debug, $run_exec);
like($args, qr/-d/, "Got expected option");
like($args, qr/-D40/, "Got expected option");
like($args, qr/-O2/, "Got expected option");

$optsref = {
    'd'     => 1,
    'g'     => 1,
    'D'     => 40,
};
($gc_debug, $run_exec) = (1,0);
$args = get_test_prog_args($optsref, $gc_debug, $run_exec);
like($args, qr/-d/, "Got expected option");
like($args, qr/-D40/, "Got expected option");
like($args, qr/\s--gc-debug/, "Got expected option");

$optsref = {
    'd'     => 1,
    'g'     => 1,
    'D'     => 40,
};
($gc_debug, $run_exec) = (0,1);
$args = get_test_prog_args($optsref, $gc_debug, $run_exec);
like($args, qr/-d/, "Got expected option");
like($args, qr/-D40/, "Got expected option");
like($args, qr/\s--run-exec/, "Got expected option");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

02-get_test_prog_args.t - test Parrot::Harness::Options

=head1 SYNOPSIS

    % prove t/pharness/02-get_test_prog_args.t

=head1 DESCRIPTION

This file holds tests for Parrot::Harness::Options::get_test_prog_args().

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Harness::Options, F<t/harness>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
