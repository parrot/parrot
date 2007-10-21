#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 122-inter_ops.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::inter::ops');

=for hints_for_testing Check latest reports of Parrot configuration
tools testing coverage to see where your time available for writing
tests is spent.  You will have to determine a way to test a user
response to a prompt.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

122-inter_ops.t - test config::inter::ops

=head1 SYNOPSIS

    % prove t/configure/122-inter_ops.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::inter::ops.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::ops, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
