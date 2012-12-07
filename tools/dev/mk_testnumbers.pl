#! perl

# Copyright (C) 2012, Parrot Foundation.

=head1 NAME

mk_testnumbers.pl - Create shellscript to test numeric pbc converters

=head1 SYNOPSIS

  perl tools/dev/mk_testnumbers.pl
  tools/dev/testnumbers

=head1 DESCRIPTION

To test numeric converters we need to create 64 and 32 bit parrots, with all supported floatval types,
on a little endian (best a 64-bit intel with gcc multilib support) and a big endian machine (best a
powerpc with gcc multilib support).

Checks if C<ccache cc> can be used.

=cut

use 5.008;
use strict;
use warnings;
use lib 'lib';
use Config;
use Parrot::Config qw/ %PConfig /;

my @floatval = ('float', '__float128', '"long double"', 'double');
my $filename = 'tools/dev/testnumbers';

use vars qw($make $floatval $cc $qcc $perl $startsh);
$make = $PConfig{make};
$perl = $PConfig{perl};
$startsh = $Config{startsh};
$floatval = join(" ",@floatval);
$cc = $qcc = '';

my $ccache;
if (-x '/usr/bin/ccache') {
  $ccache = "--cc='ccache cc' --ld='ccache cc' --link='ccache cc'";
}
elsif ($PConfig{cc} =~ /ccache /) {
  $ccache = "--cc='$PConfig{cc}' --ld='$PConfig{ld}' --link='$PConfig{link}'";
}
if ($ccache) {
  $qcc = $ccache;
  $qcc =~ s/'/\\"/g;
  $cc = $ccache;
}

my $data;
if ($^O eq 'MSWin32') {
  $filename .= '.bat';
  $filename =~ s/\//\\/g;

  my $result = <<'_EOW';
@echo off
set conf="--without-icu --without-gmp --without-libffi --without-pcre --without-opengl"
_EOW
  $data = <<'_EOW';
@@make@@ clean archclean
echo perl Configure.pl --floatval="@@f@@" @@cc@@ %conf%
perl Configure.pl --floatval="@@f@@" @@cc@@ %conf% & @@make@@ -s parrot & echo floatval=@@f@@ & perl t\\harness t\\native_pbc\\number.t
_EOW

  for my $f (@floatval) {
    my ($tmp) = $data =~ s/@\@f@@/$f/gm;
    $result .= $tmp;
  }
  $data = $result;
}
else {

  my $result = <<'_EOP';
@@startsh@@
conf="--without-icu --without-gmp --without-libffi --without-pcre --without-opengl"
for f in @@floatval@@; do
_EOP

  $data = <<'_EOP';
  @@make@@ -s clean archclean 2>/dev/null
  echo @@perl@@ Configure.pl --floatval="$f" @@qcc@@ $conf $*
  @@perl@@ Configure.pl --floatval="$f" @@cc@@ $conf $* >/dev/null && \
    @@make@@ -s parrot 2>/dev/null && echo floatval=$f && @@perl@@ t/harness t/native_pbc/number.t

_EOP

  if ($PConfig{ptrsize} == 8) {
    my $tmp = $data;
    $tmp =~ s/Configure.pl/Configure.pl --m=32/gm;
    $data .= $tmp;
  }
  $data = $result . $data . "done\n";
}

foreach my $t (qw(floatval qcc cc make perl startsh)) {
  no strict 'refs';
  my $v = $$t;
  $data =~ s/@\@$t@@/$v/gm;
}

open my $fh, ">", $filename or die "Could not write $filename: $!";
print $fh $data;
close $fh;
chmod 0755, $filename;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
