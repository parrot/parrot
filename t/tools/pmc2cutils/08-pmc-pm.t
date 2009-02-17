#! perl
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$
# 08-pmc-pm.t

use strict;
use warnings;

BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    realpath($Bin) =~ m{^(.*\/parrot)\/[^/]*\/[^/]*\/[^/]*$};
    our $topdir = $1;
    if ( defined $topdir ) {
        print "\nOK:  Parrot top directory located\n";
    }
    else {
        $topdir = realpath($Bin) . "/../../..";
    }
    unshift @INC, qq{$topdir/lib};
}
use Test::More tests => 5;

use_ok('Parrot::Pmc2c::PMC');

my ( %opt, @include, @args );
my $self;

$self = Parrot::Pmc2c::PMC->new();

isa_ok( $self, q{Parrot::Pmc2c::PMC} );

can_ok( 'Parrot::Pmc2c::PMC', q{inherit_attrs} );

#can_ok( 'Parrot::Pmc2c::PMC', q{gen_parent_lookup_info} );
#can_ok( 'Parrot::Pmc2c::PMC', q{gen_parent_reverse_lookup_info} );
can_ok( 'Parrot::Pmc2c::PMC', q{dump_is_current} );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

08-pmc-pm.t - test Parrot::Pmc2c::Pmc basic functionality

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/08-pmc-pm.t

=head1 DESCRIPTION

=head1 AUTHOR

Kevin Tew

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
