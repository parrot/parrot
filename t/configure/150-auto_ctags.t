#!perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use Test::More;
use IO::Handle;
use lib qw( lib );
use Parrot::IO::Capture::Mini;

if ( $^O eq 'MSWin32' ) {
    plan( skip_all => 'Not yet tested on Win32' );
}
else {
    plan( tests => 8 );
}

use_ok('Parrot::Configure');
use_ok('Parrot::Configure::Step');
use_ok('Parrot::Configure::Step::Base');
use_ok('auto::ctags');

my $conf = Parrot::Configure->new;
my $pkg = q{auto::ctags};

$conf->add_steps($pkg);

my $task = $conf->steps->[0];
my $step_name = $task->step;

my $step = $step_name->new;

ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

{
    my $verbose = 0;
    my $rv      = auto::ctags::runstep($step, $conf);
    is( $rv, 1, "Got expected exit code of 1" );
}

################### DOCUMENTATION ###################

=head1 NAME

t/configure/118-detect_ctags.t - tests Parrot::Configure::Step::auto::ctags

=head1 SYNOPSIS

    prove t/configure/118-detect_ctags.t

=head1 DESCRIPTION

Regression tests for the L<Parrot::Configure::Step::auto::ctags> module.
This file holds tests for Parrot::Configure::Step::auto::ctags::runstep()
(a non-exported subroutine).

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
