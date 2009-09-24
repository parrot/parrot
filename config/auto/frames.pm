# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/frames

=head1 DESCRIPTION

Determines whether the current platform is capable of building NCI call
frames dynamically.  Use the C<--buildframes> option to override the
default value for your CPU architecture and operating system.

=cut

package auto::frames;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine call frame building capability};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $can_build_call_frames = _call_frames_buildable($conf);

    $self->_handle_can_build_call_frames( $conf, $can_build_call_frames );

    return 1;
}

sub _call_frames_buildable {
    my $conf = shift;
    my $osname  = $conf->data->get('osname');
    my $cpuarch = $conf->data->get('cpuarch');
    my $nvsize  = $conf->data->get('nvsize');
    my $can_build_call_frames;

    if (defined $conf->options->get('buildframes')) {
        $can_build_call_frames = $conf->options->get('buildframes');
    }
    else {
        $can_build_call_frames = ($nvsize == 8 && $cpuarch eq 'i386'
            && $osname ne 'darwin');
    }
    return $can_build_call_frames;
}

sub _handle_can_build_call_frames {
    my ($self, $conf, $can_build_call_frames) = @_;
    if ( $can_build_call_frames ) {
        $conf->data->set(
            cc_build_call_frames  => '-DCAN_BUILD_CALL_FRAMES',
        );
        # test for executable malloced memory
        my $osname = $conf->data->get( 'osname' );
        if ( -e "config/auto/frames/test_exec_${osname}_c.in" ) {
            $conf->cc_gen("config/auto/frames/test_exec_${osname}_c.in");
            eval { $conf->cc_build(); };
            if ($@) {
                $conf->data->set( has_exec_protect => 0 );
            }
            else {
                my $exec_protect_test = (
                    $conf->cc_run(0) !~ /ok/ && $conf->cc_run(1) =~ /ok/
                );
                if ($exec_protect_test) {
                    $conf->data->set( has_exec_protect => 1 );
                }
                else {
                    $conf->data->set( has_exec_protect => 0 );
                }
            }
            $conf->cc_clean();
        }
        else {
            $conf->data->set( has_exec_protect => 0 );
        }
        $self->set_result( 'yes' );
    }
    else {
        $conf->data->set( cc_build_call_frames  => '');
        $self->set_result( 'no' );
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
