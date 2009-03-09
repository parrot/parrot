#! perl
# Copyright (C) 2001-2005,2009 Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::BuildUtil;

use Parrot::Test tests => 6;

=head1 NAME

t/native_pbc/string.t - PBC string tests

=head1 SYNOPSIS

        % prove t/native_pbc/string.t

=head1 DESCRIPTION

Tests word-size/endian-ness for different architectures.
TODO: Test foreign charsets and encodings.

These tests usually only work on updated native pbc test files.
See F<tools/dev/mk_native_pbc> to create the platform-specific
native pbcs.

=head1 PLATFORMS

  _1   i386 32 bit opcode_t, 32 bit intval   (linux-gcc-ix86, freebsd-gcc, cygwin)
  _2   i386 32 bit opcode_t, 32 bit intval, 12 bit long double (linux-gcc-ix86)
  _3   PPC BE 32 bit opcode_t, 32 bit intval (darwin-ppc)
  _4   x86_64 double float 64 bit opcode_t   (linux-gcc-x86_64, solaris-cc-64int)
  _5   x86_64 16 bit long double 64 bit opcode_t (linux-gcc-x86_64, solaris-cc-64int)
  _6   big-endian 64 bit opcode_t, 8 byte double (Sparc64/Solaris, MIPS irix)
  _7   big-endian 64 bit opcode_t, 16 byte long double (Sparc64/Solaris, MIPS irix)

=cut

=begin comment

The PBC is generated from t/op/string_133.pasm for different architectures.
Actually, there is a single architecture right now.

For adding tests, see the comments in t/native_pbc/number.t

=cut

sub bc_version($) {
    my $f = shift;
    my $b;
    open my $F, "<", "$f" or return "Can't open $f: $!";
    binmode $F;
    seek $F, 14, 0;
    read $F, $b, 8;
    my ($bc_major, $bc_minor) = unpack "cc", $b;
    return ($bc_major . "." . $bc_minor);
}
my @archtest = qw(4_le 4_le 4_be 8_le 8_le 8_be 8_be 4_le);
sub this_arch {
    return $PConfig{intvalsize}
      . "_"
      . (substr($PConfig{byteorder},0,2) eq '12' ? "le" : "be");
}
my ( $bc_major, $bc_minor ) = Parrot::BuildUtil::get_bc_version();
my $bc = ($bc_major . "." . $bc_minor);
my $arch = this_arch();
# all should pass
my $todo = {};
my $skip = {
  2 => "dummy",
  5 => "dummy"
};
# special failures: 64bit cannot read 32bit
if ($PConfig{ptrsize} == 8) {
    my $todo_msg = "TT #254 64bit cannot read 32bit";
    $skip->{1} = $todo_msg;
    $skip->{3} = $todo_msg;
    $skip->{8} = $todo_msg;
}

my $output = << 'END_OUTPUT';
%Ec
Dw
ABCX
   X
END_OUTPUT

# test_pbc_string(1, "i386 8-byte double float, 32 bit opcode_t");
sub test_pbc_string {
    my $id   = shift;
    my $desc = shift;
    my $file = "t/native_pbc/string_$id.pbc";
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
          if ($bc ne bc_version($file));
        my $todo_msg = $todo->{$id};
        if (length $todo_msg > 2) {
            $todo_msg = "$cvt $todo_msg"
        }
        else {
            $todo_msg = "$cvt yet untested, TT #357. "
                       . "Please report success."
        }
        pbc_output_is( undef, $output, "$cvt $desc",
                       todo => "$todo_msg" );
    }
    else {
        skip $skip_msg, 1
          if ($bc ne bc_version($file));
        pbc_output_is( undef, $output, "$cvt $desc" );
    }
  }
}

# execute t/native_pbc/string_1.pbc
#
# HEADER => [
#         wordsize  = 4   (interpreter's wordsize/INTVAL = 4/4)
#         byteorder = 0   (interpreter's byteorder       = 0)
#         floattype = 0   (interpreter's NUMVAL_SIZE     = 8)
#         parrot-version 0.9.1, bytecode-version 3.36
#         UUID type = 0, UUID size = 0
#         no endianize, no opcode, no numval transform
#         dirformat = 1
# ]
test_pbc_string(1, "i386 LE 32 bit opcode_t, 4-byte int" );
test_pbc_string(2, "dummy" );
test_pbc_string(3, "PPC BE 32 bit opcode_t, 4-byte int");
test_pbc_string(4, "i86_64 LE 64 bit opcode_t, 8-byte int");
test_pbc_string(5, "dummy" );
test_pbc_string(6, "big-endian 64-bit, 8-byte int, 8-byte double");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
