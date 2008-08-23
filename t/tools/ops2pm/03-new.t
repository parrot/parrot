#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$
# 03-new.t

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

use_ok('Parrot::Ops2pm');

ok( chdir $main::topdir, "Positioned at top-level Parrot directory" );
{
    local @ARGV = qw( fkadfudofyufyd );
    eval {
        my $self = Parrot::Ops2pm->new(
            {
                argv   => [@ARGV],
                script => "tools/build/ops2pm.pl",
            }
        );
    };
    like(
        $@,
        qr/Could not find ops file/,
        "Got expected error message when file could not be found"
    );
}

{
    local @ARGV = qw( src/ops/core.ops
        src/ops/bit.ops src/ops/cmp.ops src/ops/debug.ops
        src/ops/experimental.ops src/ops/io.ops src/ops/math.ops
        src/ops/object.ops src/ops/pic.ops src/ops/pmc.ops
        src/ops/set.ops src/ops/stack.ops src/ops/stm.ops
        src/ops/string.ops src/ops/sys.ops src/ops/var.ops
    );
    my $self = Parrot::Ops2pm->new(
        {
            argv   => [@ARGV],
            script => "tools/build/ops2pm.pl",
        }
    );
    isa_ok( $self, q{Parrot::Ops2pm} );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

03-new.t - test C<Parrot::Ops2pm::new()>

=head1 SYNOPSIS

    % prove t/tools/ops2pm/03-new.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines of
F<lib/Parrot/Ops2pm.pm> and F<lib/Parrot/Ops2pm/Auxiliary.pm>.
By doing so, they test the functionality of the F<ops2pm.pl> utility.
That functionality has largely been extracted
into the methods of F<Utils.pm>.

F<03-new.t> tests whether Parrot::Ops2pm::new()
works properly.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Ops2pm, F<ops2pm.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
