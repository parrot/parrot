# Copyright (C) 2005-2015, Parrot Foundation.

package init::hints::mswin32;

use strict;
use warnings;
use Win32;

sub runstep {
    my ( $self, $conf ) = @_;

    my $libs      = $conf->option_or_data('libs');
    my $ccflags   = $conf->option_or_data('ccflags');
    my $cc        = $conf->option_or_data('cc');
    my $share_ext = $conf->option_or_data('share_ext');

    # Later in the Parrot::Configure::runsteps() process,
    # inter::progs will merge the command-line overrides with the defaults.
    # We do one bit of its work early here, because we need the result now.
    $cc = $conf->options->get('cc') if defined $conf->options->get('cc');

    my $is_msvc  = $cc =~ m/\bcl\b/i;
    my $is_intel = $cc =~ m/\bicl\b/i;
    my $is_mingw = $cc =~ m/\b(?:gcc|g\+\+|clang)\b/i;
    my $is_bcc   = $cc =~ m/\bbcc32\b/i;

    $conf->data->set(
        win32  => 1,
        PQ     => '"',
        make_c => '$(PERL) -e "chdir shift @ARGV; system \'$(MAKE)\', @ARGV; exit $$? >> 8;"',
        ncilib_link_extra => '-def:src\libnci_test.def',
    );

    my $build_dir = $conf->data->get('build_dir');
    if ( $build_dir =~ /\s/ ) {
        $build_dir = Win32::GetShortPathName($build_dir);
        $conf->debug(" build_dir => $build_dir, ");
        $conf->data->set( build_dir => $build_dir );
    }

    my $bindir = $conf->data->get('bindir');
    if ( $bindir =~ /\s/ ) {
        $bindir = Win32::GetShortPathName($bindir);
        $conf->debug(" bindir => $bindir, ");
        $conf->data->set( bindir => $bindir );
    }

    $conf->data->set( clock_best => ' ' );

    my $mt_output = `mt.exe /? 2>null` || '';
    my $has_mt = $mt_output =~ m/manifest/;
    $conf->data->set( has_mt => $has_mt ? 1 : 0);

    if ($is_msvc) {
        my $msvcversion = $conf->data->get('msvcversion');

        # Check the output of cl.exe to see if it contains the
        # string 'Standard' and remove the -O1 option if it does.
        # This will prevent the 'optimization is not available in the
        # standard edition compiler' warning each time we compile.
        # The logo gets printed to STDERR; hence the redirection.
        my $cc_output = `$cc /? 2>&1` || '';
        $ccflags =~ s/-O1 // if $cc_output =~ m/Standard/ || $cc_output =~ m{/ZI};
        unless ($msvcversion) { $cc_output =~ m/Version (\d+)/; $msvcversion = $1; }
        my $ccwarn = '';
        # disable certain very noisy warnings
        if ($msvcversion >= 13) {
            $ccwarn .= "-wd4127 ";    # conditional expression is constant
            $ccwarn .= "-wd4054 ";    # type cast from function ptr to data ptr
            $ccwarn .= "-wd4310 ";    # cast truncates constant value
        }

        my $disable_static = $conf->options->get('disable-static');
        my $debugging = $conf->options->get('debugging');
        my $optimize = $conf->data->get('optimize_provisional');

        # 'link' needs to be link.exe, not cl.exe.
        # This makes 'link' and 'ld' the same.
        # Note that on win64 we mostly only have a strawberry perl, thus g++ as ld.
        my $ld      = $conf->option_or_data('ld');
        my $ldflags = $conf->option_or_data('ldflags');
        if ($ld =~ /g\+\+/) {
            # now we are sure that we have to convert from a strawberry mingw perl to msvc
            $conf->debug("convert strawberry mingw perl config to msvc...");
            if ($ccflags !~ /nologo/) {
                $ccflags = "-nologo -GF -W4 -MD -DWIN32 -D_CONSOLE -DNO_STRICT";
                $optimize =~ s/-s //;
                $optimize =~ s/-O3/-O2/;
                $conf->debug(" optimize => '$optimize', ");
                $conf->data->set('optimize_provisional', $optimize);
            }
            $conf->data->set('a', '.lib');
            $ld = 'link';
            $conf->data->set( ld   => $ld );
            my $link = $conf->options->get('link');
            if (!$link) {
                $conf->data->set( link => $ld );
                $link = $ld;
            }
            if ($link =~ /cl(\.exe)?$/i) {
                $conf->data->set( link => $ld );
                $conf->debug(" link => '$ld', ");
            }
            $conf->debug(" ld => '$ld', ");
            $conf->debug(" ldflags => '$ldflags', ");
        }
        else {
            $conf->data->set( link   => $ld );
        }

        $ccflags =~ s/-Gf/-GF/ if $msvcversion >= 13;
        # override perl's warnings level
        $ccflags =~ s/-W\d/-W4/;
        # if we want pbc_to_exe to work, need to let some versions of the
        # compiler use more memory than they normally would
        $ccflags .= " -Zm1500 " if $msvcversion < 13;

        $conf->data->set( cxx  => $conf->data->get('cc') ) unless $conf->options->get('cxx');
        my $linkflags = $ldflags;
        # advapi32 needed for src/platform/win32/entropy.c
        my $libs = 'kernel32.lib ws2_32.lib msvcrt.lib oldnames.lib advapi32.lib ';
        $conf->debug(" ccflags => '$ccflags', ");
        $conf->debug(" libs => '$libs', ");

        $conf->data->set(
            share_ext  => '.dll',
            load_ext   => '.dll',
            a          => '.lib',
            o          => '.obj',
            cc_o_out   => '-Fo',
            cc_exe_out => '-out:',
            cc_ldflags => '-link',

            make_c => q{$(PERL) -e "chdir shift @ARGV;}
                . q{system '$(MAKE)', '-nologo', @ARGV; exit $$? >> 8;"},
            make => 'nmake',

            # ZI messes with __LINE__, /Z7 is preferred for gdb
            cc_debug            => '-Zi',
            ld_debug            => '-debug',
            ld_share_flags      => '-dll',
            ld_load_flags       => '-dll',
            ld_out              => '-out:',
            ldflags             => $ldflags,
            linkflags           => $linkflags,
            libs                => $libs,
            libparrot_static    => $disable_static ? '' : 'libparrot' . $conf->data->get('a'),
            libparrot_shared    => "libparrot$share_ext",
            ar                  => 'lib',
            arflags             => '',
            ar_out              => '-out:',
            slash               => '\\',
            ccflags             => $ccflags,
            ccwarn              => $ccwarn,
            has_dynamic_linking => 1,
            parrot_is_shared    => 1,

            sym_export => '__declspec(dllexport)',
            sym_import => '__declspec(dllimport)'
        );

        # If we are building shared, need to include dynamic libparrot.lib, otherwise
        # the static libparrot.lib.
        # Unclear if it's needed both for ld and link.
        $conf->data->set( libparrot_ldflags   => "\"$build_dir\\libparrot.lib\"" );
        $conf->data->set( libparrot_linkflags   => "\"$build_dir\\libparrot.lib\"" );
        $conf->data->set( inst_libparrot_ldflags   => "\"$bindir\\libparrot.lib\"" );
        $conf->data->set( inst_libparrot_linkflags   => "\"$bindir\\libparrot.lib\"" );

        # We can't use -opt: and -debug together.
        if ( $debugging ) {
            my $linkflags = $conf->option_or_data('linkflags');
            $linkflags =~ s/-opt:\S+//;
            $conf->data->set( linkflags => $linkflags );
        }
    }
    elsif ($is_intel) {
        $conf->data->set(
            share_ext  => '.dll',
            load_ext   => '.dll',
            a          => '.lib',
            o          => '.obj',
            cc_o_out   => '-Fo',
            cc_exe_out => '-out:',
            cc_ldflags => '-link',

            # ZI messes with __LINE__
            cc_debug            => '-Zi',
            libs                => "$libs libircmt.lib",
            ld                  => 'xilink',
            ld_debug            => '-debug',
            ld_share_flags      => '-dll',
            ld_load_flags       => '-dll',
            ld_out              => '-out:',
            ldflags             => '-nologo -nodefaultlib',
            ar                  => 'xilib',
            arflags             => '',
            ar_out              => '-out:',
            slash               => '\\',
            ccflags             => $ccflags,
            ccwarn              => '',
            has_dynamic_linking => 1
        );

        # 'link' needs to be xilink.exe, not icl.exe.
        # This makes 'link' and 'ld' the same.
        $conf->data->set( link => $conf->data->get('ld') );

        # We can't use -opt: and -debug together.
        if ( $conf->data->get('ld_debug') =~ /-debug/ ) {
            my $linkflags = $conf->option_or_data('linkflags');
            $linkflags =~ s/-opt:\S+//;
            $conf->data->set( linkflags => $linkflags );
        }
    }
    elsif ($is_bcc) {
        $conf->data->set(
            o         => '.obj',
            a         => '.lib',
            share_ext => '.dll',
            load_ext  => '.dll',
            cc        => ${cc},
            ccflags =>
                '-O2 -w-8066 -DWIN32 -DNO_STRICT -DNDEBUG -D_CONSOLE -w-par -w-aus -w-ccc -w-rch',
            cc_o_out   => '-o',
            cc_exe_out => '-e',
            cc_debug   => '-v',

            ld             => ${cc},
            ldflags        => '',
            ld_out         => '-e',
            cc_ldflags     => '',
            ld_debug       => '-v',
            ld_share_flags => '-WD',
            ld_load_flags  => '-WD',
            libs           => 'import32.lib cw32.lib',

            link      => ${cc},
            linkflags => '',

            ar       => 'tlib /a /P128',
            arflags  => '',
            ar_out   => '',
            ar_extra => '',
            slash    => '\\',
            make_and => "\n\t",
        );
    }
    elsif ($is_mingw) {
        # when using mingw gcc, parrot needs at least Windows2000, but WindowsME.
        my @os_version = Win32::GetOSVersion();
        my $winver = (($os_version[4] >=2 && $os_version[1]>=5)
            || ($os_version[4] = 1 && $os_version[1] = 4))? 'Windows2000' : 'WindowsNT4';

        my $make = $conf->data->get(qw(make));

        if ( $make =~ /nmake/i ) {

            # ActiveState Perl
            $conf->data->set(
                a       => '.a',
                ar      => 'ar',
                ccflags => "-DWIN32 -DWINVER=$winver ",
                ld      => 'g++',
                ldflags => '',
                libs =>
'-lmsvcrt -lmoldname -lkernel32 -luser32 -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lshell32 -lole32 -loleaut32 -lnetapi32 -luuid -lws2_32 -lmpr -lwinmm -lversion ',
                link      => 'gcc',
                linkflags => '',
                o         => '.o',
            );
        }
        elsif ( $make =~ /dmake/i ) {

            # strawberry Perl
            $conf->data->set(
                ccflags   => "-DWIN32 -DWINVER=$winver ",
                ldflags   => '',
                linkflags => '',
                optimize  => '',
            );
        }
        elsif ( $make =~ /gmake/i ) {
            # also Strawberry Perl
            $conf->data->set(
                ccflags   => "-DWINVER=$winver ",
                make      => 'gmake',
                make_c    => 'gmake -C',
            );
        }
        elsif ( $make =~ /mingw32-make/i ) {
            ; # Vanilla Perl
            $conf->data->set(
                ccflags   => "-DWINVER=$winver ",
                make      => 'mingw32-make',
                make_c    => 'mingw32-make -C',
            );
        }
        else {
            warn "unknown configuration";
        }

        if ( $conf->data->get(qw(optimize)) eq "1" ) {
            $conf->data->set( optimize => '-O2' );
        }

        $conf->data->set(
            cc                  => 'gcc',
            parrot_is_shared    => 1,
            has_dynamic_linking => 1,
            ld_load_flags       => '-shared ',
            ld_share_flags      => '-shared ',
            libparrot_ldflags   => "\"$build_dir\\libparrot.dll\"",
            inst_libparrot_ldflags => "\"$bindir\\libparrot.dll\"",
            libparrot_linkflags   => "\"$build_dir\\libparrot.dll\"",
            inst_libparrot_linkflags => "\"$bindir\\libparrot.dll\"",
            ncilib_link_extra   => 'src\libnci_test.def',
            sym_export          => '__declspec(dllexport)',
            sym_import          => '__declspec(dllimport)',
            slash               => '\\',
        );
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
