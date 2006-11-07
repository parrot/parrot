# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

config/gen/cpu/i386/auto.pm

=head1 DESCRIPTION

Test for MMX/SSE functionality. Creates these Config entries

 TEMP_generated => 'files ...'   for inclusion in platform.c or platform.h
 i386_has_mmx   => 1

=cut

package gen::cpu::i386::auto;

use strict;
use warnings;

use Parrot::Configure::Step qw(cc_gen cc_build cc_run cc_clean);

sub runstep
{
    my ($self, $conf) = @_;

    my $verbose = $conf->options->get('verbose');

    my @files = qw( memcpy_mmx.c memcpy_sse.c );
    for my $f (@files) {
        print " $f " if $verbose;
        my ( $suffix ) = $f =~ /memcpy_(\w+)/;
        $f = "config/gen/cpu/i386/$f";
        cc_gen($f);
        eval(cc_build("-DPARROT_CONFIG_TEST"));
        if ($@) {
            print " $@ " if $verbose;
        } else {
            if (cc_run() =~ /ok/) {
                $conf->data->set(
                    "i386_has_$suffix" => '1',
                    "HAS_i386_$suffix" => '1',
                );
                print " (\U$suffix) " if ($verbose);
                $conf->data->add(' ', TEMP_generated => $f);
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
