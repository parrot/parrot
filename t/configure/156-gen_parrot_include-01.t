#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 156-gen_parrot_include-01.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( lib );
use_ok('config::gen::parrot_include');

=for hints_for_testing Consider writing a description of what 'runtime
parrot include' files means.

=cut

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

156-gen_parrot_include-01.t - test config::gen::parrot_include

=head1 SYNOPSIS

    % prove t/configure/156-gen_parrot_include-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::gen::parrot_include.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::gen::parrot_include, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
