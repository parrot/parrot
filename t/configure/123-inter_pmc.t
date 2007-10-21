#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 123-inter_pmc.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::inter::pmc');

=for hints_for_testing Check latest reports of Parrot configuration
tools testing coverage to see where your time available for writing
tests is spent.  You will have to determine a way to test a user
response to a prompt. In the course of writing tests, you should try
to resolve RT 43172.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

123-inter_pmc.t - test config::inter::pmc

=head1 SYNOPSIS

    % prove t/configure/123-inter_pmc.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::inter::pmc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::pmc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
