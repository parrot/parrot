#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 106-init_headers.t

use strict;
use warnings;
use Test::More tests =>  2;
use Carp;
use lib qw( . lib ../lib ../../lib );
use_ok('config::init::headers');

# config/init/headers.pm is completely tested in all statements, branches and
# conditions by other tests among the configuration tests.  So there is no
# need to add additional unit tests in this file.

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

106-init_headers.t - test config::init::headers

=head1 SYNOPSIS

    % prove t/configure/106-init_headers.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::init::headers.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::headers, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
