#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

t/distro/linelength.t - Test code lines length

=head1 SYNOPSIS

	% prove t/distro/linelength.t

=head1 DESCRIPTION

Tests all source files for the limit of C<n> columns.

=cut

use strict;
use warnings;

our $columns = 80;

use lib qw! . lib ../lib ../../lib !;

use Test::More;
use Parrot::Config;
use ExtUtils::Manifest qw!maniread!;

use vars qw!@files!;

diag "finding source files, this may take a while.";

our %check_language = ( tcl => 1 );

# XXX this should really be using src_dir instead of build_dir but it
# doesn't exist (yet)
my $build_dir = $PConfig{build_dir};
my $manifest     = maniread("$build_dir/MANIFEST");
my $manifest_gen = maniread("$build_dir/MANIFEST.generated");

# Read some extra exceptions
while (<DATA>) {
  next if m!^#!;
  next if m!^\s*$!;
  chomp;
  $manifest_gen->{$_}++;
}

foreach my $file (sort keys(%$manifest)) {
  my $ffile = "$build_dir/$file";

  # skip binary files (including .pbc files)
  next if -B $ffile;

  # skip missing MANIFEST.generated files
  next unless -e $ffile;
  next if exists($manifest_gen->{$file});

  # I could make this other way, but this way is more flexible
  next if ($ffile =~ m!^$build_dir/languages/([^/]+)/!
           &&
           ! $check_language{$1});

  push @files, $ffile if $file =~ m!\.c$!;
  push @files, $ffile if $file =~ m!\.pmc$!;
  # push @files, $ffile if $file =~ m!\.pl$!;
}

plan tests => scalar @files;
check($_) for (@files);

sub check {
  my $f = shift;
  my $l; # will hold the first line to be corrected

  my $g = $f; # will hold the file to be corrected with relative path;
  $g =~ s!^$build_dir/!!;

  my $ok = 1;

  open F, $f or die "Can't open file '$f'";
  while ($ok && ($_ = <F>)) {
    chomp;
    $ok = 0 if length > $columns;
  }
  $l = $.; # save the line number for future reference
  close F;

  # if not ok, print the line where the bug was first found, for
  # easier correction;
  if ($ok) {
    ok($ok, $g)
  } else {
    ok($ok, "$g (line $l)")
  }
}


__DATA__
# Lex and Bison generated
compilers/imcc/imclexer.c
compilers/imcc/imcparser.c
compilers/ast/astlexer.c
compilers/ast/astparser.c
# Generators with big strings
tools/dev/mk_inno.pl
tools/build/jit2c.pl
tools/build/nativecall.pl
tools/dev/lib_deps.pl
tools/dev/parrot_coverage.pl
