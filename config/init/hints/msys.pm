# Copyright (C) 2005-2007, Parrot Foundation.

package init::hints::msys;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    my $build_dir = $conf->data->get('build_dir');
    $build_dir =~ s/ /\\ /g;

    my $bindir = $conf->data->get('bindir');
    $bindir =~ s/ /\\ /g;

    # Hardcode paths for now
    my $build_dir = 'c:/mingw/home/parrot';
    my $libdir = 'c:/mingw/lib';
    my $libexecdir = 'c:/mingw/libexec';
    my $winver = '0x0502';

    $conf->data->set(
        libdir => $libdir,
        libexecdir => $libexecdir,
        build_dir           => $build_dir,
        ld_share_flags      => '-shared',
        ld_load_flags       => '-shared',
        has_dynamic_linking => 1,
        parrot_is_shared    => 1,
        sym_export          => '__declspec(dllexport)',
        sym_import          => '__declspec(dllimport)',
        blib_dir            => '.',
        libparrot_ldflags   => '-L' . $build_dir . ' -lparrot',
        inst_libparrot_ldflags => '-L' . $bindir . ' -lparrot',
        libparrot_linkflags   => '-L' . $build_dir . ' -lparrot',
        inst_libparrot_linkflags => '-L' . $bindir . ' -lparrot',
        ccflags             => "-DWIN32 -DWINVER=$winver ",
        libs =>
'-lmsvcrt -lmoldname -lkernel32 -luser32 -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lshell32 -lole32 -loleaut32 -lnetapi32 -luuid -lws2_32 -lmpr -lwinmm -lversion ',
        ncilib_link_extra   => 'src/libnci_test.def',
    );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
