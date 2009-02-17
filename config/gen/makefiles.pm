# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

=head1 NAME

config/gen/makefiles.pm - Build various Makefiles

=head1 DESCRIPTION

Generates the various F<Makefile>s and other files needed to build Parrot.

=cut

package gen::makefiles;

use strict;
use warnings;


use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':gen';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Generate makefiles and other build files};
    $data{result}      = q{};
    $data{makefiles}   = {
        'Makefile' => { SOURCE => 'config/gen/makefiles/root.in' },
        'ext/Makefile' => { SOURCE => 'config/gen/makefiles/ext.in', },

        'ext/Parrot-Embed/Makefile.PL' => {
            SOURCE            => 'config/gen/makefiles/parrot_embed_pl.in',
            replace_slashes   => 0,
            conditioned_lines => 1,
        },

        'compilers/ncigen/Makefile'  =>
            { SOURCE => 'compilers/ncigen/config/makefiles/ncigen.in' },
        'compilers/nqp/Makefile'     =>
            { SOURCE => 'config/gen/makefiles/nqp.in' },
        'compilers/pct/Makefile'     =>
            { SOURCE => 'config/gen/makefiles/pct.in' },
        'compilers/pge/Makefile'     =>
            { SOURCE => 'config/gen/makefiles/pge.in' },
        'compilers/tge/Makefile'     =>
            { SOURCE => 'config/gen/makefiles/tge.in' },
        'compilers/json/Makefile'    =>
            { SOURCE => 'config/gen/makefiles/json.in' },
        'compilers/pirc/Makefile'    =>
            { SOURCE => 'config/gen/makefiles/pirc.in' },
        'src/dynpmc/Makefile'        =>
            { SOURCE => 'config/gen/makefiles/dynpmc.in' },
        'src/dynoplibs/Makefile'     =>
            { SOURCE => 'config/gen/makefiles/dynoplibs.in' },
        'editor/Makefile'            =>
            { SOURCE => 'config/gen/makefiles/editor.in' },

        'tools/build/dynpmc.pl' => {
            SOURCE            => 'config/gen/makefiles/dynpmc_pl.in',
            replace_slashes   => 0,
            conditioned_lines => 1,
        },
        'tools/build/dynoplibs.pl' => {
            SOURCE            => 'config/gen/makefiles/dynoplibs_pl.in',
            replace_slashes   => 0,
            conditioned_lines => 1,
        },
        'parrot.pc'     => { SOURCE => 'config/gen/makefiles/parrot_pc.in' },
        'docs/Makefile' => { SOURCE => 'config/gen/makefiles/docs.in' },
    };
    $data{CFLAGS_source} = 'config/gen/makefiles/CFLAGS.in';
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $self->makefiles($conf);
    $self->cflags($conf);

    return 1;
}

sub cflags {
    my ( $self, $conf ) = @_;

    $conf->genfile( $self->{CFLAGS_source} => 'CFLAGS',
        comment_type                     => '#'
    );

    open( my $CFLAGS, ">>", "CFLAGS" ) or die "open >> CFLAGS: $!";

    # Why is this here?  I'd think this information belongs
    # in the CFLAGS.in file. -- A.D.  March 12, 2004
    if ( $conf->data->get('cpuarch') =~ /sun4|sparc64/ ) {

        # CFLAGS entries must be left-aligned.
        print {$CFLAGS} <<"EOF";
src/jit_cpu.c -{-Wcast-align}        # lots of noise!
src/nci.c     -{-Wstrict-prototypes} # lots of noise!
EOF
    }

    close $CFLAGS;

    return;
}

sub makefiles {
    my ( $self, $conf ) = @_;

    my $targets = $conf->options->get('target');
    my @targets =
        defined $targets
        ? split ' ', $targets
        : keys %{ $self->{makefiles} };

    foreach my $target (@targets) {
        $target =~ s/\\/\//g if $^O eq 'MSWin32';
        my $args   = $self->{makefiles}->{$target};
        my $source = delete $args->{SOURCE};

        $conf->genfile($source => $target, %$args );
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
