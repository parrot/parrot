# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

Parrot::Test::HBDB - OO interface for testing the HBDB debugger

=head1 SYNOPSIS

Set the number of tests to be run like this:

    use Parrot::Test::HBDB tests => 8;

=head1 DESCRIPTION

The C<Parrot::Test::HBDB> module provides various test functions specific to HBDB.

=head1 REQUIREMENTS

This module requires you to build HBDB, by running "make hbdb". If this
requirement has not been met, all tests will be skipped.

=head2 Constructor

=over 4

=item B<new()>

Returns a new C<Parrot::Test::HBDB> object.

    my $hbdb = Parrot::Test::HBDB->new();

=back

=head2 Methods

=over 4

=item B<start($file, $args)>

Starts HBDB. C<$file> is the name of the .pir file to debug and C<$args> is
the command-line switches.

    $hbdb->start("foo.pir", "--help");

=item B<hbdb_output_like($opt, qr/rx/, $desc)>

Similar to C<Test::More::like()>. C<$opt> is the command-line switch to pass
to hbdb, C<$rx> is a regular expression to match, and C<$desc> is a short
description. Passes the test if the help message matches the given regular
expression.

=back

=head1 SEE ALSO

L<Test::More>, L<Parrot::Test>,  F<docs/tests.pod>, F<docs/hbdb.pod>

=head1 HISTORY

Initial version by Kevin Polulak (soh_cah_toa) <kpolulak@gmail.com>

=cut

package Parrot::Test::HBDB;

use strict;
use warnings;
use lib qw(lib);

use Carp;
use File::Spec;
use IO::Select;
use IPC::Open3;
use Test::Builder;
use Test::More ();

use Parrot::Config;

# TODO Do I need this if I "use base"?
require Exporter;

use base qw(Exporter);

my $builder;
my $parrot = ".$PConfig{slash}$PConfig{test_prog}";

# Check that HBDB has been built first
BEGIN {
    $builder = Test::Builder->new();

    # Get path to HBDB executable
    my $hbdb = File::Spec->join('.', 'hbdb') . $PConfig{exe};

    # Skip tests if executable doesn't exist
    unless (-e $hbdb) {
        $builder->plan(skip_all => 'HBDB hasn\'t been built. Please run \"make hbdb\"');
        exit(0);
    }
}

sub import {
    my ($self, $plan, $args) = @_;

    $builder->plan($plan, $args);

    __PACKAGE__->export_to_level(2, __PACKAGE__);
}

# Constructor
sub new {
    my $class = shift;

    my $obj = {
        exe => ".$PConfig{'slash'}hbdb$PConfig{'exe'}"
    };

    return bless $obj, $class;
}

# Starts HBDB
sub start {
    my ($self, $file, $args) = @_;

    $self->{file} = $file if defined $file;
    $self->{args} = $args if defined $args;
}

#######################
# Private subroutines #
#######################

sub _generate_pbc {
    my $pir = shift;
    my $pbc = $pir;

    $pbc =~ s|\.pir|\.pbc|i;

    eval { system "$parrot -o $pbc $pir" };
    $builder->diag("Failed to generate $pbc") if $@;

    return $pbc;
}

#sub hbdb_help_output_like {
    #my ($opt, $rx, $desc) = @_;
    #my $out = `$HBDB $opt`;

    #Test::More::like($out, $rx, $desc);
#}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

