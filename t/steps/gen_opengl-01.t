#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$
# gen_opengl-01.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::gen::opengl');

=for hints_for_testing This is just a stub so that Configure.pl will run.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  gen_opengl-01.t - test config::gen::opengl

=head1 SYNOPSIS

    % prove t/steps/gen_opengl-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::gen::opengl.

=head1 AUTHOR

Geoffrey Broadwell; modified from a similar file by James E Keenan

=head1 SEE ALSO

config::gen::opengl, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
