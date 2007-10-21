#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 145-auto_gdbm.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::gdbm');

=for hints_for_testing The documentation for this package is skimpy;
please try to improve it, e.g., by providing a short description of what
the 'gdbm' is.  Some branches are compiler- or OS-specific.  As noted in
a comment in the module, please consider the issues raised in
http://rt.perl.org/rt3/Ticket/Display.html?id=43134.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

145-auto_gdbm.t - test config::auto::gdbm

=head1 SYNOPSIS

    % prove t/configure/145-auto_gdbm.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::gdbm.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gdbm, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
