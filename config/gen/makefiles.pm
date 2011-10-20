# Copyright (C) 2001-2010, Parrot Foundation.

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
        'compilers/imcc/Rules.mak' => {
             SOURCE => 'compilers/imcc/Rules.in',
        },
        'src/dynoplibs/Rules.mak' => {
             SOURCE => 'src/dynoplibs/Rules.in',
        },
        'src/dynoplibs/Defines.mak' => {
             SOURCE => 'src/dynoplibs/Defines.in',
        },

        'src/dynpmc/Rules.mak' => {
             SOURCE => 'src/dynpmc/Rules.in',
        },
        'src/dynpmc/Defines.mak' => {
             SOURCE => 'src/dynpmc/Defines.in',
        },
        'editor/Makefile'            =>
            { SOURCE => 'config/gen/makefiles/editor.in' },

        'docs/Makefile' => { SOURCE => 'config/gen/makefiles/docs.in' },
    };
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $self->makefiles($conf);

    $conf->shebang_mod( 'tools/dev/mk_language_shell.in'
                         => 'tools/dev/mk_language_shell.pl', );

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
