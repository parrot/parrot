#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( lib );

use Test::More;
use File::Find;

=head1 NAME

t/configure/036-config_steps.t - tests step modules under the config dir

=head1 SYNOPSIS

    prove t/configure/036-config_steps.t

=head1 DESCRIPTION

Regressions tests for configure steps that live under the config directory.

=cut

my @steps;
sub wanted { $File::Find::name =~ m{^config\/(.*)\.pm\z}s &&
    do {
        my $mod = $1;
        my $class = join '::', ( split /\//, $mod );
        push @steps, $class;
    };
}
find( { wanted => \&wanted }, 'config' );

if ( $^O !~ /win32/i ) {
    @steps = grep { $_ !~ /win32/i } @steps;
}

my $testcount = @steps + 2;
plan tests => $testcount;
unshift @INC, 'config';

foreach my $step (@steps) {
    require_ok($step);
}

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
