# Copyright (C) 2014, Parrot Foundation.

=head1 NAME

config/auto/mathl.pm - Test for C90 and C99 long math extensions

=head1 DESCRIPTION

Test for the presence of various long math variants.

powl and labs are used if available.

fabsl floorl ceill fmodl expl logl are used for NUMVAL_SIZE > 8 only.
no quad variants yet.

=cut

package auto::mathl;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

our @probes = qw(labs powl fabsl floorl ceill fmodl expl logl);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Test for long math support};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;
    my $res = _probe($conf);
    $self->_check($conf, $res);
    return 1;
}

sub _probe {
    my $conf = shift;
    my $probe = shift;
    my $res;
    $conf->cc_gen('config/auto/mathl/test_c.in');
    if ($probe) { # single probes
        $conf->debug(" probe: $probe ");
        eval { $conf->cc_build("-D".uc($probe)); }
    }
    else { # default: probe all at once
        eval { $conf->cc_build( join(" ", map{"-D".uc$_} @probes) ); }
    }
    if ($@) {
        $conf->debug($@);
        $res = "";
    }
    else {
        $res = $conf->cc_run() or $conf->debug("$!");
        $conf->debug(" ($res) ");
    }
    $conf->cc_clean();
    return $res;
}

sub _check {
    my ($self, $conf, $res) = @_;
    my $result = 0;
    for my $var (@probes) {
        if ( $res =~ /$var/ ) {
            $conf->data->set( "HAS_".uc($var) => 1 );
            $result++;
        }
    }
    if ($result == @probes) {
        $self->set_result('yes');
        return 1;
    }
    else {
        # at least one failed: try each one single
        $result = 0;
        for my $var (@probes) {
            my $res = _probe($conf, $var);
            if ( $res =~ /$var/ ) {
                $conf->data->set( "HAS_".uc($var) => 1 );
                $result++;
            }
        }
        if ($result >= @probes - 2) {
            $self->set_result('most');
            return 1;
        }
        elsif ($result > 0) {
            $self->set_result('some');
            return 1;
        }
        else {
            $self->set_result('no');
            return 0;
        }
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
