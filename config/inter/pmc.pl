#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/inter/pmc.pl - PMC Files

=head1 DESCRIPTION

Asks the user to select which PMC files to include.

=cut

package Configure::Step;

use strict;
use vars qw($description @args %PMC_PARENTS);
use Parrot::Configure::Step ':inter';

$description = 'Determining what pmc files should be compiled in...';

@args=qw(ask pmc);

# Return the (lowercased) name of the immediate parent of the given
# (lowercased) pmc name.
sub pmc_parent {
    my ($pmc) = @_;

    return $PMC_PARENTS{$pmc} if defined $PMC_PARENTS{$pmc};

    local $/;
    open(PMC, "classes/$pmc.pmc")
      or die "open classes/$pmc.pmc failed: $!";
    local $_ = <PMC>;
    close PMC;

    # Throw out everything but the pmclass declaration
    s/^.*?pmclass//s;
    s/\{.*$//s;

    return $PMC_PARENTS{$pmc} = lc($1) if /extends\s+(\w+)/;
    return $PMC_PARENTS{$pmc} = "default";
}

# Return an array of all
sub pmc_parents {
    my ($pmc) = @_;
    my @parents = ($pmc);
    push @parents, pmc_parent($parents[-1]) until $parents[-1] eq 'default';
    shift(@parents);
    push (@parents, 'perlhash') if ($pmc eq 'OrderedHash');
    return @parents;
}

sub runstep {
  my @pmc=(
    sort
    map  { m{\./classes/(.*)} }
    glob "./classes/*.pmc"
  );


  my $pmc_list = $_[1] || join(' ', @pmc);

  if($_[0]) {
  print <<"END";


The following PMC files are available:
  @pmc
END
    {
      $pmc_list = prompt('Which PMC files would you like?', $pmc_list);
    }
  }
  # XXX:leo do we really need an interactive step for this
  # user could deactivate vital PMCs like PerlHash or SArray
  # so there would be tests needed, that check for vital classes

  # names of class files for classes/Makefile
  (my $pmc_o = $pmc_list) =~ s/\.pmc/\$(O)/g;

  # calls to pmc2c.pl for classes/Makefile
  my $pmc_build = <<"E_NOTE";

# the following part of the Makefile was built by 'config/inter/pmc.pl'

E_NOTE

  foreach my $pmc (split(/\s+/, $pmc_list)) {
      $pmc =~ s/\.pmc$//;

      # make each pmc depend upon its parent.
      my $parent = pmc_parent($pmc).".pmc";
      $parent = "perlhash.pmc $parent" if ($pmc eq 'orderedhash');
      my $parent_headers = '';
      $parent_headers .= "pmc_$_.h " foreach (pmc_parents($pmc));
      $pmc_build .= "$pmc.c pmc_$pmc.h: $parent $pmc.pmc\n";
      $pmc_build .= "\t\$(PMC2C) perlhash.pmc\n" if ($pmc eq 'orderedhash');
      $pmc_build .= "\t\$(PMC2C) $pmc.pmc\n";
      $pmc_build .= "\n";
      $pmc_build .= "$pmc\$(O): \$(NONGEN_HEADERS) $parent_headers pmc_$pmc.h\n";
  }

  # build list of libraries for link line in Makefile
  my $slash = Configure::Data->get('slash');
  (my $pmc_classes_o   = $pmc_o   ) =~ s/^| / classes${slash}/g;
  (my $pmc_classes_pmc = $pmc_list) =~ s/^| / classes${slash}/g;

  # Gather the actual names (with MixedCase) of all of the
  # non-abstract built-in PMCs.
  my @names;
  PMC: foreach my $pmc_file (split(/\s+/, $pmc_list)) {
      my $name;
      open(PMC, "classes/$pmc_file") or die "open classes/$pmc_file: $!";
      my $const;
      while (<PMC>) {
          if (/^pmclass (\w+)(.*)/) {
              $name = $1;
              my $decl = $2;
              $decl .= <PMC> until ($decl =~ s/\{.*//);
	      $const = 1 if $decl =~ /\bconst_too\b/;
              next PMC if $decl =~ /\babstract\b/;
              next PMC if $decl =~ /\bextension\b/;
              last;
          }
      }
      close PMC;
      die "No pmclass declaration found in $pmc_file"
        if ! defined $name;
      # please note that normal and Const PMCs must be in this
      # order
      push @names, $name;
      push @names, "Const$name" if $const;
  }

  Configure::Data->set(
    pmc             => $pmc_list,
    pmc_names       => join(" ", @names),
    pmc_o           => $pmc_o,
    pmc_build       => $pmc_build,
    pmc_classes_o   => $pmc_classes_o,
    pmc_classes_pmc => $pmc_classes_pmc,
  );
}

1;
