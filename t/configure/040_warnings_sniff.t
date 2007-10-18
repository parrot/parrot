#!perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use Test::More tests => 4;
use Carp;
use Cwd;
use File::Temp 0.13 qw/ tempdir /;
use IO::Handle;
use lib qw( lib );
use Parrot::IO::Capture::Mini;

BEGIN { use_ok('Parrot::Configure'); }
BEGIN { use_ok('Parrot::Configure::Step'); }
BEGIN { use_ok('auto::warnings'); }

#Parrot::Configure::Step->import(@Parrot::Configure::Step::EXPORT_OK);

#can_ok( __PACKAGE__, @Parrot::Configure::Step::EXPORT_OK );

my $step = 'dummy';

my $conf = Parrot::Configure->new;
$conf->data->set('cc', 'cc');
$conf->data->set('ccflags', '-I/usr/include');

my $cwd = cwd();
my $warning;

$warning = "-Wall";
{
    my $verbose = 0;
    my $rv      = auto::warnings::try_warning($step, $conf, $warning);
    is( $rv, 1, "Got expected exit code of 1" );
}

################### DOCUMENTATION ###################

=head1 NAME

t/configure/040_warnings_sniff.t - tests Parrot::Configure::Step::auto::warnings

=head1 SYNOPSIS

    prove t/configure/040_warnings_sniff.t

=head1 DESCRIPTION

Regression tests for the L<Parrot::Configure::Step::auto::warnings> module.
This file holds tests for Parrot::Configure::Step::auto::warnings::try_warning()
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
