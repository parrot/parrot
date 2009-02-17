# Copyright (C) 2005, Parrot Foundation.
# $Id$

package init::hints::cygwin;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    # cygwin's perl is compiled with -lutil, which for some reason is not
    # in the standard installation, so we get rid of it
    my $libs = $conf->data->get('libs');
    $libs =~ s/-lutil\b//g;
    # same for -lm and -dl
    $libs =~ s/-lm\b//g;
    $libs =~ s/-ldl\b//g;

    my $build_dir = $conf->data->get('build_dir');
    $build_dir =~ s/ /\\ /g;
    my $libparrot_shared = $conf->data->get('libparrot_shared');
    # force cyg prefix
    $libparrot_shared =~ s/^lib/cyg/g;
    # force the dll versioning
    my @parrot_version = Parrot::BuildUtil::parrot_version();
    my $dllsuffix = join("_",@parrot_version);
    $libparrot_shared =~ s/parrot\.dll/parrot$dllsuffix\.dll/;

    # An old note about building shared libraries: Perl5 used the 'ld2' tool until
    # 5.8.8-4, which is installed as part of the perl5 installation. So far, it
    # appears parrot can get by with simply using gcc -shared, so we override
    # the perl5 Configure defaults and use 'gcc -shared' instead of 'ld2'.  If
    # this later causes problems, it might be worth revisiting.  A. Dougherty
    # 9/9/2002
    $conf->data->set(
        build_dir           => $build_dir,
        ld                  => $conf->data->get('ld') eq 'ld2'
                               ? 'gcc' # do not use old perl5 linker helper
                               : $conf->data->get('ld'), # gcc or g++
        ld_share_flags      => '-shared',
        ld_load_flags       => '-shared',
        libs                => $libs,
        has_static_linking  => 0,
        has_dynamic_linking => 1,
        parrot_is_shared    => 1,
        sym_export          => '__declspec(dllexport)',
        sym_import          => '__declspec(dllimport)',
        libparrot_shared    => $libparrot_shared,
        blib_dir            => '.',
        libparrot_ldflags   => '-L' . $build_dir . ' -lparrot',
    );

    # inet_aton needs to be defined on Cygwin.
    my $define = $conf->options->get('define');
    unless ($define) {
        $define = 'inet_aton';
    }
    elsif ( $define !~ /inet_[ap]ton/ ) {
        $define = join( ',', 'inet_aton', $define );
    }
    $conf->options->set( define => $define );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
