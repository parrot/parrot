#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 151-auto_cpu.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::cpu');

=for hints_for_testing You may have to create a dummy local hints
package to test this package effectively.  Try to test all branches and
conditions; consult a recent code coverage report for guidance.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

151-auto_cpu.t - test config::auto::cpu

=head1 SYNOPSIS

    % prove t/configure/151-auto_cpu.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::cpu.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::cpu, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
