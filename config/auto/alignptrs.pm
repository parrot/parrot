# Copyright (C) 2001-2005, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/alignptrs.pm - pointer alignment

=head1 DESCRIPTION

Determine the minimum pointer alignment.

=cut

package auto::alignptrs;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine your minimum pointer alignment};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = ( shift, shift );

    my $result_str = '';
    my $align;
    if ( defined( $conf->data->get('ptr_alignment') ) ) {
        $align = $conf->data->get('ptr_alignment');
        $result_str .= "configured: ";
    }
    elsif ( $conf->data->get_p5('OSNAME') eq 'hpux' && $conf->data->get_p5('ccflags') !~ /DD64/ ) {

        # HP-UX 10.20/32 hangs in this test.
        $align = 4;
        $conf->data->set( ptr_alignment => $align );
        $result_str .= "for hpux: ";
    }
    else {

        # Now really test by compiling some code
        $conf->cc_gen('config/auto/alignptrs/test_c.in');
        $conf->cc_build();
        my $minimum_valid_align;
        my @aligns = (1, 2, 4, 8, 16, 32, 64);
        TRY_ALIGN: while ( defined( my $try_align = shift(@aligns) ) ) {
            my $results = $conf->cc_run_capture($try_align);
            $align = _evaluate_results($results, $try_align);
            if (defined $align) {
                $minimum_valid_align = $align;
                last TRY_ALIGN;
            }
            else {
                next TRY_ALIGN;
            }
        }
        $conf->cc_clean();

        _evaluate_ptr_alignment($conf, $minimum_valid_align);

        # If at this point we haven't died, then we can assign
        # $minimum_valid_align to $align.
        $align = $minimum_valid_align;
    }

    $self->_finalize_result_str($align, $result_str);

    return 1;
}

sub _evaluate_results {
    my ($results, $try_align) = @_;
    my $align;
    if ( $results =~ /OK/ && $results !~ /align/i ) {
        $align = $try_align;
    }
    return $align;
}

sub _evaluate_ptr_alignment {
    my ($conf, $minimum_valid_align) = @_;
    die "Can't determine alignment!\n" unless defined $minimum_valid_align;
    $conf->data->set( ptr_alignment => $minimum_valid_align );
}

sub _finalize_result_str {
    my $self = shift;
    my ($align, $result_str) = @_;
    $result_str .= " $align byte";
    $result_str .= "s" unless $align == 1;
    $self->set_result($result_str);
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
