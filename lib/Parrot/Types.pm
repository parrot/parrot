#
# Types.pm
#
# $Id$
#
package Parrot::Types;
use strict;
use Exporter;
use Carp;
use Parrot::Config;

@Parrot::Types::ISA = qw(Exporter);
@Parrot::Types::EXPORT = qw(
    &sizeof 

    &pack_byte
    &pack_intval
    &pack_floatval
    &pack_sv
    &pack_op
    &pack_arg
    &pack_key

    &unpack_byte
    &unpack_intval
    &unpack_floatval
    &unpack_sv
    &unpack_key
    &unpack_op
    &unpack_ops
    &unpack_arg

    &shift_byte
    &shift_intval
    &shift_floatval
    &shift_sv
    &shift_key
    &shift_op
    &shift_arg
);

my %pack_type = (
    b  => $PConfig{packtype_b},
    i  => $PConfig{packtype_i},
    n  => $PConfig{packtype_n},
    op => $PConfig{packtype_op},
);

my %how_to_pack = (
    I  => $pack_type{op},
    i  => $pack_type{op},
    P  => $pack_type{op},
    p  => $pack_type{op},
    N  => $pack_type{op},
    n  => $pack_type{op},
    S  => $pack_type{op},
    s  => $pack_type{op},
    K  => $pack_type{op},
    k  => $pack_type{op},
    KI => $pack_type{op},
    ki => $pack_type{op},
    r  => $pack_type{op},
    D  => $pack_type{op},
    op => $pack_type{op},
    byte => $pack_type{b},
    intval => $pack_type{i},
    floatval => $pack_type{n},
);

my %sizeof;
foreach (keys %how_to_pack) {
    $sizeof{$_}=length(pack($how_to_pack{$_},0));
}

sub sizeof { 
    my $what = shift; 
    croak "Don't know what a $what is" unless exists $sizeof{$what};
    return $sizeof{$what};
}

sub pack_byte { return pack  ($how_to_pack{byte}, shift) }
sub pack_intval   { return pack  ($how_to_pack{intval}, shift) }
sub pack_floatval   { return pack  ($how_to_pack{floatval}, shift) }
sub pack_sv   { return shift->pack }
sub pack_key  { return shift->pack }
sub pack_op   { return pack  ($how_to_pack{op}, shift) }

sub unpack_byte { return unpack($how_to_pack{byte}, shift) } 
sub unpack_intval { return unpack($how_to_pack{intval}, shift) } 
sub unpack_floatval { return unpack($how_to_pack{floatval}, shift) } 
sub unpack_op { return unpack($how_to_pack{op}, shift) } 
sub unpack_ops { return unpack("$how_to_pack{op}*", shift) } 

sub shift_byte{ my $byte = substr($_[0], 0, sizeof("byte"), ''); return unpack_byte($byte) }
sub shift_intval  { my $intval = substr($_[0], 0, sizeof("intval"), ''); return unpack_intval($intval) }
sub shift_floatval  { my $floatval = substr($_[0], 0, sizeof("floatval"), ''); return unpack_floatval($floatval) }
sub shift_sv  {
  my $flags    = shift_intval($_[0]);
  my $encoding = shift_intval($_[0]);
  my $type     = shift_intval($_[0]);
  my $size     = shift_intval($_[0]);

  my $align = sizeof("intval");

  my $under      = ($size % $align) ? $align - ($size % $align) : 0;
  my $block_size = $size + $under;
  my $data       = substr($_[0], 0, $block_size, '');
  $data = substr($data, 0, $size);

  return new Parrot::String $flags, $encoding, $type, $size, $data;
}
sub shift_key {
  my $atoms = shift_intval($_[0]);
  my @atoms;

  for (1..$atoms) {
    my $type = shift_intval($_[0]);
    my $value = shift_intval($_[0]);

    push @atoms, { TYPE => $type, VALUE => $value };
  }

  return new Parrot::Key [ @atoms ];
}
sub shift_op  { my $op = substr($_[0], 0, sizeof("op"), ''); return unpack_op($op) }

sub pack_arg  { 
    croak "Don't know what a $_[0] is" unless exists $sizeof{$_[0]};
    return pack  ($how_to_pack{$_[0]}, $_[1]) 
}
sub unpack_arg{ 
    croak "Don't know what a $_[0] is" unless exists $sizeof{$_[0]};
    return unpack($how_to_pack{$_[0]}, $_[1]) 
}
sub shift_arg { 
    my $arg = substr($_[1], 0, sizeof($_[0]), ''); 
    return unpack_arg($_[0], $arg) 
}

1;

__END__

=head1 NAME

Parrot::Types - Basic types for Parrot

=head1 SYNOPSIS

  use Parrot::Types;

  $opcode = pack_op($opnumber) . pack_arg("I", $ireg) . ...

=head1 DESCRIPTION
