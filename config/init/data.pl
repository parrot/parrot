package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Setting up Configure's data structures...";

@args=('debugging', 'optimize');

sub runstep {
  my ($debugging, $optimize) = @_;

  package Configure::Data;
  use Config;
  use Data::Dumper;

  # We need a Glossary somewhere!

  my(%c)=(
    debugging     => $debugging ? 1 : 0,
    optimize      => $optimize ? $Config{optimize} : '',

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
    ranlib        => $Config{ranlib},
    make          => $Config{make},
    make_set_make => $Config{make_set_make},

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
    
  );

  *get=sub {
    shift;
    @c{@_};
  };

  *set=sub {
    shift;
    %c=(%c, @_);
  };

  *keys=sub {
    return keys %c;
  };

  *dump=sub {
    Data::Dumper->Dump([\%c], ['*PConfig']);
  };
}

1;
