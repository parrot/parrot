package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':inter';

use Config;

$description = 'Determining what C compiler and linker to use...';

@args = qw(ask cc ld ccflags ldflags libs debugging);

sub runstep {
  my %args;
  @args{@args}=@_;
  
  my($cc, $ld, $ccflags, $ldflags)=Configure::Data->get(qw(cc ld ccflags ldflags));
  $ccflags =~ s/-D(PERL|HAVE)_\w+\s*//g;
  $ldflags =~ s/-libpath:\S+//g;
  my $debug='n';
  
  my $libs=join ' ',
           grep { $^O=~/VMS|MSWin/ || !/^-l(c|gdbm|dbm|ndbm|db)$/ }
           split ' ', $Config{libs};
  
  $cc=$args{cc}           if defined $args{cc};
  $ld=$args{ld}           if defined $args{ld};
  $ccflags=$args{ccflags} if defined $args{ccflags};
  $ldflags=$args{ldflags} if defined $args{ldflags};
  $libs=$args{libs}       if defined $args{libs};
  $debug=$args{debugging} if defined $args{debugging};
  
  if($args{ask}) {
    print <<'END';


Okay, I'm going to start by asking you a couple questions about your
compiler and linker.  Default values are in square brackets; you can
hit ENTER to accept them.  If you don't understand a question, the 
default will usually work--they've been intuited from your Perl 5
configuration.

END

    $cc=prompt("What C compiler do you want to use?", $cc);
    $ld=prompt("How about your linker?", $ld);
    $ccflags=prompt("What flags should your C compiler receive?", $ccflags);
    $ldflags=prompt("And your linker?", $ldflags);
    $libs=prompt("What libraries should your C compiler use?", $libs);
    $debug=prompt("Do you want a debugging build of Parrot?", $debug);
  }

  if(!$debug || $debug =~ /n/i) {
    Configure::Data->set(
      cc_debug => '',
      ld_debug => ''
    );
  }
  
  Configure::Data->set(
    cc      => $cc,
    ld      => $ld,
    ccflags => $ccflags,
    ldflags => $ldflags,
    libs    => $libs
  );
}

1;