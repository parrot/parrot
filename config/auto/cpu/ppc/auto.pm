# Copyright (C) 2001-2013, Parrot Foundation.

=head1 NAME

config/auto/cpu/ppc/auto.pm

=head1 DESCRIPTION

Test

=cut

package auto::cpu::ppc::auto;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    my @files = qw( test_gcc_cmpset_c.in );
    for my $f (@files) {
        $conf->debug(" $f ");
        my ($suffix) = $f =~ /test_(\w+)/;
        $f = "config/auto/cpu/ppc/$f";
        $conf->cc_gen($f);
        eval { $conf->cc_build("-DPARROT_CONFIG_TEST") };
        if ($@) {
            $conf->debug(" $@ ");
        }
        else {
            if ( $conf->cc_run() =~ /ok/ ) {
                $conf->data->set(
                    "ppc_has_$suffix" => '1',
                    "HAS_PPC_$suffix" => '1',
                );
                $conf->debug(" (\U$suffix) ");
                $conf->add_to_generated( $f, "[]" );
            }
        }
        $conf->cc_clean();
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
