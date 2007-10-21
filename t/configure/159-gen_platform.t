#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 159-gen_platform.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::gen::platform');

=for hints_for_testing By definition, test coverage of this package will
appear low because you can only test the OS you are currently running
on.  Use Test::More SKIP blocks as needed.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

159-gen_platform.t - test config::gen::platform

=head1 SYNOPSIS

    % prove t/configure/159-gen_platform.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::gen::platform.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::gen::platform, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
