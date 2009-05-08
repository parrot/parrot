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

    _set_floatvalfmt_nvsize($conf);

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

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
