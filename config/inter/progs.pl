package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':inter';

$description = 'Determining what C compiler and linker to use...';

@args = qw(ask cc link ld ccflags ccwarn linkflags ldflags libs debugging);

sub runstep {
  my %args;
  @args{@args}=@_;
  
  my($cc, $link, $ld, $ccflags, $linkflags, $ldflags, $libs) = 
      Configure::Data->get(qw(cc link ld ccflags linkflags ldflags libs));
  $ccflags =~ s/-D(PERL|HAVE)_\w+\s*//g;
  $linkflags =~ s/-libpath:\S+//g;
  $ldflags =~ s/-libpath:\S+//g;
  my $debug='n';
  my $cc_warn='';
  
  $libs=join ' ',
           grep { $^O=~/VMS|MSWin/ || !/^-l(c|gdbm|dbm|ndbm|db)$/ }
           split(' ', $libs);
  
  $cc=$args{cc}           if defined $args{cc};
  $link=$args{link}       if defined $args{link};
  $ld=$args{ld}           if defined $args{ld};
  $ccflags=$args{ccflags} if defined $args{ccflags};
  $linkflags=$args{linkflags} if defined $args{linkflags};
  $ldflags=$args{ldflags} if defined $args{ldflags};
  $libs=$args{libs}       if defined $args{libs};
  $debug=$args{debugging} if defined $args{debugging};
  $cc_warn=$args{ccwarn}  if defined $args{ccwarn};
  
  if($args{ask}) {
    print <<'END';


Okay, I'm going to start by asking you a couple questions about your
compiler and linker.  Default values are in square brackets; you can
hit ENTER to accept them.  If you don't understand a question, the 
default will usually work--they've been intuited from your Perl 5
configuration.

END

    $cc=prompt("What C compiler do you want to use?", $cc);
    $link=prompt("How about your linker?", $link);
    $ld=prompt("What program do you want to use to build shared libraries?", 
	       $ld);
    $ccflags=prompt("What flags should your C compiler receive?", $ccflags);
    $linkflags=prompt("And your linker?", $linkflags);
    $ldflags=prompt("And your $ld for building shared libraries?", $ldflags);
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
    link    => $link,
    ld      => $ld,
    ccflags => $ccflags,
    linkflags => $linkflags,
    ldflags => $ldflags,
    libs    => $libs,
    cc_warn => $cc_warn
  );
}

1;
