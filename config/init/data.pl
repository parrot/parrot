#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/init/data.pl - Configuration Defaults

=head1 DESCRIPTION

Sets up the configuration system's default values and data structures.

=head1 METHODS

=over 4

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
    # Flags used to indicate this object file is to be compiled
    # with position-independent code suitable for dynamic loading.
    cc_shared => $Config{cccdlflags}, # e.g. -fpic for GNU cc.

    # C++ compiler -- used to compile parts of ICU.  ICU's configure
    # will try to find a suitable compiler, but it prefers GNU c++ over
    # a system c++, which might not be appropriate.  This setting
    # allows you to override ICU's guess, but is otherwise currently
    # unset.  Ultimately, it should be set to whatever ICU figures
    # out, or parrot should look for it and always tell ICU what to
    # use.
    cxx            => '',

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
    # make_c: Command to emulate GNU make's C<-C directory> option:  chdir
    # to C<directory> before executing $(MAKE)
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

    ncilib_link_extra => '',              # Extra flags needed for libnci.so

  );
  # add profiling if needed
  # FIXME gcc syntax
  # we should have this in the hints files e.g. cc_profile
  if ($profile) {
    $c{cc_debug} .= " -pg ";
    $c{ld_debug} .= " -pg ";
  }

=item Configure::Data->get($key,...)

Return value or hash slice for key.

=cut

  *get=sub {
    shift;
    @c{@_};
  };

=item Configure::Data->set($key,$val, ...)

Set config values

=cut

  *set = sub {
      shift;
      my $verbose = $c{verbose} && $c{verbose} == 2;
      return unless (defined ($_[0]));
      print "Setting Configuration Data:\n(\n" if ($verbose);
      while (my ($key, $val) = splice @_, 0, 2) {
	print "\t$key => ", defined($val) ? "'$val'" : 'undef', ",\n"
	    if ($verbose);
        $c{$key}=$val;
      }
      print ");\n" if ($verbose);
    };

=item Configure::Data->add($delim, $key,$val, ...)

Append values delimited by C<$delim> to existing keys or set values.

=cut

  *add = sub {
    my ($self, $delim) = (shift, shift);
    while (my ($key, $val) = splice @_, 0, 2) {
      my ($old) = $c{$key};
      if (defined $old) {
	$self->set($key, "$old$delim$val");
      }
      else {
	$self->set($key, $val);
      }
    }
  };

=item Configure::Data->keys()

Return config keys.

=cut

  *keys=sub {
    return keys %c;
  };

=item Configure::Data->dump()

Dump config keys.

=cut

  # Data::Dumper supports Sortkeys since 2.12
  # older versions will work but obviously not sorted
  if ($Data::Dumper::VERSION >= 2.12) {
    *dump=sub {
      Data::Dumper->new([\%c], ['*PConfig'])->Sortkeys(1)->Dump();
    };
  }
  else {
    *dump=sub {
      Data::Dumper->new([\%c], ['*PConfig'])->Dump();
    };
  }

=item Configure::Data->clean()

Delete keys matching /^TEMP_/ from config. These are used only temporarly
e.g. as file lists for Makefile generation.

=cut

  *clean=sub {
    delete $c{$_} for grep { /^TEMP_/ } keys %c;
  };
}

=back

=cut

1;

