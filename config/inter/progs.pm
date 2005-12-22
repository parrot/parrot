# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/inter/progs.pm - C Compiler and Linker

=head1 DESCRIPTION

Asks the user which compiler, linker, shared library builder, C
libraries, lexical analyzer generator and parser generator to use. Also
whether debugging should be enabled.

=cut

package inter::progs;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter';

$description = 'Determining what C compiler and linker to use...';

@args = qw(ask cc cxx link ld ccflags ccwarn linkflags ldflags libs debugging
	lex yacc maintainer);

sub runstep {
    my ($self, $conf) = (shift, shift);
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

    $cc = integrate($conf->data->get('cc'), $args{cc});
    $cc = prompt("What C compiler do you want to use?", $cc) if $args{ask};
    $conf->data->set(cc =>  $cc);

    $link = integrate($conf->data->get('link'), $args{link});
    $link = prompt("How about your linker?", $link) if $args{ask};
    $conf->data->set(link =>  $link);

    $ld = integrate($conf->data->get('ld'), $args{ld});
    $ld = prompt("What program do you want to use to build shared libraries?", $ld) if $args{ask};
    $conf->data->set(ld =>  $ld);

    $ccflags = $conf->data->get('ccflags');
    # Remove some perl5-isms.
    $ccflags =~ s/-D((PERL|HAVE)_\w+\s*|USE_PERLIO)//g;
    $ccflags =~ s/-fno-strict-aliasing//g;
    $ccflags =~ s/-fnative-struct//g;
    $ccflags = integrate($ccflags, $args{ccflags});
    $ccflags = prompt("What flags should your C compiler receive?", $ccflags) if $args{ask};
    $conf->data->set(ccflags =>  $ccflags);

    $linkflags = $conf->data->get('linkflags');
    $linkflags =~ s/-libpath:\S+//g;  # XXX No idea why.
    $linkflags = integrate($linkflags, $args{linkflags});
    $linkflags = prompt("And your linker?", $linkflags) if $args{ask};
    $conf->data->set(linkflags =>  $linkflags);

    $ldflags = $conf->data->get('ldflags');
    $ldflags =~ s/-libpath:\S+//g;  # XXX No idea why.
    $ldflags = integrate($ldflags, $args{ldflags});
    $ldflags = prompt("And your $ld for building shared libraries?", $ldflags) if $args{ask};
    $conf->data->set(ldflags =>  $ldflags);

    $libs = $conf->data->get('libs');
    $libs=join ' ',
	grep { $^O=~/VMS|MSWin/ || !/^-l(c|gdbm(_compat)?|dbm|ndbm|db)$/ }
	    split(' ', $libs);
    $libs = integrate($libs, $args{libs});
    $libs = prompt("What libraries should your C compiler use?", $libs) if $args{ask};
    $conf->data->set(libs =>  $libs);

    $cxx = integrate($conf->data->get('cxx'), $args{cxx});
    $cxx = prompt("What C++ compiler do you want to use?", $cxx) if $args{ask};
    $conf->data->set(cxx =>  $cxx);

    my $debug='n';
    $debug='y'  if $args{debugging};
    $debug = prompt("Do you want a debugging build of Parrot?", $debug) if $args{ask};

  if(!$debug || $debug =~ /n/i) {
    $conf->data->set(
      cc_debug => '',
      link_debug => '',
      ld_debug => ''
    );
  }

  # This one isn't prompted for above.  I don't know why.
  $ccwarn = integrate($conf->data->get('ccwarn'), $args{ccwarn});
  $conf->data->set(ccwarn => $ccwarn);
}

1;
