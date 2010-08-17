#! perl
# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$
use strict;
use warnings;
use Carp;
use Test::More tests => 2;

my $pbcc = q{PBC_COMPAT};
croak "Cannot locate $pbcc: $!" unless (-f $pbcc);

my @malformed = ();
my @badversion =();
open my $IN, '<', $pbcc or croak "Unable to open $pbcc for reading: $!";
while (my $l = <$IN>) {
    chomp $l;
    next if $l =~ m/^(?:#|\s*$)/o;
    push @malformed, $. unless $l =~ m/^([^\t]+)\t[^\t]+\t[^\t]+\t[^\t]+$/o;
    my $version = $1;
    push @badversion, $. unless $version =~ m/^\d+\.\d+$/o;
}
close $IN or croak "Unable to close $pbcc after reading: $!";
is( scalar( @malformed ), 0, "All records in $pbcc are properly formatted" )
    or diag( "These lines in $pbcc are malformed:  @malformed\n" );
is( scalar( @badversion ), 0, "All records in $pbcc have valid version numbers" )
    or diag( "These lines in $pbcc have bad version numbers:  @badversion\n" );

=head1 NAME

t/codingstd/pbc_compat.t - Enforce PBC_COMPAT's record format

=head1 SYNOPSIS

    % prove t/codingstd/pbc_compat.t

=head1 DESCRIPTION

PBC_COMPAT records the history of changes to Parrot's bytecode format.
Entries in this file must, per specifications in the file itself, consist of
four hard-tab-delimited columns.  The first of these columns is the bytecode
version number, which must be in C<N.N> format, where each C<N> increases
monotonically.  This test file enforces this coding standard.

We assume that this file is run from the top-level directory of the Parrot
distribution.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
