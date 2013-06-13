#! perl
# Copyright (C) 2001-2012, Parrot Foundation.

package t::native_pbc::Test;
use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::BuildUtil;
require Parrot::Test;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = ('test_native_pbc');

sub int_arch {
    return $PConfig{intvalsize}
      . "_"
      . (substr($PConfig{byteorder},0,2) eq '12' ? "le" : "be");
}
sub num_arch {
    return $PConfig{ptrsize}
      . "_". $PConfig{numvalsize}
      . "_"
      . (substr($PConfig{byteorder},0,2) eq '12' ? "le" : "be");
}

sub pbc_version {
    my $f = shift;
    my $b;
    open my $F, "<", "$f" or return "Can't open $f: $!";
    binmode $F;
    seek $F, 11, 0;
    read $F, $b, 3;
    my ($major, $minor, $patch) = unpack "ccc", $b;
    return ($major . "." . $minor . ".". $patch);
}

sub pbc_bc_version {
    my $f = shift;
    my $b;
    open my $F, "<", "$f" or return "Can't open $f: $!";
    binmode $F;
    seek $F, 14, 0;
    read $F, $b, 8;
    my ($bc_major, $bc_minor) = unpack "cc", $b;
    return ($bc_major . "." . $bc_minor);
}

my ( $bc_major, $bc_minor ) = Parrot::BuildUtil::get_bc_version();
my $bc = ($bc_major . "." . $bc_minor);
my $version = $PConfig{MAJOR}.".".$PConfig{MINOR}.".".$PConfig{PATCH};
my $arch = int_arch();

sub test_native_pbc {
    my $id   = shift;
    my $type = shift;
    my $expected = shift;
    my $desc = shift;
    my $skip = shift;
    my $todo = shift;
    my $file = "t/native_pbc/${type}_${id}.pbc";
    if ($type eq 'number') {
        $arch = num_arch();
    }
    my $cvt = "$id=>$arch";
    my $pbc_version = pbc_version($file);
    my $pbc_bc_version = pbc_bc_version($file);
    my $skip_msg;
    my $skip_msgv = "$file has old v$pbc_version. "
      . "Try tools/dev/pbc_header.pl --update-fingerprint $file";
    # check if this a platform where we can produce the needed file
    if ($id eq $arch) {
        $skip_msg = "$file has old PBC_COMPAT $pbc_bc_version. "
          . "Regenerate with tools/dev/mk_native_pbc --noconf";
    }
    else {
        $skip_msg  = "$file has old PBC_COMPAT $pbc_bc_version. "
          . "Need $id platform to generate it.";
    }
    if ($type eq 'number' and $cvt =~ /^8_16_[bl]e=>4_8_/) {
        # 16 -> 8 drops some mantissa bits
        $expected =~ s/1\.12589990684262e\+15/1.12589990684058e+15/;
    }
    # check if skip or todo
  SKIP: {
    # TODO: -r requires -o *.pbc. We could add and run it
    if ($ENV{TEST_PROG_ARGS} and $ENV{TEST_PROG_ARGS} =~ /(--run-pbc|-r)\b/) {
        skip "$cvt --run-pbc", 1;
    }
    elsif ( $skip->{$id} ) {
        my $skip_msg = $skip->{$id};
        if (length $skip_msg > 2) {
            skip "$cvt $skip_msg", 1;
        }
        else {
            skip "$cvt not yet implemented", 1;
        }
    }
    elsif ( $todo->{$id} ) {
        skip $skip_msg, 1 if $bc ne $pbc_bc_version;
        local $TODO = $skip_msgv if $version ne $pbc_version;
        my $todo_msg = $todo->{$id};
        if (length $todo_msg > 2) {
            $todo_msg = "$cvt $todo_msg";
        }
        else {
            $todo_msg = "$cvt yet untested. Please report success.";
        }
        Parrot::Test::pbc_output_is( $file, $expected, "$cvt $desc",
                       todo => "$todo_msg" );
    }
    else {
        skip $skip_msg, 1 if $bc ne $pbc_bc_version;
        local $TODO = $skip_msgv if $version ne $pbc_version;
        Parrot::Test::pbc_output_is( $file, $expected, "$cvt $desc" );
    }
  }
}

=head1 NAME

t/native_pbc/Test.pm - Native PBC test helper functions

=head1 DESCRIPTION

Tests word-size/endian-ness for different architectures.

We test 32+64bit (i.e. 4+8 byte opcode_t and 4+8 byte integers)
and 4,8,12 and 16 byte floats with le and be.

These tests usually only work on updated native pbc test files.
See F<tools/dev/mk_native_pbc> to create the platform-specific
native pbcs on 4 different machines.

=head1 PLATFORMS

  i386 32 bit opcode_t, 2 byte intval, 8 byte double (linux-gcc-ix86, freebsd-gcc, cygwin)
  i386 32 bit opcode_t, 2 byte intval, 12 bit long double --floatval="long double"
  x86_64 64 bit opcode_t, 4 byte intval, 8 byte double  (linux-gcc-x86_64, solaris-cc-64int)
  x86_64 64 bit opcode_t, 4 byte intval, 16 byte long double --floatval="long double"
  big-endian 32 bit opcode_t, 2 byte intval, 8 byte double (darwin-ppc, sparc32 or mips32)
  big-endian 32 bit opcode_t, 2 byte intval, 16 byte long double --floatval="long double"
  big-endian 64 bit opcode_t, 4 byte intval, 8 byte double (Sparc64, mips64, ppc64)
  big-endian 64 bit opcode_t, 4 byte intval, 16 byte long double --floatval="long double"

  (skipped) i386 32 bit opcode_t, 2 byte intval, 4-byte single float --floatval=float
  (skipped) x86_64 64 bit opcode_t, 4 byte intval, 4-byte single float --floatval=float
  (skipped) big-endian 32 bit opcode_t, 2 byte intval, 4 byte single float --floatval=float

=head2 Functions

=over 4

=item C<test_native_pbc($id, $type, $expected, $description, \%skip, \%todo)>

C<$type> is "integer", "number" or "string".

Runs the tests against all pre-generated native pbc files, and tries to detect
common errors, like not updated pbc files on uncommon platforms.

See F<t/native_pbc/number.t> for skip and todo.

=item C<this_arch()>

Returns "4_le", "4_be", "8_le" or "8_be". For C<$type> "number" even more combinations.

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
