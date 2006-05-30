# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

=head1 NAME

config/init/defaults.pm - Configuration Defaults

=head1 DESCRIPTION

Sets up the configuration system's default values and data structures.

=cut

package init::defaults;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Config;
use FindBin;    # see build_dir
use Parrot::Configure::Step;

$description = q{Setting up Configure's default values};

@args = qw(debugging optimize profile verbose prefix);

sub runstep
{
    my ($self, $conf) = @_;

    # We need a Glossary somewhere!
    $conf->data->set(
        debugging => $conf->options->get('debugging') ? 1 : 0,
        optimize  => '',
        verbose   => $conf->options->get('verbose'),
        build_dir => $FindBin::Bin,

        # Compiler -- used to turn .c files into object files.
        # (Usually cc or cl, or something like that.)
        cc      => $Config{cc},
        ccflags => $Config{ccflags},
        ccwarn  => exists($Config{ccwarn}) ? $Config{ccwarn} : '',

        # Flags used to indicate this object file is to be compiled
        # with position-independent code suitable for dynamic loading.
        cc_shared => $Config{cccdlflags},    # e.g. -fpic for GNU cc.

        # C++ compiler -- used to compile parts of ICU.  ICU's configure
        # will try to find a suitable compiler, but it prefers GNU c++ over
        # a system c++, which might not be appropriate.  This setting
        # allows you to override ICU's guess, but is otherwise currently
        # unset.  Ultimately, it should be set to whatever ICU figures
        # out, or parrot should look for it and always tell ICU what to
        # use.
        cxx => '',

        # Linker, used to link object files (plus libraries) into
        # an executable.  It is usually $cc on Unix-ish systems.
        # VMS and Win32 might use "Link".
        # Perl5's Configure doesn't distinguish linking from loading, so
        # make a reasonable guess at defaults.
        link      => $Config{cc},
        linkflags => $Config{ldflags},

        # Linker Flags to have this binary work with the shared and dynamically
        # loadable libraries we're building.  On HP-UX, for example, we need to
        # allow dynamic libraries to access the binary's symbols
        link_dynamic => $Config{ccdlflags},    # e.g. -Wl,-E on HP-UX

        # ld: Tool used to build shared libraries and dynamically loadable
        # modules. Often $cc on Unix-ish systems, but apparently sometimes
        # it's ld.
        ld      => $Config{ld},
        ldflags => $Config{ldflags},

        # Some operating systems (e.g. Darwin) distinguish between shared
        # libraries and modules that can be dynamically loaded.  Flags to tell
        # ld to build a shared library, e.g.  -shared for GNU ld.
        ld_share_flags => $Config{lddlflags},

        # Flags to tell ld to build a dynamically loadable module, e.g.
        # -shared for GNU ld.
        ld_load_flags     => $Config{lddlflags},

        libs => $Config{libs},

        cc_inc     => "-I./include",
        cc_debug   => '-g',
        link_debug => '',

        o         => $Config{_o},       # object files extension
        share_ext => ".$Config{so}",    # shared library extension

        # dynamically loadable module extension
        load_ext => ".$Config{so}",
        a        => $Config{_a},        # library or archive extension
        exe      => $Config{_exe},      # executable files extension
        cc_o_out => '-o ',              # cc object output file

        # cc executable output file (different on Win32)
        cc_exe_out => '-o ',

        # prefix for ldflags (necessary for Win32)
        cc_ldflags => '',

        # ld output file.  Keep the trailing space.
        ld_out => '-o ',

        # include debug info in executable
        ld_debug => '',

        # Way to decorate a function to mark it as an exportable or
        # importable symbol.
        sym_export => '',
        sym_import => '',

        # Library build directory
        blib_dir      => 'blib/lib',

        # libparrot library names
        libparrot_static => 'libparrot'.$Config{_a},
        libparrot_shared => 'libparrot.'.$Config{so},

        # does the system know about static/dynamic linking?
        has_static_linking => 1,
        has_dynamic_linking => 0,

        # default behaviour for linking parrot to a static or shared libparrot
        parrot_is_shared => 0,

        #avoid a warning during Configure.pl
        libparrot_soname => '',

        perl      => $^X,
        test_prog => 'parrot',
        rm_f      => '$(PERL) -MExtUtils::Command -e rm_f',
        rm_rf     => '$(PERL) -MExtUtils::Command -e rm_rf',
        mkdir     => '$(PERL) -MExtUtils::Command -e mkpath',
        touch     => '$(PERL) -MExtUtils::Command -e touch',
        chmod     => '$(PERL) -MExtUtils::Command -e ExtUtils::Command::chmod',
        ar        => $Config{ar},
        ar_flags  => 'cr',

        # for Win32
        ar_out => '',

        # for Borland C
        ar_extra      => '',
        ranlib        => $Config{ranlib},
        rpath         => '',
        make          => $Config{make},
        make_set_make => $Config{make_set_make},
        make_and      => '&&',

        # make_c: Command to emulate GNU make's C<-C directory> option:  chdir
        # to C<directory> before executing $(MAKE)
        make_c => '$(PERL) -e \'chdir shift @ARGV; system q{$(MAKE)}, @ARGV; exit $$? >> 8;\'',

        # if platform has a .s file that needs to be assembled
        platform_asm => 0,
        as           => 'as',    # assembler

        cp    => '$(PERL) -MExtUtils::Command -e cp',
        lns   => $Config{lns},                          # soft link
        slash => '/',

        VERSION => $main::parrot_version,
        MAJOR   => $main::parrot_version[0],
        MINOR   => $main::parrot_version[1],
        PATCH   => $main::parrot_version[2],
        DEVEL   => (-e 'DEVELOPING' ? '-devel' : ''),

        configdate => scalar localtime,
        PQ         => "'",
        dquote     => "\\\"",

        # yacc = Automatic parser generator
        # lex  = Automatic lexer  generator
        # Some systems may lack these
        yacc => 'bison -v -y',
        lex  => 'flex',

        # Extra flags needed for libnci_test.so
        ncilib_link_extra => '',

    );

    my $prefix = $conf->options->get('prefix');
    unless (defined $prefix) {
        my $VERSION = $conf->data->get('VERSION');
        my $DEVEL   = $conf->data->get('DEVEL');
        $prefix = "/usr/local";
    }
    $conf->data->set(
        prefix      => $prefix,
        exec_prefix => $prefix,
        bin_dir     => $prefix . "/bin",
        lib_dir     => $prefix . "/lib",
        include_dir => $prefix . "/include",
        doc_dir     => $prefix . "/share/doc/parrot",
    );

    # add profiling if needed
    # FIXME gcc syntax
    # we should have this in the hints files e.g. cc_profile
    # FIXME move profiling to it's own step
    if ($conf->options->get('profile')) {
        $conf->data->set(
            cc_debug => " -pg ",
            ld_debug => " -pg ",
        );
    }

    return $self;
}

1;
