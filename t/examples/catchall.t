#!perl
# Copyright (C) 2007-2015, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use ExtUtils::Manifest qw(maniread);
use File::Spec qw();
use Test::More;
use Parrot::Config qw(%PConfig);

=head1 NAME

t/examples/catchall.t - Verify all example code at least compiles

=head1 SYNOPSIS

    % prove t/examples/catchall.t

=head1 DESCRIPTION

Verify compilation of all examples that aren't explicitly tested by other
tests. No guarantee is made that these examples I<work>, just that they
compile.

=cut

my $manifest = maniread('MANIFEST');
my %files;
foreach my $file (keys %$manifest) {
  next unless $file =~ m{^examples/.*(pir|pasm)$};
  next if $file =~ m{^examples/tutorial}; # all are tested in tutorial.t
  next if $file =~ m{^examples/pir/befunge}; # language, not testable here
  next if $file =~ m{^examples/languages}; # language, not testable here
  next if $file =~ m{^examples/opengl}; # depends on OpenGL install
  next if $file =~ m{^examples/nci/xlib}; # depends on libX11 install
  $files{$file}=undef;
}

plan tests => scalar keys %files;

foreach my $file (sort keys %files) {
    my $cmd = File::Spec->curdir() . $PConfig{slash} .
              $PConfig{test_prog} . " -o " . File::Spec->devnull() . " " .
              $file;

    is(system($cmd), 0 , $file);
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
