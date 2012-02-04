#! perl
# Copyright (C) 2001-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;

use Parrot::Test skip_all => 'pending robust testing strategy, GH #394';
#use Parrot::Test tests => 9;

use File::Temp;
use Parrot::Config;

=head1 NAME

t/native_pbc/header.t - PBC header format

=head1 SYNOPSIS

        % prove t/native_pbc/header.t

=head1 DESCRIPTION

Tests the layout of the PBC header.

=cut

# idea stolen from t/pmc/sub.t
my $tmppasm = File::Temp->new( UNLINK => 1, SUFFIX => '.pasm', CLEANUP => 1 );
print $tmppasm <<END;
set I0, 0
END
$tmppasm->flush;
my $out_f = File::Temp->new( UNLINK => 1, SUFFIX => '.pbc', CLEANUP => 1 );
my $path_to_parrot = Parrot::Test::path_to_parrot();
my $parrot = File::Spec->join( File::Spec->curdir(), 'parrot' . $PConfig{exe} );
my $args = $ENV{TEST_PROG_ARGS} || '';
Parrot::Test::run_command
  (
   qq{$parrot $args -o $out_f $tmppasm},
   CD     => $path_to_parrot,
   STDOUT => $out_f,
   STDERR => $out_f,
  );
my $pbc = slurp_file($out_f);

my @fields = qw(
    magic
    wordsize
    byteorder
    floattype
    major
    minor
    patch
    bc_major
    bc_minor
    uuid_type
    uuid_size
);

my %h;
@h{@fields} = unpack "a7CCCCCCCCCC", $pbc;

is( $h{magic}, "\xfe\x50\x42\x43\x0a\x1a\x0a", "magic string 0xfePBC0x0a0x1a0x0a len=7" );
ok( $h{wordsize} == 2 || $h{wordsize} == 4 || $h{wordsize} == 8,  "wordsize: $h{wordsize}" );
ok( $h{byteorder} < 2, "byteorder: $h{byteorder}" );
ok( $h{floattype} < 3, "floattype: $h{floattype}" );
is( $h{major}, $PConfig{MAJOR}, "major version: $h{major} vs $PConfig{MAJOR}" );
is( $h{minor}, $PConfig{MINOR}, "minor version: $h{minor} vs $PConfig{MINOR}" );
is( $h{patch}, $PConfig{PATCH}, "patch version: $h{patch} vs $PConfig{PATCH}" );
# see pbcversion.h or PBC_COMPAT
ok( $h{bc_major} > 0,           "bc major version: $h{bc_major}" );
ok( $h{bc_minor} >= 0,          "bc minor version: $h{bc_minor}" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
