# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
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

@args=('debugging', 'optimize', 'profile', 'verbose', 'prefix');

sub runstep {
  my ($debugging, $optimize, $profile,  $verbose, $prefix) = @_;

  package Configure::Data;
  use Config;
  use Data::Dumper;
  use FindBin; # see build_dir

  # We need a Glossary somewhere!

  my(%c)=(
    debugging     => $debugging ? 1 : 0,
    # A plain --optimize means use perl5's $Config{optimize}.  If an argument is
    # given, however, use that instead.  This logic really belongs in the optimize
    # unit.
    optimize      => $optimize ? ($optimize eq "1" ? $Config{optimize} : $optimize) : '',
    verbose       => $verbose,

    build_dir     => $FindBin::Bin,

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
    # Linker Flags to have this binary work with the shared and dynamically 
    # loadable libraries we're building.  On HP-UX, for example, we need to
    # allow dynamic libraries to access the binary's symbols
    link_dynamic  => $Config{ccdlflags}, # e.g. -Wl,-E on HP-UX

    # ld: Tool used to build shared libraries and dynamically loadable
    # modules. Often $cc on Unix-ish systems, but apparently sometimes
    # it's ld.
    ld            => $Config{ld},
    ldflags       => $Config{ldflags},

    # Some operating systems (e.g. Darwin) distinguish between shared libraries and
    # modules that can be dynamically loaded.
    # Flags to tell ld to build a shared library, e.g.  -shared for GNU ld.
    ld_share_flags => $Config{lddlflags},
    
    # These relate to building of dynclasses.
    cc_building_dynclass_flag => '',
    
    # Flags to tell ld to build a dynamically loadable module, e.g.  -shared for GNU ld.
    # Also some platforms (Win32) need to generate and pass the linker an export list.
    # Dynamically loadable modules
    ld_load_flags       => $Config{lddlflags},
    parrot_exe_def      => '',
    ld_parrot_exe_def   => '',

    libs          => $Config{libs},

    cc_inc	  => "-I./include",
    cc_debug      => '-g',
    link_debug    => '',

    o             => $Config{_o},         # object files extension
    share_ext     => ".$Config{so}",      # shared library extension
    load_ext      => ".$Config{so}",      # dynamically loadable module extension
    a             => $Config{_a},         # library or archive extension
    exe           => $Config{_exe},       # executable files extension
    cc_o_out      => '-o ',               # cc object output file
    cc_exe_out    => '-o ',               # cc executable output file (different on Win32)

    cc_ldflags    => '',                  # prefix for ldflags (necessary for Win32)

    ld_out        => '-o ',               # ld output file.  Keep the trailing space.
    ld_debug      => '',                  # include debug info in executable

    # should we have a dependancy upon arc to generate .a's?
    blib_lib_libparrot_a => 'blib/lib/libparrot$(A)',

    perl          => $^X,
    test_prog     => 'parrot',
    rm_f          => '$(PERL) -MExtUtils::Command -e rm_f',
    rm_rf         => '$(PERL) -MExtUtils::Command -e rm_rf',
    ar            => $Config{ar},
    ar_flags      => 'cr',
    ar_out        => '',                  # for Win32
    ar_extra      => '',                  # for Borland C
    ranlib        => $Config{ranlib},
    rpath         => '-Wl,-rpath=',
    make          => $Config{make},
    make_set_make => $Config{make_set_make},
    make_and      => '&&',
    # make_c: Command to emulate GNU make's C<-C directory> option:  chdir
    # to C<directory> before executing $(MAKE)
    make_c        => '$(PERL) -e \'chdir shift @ARGV; system q{$(MAKE)}, @ARGV; exit $$? >> 8;\'',

    platform_asm  => 0,                   # if platform has a .s file that needs to be assembled
    as            => 'as',                # assembler

    cp            => '$(PERL) -MExtUtils::Command -e cp',
    lns           => $Config{lns},        # soft link
    # On all platform slash == slash_exec, except with MinGW
    # slash_exec is needed by pathname of executable in test or makefile
    slash         => '/',
    slash_exec    => '/',

    VERSION       => $main::parrot_version,
    MAJOR         => $main::parrot_version[0],
    MINOR         => $main::parrot_version[1],
    PATCH         => $main::parrot_version[2],
    DEVEL         => (-e 'DEVELOPING' ? '-devel' : ''),

    configdate    => scalar localtime,
    PQ            => "'",
    dquote        => "\\\"",

    # yacc = Automatic parser generator
    # lex  = Automatic lexer  generator
    # Some systems may lack these
    yacc          => 'bison -v -y',
    lex           => 'flex',

    icu_make      => '# Building of ICU disabled',
    buildicu      => 0,

    # Extra flags needed for libnci_test.so
    ncilib_link_extra => '',           

  );

  $prefix = "/usr/local/parrot-$c{VERSION}$c{DEVEL}" unless defined $prefix;
  $c{prefix} = $prefix;

  my (%triggers);

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
	if (defined $triggers{$key}) {
	  while (my ($trigger, $cb) = each %{$triggers{$key}}) {
	    print "\tcalling trigger $trigger for $key\n" if $verbose;
	    &$cb($key, $val);
	  }
	}
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
  my $dd_version;
  if ($Data::Dumper::VERSION =~ /([\d.]+)/) {
    $dd_version = $1;
  } else {
    $dd_version = $Data::Dumper::VERSION;
  }
  if ($dd_version >= 2.12) {
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

=item Configure::Data->settrigger($key, $trigger, $cb)

Set a callback on C<$key> named C<$trigger>.  Multiple triggers can be
set on a given key.  When the key is set via C<set> or C<add> then all
callbacks that are defined will be called.  Triggers are passed the
key and value that was set after it has been changed.

=cut

  *settrigger=sub {
    my ($self, $var, $trigger, $cb) = @_;
    if (defined $cb) {
      if (defined $verbose and $verbose == 2) {
	print "Setting trigger $trigger on configuration key $var\n";
      }
      $triggers{$var}{$trigger} = $cb;
    }
  };

=item Configure::Data->gettriggers($key)

Get the names of all triggers set for C<$key>.

=cut

  *gettriggers=sub {
    my ($self, $key) = @_;
    return keys %{$triggers{$key}};
  };

=item Configure::Data->gettrigger($key, $trigger)

Get the callback set for C<$key> under the name C<$trigger>

=cut

  *gettrigger=sub {
    my ($self, $key, $t) = @_;
    return undef if !defined $triggers{$key} or !defined $triggers{$key}{$t};
    $triggers{$key}{$t};
  };

=item Configure::Data->deltrigger($key, $trigger)

Removes the trigger on C<$key> named by C<$trigger>

=cut

  *deltrigger=sub {
    my ($self, $var, $t) = @_;
    return if !defined $triggers{$var} or !defined $triggers{$var}{$t};
    delete $triggers{$var}{$t};
    if (defined $verbose and $verbose == 2) {
      print "Removing trigger $t on configuration key $var\n";
    }
  };
}

=back

=cut

1;
