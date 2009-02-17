#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# 01-ops2pm.t

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
use Test::More tests => 3;

use_ok('Parrot::Ops2pm');

ok( chdir $main::topdir, "Positioned at top-level Parrot directory" );
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

01-ops2pm.t - test importability of Parrot::Ops2pm subroutines

=head1 SYNOPSIS

    % prove t/tools/ops2pm/01-ops2pm.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines of
F<lib/Parrot/Ops2pm.pm> and F<lib/Parrot/Ops2pm/Auxiliary.pm>.  By doing so,
they test the functionality of the F<ops2pm.pl> utility.  That functionality
has largely been extracted into the methods of F<Ops2pm.pm>.

F<01-ops2pm.t> tests whether Parrot::Ops2pm is exporting the
subroutines in its C<@EXPORT_OK>.:

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
