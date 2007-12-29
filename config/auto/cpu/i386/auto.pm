# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/cpu/i386/auto.pm

=head1 DESCRIPTION

Test for MMX/SSE functionality. Creates these Config entries

 TEMP_generated => 'files ...'   for inclusion in platform.c or platform.h
 i386_has_mmx   => 1

=cut

package auto::cpu::i386::auto;

use strict;
use warnings;

use Parrot::Configure::Step qw(cc_gen cc_build cc_run cc_clean);

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get('verbose');

    my @files = qw( memcpy_mmx.c memcpy_sse.c );
    for my $f (@files) {
        print " $f " if $verbose;
        my ($suffix) = $f =~ /memcpy_(\w+)/;
        my $path_f = "config/auto/cpu/i386/$f";
        cc_gen($path_f);
        eval( cc_build("-DPARROT_CONFIG_TEST") );
        if ($@) {
            print " $@ " if $verbose;
        }
        else {
            if ( cc_run() =~ /ok/ ) {
                _handle_cc_run_ok($conf, $suffix, $path_f, $verbose);
            }
        }
        cc_clean();
    }

    @files = qw( test_gcc_cmpxchg.in );
    for my $f (@files) {
        print " $f " if $verbose;
        my ($suffix) = $f =~ /test_(\w+)/;
        my $path_f = "config/auto/cpu/i386/$f";
        cc_gen($path_f);
        eval { cc_build("-DPARROT_CONFIG_TEST") };
        if ($@) {
            print " $@ " if $verbose;
        }
        else {
            if ( cc_run() =~ /ok/ ) {
                _handle_cc_run_ok($conf, $suffix, $path_f, $verbose);
            }
        }
        cc_clean();
    }
    return;
}

sub _handle_cc_run_ok {
    my ($conf, $suffix, $path_f, $verbose) = @_;
    $conf->data->set(
        "i386_has_$suffix" => '1',
        "HAS_i386_$suffix" => '1',
    );
    print " (\U$suffix) " if ($verbose);
    $conf->data->add( ' ', TEMP_generated => $path_f );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
