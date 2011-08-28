# Copyright (C) 2001-2009, Parrot Foundation.

=head1 NAME

config/auto/gc.pm - Garbage Collection

=head1 DESCRIPTION

Sets memory allocator.

The C<--gc> command-line option enables the configurer to choose among
several garbage collectors.  Current available options are:

=over 4

=item ms

Stop-the-world mark & sweep

=item inf

Infinite memory "collector"

=item ms2

New style mark & sweep

=item gms (default)

Generational M&S based on MS2

=back

The choice is stored as C<gc_type> in C<%PConfig>, and available
(uppercased) as PARROT_GC_DEFAULT_TYPE in F<parrot/config.h>

For backwards compatibility with parrot 3.1.0 and earlier, an empty
entry C<gc_flag> is maintained.  (It used to be used in Makefiles to
append to the C compiler flags.)

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
        $conf->data->set(gc_type => uc($gc));
        $self->set_result($gc);
    }
    $conf->data->set(gc_flag => ''); # Compatibility with parrot-3.1.0 and earlier

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
