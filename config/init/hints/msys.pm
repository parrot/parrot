# Copyright (C) 2005-2011, Parrot Foundation.

package init::hints::msys;

use strict;
use warnings;

my %modes = (
    MINGW32 => \&_mingw,
    MSYS => \&_msys
);

sub runstep {
    my (undef, $conf) = @_;

    # Assume Windows 2000 or above
    $conf->data->set(ccflags => '-DWINVER=0x0500 ');

    # Create Parrot as shared library
    $conf->data->set(
        parrot_is_shared    => 1,
        has_dynamic_linking => 1,
        has_static_linking  => 0,
        ld_share_flags      => '-shared',
        ld_load_flags       => '-shared',
        sym_export          => '__declspec(dllexport)',
        sym_import          => '__declspec(dllimport)'
    );

    # Link non-default libs
    $conf->data->set(libs => '-lws2_32');

    # Create DLL in same directory as executable
    # Generates unnecessary clutter in build directory
    $conf->data->set(
        blib_dir            => '.',
        libparrot_ldflags   => '-L. -lparrot',
        libparrot_linkflags => '-L. -lparrot',
    );

    # Setup installed Parrot
    my $bindir = $conf->data->get('bindir');
    $bindir =~ s/ /\\ /g;
    $conf->data->set(
        inst_libparrot_ldflags   => "-L$bindir -lparrot",
        inst_libparrot_linkflags => "-L$bindir -lparrot"
    );

    # NCI testing
    $conf->data->set(ncilib_link_extra => 'src/libnci_test.def');

    # Custom settings for different MSYS modes
    my $mode = $ENV{MSYSTEM};
    if (exists $modes{$mode}) { $modes{$mode}->($conf) }
    else { warn "MSYS mode $mode not supported" }
}

sub _msys {
    my ($conf) = @_;

    # Use MSYS naming scheme for DLLs
    my $libname = $conf->data->get('libparrot_shared');
    $libname =~ s/^lib/msys-/g;
    $conf->data->set(libparrot_shared => $libname);

    # Set Windows defines
    my $ccflags = $conf->data->get('ccflags');
    $conf->data->set(ccflags => '-mwin32 '.$ccflags);
}

sub _mingw {
    my ($conf) = @_;

    my $bindir = $conf->data->get('bindir');
    $bindir = `cd '$bindir' && pwd -W`;
    chomp $bindir;
    $conf->data->set(bindir => $bindir);

    # Setup path for MSYS libs
    my $libs = $conf->data->get('libs');
    $conf->data->set(libs => $libs.' -L/bin');
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
