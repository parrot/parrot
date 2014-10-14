# Copyright (C) 2005-2015, Parrot Foundation.

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
    my $libdir = $conf->data->get('libdir');
    $libdir =~ s/ /\\ /g;
    my $libparrot_shared = $conf->data->get('libparrot_shared');
    if ($libparrot_shared) {
        # force cyg prefix
        $libparrot_shared =~ s/^lib/cyg/g;
        # force the dll versioning
        my @parrot_version = Parrot::BuildUtil::parrot_version();
        my $dllsuffix = join('.', @parrot_version);
        $libparrot_shared =~ s/parrot\.dll/parrot-$dllsuffix\.dll/;
    }

    # An old note about building shared libraries: Perl5 used the 'ld2' tool until
    # 5.8.8-4, which is installed as part of the perl5 installation. So far, it
    # appears parrot can get by with simply using gcc -shared, so we override
    # the perl5 Configure defaults and use 'gcc -shared' instead of 'ld2'.  If
    # this later causes problems, it might be worth revisiting.  A. Dougherty
    # 9/9/2002
    if ($conf->data->get('ld') eq 'ld2') {
        $conf->data->set('ld' => 'gcc');
    }
    # cygwin gcc removed the old gcc-4 symlink, but perl still uses gcc-4/g++-4
    if ($conf->data->get('ld') eq 'g++-4' and !-e '/usr/bin/g++-4') {
        $conf->data->set('ld' => 'g++');
        if ($conf->data->get('cc') eq 'gcc-4' and !-e '/usr/bin/gcc-4') {
            $conf->data->set('cc' => 'gcc');
        }
        if ($conf->data->get('link') eq 'gcc-4' and !-e '/usr/bin/gcc-4') {
            $conf->data->set('link' => 'gcc');
        }
    }
    else {
        # default to gcc-4 on cygwin-1.7 with the old gcc package.
        # -shared-libgcc should be used also, but this will be the new default soon.
        my $cygwin = `/bin/uname -r`;
        if ($cygwin =~ /^1\.7\./) {
            $conf->data->set(cc => 'gcc-4') if -e '/usr/bin/gcc-4'
                and !$conf->options->get('cc');
            $conf->data->set(ld => 'g++-4') if -e '/usr/bin/g++-4'
                and !$conf->options->get('ld');
        }
    }

    $conf->data->set(
        cp                  => '/bin/cp', # ExtUtils::Command::cp broken cpan #56666
        build_dir           => $build_dir,
        ld_share_flags      => '-shared',
        ld_load_flags       => '-shared',
        libs                => $libs,
        has_static_linking  => 0,
        has_dynamic_linking => 1,
        parrot_is_shared    => $conf->options->get('disable-shared') ? 0 : 1,
        sym_export          => '__declspec(dllexport)',
        sym_import          => '__declspec(dllimport)',
        libparrot_shared    => $libparrot_shared,
        libparrot_ldflags   => '-L' . $build_dir . ' -lparrot',
        inst_libparrot_ldflags => '-L' . $libdir . ' -lparrot',
        libparrot_linkflags   => '-L' . $build_dir . ' -lparrot',
        inst_libparrot_linkflags => '-L' . $libdir . ' -lparrot',
    );
    unless ( $libparrot_shared ) {
        $conf->data->set(
             libparrot_ldflags   => '-L' . $build_dir . '/blib/lib -lparrot',
             libparrot_linkflags => '-L' . $build_dir . '/blib/lib -lparrot'
        );
    }

    # inet_aton needs to be defined on Cygwin.
    my $define = $conf->options->get('define');
    unless ($define) {
        $define = 'inet_aton';
    }
    elsif ( $define !~ /inet_[ap]ton/ ) {
        $define = join( ',', 'inet_aton', $define );
    }
    $conf->options->set( define => $define );

    # -shared-libgcc should be used also, but this will be the new default soon.
    my $cygwin = `/bin/uname -r`;
    if ($cygwin =~ /^1\.7\./) {
        $conf->data->set(cc => 'gcc') unless $conf->options->get('cc');
        $conf->data->set(ld => 'g++') unless $conf->options->get('ld');
    }
    $conf->data->set( clock_best => '-DCLOCK_BEST=CLOCK_REALTIME' );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
