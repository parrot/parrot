# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/aio.pm - Test for AI/O

=head1 DESCRIPTION

Determines whether the platform supports asynchronous input/output.

From the documentation to Marc Lehmann's CPAN module IO::AIO
(L<http://search.cpan.org/dist/IO-AIO/AIO.pm>):

I<"Asynchronous means that operations that can normally block your program
(e.g. reading from disk) will be done asynchronously: the operation will
still block, but you can do something else in the meantime. This is
extremely useful for programs that need to stay interactive even when
doing heavy I/O (GUI programs, high performance network servers etc.),
but can also be used to easily do operations in parallel that are
normally done sequentially ....">

=cut

package auto::aio;

use strict;
use warnings;

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determining if your platform supports AIO};
    $data{args}        = [ qw( verbose ) ];
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = ( shift, shift );

    my $verbose = $conf->options->get('verbose');
    my $libs    = $conf->data->get('libs');
    $conf->data->add( ' ', libs => '-lrt' );

    my $errormsg = _first_probe_for_aio();
    if ( ! $errormsg ) {
        my $test = cc_run(35);

        # if the test is failing with sigaction err
        # we should repeat it with a different signal number
        if (
            $test =~ /SIGRTMIN=(\d+)\sSIGRTMAX=(\d+)\n
                INFO=42\n
                ok/x
            )
        {
            print " (yes) " if $verbose;
            $self->set_result('yes');

            $conf->data->set(
                aio        => 'define',
                HAS_AIO    => 1,
                D_SIGRTMIN => $1,
                D_SIGRTMAX => $2,
            );
        }

    }
    else {
        $self->_handle_error_case($conf, $libs, $verbose);
    }

    return 1;
}

sub _first_probe_for_aio {
    my $errormsg;
    cc_gen('config/auto/aio/aio.in');
    eval { cc_build(); };
    $errormsg = 1 if  $@;
    return $errormsg;
}

sub _handle_error_case {
    my ($self, $conf, $libs, $verbose) = @_;
    $conf->data->set( libs => $libs );
    print " (no) " if $verbose;
    $self->set_result('no');
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
