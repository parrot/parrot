#! perl

=pod

This is used to generate nci tests for nci signatures.
useful in debugging nci

=cut

use strict;
use warnings;
use Data::Dumper;

sub perl_test_prefix {
my $temp = <<'EOT';
#! perl
# Copyright (C) 2001-2008, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 67;
use Parrot::Config qw(%PConfig);

=head1 NAME

t/pmc/nci.t - test the Native Call Interface

=head1 SYNOPSIS

    % prove t/pmc/nci.t

=head1 DESCRIPTION

This tests the Native Call Interface, that is the ParrotLibrary PMC.
Most tests are skipped when the F<libnci_test.so> shared library is not found.

=head1 SEE ALSO

  F<docs/pdds/pdd16_native_call.pod>
  F<config/gen/makefiles/root.in>
  F<src/nci_test.c>

=cut

$ENV{TEST_PROG_ARGS} ||= '';

SKIP: {
    unless ( -e "runtime/parrot/dynext/libnci_test$PConfig{load_ext}" ) {
        skip( "Please make libnci_test$PConfig{load_ext}", Test::Builder->expected_tests() );
    }
}
EOT
return $temp;
}

sub perl_test_suffix {
my $temp = <<'EOT';

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
EOT
return $temp;
}

sub c_prefix {
my $temp = <<'EOT';
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <parrot/config.h>

#ifdef __cplusplus
extern "C" {
#endif
EOT
return $temp;
}

sub c_suffix {
my $temp = <<'EOT';
#ifdef __cplusplus
}
#endif
/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
EOT
return $temp;
}

sub pirprefix {
my $temp = <<EOT;
.sub test :main
  .local string library_name
  library_name = 'libnci_test'
  .local pmc libnci_test
  libnci_test = loadlib  library_name
EOT
print $temp;
}

my $sig_ret_type_id = {
  'i' => "I",
  't' => "S",
  'p' => "P",
  'v' => "",
  'c' => "S",
  'd' => "N",
  'f' => "N",
  'J' => "P",
  'P' => "P",
};
my $sig_arg_type_id = { %$sig_ret_type_id };
$sig_arg_type_id->{'c'} = "c";

my $c_ret_type_id = {
  'i' => "int ",
  't' => "char *",
  'p' => "void *",
  'v' => "void ",
  'c' => "char ",
  'd' => "double ",
  'f' => "float ",
  'J' => "void *",
  'P' => "void *",
};

my $printf_sig_type = {
  'i' => "%i",
  't' => "%s",
  'p' => "%p",
  'v' => "",
  'c' => "%c",
  'd' => "%lf",
  'f' => "%f",
  'J' => "%p",
  'P' => "%p",
};

sub rand_int {
  my ($minimum, $range) = @_;

  my $random_number = int(rand($range)) + $minimum;
  return $random_number;
}

sub gen_rand_int {
  return rand_int(10, 50000);
}

sub gen_rand_char {
  return rand_int(66, 26);
}

sub gen_rand_float {
  my $n1 = gen_rand_int();
  my $n2 = gen_rand_int();
  return "$n1.$n2";
}

sub gen_rand_string {
  my $n1 = gen_rand_int();
  return "RANDOM$n1";
}

sub gen_rand_hexaddr {
  my $i_to_hex = {
    0 => 0, 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9=>9,
    10 => 'a', 11 => 'b', 12 => 'c', 13 => 'd', 14 => 'e', 15 => 'f',
  };
  my $hex = "0x";
  for (1 .. 8) {
    $hex .= $i_to_hex->{rand_int(0,15)};
  }
  return $hex;
}
sub gen_rand_value {
  my ($cursigc) = @_;
  my $pirsigc = $sig_arg_type_id->{$cursigc};
  my $param = "";

  if ($pirsigc eq 'I') { $param = gen_rand_int(); }
  elsif ($pirsigc eq 'N') { $param = gen_rand_float(); }
  elsif ($pirsigc eq 'S') { $param = gen_rand_string(); }
  elsif ($pirsigc eq 'P') { $param = gen_rand_hexaddr(); }
  elsif ($pirsigc eq 'c') { $param = gen_rand_char(); }
  else {
    print "ERROR $cursigc, $pirsigc\n";
  }
  return $param;
}

sub gen_rand_wrapped_value {
  my ($cursigc) = @_;
  my $pirsigc = $sig_arg_type_id->{$cursigc};
  my $param = gen_rand_value(@_);
  my $wparam = $param;
  if ($pirsigc eq 'S') { $wparam = "\"" . $param . "\""; }
  if ($pirsigc eq 'N') { $param = sprintf("%.06f", +$param); }
  elsif ($pirsigc eq 'c') { $param = chr($param); }
  return ($wparam, $param);
}

sub gen_pir_return {
  my ($sig) = @_;
  my $ret = "";
  my $sayret = "";
  my $crettype = "void ";
  my $pirretval = "";

  my $c_ret_type = substr($sig, 0, 1);
  my $ret_type = $sig_ret_type_id->{$c_ret_type};
  unless ($ret_type eq '') {
    $ret = "\$${ret_type}0 = ";
    $sayret = "say \$${ret_type}0";
    $crettype = $c_ret_type_id->{$c_ret_type};
    $pirretval = gen_rand_value($c_ret_type);
  }
  return ($ret, $sayret, $crettype, $pirretval);
}

sub gen_pir_sig {
  my ($sig) = @_;
  my @pirsigs;
  my @pirsigssay;

  for my $cursigc (split(//, substr($sig, 1, length $sig))) {
    my ($w, $uw) = gen_rand_wrapped_value($cursigc);
    push @pirsigs, $w;
    push @pirsigssay, $uw;
  }

  my $pirsig = join(", ", @pirsigs);
  my $pirsigsay = join("\n", @pirsigssay);
  return ($pirsig, $pirsigsay, \@pirsigs);
}

sub gen_c_sig {
  my ($sig) = @_;
  my @csig;
  my @printfformat;
  my @printfsig;

  my $i = 1;
  for my $cursigc (split(//, substr($sig, 1, length $sig))) {
    push @csig, $c_ret_type_id->{$cursigc} ."_$i";
    push @printfformat, $printf_sig_type->{$cursigc};
    push @printfsig, "_$i";
    $i++;
  }

  my $csig = join(", ", @csig);
  my $printfformat = join("\\n", @printfformat);
  my $printfsig = join(", ", @printfsig);
  return ($csig, $printfformat, $printfsig);
}

sub gen_nci_test {
  my ($fh, $sig) = @_;
  my ($ret, $sayret, $crettype, $pirretval) = gen_pir_return($sig);
  my ($pirsig, $pirsigsay) = gen_pir_sig($sig);
  my ($csig, $printfformat, $printfsig) = gen_c_sig($sig);
  $printfformat .= '\n' unless $printfformat eq "";
  my $printfline = "";
  $printfline = "\n  printf(\"$printfformat\", $printfsig);\n  fflush(stdout);" unless $printfformat eq "";

  my $pircode = <<EOT;
  .local pmc nci_$sig
  nci_$sig = dlfunc libnci_test, "nci_$sig", "$sig"
  ${ret}nci_$sig($pirsig)
  $sayret
EOT

  my $pirretvalf = "";
  $pirretvalf = " " . $pirretval unless $pirretval eq "";

  my $ccode = <<EOT;
PARROT_EXPORT ${crettype}nci_$sig($csig) {$printfline
  return$pirretvalf;
}
EOT

  my $output = "";
  $output = "\n$pirsigsay"  unless $pirsigsay eq "";
  unless ($pirretval eq "") {
    $output .= "\n" unless $output eq "";
    $output .= "$pirretval"
  }

  return (gen_perl_test($sig, $pircode, $output), $ccode);
}

sub gen_perl_test {
  my ($sig, $pircode, $output) = @_;
my $temp = <<EOT;
pir_output_is( << 'CODE', << 'OUTPUT', "nci_$sig - $sig test" );
.sub test :main
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib  library_name

$pircode
.end
CODE$output
OUTPUT
EOT
return $temp;
}

sub pirsuffix {
print <<EOT;
.end
EOT
}

sub main {
my @test = qw{
it
p
v
vc
vcccc
vd
vdddd
vddddddddd
vf
vfff
vffff
vi
vii
viif
viii
viiii
viip
vp
vpddii
vJP
};

open(my $cout, q{>}, "nci_test.c");
open(my $perlout, q{>}, "nci_me.t");
print $perlout perl_test_prefix();
print $cout c_prefix();

for my $x (@test) {
  chomp $x;
  my ($perlcode, $ccode) = gen_nci_test("", $x);
  print $perlout "$perlcode\n";
  print $cout "$ccode";
}

print $perlout perl_test_suffix();
print $cout c_suffix();

close $perlout;
close $cout;
system('cp nci_test.c src');
system('make');
system('perl nci_me.t');
}

main();

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
