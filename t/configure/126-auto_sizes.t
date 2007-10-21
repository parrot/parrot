#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 126-auto_sizes.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::sizes');

=for hints_for_testing You will need to explore writing tests that
trigger the various warnings in the package being tested.  Check latest
reports of Parrot configuration tools testing coverage to see where your
time available for writing tests is spent.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

126-auto_sizes.t - test config::auto::sizes

=head1 SYNOPSIS

    % prove t/configure/126-auto_sizes.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::sizes.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::sizes, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
