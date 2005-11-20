# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/funcptr.pl - Function Pointer Casts

=head1 DESCRIPTION

Verifies that the compiler supports function pointer casts.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description="Verifying that the compiler supports function pointer casts...";

@args=qw(verbose);

sub runstep {
    my $self = shift;
  my $jitcapable=Parrot::Configure::Data->get('jitcapable');

  if ($jitcapable) {
    cc_gen('config/auto/funcptr/test_c.in');
    eval { cc_build(); };

    if ($@ || cc_run() !~ /OK/) {
      print <<"END";
Although it is not required by the ANSI C standard,
Parrot requires the ability to cast from void pointers to function
pointers for its JIT support.

Your compiler does not appear to support this behavior with the
flags you have specified.  You must adjust your settings in order
to use the JIT code.

If you wish to continue without JIT support, please re-run this script
With the '--jitcapable=0' argument.
END
      exit(-1);
    }
    cc_clean();
    print " (yes) " if $_[0];
    $Configure::Step::result = 'yes';
  }
}

1;
