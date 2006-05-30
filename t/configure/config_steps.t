#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );

use Test::More;
use File::Find;

=head1 NAME

t/configure/config_steps.t - tests step modules under the config dir

=head1 SYNOPSIS

    prove t/configure/config_steps.t

=head1 DESCRIPTION

Regressions tests for configure steps that live under the config directory.

=cut

my @steps;
sub wanted { /^.*\.pm\z/s && push @steps, $File::Find::name; }
find({wanted => \&wanted}, 'config'); 

plan tests => scalar @steps;
foreach my $step (@steps) {
    require_ok($step);
}
