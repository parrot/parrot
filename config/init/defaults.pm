# Copyright (C) 2001-2015, Parrot Foundation.

=head1 NAME

config/init/defaults.pm - Configuration Defaults

=head1 DESCRIPTION

Sets up the configuration system's default values and data structures.

=cut

package init::defaults;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Config;
use File::Which;
use FindBin;    # see build_dir
use Parrot::BuildUtil;
use Parrot::Configure::Step;
use Parrot::Harness::DefaultTests ();
use Cwd qw(abs_path);
use File::Spec;


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Set Configure's default values};
    $data{result}      = q{};
    return \%data;
}

my $parrot_version = Parrot::BuildUtil::parrot_version();
my @parrot_version = Parrot::BuildUtil::parrot_version();

sub runstep {
    my ( $self, $conf ) = @_;

    # Later configuration steps need access to values from the Perl 5
    # %Config.  However, other later configuration steps may change
    # the corresponding values in the Parrot::Configure object.  In
    # order to provide access to the original values from Perl 5
    # %Config, we grab those settings we need now and store them in
    # special keys within the Parrot::Configure object.  We label these keys
    # '_provisional' to alert users that these should only be used during
    # configuration and testing of configuration steps.  They should not be
    # used during Parrot's build, nor should they be used in 'make test'.
    #
    # This is a multi-stage process.

    # Stage 1:
    foreach my $orig ( qw|
        archname
        ccflags
        d_socklen_t
        optimize
        osvers
        scriptdirexp
        sig_name
        sPRIgldbl
    | ) {
        $conf->data->set( qq|${orig}_provisional| => $Config{$orig} );
    }

    # Stage 2 (anticipating needs of config/auto/headers.pm):
    $conf->data->set_p5(
        map { $_ => $Config{$_} } grep { /^i_/ } keys %Config
    );

    # Stage 3 (Along similar lines, look up values from Perl 5 special
    # variables and stash them for later lookups.  Name them according
    # to their 'use English' names as documented in 'perlvar'.)
    $conf->data->set( OSNAME_provisional => $^O );

    my $ccdlflags = $Config{ccdlflags};
    $ccdlflags =~ s/\s*-Wl,-rpath,\S*//g if $conf->options->get('disable-rpath');
    $ccdlflags =~ s/-Xlink.*perl\.exp// if $Config{osname} eq 'aix';

    my $lddlflags = $Config{lddlflags};
    $lddlflags =~ s/-Wl,-bI:\$\(PERL_INC\)\/perl\.exp -Wl,-bE:\$\(BASEEXT\)\.exp// if $Config{osname} eq 'aix';

    my $build_dir =  abs_path($FindBin::Bin);

    my $cc_option = $conf->options->get('cc');
    my $debugging = $conf->options->get('debugging');
    my $disable_static = $conf->options->get('disable-static');
    my $disable_shared = $conf->options->get('disable-shared');
    my $POSIX = $^O !~ /^(MSWin|VMS|riscos|amiga|beos|mpeix|os390|os400|vmesa|VOS|dos|os2)/;
    # We need a Glossary somewhere!
    $conf->data->set(
        debugging => $debugging ? 1 : 0,
        optimize  => '',
        verbose   => $conf->options->get('verbose'),
        build_dir => $build_dir,
        configured_from_file =>
            $conf->options->get('configured_from_file') || '',
        configuration_steps => ( join q{ } => $conf->get_list_of_steps() ),

        # Compiler -- used to turn .c files into object files.
        # (Usually cc or cl, or something like that.)
        cc      => $cc_option ? $cc_option : $Config{cc},
        # If we specify a compiler, we can't use existing ccflags.
        ccflags => $cc_option ? ''         : $Config{ccflags},
        ccwarn  => '',

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
        cxx => 'c++',

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
        link_dynamic => $ccdlflags,    # e.g. -Wl,-E on HP-UX

        # ld: Tool used to build shared libraries and dynamically loadable
        # modules. Often $cc on Unix-ish systems, but apparently sometimes
        # it's ld.
        ld      => $Config{ld},
        ldflags => $Config{ldflags},

        # Some operating systems (e.g. Darwin) distinguish between shared
        # libraries and modules that can be dynamically loaded.  Flags to tell
        # ld to build a shared library, e.g.  -shared for GNU ld.
        ld_share_flags => $lddlflags,

        # Flags to tell ld to build a dynamically loadable module, e.g.
        # -shared for GNU ld, -bundle -undefined dynamic_lookup on darwin.
        ld_load_flags => $lddlflags,

        libs => $Config{libs},

        cc_inc     => "-I./include -I./include/pmc",
        cc_debug   => $debugging =~ /^[-\/]\w+/ ? $debugging : '-g',
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
        blib_dir => 'blib/lib',

        # libparrot library names
        libparrot_static => $disable_static ? '' : 'libparrot' . $Config{_a},
        libparrot_shared => $disable_shared ? '' : 'libparrot.' . $Config{so},
        inst_libparrot_shared => $disable_shared ? '' : 'libparrot.' . $Config{so},

        # does the system know about static/dynamic linking?
        has_static_linking  => $disable_static ? 0 : 1,
        has_dynamic_linking => 0,

        # default behaviour for linking parrot to a static or shared libparrot
        parrot_is_shared => 0,

        #avoid a warning during Configure.pl
        libparrot_soname => '',
        inst_libparrot_soname => '',

        perl      => $^X,
        test_prog => 'parrot',

        # some utilities in Makefile
        cat       => $POSIX ? 'cat'    : '$(PERL) -MExtUtils::Command -e cat',
        chmod     => $POSIX ? 'chmod'  : '$(PERL) -MExtUtils::Command -e chmod',
        cp        => $POSIX ? 'cp'     : '$(PERL) -MExtUtils::Command -e cp',
        mkpath    => $POSIX ? 'mkdir -p' : '$(PERL) -MExtUtils::Command -e mkpath',
        mv        => $POSIX ? 'mv'     : '$(PERL) -MExtUtils::Command -e mv',
        rm_f      => $POSIX ? 'rm -f'  : '$(PERL) -MExtUtils::Command -e rm_f',
        rm_rf     => $POSIX ? 'rm -rf' : '$(PERL) -MExtUtils::Command -e rm_rf',
        touch     => $POSIX ? 'touch'  : '$(PERL) -MExtUtils::Command -e touch',

        # added with 6.9.0 to hint at the rename ops2c => parrot-ops2c
        ops2c     => 'parrot-ops2c',

        # tar is currently used only in 'make release'.
        tar       => which('tar') || '',

        ar        => $Config{ar},
        arflags   => 'cr',

        # for Win32
        ar_out => '',

        # for Borland C
        ar_extra      => '',
        # rem is an invalid command for dmake
        ranlib        => $Config{ranlib} eq 'rem' ? 'echo' : $Config{ranlib},
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

        lns   => $Config{lns},                          # soft link
        slash => '/',

        VERSION => $parrot_version,
        MAJOR   => $parrot_version[0],
        MINOR   => $parrot_version[1],
        PATCH   => $parrot_version[2],
        DEVEL   => ( -e 'DEVELOPING' ? '-devel' : '' ),

        configdate => scalar gmtime() . " GMT",
        PQ         => "'",
        dquote     => "\\\"",

        # yacc = Automatic parser generator
        # lex  = Automatic lexer  generator
        # Some systems may lack these
        yacc => 'bison -v -y',
        lex  => 'flex',

        # Extra flags needed for libnci_test.so
        ncilib_link_extra => '',

        # Flag determines if pmc2c and ops2c also
        # generate #line directives. These can confuse
        # debugging internals.
        no_lines_flag => $conf->options->get('no-line-directives') ? '--no-lines' : '',

        tempdir => File::Spec->tmpdir,

        coveragedir => $conf->options->get('coveragedir') || $build_dir,
    );

    # GH #383:  Profiling options are too specific to GCC
    if ( $conf->options->get('profile') ) {
        $conf->data->set(
            cc_debug => " -pg ",
            ld_debug => " -pg ",
        );
    }

    $conf->data->set( clock_best => "" );

    $conf->data->set( 'archname', $Config{archname});

    $conf->data->set( has_core_nci_thunks => 1 );
    $conf->data->set( HAS_CORE_NCI_THUNKS => 1 );
    if ( $conf->options->get( 'without-core-nci-thunks' ) ) {
        $conf->data->set( has_core_nci_thunks => 0 );
        $conf->data->set( HAS_CORE_NCI_THUNKS => 0 );
    }

    $conf->data->set( has_extra_nci_thunks => 1 );
    $conf->data->set( HAS_EXTRA_NCI_THUNKS => 1 );
    if ( $conf->options->get( 'without-extra-nci-thunks' ) ) {
        $conf->data->set( has_extra_nci_thunks => 0 );
        $conf->data->set( HAS_EXTRA_NCI_THUNKS => 0 );
    }

    # adjust archname, cc and libs for e.g. --m=32 or --m=64
    # remember corrected archname - jit.pm was using $Config('archname')
    _64_bit_adjustments($conf);

    _set_default_tests($conf);

    return 1;
}

sub _64_bit_adjustments {
    my $conf = shift;
    my $m = $conf->options->get('m');
    if ($m) {
        my $archname = $conf->data->get('archname');
        # crude logic for m32, mostly for non-gcc compilers.
        # do it better for gcc and non-standard platforms in auto::gcc
        if ( $archname =~ /(64$|64-)/ && $m eq '32' ) {
            $archname =~ s/x86_64/i386/;

            # adjust gcc or as fallback the flags
            for my $cc (qw(cc ld link cxx)) {
                if (!$conf->options->get($cc)) {
                    $conf->debug( "Add -m32 to $cc" );
                    $conf->data->add( ' ', $cc, '-m32' );
                }
                else {
                    $conf->debug( "Add -m32 to $cc"."flags" );
                    $conf->data->add( ' ', $cc.'flags', '-m32' );
                }
            }
            my $has_libpath_override;
            # and lib flags
            for my $lib (qw(ld_load_flags ld_share_flags ldflags linkflags)) {
                my $item = $conf->data->get($lib);
                if ($item) {
                    my $olditem = $item;
                    $item =~ s/lib64/lib/g;
                    if ($olditem ne $item and !$conf->options->get($lib)) {
                        $conf->data->set( $lib, $item ) ;
                        $conf->debug( "Set has_libpath_override to lib64, changing $lib to $item" );
                        $has_libpath_override++;
                    }
                }
            }
            $conf->data->set( 'has_libpath_override', 'lib64') if $has_libpath_override;
        }
        $conf->data->set( 'archname', $archname );
    }
    return 1;
}

sub _set_default_tests {
    my $conf = shift;
    $conf->data->set( 'runcore_tests' =>
        ( join ' ' => @Parrot::Harness::DefaultTests::runcore_tests ) );
    $conf->data->set( 'core_tests' =>
        ( join ' ' => @Parrot::Harness::DefaultTests::core_tests ) );
    $conf->data->set( 'library_tests' =>
        ( join ' ' => @Parrot::Harness::DefaultTests::library_tests ) );
    $conf->data->set( 'configure_tests' =>
        ( join ' ' => @Parrot::Harness::DefaultTests::configure_tests ) );
    $conf->data->set( 'developing_tests' =>
        ( join ' ' => @Parrot::Harness::DefaultTests::developing_tests ) );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
