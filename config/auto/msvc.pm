# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: $

=head1 NAME

config/auto/msvc.pm - Microsoft Visual C++ Compiler

=head1 DESCRIPTION

Determines whether the C compiler is actually C<Visual C++>.

=cut

package Configure::Step;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description="Determining if your C compiler is actually Visual C++...";

@args=qw(verbose);

sub runstep {
  my $self = shift;
  my ($verbose) = @_;

  cc_gen("config/auto/msvc/test_c.in");
  cc_build();
  my %msvc = eval cc_run() or die "Can't run the test program: $!";
  cc_clean();

  # Set msvcversion to undef.  This will also trigger any hints-file
  # callbacks that depend on knowing whether or not we're using Visual C++.

  # This key should always exist unless the program couldn't be run,
  # which should have been caught by the 'die' above.
  unless (defined $msvc{_MSC_VER}) {
    Parrot::Configure::Data->set(msvcversion => undef);
    return;
  }
  
  my $major = int ($msvc{_MSC_VER} / 100);
  my $minor = $msvc{_MSC_VER} % 100;
  unless (defined $major && defined $minor) {
    print " (no) " if $verbose;
    $result = 'no';
    Parrot::Configure::Data->set(msvcversion => undef);
    return;
  }

  my $msvcversion = "$major.$minor";
  print " (yep: $msvcversion )" if $verbose;
  $result = 'yes';

  Parrot::Configure::Data->set(
    msvcversion => $msvcversion,
  );

  # Add Visual C++ specifics here
  if ($msvcversion >= 14.00) {
      # Version 14 (aka Visual C++ 2005) warns about unsafe, deprecated
      # functions with the following message.
      #
      # This function or variable may be unsafe. Consider using xxx_s instead.
      # To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help
      # for details.
      Parrot::Configure::Data->add(" ", "ccflags", "-D_CRT_SECURE_NO_DEPRECATE");
  }
}

1;
