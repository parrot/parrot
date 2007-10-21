#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 128-auto_va_ptr.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::va_ptr');

=for hints_for_testing The documentation of the package being tested is
insufficient; please try to improve it.  Explore the likelihood of seg
faults while running the test.  Check latest reports of Parrot
configuration tools testing coverage to see where your time available
for writing tests is spent.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

128-auto_va_ptr.t - test config::auto::va_ptr

=head1 SYNOPSIS

    % prove t/configure/128-auto_va_ptr.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::va_ptr.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::va_ptr, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
