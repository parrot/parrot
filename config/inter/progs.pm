# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/inter/progs.pm - C Compiler and Linker

=head1 DESCRIPTION

Asks the user which compiler, linker, shared library builder, C
libraries, lexical analyzer generator and parser generator to use. Also
whether debugging should be enabled.

=cut

package Configure::Step;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter';

$description = 'Determining what C compiler and linker to use...';

@args = qw(ask cc cxx link ld ccflags ccwarn linkflags ldflags libs debugging
	lex yacc maintainer);

sub runstep {
    my $self = shift;
  my %args;
  @args{@args}=@_;

  my($cc, $cxx, $link, $ld, $ccflags, $ccwarn, $linkflags, $ldflags, $libs, $lex,
     $yacc);

  # Find a working version of a program:
  # Try each alternative, until one works.
  # If none work, then set to null command.
  # XXX need config support for a null command.
  my $null = 'echo';
  my $first_working = sub {
    foreach (@_) {
      `$_ -h 2>&1`;
      return $_ if not $?;
    }
    return $null;
  };

  if($args{ask}) {
    print <<'END';


    Okay, I'm going to start by asking you a couple questions about your
    compiler and linker.  Default values are in square brackets; you can
    hit ENTER to accept them.  If you don't understand a question, the
    default will usually work--they've been intuited from your Perl 5
    configuration.

END
    }

    # Set each variable individually so that hints files can use them as
    # triggers to help pick the correct defaults for later answers.

    $cc = integrate(Parrot::Configure::Data->get('cc'), $args{cc});
    $cc = prompt("What C compiler do you want to use?", $cc) if $args{ask};
    Parrot::Configure::Data->set(cc =>  $cc);

    $link = integrate(Parrot::Configure::Data->get('link'), $args{link});
    $link = prompt("How about your linker?", $link) if $args{ask};
    Parrot::Configure::Data->set(link =>  $link);

    $ld = integrate(Parrot::Configure::Data->get('ld'), $args{ld});
    $ld = prompt("What program do you want to use to build shared libraries?", $ld) if $args{ask};
    Parrot::Configure::Data->set(ld =>  $ld);

    $ccflags = Parrot::Configure::Data->get('ccflags');
    # Remove some perl5-isms.
    $ccflags =~ s/-D((PERL|HAVE)_\w+\s*|USE_PERLIO)//g;
    $ccflags =~ s/-fno-strict-aliasing//g;
    $ccflags =~ s/-fnative-struct//g;
    $ccflags = integrate($ccflags, $args{ccflags});
    $ccflags = prompt("What flags should your C compiler receive?", $ccflags) if $args{ask};
    Parrot::Configure::Data->set(ccflags =>  $ccflags);

    $linkflags = Parrot::Configure::Data->get('linkflags');
    $linkflags =~ s/-libpath:\S+//g;  # XXX No idea why.
    $linkflags = integrate($linkflags, $args{linkflags});
    $linkflags = prompt("And your linker?", $linkflags) if $args{ask};
    Parrot::Configure::Data->set(linkflags =>  $linkflags);

    $ldflags = Parrot::Configure::Data->get('ldflags');
    $ldflags =~ s/-libpath:\S+//g;  # XXX No idea why.
    $ldflags = integrate($ldflags, $args{ldflags});
    $ldflags = prompt("And your $ld for building shared libraries?", $ldflags) if $args{ask};
    Parrot::Configure::Data->set(ldflags =>  $ldflags);

    $libs = Parrot::Configure::Data->get('libs');
    $libs=join ' ',
	grep { $^O=~/VMS|MSWin/ || !/^-l(c|gdbm(_compat)?|dbm|ndbm|db)$/ }
	    split(' ', $libs);
    $libs = integrate($libs, $args{libs});
    $libs = prompt("What libraries should your C compiler use?", $libs) if $args{ask};
    Parrot::Configure::Data->set(libs =>  $libs);

    $cxx = integrate(Parrot::Configure::Data->get('cxx'), $args{cxx});
    $cxx = prompt("What C++ compiler do you want to use?", $cxx) if $args{ask};
    Parrot::Configure::Data->set(cxx =>  $cxx);

    my $debug='n';
    $debug='y'  if $args{debugging};
    $debug = prompt("Do you want a debugging build of Parrot?", $debug) if $args{ask};

  if(!$debug || $debug =~ /n/i) {
    Parrot::Configure::Data->set(
      cc_debug => '',
      link_debug => '',
      ld_debug => ''
    );
  }

  # This one isn't prompted for above.  I don't know why.
  $ccwarn = integrate(Parrot::Configure::Data->get('ccwarn'), $args{ccwarn});
  Parrot::Configure::Data->set(ccwarn => $ccwarn);
}

1;
