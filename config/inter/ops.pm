# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/inter/ops.pl - Ops Files

=head1 DESCRIPTION

Asks the user to select which ops files to include.

=cut

package Configure::Step;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter';

$description = 'Determining what opcode files should be compiled in...';

@args=qw(ask ops);

sub runstep {
    my $self = shift;
  my @ops=(
    sort {
      if($a =~ /core\.ops/) { return -1 }
      if($b =~ /core\.ops/) { return  1 }
      return               ( $a cmp $b )
    }
    grep { !/vtable\.ops/ }
    glob "ops/*.ops"
  );


  my $ops=join ' ', grep { !/obscure\.ops/ } @ops;

  $ops=$_[1] if defined $_[1];

  # ops selection disabled - until we can build and load
  # opcode subset libs
  if (0 && $_[0]) {
  print <<"END";


The following opcode files are available:
  @ops
END
    {
      $ops=prompt('Which opcode files would you like?', $ops);

      if($ops !~ m{\bcore\.ops}) {
        print "core.ops must be the first selection.\n";
        redo;
      }
    }
  }

  Parrot::Configure::Data->set(
    ops => $ops
  );
}

1;
