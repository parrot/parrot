#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 7;

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

use vars qw($description $result @args);

$description    = "foo";
$result         = "bar";
@args           = qw(foo bar baz);

package main;

my $testpkg = 'Test::Parrot::Configure::Step::Base';

can_ok($testpkg, qw(description result set_result args));

is($testpkg->description, 'foo', "->description() returns the proper value");
is($testpkg->result, 'bar', "->result() returns the proper value");
is($testpkg->set_result('baz'), $testpkg, "->set_result() returns the class");
is($testpkg->result, 'baz', "->set_result() changed the result value");
is_deeply([$testpkg->args], [qw(foo bar baz)],
    "->args() returns the proper value");
