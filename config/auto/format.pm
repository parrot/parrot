# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

config/auto/format.pm - Sprintf Formats

=head1 DESCRIPTION

Figures out what integer and number formats should be used for C<sprintf()>.

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
    my ( $nv, $numvalsize, $cpuarch, $floatvaldig ) =
        $conf->data->get(qw(nv numvalsize cpuarch floatvaldig));
    my ( $nvformat, $nvsize, $floattype );
    $nvsize = $numvalsize;

    my $fltdig = _get_floatvaldigits($conf, $floatvaldig)
      if $floatvaldig;
    if ( $nv eq "double" ) {
        $nvformat = sprintf("%%.%dg", $fltdig ? $fltdig : 15);
	$floattype = 'FLOATTYPE_8';
    }
    elsif ( $nv eq "long double" ) {
        # 64 or 80 bits, 12 or 16 bytes
        my $spri = $conf->data->get('sPRIgldbl_provisional');
        if ( defined $spri ) {
	    # TT #308 same values as in imcc
	    if ($nvsize == 8) {
		$floattype = 'FLOATTYPE_8';
		$nvformat = sprintf("%%.%dg", $fltdig ? $fltdig : 16);
	    }
	    elsif ($nvsize == 12) {
		$floattype = 'FLOATTYPE_10'; # i386 only
		$nvformat = sprintf("%%.%dLg", $fltdig ? $fltdig : 18);
	    }
	    elsif ($nvsize == 16) {
		$nvformat = sprintf("%%.%dLg", $fltdig ? $fltdig : 41);
		if ($cpuarch =~ /^i386|amd64|ia64$/) {
		    $floattype = 'FLOATTYPE_10';
		    $nvformat = "%.18Lg" unless $fltdig;
		}
		elsif ($cpuarch eq 'mips') {
		    # quadmath with special NaN
		    $floattype = 'FLOATTYPE_16MIPS';
		}
		elsif ($cpuarch eq 'ppc') {
		    # double-double https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man3/float.3.html
		    $nvformat = "%.31Lg" unless $fltdig;
		    $floattype = 'FLOATTYPE_16PPC';
		}
		elsif ($cpuarch =~ /^s390|sparc/) {
		    # native IEEE-754 quadmath
		    $floattype = 'FLOATTYPE_16';
		}
		else {
		    die qq{Configure.pl:  Can't find the binary representation for '$nv'\n};
		}
	    }
            $nvformat =~ s/"//g;   # Perl 5's Config value has embedded double quotes
        }
	else {
	    die qq{Configure.pl:  Can't find a printf-style format specifier for type '$nv'\n};
	}
    }
    elsif ( $nv eq '__float128' ) {
	# Probe for "%Q" libquadmath printf hook support (linux only)
	if( _test_format($conf, "%Qg", 1.0)) {
	    $nvformat = "%Qg";
	}
	else {
	    $nvformat = sprintf("%%.%dLg", $fltdig ? $fltdig : 41);
	}
	$floattype = 'FLOATTYPE_16';
    }
    elsif ( $nv eq "float" ) {
        $nvsize   = 4;
        # http://www.keil.com/support/docs/2191.htm
	$nvformat = sprintf("%%.%dg", $fltdig ? $fltdig : 7);
	$floattype = 'FLOATTYPE_4';
    }
    else {
        die qq{Configure.pl:  Can't find a printf-style format specifier for type '$nv'\n};
    }

    # For a series of random numbers test the nvformat precision, and decrease it.
    # 4: 7 digits, 8: 15, 10: 18, 16ppc: 31, 16: 41
    my @TEST = (-2.5, -4.003052, -10.48576, 1.0/3.0 );
    push @TEST, (-4.0030526, 4.398046511104) if $nvsize > 4;
    push @TEST, (-104.398046517704) if $nvsize >= 16;
    for my $num (@TEST) {
	if (!_test_format($conf, $nvformat, $num)) {
	    $nvformat = _decrease_nvformat_precision($conf, $nvformat);
	    $conf->debug("nvformat reduced: $nvformat\n");
	    redo;
	}
    }

    $conf->data->set(
        floatvalfmt => $nvformat,
        nvsize      => $nvsize,
        floattype   => $floattype
    );
}

sub _decrease_nvformat_precision {
    my ($conf, $nvformat) = @_;
    my ($prefix, $num, $suff) = $nvformat =~ m/^(%\.?)([Q\d]+)(.+)$/;
    $num = 41 if $num eq 'Q';
    # require at least some sort of precision
    if ($num < 6) {
	my ( $nv, $numvalsize, $cpuarch ) =
	  $conf->data->get(qw(nv numvalsize cpuarch));
	die "\nConfigure.pl: Unable to find stable round-trip numeric precision\n"
	  . "for $nv, size $numvalsize on $cpuarch. Please choose another --floatval\n";
    }
    return sprintf("%s%d%s", $prefix, $num-1, $suff);
}

sub _rounded_numeq {
    my ($conf, $n1, $n2, $prec) = @_;
    return 1 if $n1 == $n2;
    if (length("$n1") > 3) {
	if (length("$n1") >= 7) {
	    $n1 = sprintf("%.$prec"."g", $n1);
	}
	if (length("$n2") >= 7) {
	    $n2 = sprintf("%.$prec"."g", $n2);
	}
	$n1 = substr("$n1", 0, $prec-1);
	$n2 = substr("$n2", 0, $prec-1);
	$conf->debug(" nvformat:\n  \"$n1\" == \n  \"$n2\" ($prec digits)\n");
	return $n1 == $n2;
    }
    else {
	$conf->debug(" nvformat: \n  $n1 == \n  $n2 ($prec digits)\n");
        return $n1 == $n2;
    }
}

sub _test_format {
    my ($conf, $nvformat, $number) = @_;

    my $num = $number;
    $num .= "L" if $nvformat =~ /L/;
    $num .= "Q" if $nvformat =~ /Q/;
    my ($prefix, $prec, $suff) = $nvformat =~ m/^(%\.?)([Q\d]+)(.+)$/;
    $prec = 41 if $prec eq 'Q';
    $conf->data->set( TEMP_nvformat => $nvformat,
		      TEMP_number   => $num);
    $conf->cc_gen('config/auto/format/test_c.in');
    eval { $conf->cc_build() };
    my $ret = $@ ? 0 : eval $conf->cc_run();
    $conf->cc_clean();
    return _rounded_numeq($conf, $ret, $number, $prec);
}

sub _get_floatvaldigits {
    my ($conf, $floatvaldig) = @_;

    $conf->data->set( TEMP_nvformat => "%u",
		      TEMP_number   => $floatvaldig);
    $conf->cc_gen('config/auto/format/test_c.in');
    eval { $conf->cc_build() };
    my $ret = $@ ? 0 : eval $conf->cc_run();
    $conf->cc_clean();

    return $ret;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
