package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':inter';

$description = 'Determining what C compiler and linker to use...';

@args = qw(ask cc link ld ccflags ccwarn linkflags ldflags libs debugging
	lex yacc maintainer);

sub runstep {
  my %args;
  @args{@args}=@_;

  my($cc, $link, $ld, $ccflags, $ccwarn, $linkflags, $ldflags, $libs, $lex,
     $yacc) =
       Configure::Data->get(qw(cc link ld ccflags ccwarn linkflags ldflags
			       libs lex yacc));
  $ccflags =~ s/-D((PERL|HAVE)_\w+\s*|USE_PERLIO)//g;
  $ccflags =~ s/-fno-strict-aliasing//g;
  $linkflags =~ s/-libpath:\S+//g;
  $ldflags =~ s/-libpath:\S+//g;
  my $debug='n';

  $libs=join ' ',
  grep { $^O=~/VMS|MSWin/ || !/^-l(c|gdbm(_compat)?|dbm|ndbm|db)$/ }
  split(' ', $libs);

  # Try each alternative, until one works.
  # If none work, then set to null command.
  # XXX need config support for a null command.
  my $null = $^O eq 'Win32' ? 'REM' : 'echo';
  my $first_working = sub {
    foreach (@_) {
      `$_ -h 2>&1`;
      return $_ if not $?;
    }
    return $null;
  };
  if ($args{'maintainer'}) {
    $lex  = &$first_working($lex,  'flex', 'lex'                 );
    $yacc = &$first_working($yacc, 'bison -v -y', 'yacc', 'byacc');
  }
  else {
    $lex = $yacc = $null;
  }

  for my $var(qw(cc link ld ccflags linkflags ldflags libs ccwarn lex yacc)) {
    #Symrefs to lexicals are a no-no, so we have to use eval STRING.  %MY, anyone?
    eval qq{ \$$var=integrate(\$$var, \$args{$var}) if defined \$args{$var} };
  }

  $debug='y'              if $args{debugging};

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
    $lex=prompt("Do you have a lexical analyzer generator, like flex or lex?",$lex);
    $yacc=prompt("Do you have a parser generator, like bison or yacc?",$yacc);
  }

  if(!$debug || $debug =~ /n/i) {
    Configure::Data->set(
      cc_debug => '',
      link_debug => '',
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
    ccwarn => $ccwarn,
    lex     => $lex,
    yacc    => $yacc,
  );
}

1;
