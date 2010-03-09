# Copyright (C) 2001-2009, Parrot Foundation.
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
        'Makefile' => {
            SOURCE => 'config/gen/makefiles/root.in',
        },
        'ext/Makefile' => {
            SOURCE => 'config/gen/makefiles/ext.in',
        },
        'compilers/imcc/Rules.mak' => {
             SOURCE => 'compilers/imcc/Rules.in',
        },
        'src/dynoplibs/Rules.mak' => {
             SOURCE => 'src/dynoplibs/Rules.in',
        },
        'src/dynoplibs/Defines.mak' => {
             SOURCE => 'src/dynoplibs/Defines.in',
        },

        'ext/Parrot-Embed/Makefile.PL' => {
            SOURCE            => 'config/gen/makefiles/parrot_embed_pl.in',
            conditioned_lines => 1,
        },

        'compilers/ncigen/Makefile'  =>
            { SOURCE => 'compilers/ncigen/config/makefiles/ncigen.in' },
        'src/dynpmc/Makefile'        =>
            { SOURCE => 'config/gen/makefiles/dynpmc.in' },
        'editor/Makefile'            =>
            { SOURCE => 'config/gen/makefiles/editor.in' },

        'parrot.pc'     => { SOURCE => 'config/gen/makefiles/parrot_pc.in' },
        'docs/Makefile' => { SOURCE => 'config/gen/makefiles/docs.in' },
    };
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $self->makefiles($conf);

    return 1;
}

sub makefiles {
    my ( $self, $conf ) = @_;

    my $targets = $conf->options->get('target');
    my @targets =
        defined $targets
        ? split ' ', $targets
        : keys %{ $self->{makefiles} };

    foreach my $target (@targets) {
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
