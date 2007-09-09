# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

package init::hints::linux;

use strict;
use warnings;

use Config;

our $verbose;

sub runstep {
    my ( $self, $conf ) = @_;

    my $libs        = $conf->option_or_data('libs');
    my $ccflags     = $conf->option_or_data('ccflags');
    my $cc          = $conf->option_or_data('cc');
    my $linkflags   = $conf->option_or_data('linkflags');

    $verbose = $conf->options->get( 'verbose' );
    print $/ if $verbose;

    # should find g++ in most cases
    my $link = $conf->data->get('link') || 'c++';

    if ( $libs !~ /-lpthread/ ) {
        $libs .= ' -lpthread';
    }
    my $ld_share_flags = $conf->data->get('ld_share_flags');
    my $cc_shared      = $conf->data->get('cc_shared');

    if ( $cc =~ /icc/ ) {
        # Intel C++ compiler has the same name as its C compiler
        $link = $cc;

        # don't allow icc to pretend it's gcc
        $ccflags .= ' -no-gcc';

        # suppress sprintf warnings that don't apply
        $ccflags .= ' -wd269';

        # suppress remarks about floating point comparisons
        $ccflags .= ' -wd1572';

        # gcc is currently not looking for unused variables, so should icc
        # for the time being (this will reduce the noise somewhat)
        $ccflags .= ' -wd869';

        # ignore warnings springing from problems with computed goto
        # statements.  If someone can find out how to make icc play nicely
        # in these situations, that would be good.
        $ccflags .= ' -wd1296';

        $ccflags .= ' -Wall -Wcheck -w2';

        $ld_share_flags = ' -shared -g -pipe -fexceptions -fPIC';
        $cc_shared .= ' -fPIC';

        $verbose and print " ccflags: $ccflags\n";
    }
    elsif ( $cc =~ /suncc/ ) {
        $link = 'sunCC';
        if ( $ld_share_flags !~ /-KPIC/ ) {
            $ld_share_flags = '-KPIC';
        }
        if ( $cc_shared !~ /-KPIC/ ) {
            $cc_shared = '-KPIC';
        }
    }
    else {
        if ( $ld_share_flags !~ /-fPIC/ ) {
            $ld_share_flags .= ' -fPIC';
        }
        if ( $cc_shared !~ /-fPIC/ ) {
            $cc_shared .= ' -fPIC';
        }

        # --export-dynamic, s. info gcc, ld
        $linkflags .= ' -Wl,-E';
    }

    if ( $ccflags !~ /-D_GNU_SOURCE/ ) {

        # Request visibility of all POSIX symbols
        # _XOPEN_SOURCE=600 doesn't work with glibc 2.1.3
        # _XOPEN_SOURCE=500 gives 2 undefined warns (setenv, unsetenv) on 2.1.3
        $ccflags .= ' -D_GNU_SOURCE';
    }

    $conf->data->set(
        ccflags        => $ccflags,
        libs           => $libs,
        ld_share_flags => $ld_share_flags,
        ld_load_flags  => $ld_share_flags,
        i_lib_pthread  => 1,                 # RT#43149 fake a header entry
        linkflags      => $linkflags,
        link           => $link,
        cc_shared      => $cc_shared,
        rpath          => '-Wl,-rpath=',

        has_dynamic_linking    => 1,
        parrot_is_shared       => 1,
        libparrot_shared       => 'libparrot$(SHARE_EXT).$(SOVERSION)',
        libparrot_shared_alias => 'libparrot$(SHARE_EXT)',
        libparrot_soname       => '-Wl,-soname=libparrot$(SHARE_EXT).$(SOVERSION)',
    );

    if ( ( split( '-', $Config{archname} ) )[0] eq 'ia64' ) {
        $conf->data->set( platform_asm => 1 );
    }
    return;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
