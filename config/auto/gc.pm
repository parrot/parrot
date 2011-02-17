# Copyright (C) 2001-2009, Parrot Foundation.

=head1 NAME

config/auto/gc.pm - Garbage Collection

=head1 DESCRIPTION

Sets memory allocator.

Currently, we have only one choice:  the memory allocator in
F<src/gc/alloc_resources.c>.

In the future, we will have a C<--gc> command-line option which will enable
the configurer to choose among several garbage collectors.

=over 4

=back

=cut

package auto::gc;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine allocator to use};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $gc = $conf->options->get('gc') || 'gms';
    $conf->debug(" ($gc) ");
    
    my @known_gcs = qw<gms ms ms2 inf>;

    if ($gc) {
        if (!grep /$gc/, @known_gcs) {
            die "unknown gc '$gc': valid gc cores are ".join(', ', @known_gcs);
        }
        $conf->data->set(gc_flag => '-DPARROT_GC_DEFAULT_TYPE=' . uc($gc));
        $self->set_result($gc);
    }
    else {
        $conf->data->set(gc_flag => '-DPARROT_GC_DEFAULT_TYPE=GMS');
        $self->set_result('gms');
    }

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
