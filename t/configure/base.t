#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 10;

=head1 NAME

t/configure/base.t - tests Parrot::Configure::Step::Base

=head1 SYNOPSIS

    prove t/configure/base.t

=head1 DESCRIPTION

Regressions tests for the L<Parrote::Configure::Step::Base> abstract base
class.

=cut

BEGIN { use_ok('Parrot::Configure::Step::Base'); }

package Test::Parrot::Configure::Step::Base;

use base qw(Parrot::Configure::Step::Base);

use vars qw($description @args);

$description    = "foo";
@args           = qw(foo bar baz);

package main;

my $testpkg = 'Test::Parrot::Configure::Step::Base';

can_ok($testpkg, qw(new description args result set_result));

# class methods
is($testpkg->description, 'foo', "->description() returns the proper value");
is_deeply([$testpkg->args], [qw(foo bar baz)],
    "->args() returns the proper value");

# object methods

isa_ok($testpkg->new, $testpkg);

# ->description() & ->args() work as object methods too
{
    my $teststep = $testpkg->new;

    is($teststep->description, 'foo', "->description() returns the proper value");
    is_deeply([$teststep->args], [qw(foo bar baz)],
        "->args() returns the proper value");
}

{
    my $teststep = $testpkg->new;

    is($teststep->result('baz'), undef, "->set_result() returns the class");
    isa_ok($teststep->set_result('baz'), $testpkg);
    is($teststep->result, 'baz', "->set_result() changed the result value");
}
