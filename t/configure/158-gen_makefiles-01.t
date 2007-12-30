#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 158-gen_makefiles-01.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::gen::makefiles');

=for hints_for_testing Consider testing the content of the files which
the POD claims the module creates.  Consider resolving questions raised
in inline comments such as "Why is this here?"

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

158-gen_makefiles-01.t - test config::gen::makefiles

=head1 SYNOPSIS

    % prove t/configure/158-gen_makefiles-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::gen::makefiles.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::gen::makefiles, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
