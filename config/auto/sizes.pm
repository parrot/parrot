# Copyright (C) 2001-2003, Parrot Foundation.

=head1 NAME

config/auto/sizes.pm - Various Sizes

=head1 DESCRIPTION

Determines the sizes of various types.

=cut

package auto::sizes;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine some sizes};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my %types = (
        intval     => $conf->data->get('iv'),
        numval     => $conf->data->get('nv'),
        opcode     => $conf->data->get('opcode_t'),
        short      => 'short',
        int        => 'int',
        long       => 'long',
        longlong   => 'long long',
        ptr        => 'void *',
        float      => 'float',
        double     => 'double',
        longdouble => 'long double',
    );

    my %sizes = map {
        $_, test_size($conf, $types{$_})
    } keys %types;

    for ( keys %sizes ) {
        $conf->data->set( $_ . 'size' => $sizes{$_} );
    }

    _handle_intval_ptrsize_discrepancy(\%sizes);
    _handle_longlong($conf, \%sizes);

    # probe for 64-bit integer-types
    foreach my $type ('int64_t', '__int64') {
        my $size = test_size($conf, $type);
        if ($size) {
            $types{int64} = $type;
            $sizes{int64} = $size;
            last;
        }
    }

    # set fixed sized types
    _set_int2($conf, \%types, \%sizes);

    _set_int4($conf, \%types, \%sizes);

    _set_int8($conf, \%types, \%sizes);

    _set_float4($conf, \%types, \%sizes);

    _set_float8($conf, \%types, \%sizes);

    # get HUGEINTVAL
    my $hiv = do {
        my @t = ('long', 'int', 'longlong', 'int64', 'invtal');
        my $i = maxind( @sizes{grep exists $sizes{$_}, @t} );
        $t[$i];
    };

    $conf->data->set(
        hugeintval     => $types{$hiv},
        hugeintvalsize => $sizes{$hiv},
    );

    # get HUGEFLOATVAL
    my $hfv = do {
        my @t = ('float', 'double', 'longdouble', 'numval');
        my $i = maxind( @sizes{@t} );
        $t[$i];
    };

    $conf->data->set(
        hugefloatval     => $types{$hfv},
        hugefloatvalsize => $sizes{$hfv},
    );

    _set_intvalmaxmin($conf);

    _set_floatvalmaxmin($conf);

    return 1;
}

#################### INTERNAL SUBROUTINES ####################

sub test_size {
    my ($conf, $type) = @_;

    $conf->data->set( TEMP_type => $type );
    $conf->cc_gen('config/auto/sizes/test_c.in');
    $conf->cc_build();
    my $ret = eval $conf->cc_run();
    $conf->cc_clean();

    return $ret;
}

sub maxind {
    my $i = 0;
    $_[$_] <= $_[$i] or $i = $_ for 0..$#_;
    return $i;
}

sub _handle_intval_ptrsize_discrepancy {
    my $sizesref = shift;
    if ( $sizesref->{ptr} != $sizesref->{intval} ) {
        print <<"END";

Hmm, I see your chosen INTVAL isn't the same size as your pointers.  Parrot
should still compile and run, but you may see a ton of warnings.
END
    }
}

sub _handle_longlong {
    my ($conf, $sizesref) = @_;
    $conf->data->set( HAS_LONGLONG => !!($sizesref->{longlong} > 0) );
}

sub _set_int2 {
    my ($conf, $typesref, $sizesref) = @_;
    if ( $sizesref->{short} == 2 ) {
        $conf->data->set( int2_t => 'short' );
    }
    else {
        $conf->data->set( int2_t => 'int' );
        print <<'END';

Can't find a int type with size 2, conversion ops might fail!

END
    }
}

sub _set_int4 {
    my ($conf, $typesref, $sizesref) = @_;
    foreach my $type (qw[ short int long ]) {
        if ( $sizesref->{$type} == 4 ) {
            $conf->data->set( int4_t => $typesref->{$type} );
            return;
        }
    }

    $conf->data->set( int4_t => 'int' );
    print <<'END';

Can't find a int type with size 4, conversion ops might fail!

END
}

sub _set_int8 {
    my ($conf, $typesref, $sizesref) = @_;
    foreach my $type (qw[ int long longlong int64 ]) {
        if ( $sizesref->{$type} == 8 ) {
            $conf->data->set(
                int8_t       => $typesref->{$type},
                HAS_INT64 => 1,
            );
            return;
        }
    }

    $conf->data->set( HAS_INT64 => 0 );
    print <<'END';

Can't find an int type with size 8, 64-bit support dissabled.

END
}

sub _set_float4 {
    my ($conf, $typesref, $sizesref) = @_;
    if ( $sizesref->{float} == 4 ) {
        $conf->data->set( float4_t => 'float' );
    }
    else {
        $conf->data->set( float4_t => 'double' );
        print <<'END';

Can't find a float type with size 4, conversion ops might fail!

END
    }
}

sub _set_float8 {
    my ($conf, $typesref, $sizesref) = @_;
    if ( $sizesref->{double} == 8 ) {
        $conf->data->set( float8_t => 'double' );
    }
    else {
        $conf->data->set( float8_t => 'double' );
        print <<'END';

Can't find a float type with size 8, conversion ops might fail!

END
    }
}

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
        $ivmin = 'LLONG_MIN';
        $ivmax = 'LLONG_MAX';
    }
    else {
        die qq{Configure.pl:  Cannot find limits for type '$iv'\n};
    }

    $conf->data->set( intvalmin   => $ivmin );
    $conf->data->set( intvalmax   => $ivmax );
}

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
        die qq{Configure.pl:  Cannot find limits for type '$nv'\n};
    }

    $conf->data->set( floatvalmin => $nvmin );
    $conf->data->set( floatvalmax => $nvmax );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
