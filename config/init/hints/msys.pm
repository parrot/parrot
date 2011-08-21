# Copyright (C) 2005-2011, Parrot Foundation.

# TODO: support MSYS mode

package init::hints::msys;

use strict;
use warnings;

my %modes = (
    MINGW32 => \&_mingw,
#    MSYS => \&_msys
);

sub runstep {
    my ( $self, $conf ) = @_;

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
    $conf->data->set(
        blib_dir            => '.',
        libparrot_ldflags   => "-L. -lparrot",
        libparrot_linkflags => "-L. -lparrot",
    );

    # Custom settings for different MSYS modes
    my $mode = $ENV{MSYSTEM};
    if (exists $modes{$mode}) { $modes{$mode}->($conf) }
    else { warn "MSYS mode $mode not supported" }
}

sub _msys {
    my ( $conf ) = @_;

    # TODO: use dll name msys-parrot-XXX.dll
}

sub _mingw {
    my ( $conf ) = @_;

    # Assume Windows 2000 or above
    $conf->data->set(ccflags => '-DWIN32 -DWINVER=0x0500 ');

    # Setup installed Parrot
    my $bindir = $conf->data->get('bindir');
    $conf->data->set(
        inst_libparrot_ldflags   => "-L$bindir -lparrot",
        inst_libparrot_linkflags => "-L$bindir -lparrot",
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
