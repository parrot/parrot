# Copyright (C) 2001-2013, Parrot Foundation.

=head1 NAME

config/auto/cpu/i386/auto.pm

=head1 DESCRIPTION

Test for cmpxchg ASM functionality. Creates these Config entries

 i386_has_gcc_cmpxchg_c   => 1

=cut

package auto::cpu::i386::auto;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    my @files = qw( test_gcc_cmpxchg_c.in );
    for my $f (@files) {
        $conf->debug(" $f ");
        my ($suffix) = $f =~ /test_(\w+)/;
        my $path_f = "config/auto/cpu/i386/$f";
        $conf->cc_gen($path_f);
        eval { $conf->cc_build("-DPARROT_CONFIG_TEST") };
        if ($@) {
            $conf->debug(" $@ ");
        }
        else {
            if ( $conf->cc_run() =~ /ok/ ) {
                _handle_cc_run_ok($conf, $suffix, $path_f);
                $conf->add_to_generated( $path_f, "[]" );
            }
        }
        $conf->cc_clean();
    }
    return;
}

sub _handle_cc_run_ok {
    my ($conf, $suffix, $path_f) = @_;
    $conf->data->set(
        "i386_has_$suffix" => '1',
        "HAS_i386_$suffix" => '1',
    );
    $conf->debug(" (\U$suffix) ");
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
