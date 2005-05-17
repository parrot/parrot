#! perl -w
################################################################################
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
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
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Data::Dumper;
use ExtUtils::Manifest;
use File::Spec;
use Parrot::Distribution;
use Parrot::Revision;
use Parrot::Configure::Step qw(capture_output);

# CVS built-in patterns
my @base_patterns = qw(^\.svn$ ^core$ ^.*\.o$);

my $manifest  = ExtUtils::Manifest::maniread();
my $file_list = ExtUtils::Manifest::manifind();
my %dir_list  = map { ( File::Spec->splitpath( $_ ) )[1] => 1 } keys %{$file_list};
$dir_list{'./'} = 1;

# manicheck.pl is propably only useful for checked out revisions
# Checkout is done either with svn or svk
my $svn_cmd = $Parrot::Revision::svn_entries =~ m/\.svn/ ? 'svn' : 'svk';
my $dist = Parrot::Distribution->new();
my $skip = $dist->gen_manifest_skip( );
die Dumper( $skip );

# directories with
my @ignore_dirs; 

# Ask all directories about svn:ignore file patterns
my %ignore_dirs;

foreach my $dir ( keys %dir_list ) {
  
  next unless $dir;
  next if $dir =~ m/\.svn/;
  next unless -d $dir; 
  #my $cvsignore = $dir ne '' ? "$dir/.cvsignore" : '.cvsignore';

  #open CVSIGNORE, "<$cvsignore" or die "Could not open $cvsignore.\n";
  #my @patterns = <CVSIGNORE>;
  #close CVSIGNORE;
  my @patterns = `$svn_cmd propget svn:ignore $dir`;
  @patterns = map { chomp; s/\*/.*/g; "^$_\$"; } @patterns;
die Dumper( $dir, \@patterns );

  $ignore_dirs{$dir} = \@patterns if scalar(@patterns);
}
die Dumper( \%ignore_dirs );

my %matches;

foreach (keys %$file_list) { $matches{$_}++; }
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


=head2 gen_manifest_skip

Take a list of dirs and ask svn of svk about them and generate a MANIFEST.SKIP.

=cut

sub gen_manifest_skip {
   my ( $dir_list, $svn_cmd ) = @_;
 
   my @skip;     # regular expressions for files to skip
   foreach my $dir ( sort keys %dir_list ) {
  
       next unless $dir;
       next unless $dir =~ m/\/$/;
       next if $dir =~ m/\.svn/;
       next unless -d $dir; 

       my $patterns = capture_output( "$svn_cmd propget svn:ignore $dir" );
       # TODO: escape chars that are special in regular expressions
       push @skip, qq{# generated from svn:ignore of '$dir'},
                   map { s/\*/.*/g;       # * is any amount of chars
                         s/\./\./g;       # . is simple a dot
                         "^${dir}${_}\$"; # SVN globs are specific to a dir
                       } split( /\n/, $patterns );
    }

     return \@skip;
}

