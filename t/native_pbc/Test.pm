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

my @archtest = qw(4_le 4_le 4_be 8_le 8_le 8_be 8_be 4_le 4_be);
sub int_arch {
    return $PConfig{intvalsize}
      . "_"
      . (substr($PConfig{byteorder},0,2) eq '12' ? "le" : "be");
}
sub num_arch {
    return $PConfig{numvalsize}
      . "_"
	. (substr($PConfig{byteorder},0,2) eq '12' ? "le" : "be");
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
	@archtest = qw(8_le 12_le 8_be 8_le 16_le 8_be 16_be 4_le 4_be);
    }
    my $cvt = "$archtest[$id-1]=>$arch";
    my $skip_msg;
    # check if this a platform where we can produce the needed file
    if ($archtest[$id-1] eq $arch) {
        $skip_msg = "Want to help? Regenerate $file "
          . "with tools/dev/mk_native_pbc --noconf";
    }
    else {
        $skip_msg  = "$file is outdated. "
          . "Need $archtest[$id-1] platform.";
    }
    if ($type eq 'number' and $cvt =~ /^16_[bl]e=>8_/) {
	# 16 -> 8 drops some mantissa bits
        $expected =~ s/1\.12589990684262e\+15/1.12589990684058e+15/;
    }
    # check if skip or todo
  SKIP: {
    if ( $skip->{$id} ) {
        my $skip_msg = $skip->{$id};
        if (length $skip_msg > 2) {
            skip "$cvt $skip_msg", 1;
        }
        else {
            skip "$cvt not yet implemented", 1;
        }
    }
    elsif ( $todo->{$id} ) {
        skip $skip_msg, 1
          if ($bc ne pbc_bc_version($file));
        my $todo_msg = $todo->{$id};
        if (length $todo_msg > 2) {
            $todo_msg = "$cvt $todo_msg"
        }
        else {
            $todo_msg = "$cvt yet untested, GH #394. "
                       . "Please report success."
        }
        Parrot::Test::pbc_output_is( undef, $expected, "$cvt $desc",
                       todo => "$todo_msg" );
    }
    else {
        skip $skip_msg, 1
          if ($bc ne pbc_bc_version($file));
        Parrot::Test::pbc_output_is( undef, $expected, "$cvt $desc" );
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

  _1   i386 32 bit opcode_t, 32 bit intval   (linux-gcc-ix86, freebsd-gcc, cygwin)
  _3   PPC BE 32 bit opcode_t, 32 bit intval (darwin-ppc, sparc32 or mips32)
  _4   x86_64 double float 64 bit opcode_t   (linux-gcc-x86_64, solaris-cc-64int)
  _6   big-endian 64 bit opcode_t, 8 byte double (Sparc64, mips64, ppc64)

  _2   (skipped) i386 32 bit opcode_t, 32 bit intval, 12 bit long double
  _8   (skipped) i386 32 bit opcode_t, 32 bit intval, 4-byte single float --floatval=float
  _5   (skipped) x86_64 16 bit long double 64 bit opcode_t
  _7   (skipped) big-endian 64 bit opcode_t, 16 byte long double
  _9   (skipped) big-endian 32 bit opcode_t, 4 byte intval, 4 byte single float

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
