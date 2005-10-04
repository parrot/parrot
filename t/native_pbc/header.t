#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id: number.t 7803 2005-04-11 13:37:27Z leo $

=head1 NAME

t/native_pbc/header.t - PBC header format

=head1 SYNOPSIS

        % perl t/native_pbc/header.t

=head1 DESCRIPTION

Tests the layout of the PBC header.

=cut

use strict;
use warnings;

use Parrot::Test tests => 8;

use File::Temp;
use Test::More;
use Parrot::Config;

SKIP: {
    skip "new header format not yet implimented", 8;
    # idea stolen from t/pmc/sub.t
    my $tmppasm = File::Temp->new(UNLINK => 1, SUFFIX => '.pasm');
    print $tmppasm <<END;
    set I0, 0
END
    $tmppasm->flush;
    my $tmppbc = File::Temp->new(UNLINK => 1, SUFFIX => '.pbc');
    system(".$PConfig{slash}parrot$PConfig{exe} -o $tmppbc $tmppasm");
    my $pbc = slurp_file($tmppbc);

my @fields = qw(
    magic
    wordsize
    byteorder
    major
    minor
    intval
    floattype
    fingerprint
    padding
);

    my %h;
    @h{@fields} = unpack "a8CCCCCCa10a8", $pbc;

    is($h{magic}, "\xfe\x50\x42\x43\x0d\x0a\x1a\x0a", "magic string");
    ok($h{wordsize} < 2, "wordsize");
    ok($h{byteorder} < 2, "byteorder");
    is($h{major}, $PConfig{MAJOR}, "major version");
    is($h{minor}, $PConfig{MINOR}, "minor version");
    ok($h{intval} == 4 || $h{intval} == 8, "intval");
    ok($h{floattype} < 2, "floattype");
    is($h{padding}, pack "x8", "NULL padding");
}
