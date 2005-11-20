# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/init/defaults.pm - Configuration Defaults

=head1 DESCRIPTION

Sets up the configuration system's default values and data structures.

=cut

package Configure::Step;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);


use Config;
use FindBin; # see build_dir
use Parrot::Configure::Data;
use Parrot::Configure::Step;

$description="Setting up Configure's default values...";

@args=('debugging', 'optimize', 'profile', 'verbose', 'prefix');

sub runstep {
    my $self = shift;
    my ($debugging, $optimize, $profile,  $verbose, $prefix) = @_;

    # We need a Glossary somewhere!
    Parrot::Configure::Data->set(
        debugging     => $debugging ? 1 : 0,
        # A plain --optimize means use perl5's $Config{optimize}.  If an
        # argument is given, however, use that instead.  This logic really
        # belongs in the optimize unit.
        optimize      => $optimize ? ($optimize eq "1" ? ($Config{optimize} || "1") : $optimize) : '',
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

        # Some operating systems (e.g. Darwin) distinguish between shared
        # libraries and modules that can be dynamically loaded.  Flags to tell
        # ld to build a shared library, e.g.  -shared for GNU ld.
        ld_share_flags => $Config{lddlflags},
    
        # These relate to building of dynclasses.
        cc_building_dynclass_flag => '',
    
        # Flags to tell ld to build a dynamically loadable module, e.g.
        # -shared for GNU ld.  Also some platforms (Win32) need to generate and
        # pass the linker an export list.  Dynamically loadable modules
        ld_load_flags       => $Config{lddlflags},
        parrot_exe_def      => '',
        ld_parrot_exe_def   => '',

        libs          => $Config{libs},

        cc_inc	  => "-I./include",
        cc_debug      => '-g',
        link_debug    => '',

        o             => $Config{_o},         # object files extension
        share_ext     => ".$Config{so}",      # shared library extension
        # dynamically loadable module extension
        load_ext      => ".$Config{so}",
        a             => $Config{_a},         # library or archive extension
        exe           => $Config{_exe},       # executable files extension
        cc_o_out      => '-o ',               # cc object output file
        # cc executable output file (different on Win32)
        cc_exe_out    => '-o ',

        # prefix for ldflags (necessary for Win32)
        cc_ldflags    => '', 

        # ld output file.  Keep the trailing space.
        ld_out        => '-o ',
        # include debug info in executable
        ld_debug      => '',

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

        # if platform has a .s file that needs to be assembled
        platform_asm  => 0, 
        as            => 'as',                # assembler

        cp            => '$(PERL) -MExtUtils::Command -e cp',
        lns           => $Config{lns},        # soft link
        slash         => '/',

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

    unless (defined $prefix) {
        my $VERSION   = Parrot::Configure::Data->get('VERSION'); 
        my $DEVEL     = Parrot::Configure::Data->get('DEVEL');
        $prefix = "/usr/local/parrot-${VERSION}${DEVEL}";
    }
    Parrot::Configure::Data->set(prefix => $prefix);

    # add profiling if needed
    # FIXME gcc syntax
    # we should have this in the hints files e.g. cc_profile
    # FIXME move profiling to it's own step 
    if ($profile) {
        Parrot::Configure::Data->set(
            cc_debug => " -pg ",
            ld_debug => " -pg ",
        );
    }
}

1;
