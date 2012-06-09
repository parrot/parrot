#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use lib qw| lib |;

use Parrot::Harness::Smoke qw(
    collect_test_environment_data
    send_archive_to_smolder
);

my $tarball = 't/archive/parrot_test_run.tar.gz';
die "Could not locate $tarball" unless (-f $tarball);

send_archive_to_smolder(collect_test_environment_data());

=head1 NAME

tools/dev/resubmit_smolder.pl

=head1 SYNOPSIS

    perl tools/dev/resubmit_smolder.pl

=head1 DESCRIPTION

This program is a simple wrapper around the Parrot::Harness::Smoke functions
needed to resubmit a smoke test tarball to our Smolder server if the initial
transmission of that tarball failed.

The command should be run from the top-level of your checkout of Parrot.  It
will fail if no file named F<t/archive/parrot_test_run.tar.gz> exists in that
directory.

=head1 AUTHOR

James E Keenan (kid51)

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
