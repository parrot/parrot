# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

Parrot::Test::HBDB - testing routines for the HBDB debugger

=head1 SYNOPSIS

Set the number of tests to be run like this:

    use Parrot::Test::HBDB tests => 8;

=head1 DESCRIPTION

The C<Parrot::Test::HBDB> module provides various test functions specific to HBDB.

=head1 REQUIREMENTS

This module requires you to build HBDB, by running "make hbdb". If this
requirement has not been met, all tests will be skipped.

=head2 Subroutines

=over 4

=cut

package Parrot::Test::HBDB;

use strict;
use warnings;
use lib qw(lib);

use File::Spec;
use Test::Builder;
use Test::More ();
use Parrot::Config;

require Exporter;

use base qw(Exporter);

our @EXPORT = qw(hbdb_help_output_like);

my $exec;

# Check that HBDB has been built first
BEGIN {
    my $path = File::Spec->join(".", "hbdb");
    $exec = $path . $PConfig{'exe'};

    # Skip tests if executable doesn't exist
    unless (-f $exec) {
        Test::Builder->plan(skip_all => "HBDB hasn't been built. Please run \"make hbdb\"");
        exit(0);
    }
}

my $builder = Test::Builder->new();

sub import {
    my ($self, $plan, $args) = @_;

    $builder->plan($plan, $args);

    __PACKAGE__->export_to_level(2, __PACKAGE__);
}

=item C<hbdb_output_like($opt, qr/rx/, $desc)>

Similar to C<Test::More::like()>. C<$opt> is the command-line switch to pass
to hbdb, C<$rx> is a regular expression to match, and C<$desc> is a short
description. Passes the test if the help message matches the given regular
expression.

=cut

sub hbdb_help_output_like {
    my ($opt, $rx, $desc) = @_;
    my $out = `$exec $opt`;

    Test::More::like($out, $rx, $desc);
}

sub hbdb_output_like {

}

1;

=back

=head1 SEE ALSO

F<docs/tests.pod>, F<docs/hbdb.pod>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

