#! perl -w
################################################################################
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$
################################################################################

=head1 NAME

tools/dev/manicheck.pl - Check the MANIFEST file

=head1 SYNOPSIS

    % perl tools/dev/manicheck.pl

=head1 DESCRIPTION

Check the contents of the F<MANIFEST> file against the files present in
this directory tree, accounting for CVS ignore files. Prints out the
number of I<missing>, I<expected>, I<ignored> and I<extra> files, and
then any extra files are listed.

=cut

################################################################################

use strict;

# CVS built-in patterns
my @base_patterns = qw(^CVS$ ^\.cvsignore$ ^core$ ^.*\.o$);

use ExtUtils::Manifest;

my $manifest = ExtUtils::Manifest::maniread();
my $filelist = ExtUtils::Manifest::manifind();

my @ignore_dirs = grep { m#(^|/)\.cvsignore$#; } keys %$filelist;

@ignore_dirs = map { s#(^|/)\.cvsignore$##; $_ } @ignore_dirs;

my %ignore_dirs;

foreach my $dir (@ignore_dirs) {
  my $cvsignore = $dir ne '' ? "$dir/.cvsignore" : '.cvsignore';

  open CVSIGNORE, "<$cvsignore" or die "Could not open $cvsignore.\n";
  my @patterns = <CVSIGNORE>;
  close CVSIGNORE;
  @patterns = map { chomp; s/\*/.*/g; "^$_\$"; } @patterns;

  $ignore_dirs{$dir} = [ @patterns, @base_patterns ];
}

my %matches;

foreach (keys %$filelist) { $matches{$_}++; }
foreach (keys %$manifest) { $matches{$_}--; }

my @missing;
my @expected;
my @ignored;
my @extra;

printf "Found %d distinct files among MANIFEST and directory contents.\n\n",
  scalar(keys %matches);

foreach (sort keys %matches) {
  if ($matches{$_} < 0) {
    push @missing, $_;
  } elsif ($matches{$_} == 0) {
    push @expected, $_;
  } elsif (ignore($_)) {
    push @ignored, $_;
  } else {
    push @extra, $_;
  }
}

printf "  %5d missing\n",  scalar @missing;
printf "  %5d expected\n", scalar @expected;
printf "  %5d ignored\n",  scalar @ignored;
printf "  %5d extra\n",    scalar @extra;

if (@missing) {
  print "\n";
  print "Missing files:\n";
  foreach (@missing) {
    print "  $_\n";
  }
}

#if (@expected) {
#  print "\n";
#  print "Expected files:\n";
#  foreach (@expected) {
#    print "  $_\n";
#  }
#}

#if (@ignored) {
#  print "\n";
#  print "Ignored files:\n";
#  foreach (@ignored) {
#    print "  $_\n";
#  }
#}

if (@extra) {
  print "\n";
  print "Extra files:\n";
  foreach (@extra) {
    print "  $_\n";
  }
}

exit scalar(@missing) or scalar(@extra) ? 1 : 0;

sub ignore
{
  my $file = shift;
  my @path = split(/\//, $file);
  my $dir = "";

  foreach my $element (@path) {  
    if ($ignore_dirs{$dir}) {
      foreach my $pattern (@{$ignore_dirs{$dir}}) {
	return 1 if $element =~ m/$pattern/;
      }
    } else {
      foreach my $pattern (@base_patterns) {
	return 1 if $element =~ m/$pattern/;
      }
    }

    if ($dir eq "") {
      $dir = $element;
    } else {
      $dir = "$dir/$element";
    }
  }

  return 0;
}

