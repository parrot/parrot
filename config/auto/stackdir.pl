package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step qw(:auto :gen);

$description = "Determining stack growth direction...";

@args=qw(miniparrot);

sub runstep {
    my $redir_err = (($ENV{COMSPEC} || "")=~ /command\.com/i) ? "" : "2>&1";

    # Special steps are needed because we want to compile and link
    # three object files together.  This sort of thing ought to get 
    # folded back into Configure.pl.
    genfile('config/auto/stackdir/test0_c.in', 'test0.c');
    genfile('config/auto/stackdir/test1_c.in', 'test1.c');
    genfile('config/auto/stackdir/test2_c.in', 'test2.c');
    
    my($cc, $ccflags, $ldout, $o, $link, $linkflags, 
	   $cc_exe_out, $exe, $libs) =
	Configure::Data->get( qw(cc ccflags ld_out o link linkflags 
	    cc_exe_out exe libs) );
	
    system("$cc $ccflags -I./include -c test0.c >test0.cco $redir_err") and 
        die "C compiler failed (see test0.cco)";
    system("$cc $ccflags -I./include -c test1.c >test1.cco $redir_err") and 
        die "C compiler failed (see test1.cco)";
    system("$cc $ccflags -I./include -c test2.c >test2.cco $redir_err") and 
        die "C compiler failed (see test2.cco)";
    system("$link $linkflags ${cc_exe_out}test$exe test0$o test1$o test2$o $libs >test.ldo $redir_err") and 
	die "Linker failed (see test.ldo)";

  my %results=eval cc_run();
  cc_clean();
  unlink glob "test0.*";
  unlink glob "test1.*";
  unlink glob "test2.*";
  
  for(keys %results) {
    Configure::Data->set($_ => $results{$_});
  }
}

1;
