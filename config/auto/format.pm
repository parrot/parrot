# Copyright (C) 2001-2003, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/format.pm - Sprintf Formats

=head1 DESCRIPTION

Figures out what formats should be used for C<sprintf()>.

=cut

package auto::format;

use strict;
use warnings;
use Config;  # for long double printf format

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Step;


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{What formats should be used for sprintf};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    _set_intvalfmt($conf);

    _set_intvalmaxmin($conf);

    _set_floatvalfmt_nvsize($conf);

    _set_floatvalmaxmin($conf);

    return 1;
}

sub _set_intvalfmt {
    my $conf = shift;
    my $ivformat;
    my $iv = $conf->data->get(qw(iv));

    if ( $iv eq "int" ) {
        $ivformat = "%d";
    }
    elsif ( ( $iv eq "long" ) || ( $iv eq "long int" ) ) {
        $ivformat = "%ld";
    }
    elsif ( ( $iv eq "long long" ) || ( $iv eq "long long int" ) ) {
        $ivformat = "%lld";
    }
    else {
        die qq{Configure.pl:  Can't find a printf-style format specifier for type '$iv'\n};
    }
    $conf->data->set( intvalfmt   => $ivformat );
}

# This is unrelated to format, may be moved to other place later
sub _set_intvalmaxmin {
    my $conf = shift;
    my $ivmin;
    my $ivmax;
    my $iv = $conf->data->get(qw(iv));

    if ( $iv eq "int" ) {
        $ivmin = 'INT_MIN';
        $ivmax = 'INT_MAX';
    }
    elsif ( ( $iv eq "long" ) || ( $iv eq "long int" ) ) {
        $ivmin = 'LONG_MIN';
        $ivmax = 'LONG_MAX';
    }
    elsif ( ( $iv eq "long long" ) || ( $iv eq "long long int" ) ) {
        # The assumption is that a compiler that have the long long type
        # also provides his limit macros.
        $ivmax = 'LLONG_MIN';
        $ivmin = 'LLONG_MAX';
    }
    else {
        die qq{Configure.pl:  Can't find limits for type '$iv'\n};
    }

    $conf->data->set( intvalmin   => $ivmin );
    $conf->data->set( intvalmax   => $ivmax );

    $conf->cc_gen('config/auto/format/intval_maxmin_c.in');
    eval { $conf->cc_build(); };
    if ( $@ ) {
        $ivmin = '0';
        $ivmax = '0';
    }

}

sub _set_floatvalfmt_nvsize {
    my $conf = shift;
    my ( $nv, $floatsize, $doublesize, $ldsize ) =
        $conf->data->get(qw(nv floatsize doublesize hugefloatvalsize));
    my ( $nvformat, $nvsize );
    $nvsize = $floatsize;
    if ( $nv eq "double" ) {
        $nvsize   = $doublesize;
        $nvformat = "%.15g";
    }
    elsif ( $nv eq "long double" ) {

        # Stay way from long double for now (it may be 64 or 80 bits)
        # die "long double not supported at this time, use double.";
        $nvsize   = $ldsize;
        if (defined($Config{'sPRIgldbl'})) {
            $nvformat = "%.15" .  $Config{'sPRIgldbl'};
            $nvformat =~ s/"//g;   # Perl 5's Config value has embedded double quotes
        }
        else {
            die qq{Configure.pl:  Can't find a printf-style format specifier for type '$nv'\n};
        }
    }
    else {
        die qq{Configure.pl:  Can't find a printf-style format specifier for type '$nv'\n};
    }

    $conf->data->set(
        floatvalfmt => $nvformat,
        nvsize      => $nvsize
    );
}

# This is unrelated to format, may be moved to other place later
sub _set_floatvalmaxmin {
    my $conf = shift;
    my $nvmin;
    my $nvmax;
    my $nv = $conf->data->get(qw(nv));

    if ( $nv eq "double" ) {
        $nvmin = 'DBL_MIN';
        $nvmax = 'DBL_MAX';
    }
    elsif ( $nv eq "long double" ) {

        # Stay way from long double for now (it may be 64 or 80 bits)
        # die "long double not supported at this time, use double.";
        $nvmin = 'LDBL_MIN';
        $nvmax = 'LDBL_MAX';
    }
    else {
        die qq{Configure.pl:  Can't find limits for type '$nv'\n};
    }

    $conf->data->set( floatvalmin => $nvmin );
    $conf->data->set( floatvalmax => $nvmax );

    $conf->cc_gen('config/auto/format/floatval_maxmin_c.in');
    eval { $conf->cc_build(); };
    if ( $@ ) {
        $nvmin = '0';
        $nvmax = '0';
    }

}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
