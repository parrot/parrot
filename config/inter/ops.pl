package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':inter';

$description = 'Determining what opcode files should be compiled in...';

@args=qw(ask ops);

sub runstep {
  my @ops=(
    sort {
      if($a eq 'core.ops') { return -1 }
      if($b eq 'core.ops') { return  1 }
      return               ( $a cmp $b )
    }
    grep { !/vtable\.ops/ }
    map  { m{\./(.*)}     }
    glob "./*.ops"
  );
  
  
  my $ops=join ' ', grep { !/obscure\.ops/ } @ops;
  
  $ops=$_[1] if defined $_[1];
  
  if($_[0]) {
  print <<"END";


The following opcode files are available:
  @ops
END
    {
      $ops=prompt('Which opcode files would you like?', $ops);
      
      if($ops !~ m{^\s*core\.ops}) {
        print "core.ops must be the first selection.\n";
        redo;
      }
    }
  }
  
  Configure::Data->set(
    ops => $ops
  );
}

1;