#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/init/data.pl - Configuration Defaults

=head1 DESCRIPTION

Sets up the configuration systems's default values and data structures.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Setting up Configure's data structures...";

@args=('debugging', 'optimize', 'profile', 'verbose');

sub runstep {
  my ($debugging, $optimize, $profile,  $verbose) = @_;

  package Configure::Data;
  use Config;
  use Data::Dumper;

  # We need a Glossary somewhere!

  my(%c)=(
    debugging     => $debugging ? 1 : 0,
    optimize      => $optimize ? $Config{optimize} : '',
    verbose       => $verbose,

    # Compiler -- used to turn .c files into object files.
    # (Usually cc or cl, or something like that.)
    cc            => $Config{cc},
    ccflags       => $Config{ccflags},
    ccwarn        => exists($Config{ccwarn}) ? $Config{ccwarn} : '',

    # Linker, used to link object files (plus libraries) into
    # an executable.  It is usually $cc on Unix-ish systems.
    # VMS and Win32 might use "Link".
    # Perl5's Configure doesn't distinguish linking from loading, so
    # make a reasonable guess at defaults.
    link          => $Config{cc},
    linkflags     => $Config{ldflags},

    # ld:  Tool used to build dynamically loadable libraries.  Often
    # $cc on Unix-ish systems, but apparently sometimes it's ld.
    ld            => $Config{ld},
    ldflags       => $Config{ldflags},

    libs          => $Config{libs},

    cc_inc	  => "-I./include",
    cc_debug      => '-g',
    link_debug    => '',

    o             => '.o',                # object files extension
    so            => '.so',               # dynamic link library or shared object extension
    a             => '.a',                # library or archive extension
    exe           => $Config{_exe},       # executable files extension
    cc_o_out      => '-o ',               # cc object output file
    cc_exe_out    => '-o ',               # cc executable output file (different on Win32)

    cc_ldflags    => '',                  # prefix for ldflags (necessary for Win32)

    ld_out        => '-o ',               # ld output file
    ld_debug      => '-g ',               # include debug info in executable
    ld_shared     => $Config{lddlflags},
    ld_shared_flags=> '', # What is this, exactly?  For GNU ld, it was
    # '-Wl,-soname,libparrot$(SO)'

    # should we have a dependancy upon arc to generate .a's?
    blib_lib_libparrot_a => 'blib/lib/libparrot$(A)',

    perl          => $^X,
    test_prog     => 'parrot',
    rm_f          => 'rm -f',
    rm_rf         => 'rm -rf',
    ar            => $Config{ar},
    ar_flags      => 'cr',
    ar_out        => '',                  # for Win32
    ar_extra      => '',                  # for Borland C
    ranlib        => $Config{ranlib},
    make          => $Config{make},
    make_set_make => $Config{make_set_make},
    make_and      => '&&',
    make_c        => '$(PERL) -e \'chdir shift @ARGV; system q{$(MAKE)}, @ARGV; exit $$? >> 8;\'',

    platform_asm  => 0,                   # if platform has a .s file that needs to be assembled
    as            => 'as',                # assembler

    cp            => 'cp',
    slash         => '/',

    VERSION       => $main::parrot_version,
    MAJOR         => $main::parrot_version[0],
    MINOR         => $main::parrot_version[1],
    PATCH         => $main::parrot_version[2],
    DEVEL         => (-e 'DEVELOPING' ? '-devel' : ''),

    configdate    => scalar localtime,
    PQ            => "'",

    # yacc = Automatic parser generator
    # lex  = Automatic lexer  generator
    # Some systems may lack these
    yacc          => 'bison -v -y',
    lex           => 'flex',

    icu_make      => '# Building of ICU disabled',
    buildicu      => 0,

  );
  # add profiling if needed
  # FIXME gcc syntax
  # we should have this in the hints files e.g. cc_profile
  if ($profile) {
    $c{cc_debug} .= " -pg ";
    $c{ld_debug} .= " -pg ";
  }


  *get=sub {
    shift;
    @c{@_};
  };

  *set=defined($verbose) && $verbose == 2
    ? sub {
      shift;
      return unless (defined ($_[0]));
      print "Setting Configuration Data:\n(\n";
      while (my ($key, $val) = splice @_, 0, 2) {
	print "\t$key => ", defined($val) ? "'$val'" : 'undef', ",\n";
        $c{$key}=$val;
      }
      print ");\n"
    }
    : sub {
      shift;
      %c=(%c, @_);
    };

  *keys=sub {
    return keys %c;
  };

  *dump=sub {
    Data::Dumper->Dump([\%c], ['*PConfig']);
  };
  
  *clean=sub {
    delete $c{$_} for grep { /^TEMP_/ } keys %c;
  };
}

1;








