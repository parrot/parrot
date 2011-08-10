# Copyright (C) 2005-2007, Parrot Foundation.

package init::hints::msys;

use strict;
use warnings;

sub _real_path {
    my ( $path ) = @_;
    $path = `cd '$path' && pwd -W`;
    chomp $path;
    $path =~ s/ /\\ /g;
    return $path;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my @keys = qw(bindir build_dir tempdir);
    my %dirs;
    @dirs{@keys} = map { _real_path $conf->data->get($_) } @keys;

    $conf->data->set(%dirs);

    my $winver = '0x0502';

    $conf->data->set(
        ld_share_flags      => '-shared',
        ld_load_flags       => '-shared',
        has_dynamic_linking => 1,
        parrot_is_shared    => 1,
        sym_export          => '__declspec(dllexport)',
        sym_import          => '__declspec(dllimport)',
        blib_dir            => '.',
        libparrot_ldflags   => '-L' . $dirs{build_dir} . ' -lparrot',
        inst_libparrot_ldflags => '-L' . $dirs{bindir} . ' -lparrot',
        libparrot_linkflags   => '-L' . $dirs{build_dir} . ' -lparrot',
        inst_libparrot_linkflags => '-L' . $dirs{bindir} . ' -lparrot',
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
