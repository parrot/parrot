# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/gen/cpu/ppc/auto.pm

=head1 DESCRIPTION

Power PC-specific configuration hints.

=cut

package gen::cpu::ppc::auto;

use strict;
use warnings;

use Parrot::Configure::Step qw(cc_gen cc_build cc_run cc_clean);

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get('verbose');

    my @files = qw( test_gcc_cmpset.in );
    for my $f (@files) {
        print " $f " if $verbose;
        my ($suffix) = $f =~ /test_(\w+)/;
        my $path_f = "config/gen/cpu/ppc/$f";
        cc_gen($path_f);
        eval { cc_build("-DPARROT_CONFIG_TEST") };
        if ($@) {
            print " $@ " if $verbose;
        }
        else {
            if ( cc_run() =~ /ok/ ) {
                $conf->data->set(
                    "ppc_has_$suffix" => '1',
                    "HAS_PPC_$suffix" => '1',
                );
                print " (\U$suffix) " if ($verbose);
                $conf->data->add( ' ', TEMP_generated => $path_f );
            }
        }
        cc_clean();
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
