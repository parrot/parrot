# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

config/auto/format.pm - Sprintf Formats

=head1 DESCRIPTION

Figures out what formats should be used for C<sprintf()>.

=cut

package auto::format;

use strict;
use warnings;

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

    $conf->cc_clean();
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

        # long double may be 64 or 80 bits or even quadmath.
        $nvsize   = $ldsize;
        my $spri = $conf->data->get('sPRIgldbl_provisional');
        if ( defined $spri ) {
	    # TT #308 same values as in imcc
	    if ($nvsize == 8) {
		$nvformat = "%.16" .  $spri;
	    }
	    elsif ($nvsize == 12) {
		$nvformat = "%.16Lg"; # i386 only
	    }
	    elsif ($nvsize == 16) {
		# only on a sparc64/s390 or __float128. intel cheats
		$nvformat = $nv eq '__float128'
		    ? "%Qe"     # libquadmath printf hook support (linux only).
		                # TODO probe for it.
		    : "%.16Lg"; # intel, ppc, mips, aix
	    }
            $nvformat =~ s/"//g;   # Perl 5's Config value has embedded double quotes
        }
        else {
            die qq{Configure.pl:  Can't find a printf-style format specifier for type '$nv'\n};
        }
    }
    elsif ( $nv eq "float" ) {
        $nvsize   = 4;
        $nvformat = "%.7g"; # http://www.keil.com/support/docs/2191.htm
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
