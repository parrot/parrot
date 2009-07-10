#! perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$
# init/hints/darwin-01.t

use strict;
use warnings;
use Test::More; # tests => 26;
plan( skip_all => 'only needs testing on Darwin' ) unless $^O =~ /darwin/i;
plan( tests =>  1 );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

init/hints/darwin-01.t - test init::hints::darwin

=head1 SYNOPSIS

    % prove t/steps/init/hints/darwin-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test init::hints::darwin.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::hints::darwin, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
