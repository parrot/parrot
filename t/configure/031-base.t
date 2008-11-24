#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( lib );
use Test::More tests =>  5;

=head1 NAME

t/configure/031-base.t - tests Parrot::Configure::Step

=head1 SYNOPSIS

    prove t/configure/031-base.t

=head1 DESCRIPTION

Regressions tests for the L<Parrot::Configure::Step> abstract base
class.

=cut

BEGIN { use Parrot::Configure::Step; }

package Test::Parrot::Configure::Step;

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{foo};
    $data{result}      = q{};
    return \%data;
}

package main;

my $testpkg = 'Test::Parrot::Configure::Step';

can_ok( $testpkg, qw(new description result set_result) );
isa_ok( $testpkg->new, $testpkg );

{
    my $teststep = $testpkg->new;

    is( $teststep->result('baz'), q{}, "->set_result() returns the class" );
    isa_ok( $teststep->set_result('baz'), $testpkg );
    is( $teststep->result, 'baz', "->set_result() changed the result value" );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
