# Copyright (C) 2005-2007, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/msvc.pm - Microsoft Visual C++ Compiler

=head1 DESCRIPTION

Determines whether the C compiler is actually Visual C++.

=cut

package auto::msvc;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is your C compiler actually Visual C++};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = ( shift, shift );

    if ($conf->data->get('gccversion')) {
        $conf->debug(" (skipped) ");
        $self->set_result('skipped');
        $conf->data->set( msvcversion => undef );
        return 1;
    }
    my $msvcref = _probe_for_msvc($conf);

    $self->_evaluate_msvc($conf, $msvcref);

    return 1;
}

sub _probe_for_msvc {
    my $conf = shift;
    $conf->cc_gen("config/auto/msvc/test_c.in");
    $conf->cc_build();
    my %msvc = eval $conf->cc_run() or die "Can't run the test program: $!";
    $conf->cc_clean();
    return \%msvc;
}

sub _evaluate_msvc {
    my ($self, $conf, $msvcref) = @_;
    # Set msvcversion to undef.  This will also trigger any hints-file
    # callbacks that depend on knowing whether or not we're using Visual C++.

    # This key should always exist unless the program couldn't be run,
    # which should have been caught by the 'die' above.
    # Therefore, test if it's defined to see if MSVC's installed.
    # return 'no' if it's not.
    unless ( defined $msvcref->{_MSC_VER} ) {
        $self->set_result('no');
        $conf->data->set( msvcversion => undef );
        return 1;
    }

    my $major = int( $msvcref->{_MSC_VER} / 100 );
    my $minor = $msvcref->{_MSC_VER} % 100;
    my $status = $self->_handle_not_msvc($conf, $major, $minor);
    return 1 if $status;

    my $msvcversion = $self->_compose_msvcversion($major, $minor);

    $conf->data->set( msvcversion => $msvcversion );

    # Add Visual C++ specifics here
    if ( $msvcversion >= 14.00 ) {

        # Version 14 (aka Visual C++ 2005) warns about unsafe, deprecated
        # functions with the following message.
        #
        # This function or variable may be unsafe. Consider using xxx_s instead.
        # To disable deprecation, use _CRT_SECURE_NO_DEPRECATE. See online help
        # for details.
        $conf->data->add( " ", "ccflags", "-D_CRT_SECURE_NO_DEPRECATE" );
    }
    return 1;
}

sub _handle_not_msvc {
    my $self = shift;
    my ($conf, $major, $minor) = @_;
    my $status;
    unless ( defined $major && defined $minor ) {
        $conf->debug(" (no) ");
        $self->set_result('no');
        $conf->data->set( msvcversion => undef );
        $status++;
    }
    return $status;
}

sub _compose_msvcversion {
    my $self = shift;
    my ($major, $minor) = @_;
    my $msvcversion = "$major.$minor";
    $self->set_result("yes, $msvcversion");
    return $msvcversion;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
