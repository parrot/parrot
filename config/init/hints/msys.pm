# Copyright (C) 2005-2011, Parrot Foundation.

package init::hints::msys;

use strict;
use warnings;

sub _real_path {
    my ( $path ) = @_;
    $path = `mkdir -p '$path' && cd '$path' && pwd -W`;
    chomp $path;
    return $path;
}

sub runstep {
    my (undef, $conf) = @_;

    # Translate absolute paths from UNIX-style to Windows-style
    my @keys = qw{bindir build_dir tempdir libdir includedir};
    my %dirs;
    @dirs{@keys} = map { _real_path $conf->data->get($_) } @keys;
    $conf->data->set(%dirs);

    # Identify as msys instead of win32
    $conf->data->set(msys => 1);

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

    # Link non-default Windows libs and setup path for MSYS libs
    # Use /bin instead of /lib to avoid incorrectly pulling in other MSYS libs
    $conf->data->set(libs => '-lws2_32 -L/bin');

    # Setup built Parrot
    $conf->data->set(
        libparrot_ldflags   => '-L. -lparrot',
        libparrot_linkflags => '-L. -lparrot',
    );

    # Setup installed Parrot
    my $bindir = $conf->data->get('bindir');
    $bindir =~ s{ }{\\ }g;
    $conf->data->set(
        inst_libparrot_ldflags   => "-L$bindir -lparrot",
        inst_libparrot_linkflags => "-L$bindir -lparrot"
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
