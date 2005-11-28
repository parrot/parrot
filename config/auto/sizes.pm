# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/sizes.pm - Various Sizes

=head1 DESCRIPTION

Determines the sizes of various types.

=cut

package Configure::Step;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description = "Determining some sizes...";

@args=qw(miniparrot);

sub runstep {
    my $self = shift;

    if (defined $_[0]) {
        Parrot::Configure::Data->set(
          'doublesize'       => 8,
          'numvalsize'       => 8,
          'nvsize'           => 8,
          'floatsize'        => 4,
          'opcode_t_size'    => 4,
          'ptrsize'          => 4,
          'intvalsize'       => 4,
          'intsize'          => 4,
          'longsize'         => 4,
          'shortsize'        => 2,
          'hugeintval'       => 'long',
          'hugeintvalsize'   => 4,
	  'hugefloatval'     => 'double',
          'hugefloatvalsize' => 8,
	  'int2_t'           => 'int',
	  'int4_t'           => 'int',
	  'float4_t'         => 'double',
	  'float8_t'         => 'double',
        );
        return;
    }


  cc_gen('config/auto/sizes/test_c.in');
  cc_build();
  my %results=eval cc_run();
  cc_clean();

  for(keys %results) {
    Parrot::Configure::Data->set($_ => $results{$_});
  }

  if($results{ptrsize} != $results{intvalsize}) {
    print <<"END";

Hmm, I see your chosen INTVAL isn't the same size as your pointers.  Parrot
should still compile and run, but you may see a ton of warnings.
END
  }

  # set fixed sized types
  if ($results{shortsize} == 2) {
    Parrot::Configure::Data->set('int2_t' => 'short');
  }
  else {
    Parrot::Configure::Data->set('int2_t' => 'int');
    print <<'END';

Can't find a int type with size 2, conversion ops might fail!

END
  }
  if ($results{shortsize} == 4) {
    Parrot::Configure::Data->set('int4_t' => 'short');
  }
  elsif ($results{intsize} == 4) {
    Parrot::Configure::Data->set('int4_t' => 'int');
  }
  elsif ($results{longsize} == 4) {
    Parrot::Configure::Data->set('int4_t' => 'long');
  }
  else {
    Parrot::Configure::Data->set('int4_t' => 'int');
    print <<'END';

Can't find a int type with size 4, conversion ops might fail!

END
  }

  if ($results{floatsize} == 4) {
    Parrot::Configure::Data->set('float4_t' => 'float');
  }
  else {
    Parrot::Configure::Data->set('float4_t' => 'double');
    print <<'END';

Can't find a float type with size 4, conversion ops might fail!

END
  }
  if ($results{doublesize} == 8) {
    Parrot::Configure::Data->set('float8_t' => 'double');
  }
  else {
    Parrot::Configure::Data->set('float8_t' => 'double');
    print <<'END';

Can't find a float type with size 8, conversion ops might fail!

END
  }

  my %hugeintval;
  my $intval     = Parrot::Configure::Data->get('iv');
  my $intvalsize = Parrot::Configure::Data->get('intvalsize');
  # Get HUGEINTVAL, note that we prefer standard types
  foreach my $type ('long', 'int', 'long long', '__int64') {

    Parrot::Configure::Data->set('int8_t' => $type);
    eval {
      cc_gen('config/auto/sizes/test2_c.in');
      cc_build();
      %hugeintval=eval cc_run();
    };

    # clear int8_t on error
    if($@ || !exists $hugeintval{hugeintval}) {
      Parrot::Configure::Data->set('int8_t' => undef);
      next;
    }

    if ($hugeintval{hugeintvalsize} > $intvalsize) {
        # We found something bigger than intval.
        Parrot::Configure::Data->set(%hugeintval);
        last;
    }
  }
  if (!defined($hugeintval{hugeintvalsize}) ||
      $hugeintval{hugeintvalsize} == $intvalsize) {
      # Could not find anything bigger than intval. 
      Parrot::Configure::Data->set(
          hugeintval     => $intval,
          hugeintvalsize => $intvalsize,
      );
  }

  cc_clean();

  #get HUGEFLOATVAL
  if(my $size=eval {
    open(TEST, ">test.c") or die "Can't open test.c: $!";
    print TEST <<'END';
#include <stdio.h>

int main() {
    long double foo;
    printf("%u", sizeof(foo));
    return 0;
}
END
    close TEST;

    cc_build();
    cc_run();
  }) {
    Parrot::Configure::Data->set(
        'hugefloatval'      => 'long double',
        'hugefloatvalsize'  => $size
    );
  }
  else {
    Parrot::Configure::Data->set(
        'hugefloatval'      => 'double',
        'hugefloatvalsize'  => Parrot::Configure::Data->get('doublesize')
    );
  }

  cc_clean();
}

1;
