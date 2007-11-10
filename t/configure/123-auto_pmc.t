#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 123-auto_pmc.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::auto::pmc');

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

123-auto_pmc.t - test config::auto::pmc

=head1 SYNOPSIS

    % prove t/configure/123-auto_pmc.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::pmc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::pmc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
