#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 117-inter_shlibs.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::inter::shlibs');

=for hints_for_testing Check latest reports of Parrot configuration
tools testing coverage to see where your time available for writing
tests is spent.  You will have to determine a way to test a user
response to a prompt. Note the comment in POD:  "This is a separate
unit from config/inter/progs.pm because the answers depend on which
compiler is in use.  Thus it should come after the gccversion test."
This may affect how the tests in this file are set up.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

117-inter_shlibs.t - test config::inter::shlibs

=head1 SYNOPSIS

    % prove t/configure/117-inter_shlibs.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::inter::shlibs.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::shlibs, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
