# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/gcc.pm - GNU C Compiler

=head1 DESCRIPTION

Determines whether the C compiler is actually C<gcc>.

=cut

package auto::gcc;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is your C compiler actually gcc};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;
    my $gnucref = _probe_for_gcc($conf);
    my $rv = $self->_evaluate_gcc($conf, $gnucref);
    return $rv;
}

sub _probe_for_gcc {
    my $conf = shift;
    $conf->cc_gen("config/auto/gcc/test_c.in");
    $conf->cc_build();
    my %gnuc = eval $conf->cc_run() or die "Can't run the test program: $!";
    $conf->cc_clean();
    return \%gnuc;
}

sub _evaluate_gcc {
    my ($self, $conf, $gnucref) = @_;

    # Set gccversion to undef.  This will also trigger any hints-file
    # callbacks that depend on knowing whether or not we're using gcc.

    # This key should always exist unless the program couldn't be run,
    # which should have been caught by the 'die' above.
    unless ( exists $gnucref->{__GNUC__} ) {
        $conf->data->set( gccversion => undef );
        return 1;
    }

    my $major = $gnucref->{__GNUC__};
    my $minor = $gnucref->{__GNUC_MINOR__};
    my $intel = $gnucref->{__INTEL_COMPILER};

    if ( defined $intel || !defined $major ) {
        $conf->debug(" (no) ");
        $self->set_result('no');
        $conf->data->set( gccversion => undef );
        return 1;
    }
    if ( $major =~ tr/0-9//c ) {
        undef $major;    # Don't use it
    }
    if ( defined $minor and $minor =~ tr/0-9//c ) {
        undef $minor;    # Don't use it
    }
    if ( ! defined $major ) {
        $conf->debug(" (no) ");
        $self->set_result('no');
        $conf->data->set( gccversion => undef );
        return 1;
    }
    my $gccversion = $major;
    $gccversion .= ".$minor" if defined $minor;
    $self->set_result("yes, $gccversion");

    $conf->data->set( sym_export => '__attribute__ ((visibility("default")))' )
        if $gccversion >= 4.0 && !$conf->data->get('sym_export');

    # sneaky check for g++
    my $gpp = (index($conf->data->get('cc'), '++') > 0) ? 1 : 0;

    $conf->data->set(
        gccversion => $gccversion,
        'g++'      => $gpp,
    );
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
