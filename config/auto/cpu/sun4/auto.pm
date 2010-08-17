# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/cpu/sun4/auto.pm

=head1 DESCRIPTION

Test

=cut

package auto::cpu::sun4::auto;

use strict;
use warnings;

sub build_asm {
    my ( $self, $conf ) = @_;
    my $file = 'src/atomic/sparc_v9.s';
    my $successp;

    # borrowed from cc_build
    my ( $cc, $ccflags, $ldout, $o, $link, $linkflags, $cc_exe_out, $exe, $libs ) =
        $conf->data->get(qw(cc ccflags ld_out o link linkflags cc_exe_out exe libs));

    $successp =
        Parrot::Configure::Utils::_run_command( "$cc -c $ccflags -I./include -o sparcasm$o $file",
        'test.cco', 'test.cco', $conf->options->get('verbose') );

    return $successp;
}

sub cleanup {
    my ( $self, $conf ) = @_;
    unlink "sparcasm" . $conf->data->get('o');
}

sub runstep {
    my ( $self, $conf ) = @_;

    build_asm( $self, $conf );

    my @files = qw( test_atomic_c.in );
    for my $f (@files) {
        $conf->debug(" $f ");
        my ($suffix) = $f =~ /test_(\w+)/;
        $f = "config/auto/cpu/sun4/$f";
        $conf->cc_gen($f);
        eval { $conf->cc_build("-DPARROT_CONFIG_TEST", "sparcasm" . $conf->data->get('o') ) };
        if ($@) {
            $conf->debug(" $@ ");
        }
        else {
            if ( $conf->cc_run() =~ /ok/ ) {
                $conf->data->set(
                    "sparc_has_$suffix" => '1',
                    "HAS_SPARC_$suffix" => '1',
                );
                $conf->debug(" (\U$suffix) ");
                $conf->data->add( ' ', TEMP_atomic_o => 'src/atomic/sparc_v9.o' );
            }
        }
        $conf->cc_clean();
    }

    cleanup( $self, $conf );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
