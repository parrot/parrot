#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id: pod.t 12838 2006-05-30 14:19:10Z coke $

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

foreach my $file (sort keys(%$manifest)) {
    $file = "$build_dir/$file";
    # skip binary files (including .pbc files)
    next if -B $file;
    # skip missing MANIFEST.generated files
    next unless -e $file;
    next if exists($manifest_gen->{$file});

    # I could make this other way, but this way is more flexible
    next if ($file =~ m!^$build_dir/languages/([^/]+)/! &&
             ! $check_language{$1});



    push @files, $file if $file =~ m!\.c$!;
    push @files, $file if $file =~ m!\.pmc$!;
    push @files, $file if $file =~ m!\.pl$!;
}

plan tests => scalar @files;
check($_) for (@files);

sub check {
  my $f = shift;
  my $g = $f;
  $g =~ s!^$build_dir/!!;
  my $ok = 1;
  open F, $f or die "Can't open file '$f'";
  while ($ok && ($_ = <F>)) {
    $ok = 0 if length > $columns;
  }
  close F;

  ok($ok, $g);
}
