#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 5;

=head1 NAME

t/configure/configure.t - tests Parrot::Configure

=head1 SYNOPSIS

    prove t/configure/configure.t

=head1 DESCRIPTION

Regressions tests for the L<Parrote::Configure> class.

=cut

BEGIN { use_ok('Parrot::Configure'); }

can_ok('Parrot::Configure', qw(
    new
    data
    options
    steps
    add_steps
    runsteps
));

# ->new()

{
    my $pc = Parrot::Configure->new;

    isa_ok($pc, 'Parrot::Configure');
}

# ->data()

{
    my $pc = Parrot::Configure->new;

    isa_ok($pc->data, 'Parrot::Configure::Data');
}

# ->options()

{
    my $pc = Parrot::Configure->new;

    isa_ok($pc->options, 'Parrot::Configure::Data');
}

# ->steps()
# ->add_steps()
# ->runsteps()
