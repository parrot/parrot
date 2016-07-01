# Copyright (C) 2005-2011, Parrot Foundation.

package init::hints::msys;

use strict;
use warnings;

sub _real_path {
    my ( $path ) = @_;
    $path = `cd '$path' && pwd -W`;
    chomp $path;
    return $path;
}

sub runstep {
    my ( $self, $conf ) = @_;

    # Translate absolute paths accessed by Parrot tools
    # from UNIX-style to Windows-style
    my @keys = qw{bindir build_dir tempdir};
    my %dirs;
    @dirs{@keys} = map { _real_path $conf->data->get($_) } @keys;
    $conf->data->set(%dirs);

    # Assume Windows 2000 or above
    $conf->data->set(ccflags => "-DWIN32 -DWINVER=0x0500 ");

    # Create Parrot as shared library
    $conf->data->set(
        parrot_is_shared    => 1,
        has_dynamic_linking => 1,
        ld_share_flags      => '-shared',
        ld_load_flags       => '-shared',
        sym_export          => '__declspec(dllexport)',
        sym_import          => '__declspec(dllimport)'
    );

    # Create libparrot.dll in same directory as parrot.exe
    # Generates unnecessary clutter in build directory
    $conf->data->set(blib_dir => '.');

    # Setup dynamic linking
    $conf->data->set(
        libparrot_ldflags        => '-L' . $dirs{build_dir} . ' -lparrot',
        libparrot_linkflags      => '-L' . $dirs{build_dir} . ' -lparrot',
        inst_libparrot_ldflags   => '-L' . $dirs{bindir} . ' -lparrot',
        inst_libparrot_linkflags => '-L' . $dirs{bindir} . ' -lparrot',
        libs =>
'-lmsvcrt -lmoldname -lkernel32 -luser32 -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lshell32 -lole32 -loleaut32 -lnetapi32 -luuid -lws2_32 -lmpr -lwinmm -lversion '
    );

    # NCI testing
    $conf->data->set(ncilib_link_extra => 'src/libnci_test.def');
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
