#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 153-gen_revision.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::gen::revision');

=for hints_for_testing See also:
t/configure/017-revision_no_DEVELOPING.t
t/configure/018-revision.t
t/configure/153-gen_revision.t
t/postconfigure/02-revision_no_DEVELOPING.t
t/postconfigure/03-revision.t

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

153-gen_revision.t - test config::gen::revision

=head1 SYNOPSIS

    % prove t/configure/153-gen_revision.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::gen::revision.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::gen::revision, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
