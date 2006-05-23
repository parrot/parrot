# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

package init::hints::cygwin;

use strict;

sub runstep
{
    my ($self, $conf) = @_;

    # cygwin's perl is compiled with -lutil, which for some reason is not
    # in the standard installation, so we get rid of it
    my $libs = $conf->data->get('libs');
    $libs =~ s/-lutil\b//g;

    my $build_dir = $conf->data->get('build_dir');
    $build_dir =~ s/ /\\ /g;

    # A note about building shared libraries:  Perl5 uses the 'ld2' tool, which
    # is installed as part of the perl5 installation.  So far, it appears
    # parrot can get by with simply using gcc -shared, so we override the
    # perl5 Configure defaults and use 'gcc -shared' instead of 'ld2'.
    # If this later causes problems, it might be worth revisiting.
    # A. Dougherty 9/9/2002
    $conf->data->set(
        build_dir           => $build_dir,
        ld                  => 'gcc',
        ld_share_flags      => '-shared',
        ld_load_flags       => '-shared',
        libs                => $libs,
        has_static_linking  => 0,
        has_dynamic_linking => 1,
        parrot_is_shared    => 1,
        sym_export => '__declspec(dllexport)',
        sym_import => '__declspec(dllimport)'
    );

    # inet_aton needs to be defined on Cygwin.
    my $define = $conf->options->get('define');
    unless ($define) {
        $define = 'inet_aton';
    } elsif ($define !~ /inet_[ap]ton/) {
        $define = join(',', 'inet_aton', $define);
    }
    $conf->options->set(define => $define);
}

1;
