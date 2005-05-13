# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/gen/icu.pl - ICU

=head1 DESCRIPTION

Configures ICU and add appropriate targets to the Makefile.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Cwd qw(cwd);
use Parrot::Configure::Step qw(capture_output);

$description = "Determining whether ICU is installed";

@args = qw(verbose icudatadir icushared icuheaders icu-config without-icu);

sub runstep {
  my ($verbose, $icudatadir, $icushared, $icuheaders, $icuconfig, $without) = @_;

  my @icu_headers = qw(ucnv.h utypes.h uchar.h);
  my $autodetect =    !defined($icudatadir)
                   && !defined($icushared)
                   && !defined($icuheaders);

  $Configure::Step::result = undef;
  unless ($without) {
    if (!$autodetect) {
      print "specified a icu config parameter,\nICU autodetection disabled.\n" if $verbose;
    } elsif (!defined $icuconfig || !$icuconfig) {
      my (undef, undef, $ret) = capture_output("icu-config", "--exists");

      if (($ret == -1) || (($ret >> 8) != 0)) {
        undef $icuconfig;
        $autodetect = 0;
        $without = 1;
      } else {
        $icuconfig = "icu-config";
        print "icu-config found... good!\n" if $verbose;
      }
    }
  
    if (!$without && $autodetect && $icuconfig && $icuconfig ne "none") {
      my $slash = Configure::Data->get('slash');
  
      # icu-config script to use
      $icuconfig = "icu-config" if $icuconfig eq "1";
  
      # ldflags
      $icushared = capture_output("$icuconfig --ldflags");
      if (defined $icushared) {
        chomp $icushared;
        $icushared =~ s/-licui18n\w*//;     # "-licui18n32" too
        # $icushared =~ s/-licudata\w*//;
        $without = 1 if length $icushared == 0;
      }

      # location of header files
      $icuheaders = capture_output("$icuconfig --prefix");
      if (defined $icuheaders) {
        chomp $icuheaders;
        $without = 1 unless -d $icuheaders;
        $icuheaders .= "${slash}include";
        $without = 1 unless -d $icuheaders;
      }

      # icu data dir
      $icudatadir = capture_output("$icuconfig --icudatadir");
      if (defined $icudatadir) {
        chomp $icudatadir;
        $without = 1 unless -d $icudatadir;
      }
      
      if ($without) {
        $Configure::Step::result = "failed";
      }
    }
  }
    
  if ($verbose) {
    print "icuconfig: $icuconfig\n" if defined $icuconfig;
    print "icushared='$icushared'\n" if defined $icushared;
    print "headers='$icuheaders'\n" if defined $icuheaders;
    print "datadir='$icudatadir'\n" if defined $icudatadir;
  }

  if ($without) {
    Configure::Data->set(
      has_icu     => 0,
      icu_shared  => '',  # used for generating dynclasses/Makefile
      icu_datadir => '',  # used for generation Makefile
    );
    $Configure::Step::result = "no" unless defined $Configure::Step::result;
    return;
  }

  my $ok = 1;
  
  unless (defined $icushared) {
    warn "error: icushared not defined\n";
    $ok = 0;
  }

  unless (defined $icuheaders and -d $icuheaders) {
    warn "error: icuheaders not defined or invalid\n";
    $ok = 0;
  } else {
    $icuheaders =~ s![\\/]$!!;
    foreach my $header ( @icu_headers ) {
      $header = "$icuheaders/unicode/$header";
      unless (-e $header) {
        $ok = 0;
        warn "error: ICU header '$header' not found\n";
      }
    }
  }

  unless (defined $icudatadir and -d $icudatadir ) {
    warn "error: icudatadir not defined or invalid\n";
    $ok = 0;
  } else {
    $icudatadir =~ s![\\/]$!!;
  }

  die <<"HELP" unless $ok; # this text is also in Configure.PL!
Something is wrong with your ICU installation!
   
   If you do not have a full ICU installation:

   --without-icu        Build parrot without ICU support
   --icu-config=(file)  Location of icu-config
   --icuheaders=(path)  Location of ICU headers without /unicode
   --icushared=(flags)  Full linker command to create shared libraries
   --icudatadir=(path)  Directory to locate ICU's data file(s)
HELP
#'
  
  Configure::Data->set(
    has_icu     => 1,
    icu_shared  => $icushared,
    icu_headers => join( ' ', @icu_headers ),
    icu_datadir => $icudatadir,
  );

  # Add -I $Icuheaders if necessary
  my $header = "unicode/ucnv.h";
  Configure::Data->set(testheaders =>"#include <$header>\n");
  Configure::Data->set(testheader => "$header");
  cc_gen('config/auto/headers/test_c.in');

  Configure::Data->set(testheaders => undef);  # Clean up.
  Configure::Data->set(testheader => undef);
  eval { cc_build(); };
  if (!$@ && cc_run() =~ /^$header OK/) {
    # Ok, we don't need anything more.
    print "Your compiler found the icu headers... good!\n" if $verbose;
  }
  else {
    print "Adding -I $icuheaders to ccflags for icu headers.\n" if $verbose;
    Configure::Data->add(' ',
    ccflags    => "-I $icuheaders");
  }
  cc_clean();

  $Configure::Step::result = "yes";

}

1;
