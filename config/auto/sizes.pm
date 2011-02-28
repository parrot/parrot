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

    my %results = map {
        $_->[0] . 'size', test_size($conf, $_->[1])
    } ( [ intval     => $conf->data->get('iv') ],
        [ numval     => $conf->data->get('nv') ],
        [ opcode     => $conf->data->get('opcode_t') ],
        [ short      => 'short' ],
        [ int        => 'int' ],
        [ long       => 'long' ],
        [ longlong   => 'long long' ],
        [ ptr        => 'void *' ],
        [ float      => 'float' ],
        [ double     => 'double' ],
        [ longdouble => 'long double' ],
    );

    for ( keys %results ) {
        $conf->data->set( $_ => $results{$_} );
    }

    _handle_intval_ptrsize_discrepancy(\%results);

    # set fixed sized types
    _set_int2($conf, \%results);

    _set_int4($conf, \%results);

    _set_float4($conf, \%results);

    _set_float8($conf, \%results);

    my %hugeintval;
    my $intval     = $conf->data->get('iv');
    my $intvalsize = $conf->data->get('intvalsize');

    # Get HUGEINTVAL, note that we prefer standard types
    foreach my $type ( 'long', 'int', 'long long', '__int64' ) {

        $conf->data->set( int8_t => $type );
        eval {
            $conf->cc_gen('config/auto/sizes/test2_c.in');
            $conf->cc_build();
            %hugeintval = eval $conf->cc_run();
            $conf->cc_clean();
        };

        # clear int8_t on error
        if ( $@ || !exists $hugeintval{hugeintval} ) {
            $conf->data->set( int8_t => undef );
            next;
        }

        if ( $hugeintval{hugeintvalsize} > $intvalsize ) {

            # We found something bigger than intval.
            $conf->data->set(%hugeintval);
            last;
        }
    }
    _handle_hugeintvalsize(
        $conf,
        {
            hugeintval      => \%hugeintval,
            intval          => $intval,
            intvalsize      => $intvalsize,
        },
    );

    $conf->cc_clean();

    #get HUGEFLOATVAL
    my $size = _probe_for_hugefloatval( $conf );
    _set_hugefloatval( $conf, $size );

    $conf->cc_clean();

    _set_intvalmaxmin($conf);

    _set_floatvalmaxmin($conf);

    return 1;
}

#################### INTERNAL SUBROUTINES ####################

sub test_size {
    my ($conf, $type) = @_;

    $conf->data->set(TEMP_type => $type);
    $conf->cc_gen('config/auto/sizes/test_c.in');
    $conf->cc_build();
    my $ret = eval $conf->cc_run();
    $conf->cc_clean();

    return $ret;
}

sub _handle_intval_ptrsize_discrepancy {
    my $resultsref = shift;
    if ( $resultsref->{ptrsize} != $resultsref->{intvalsize} ) {
        print <<"END";

Hmm, I see your chosen INTVAL isn't the same size as your pointers.  Parrot
should still compile and run, but you may see a ton of warnings.
END
    }
}

sub _set_int2 {
    my ($conf, $resultsref) = @_;
    if ( $resultsref->{shortsize} == 2 ) {
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
    my ($conf, $resultsref) = @_;
    if ( $resultsref->{shortsize} == 4 ) {
        $conf->data->set( int4_t => 'short' );
    }
    elsif ( $resultsref->{intsize} == 4 ) {
        $conf->data->set( int4_t => 'int' );
    }
    elsif ( $resultsref->{longsize} == 4 ) {
        $conf->data->set( int4_t => 'long' );
    }
    else {
        $conf->data->set( int4_t => 'int' );
        print <<'END';

Can't find a int type with size 4, conversion ops might fail!

END
    }
}

sub _set_float4 {
    my ($conf, $resultsref) = @_;
    if ( $resultsref->{floatsize} == 4 ) {
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
    my ($conf, $resultsref) = @_;
    if ( $resultsref->{doublesize} == 8 ) {
        $conf->data->set( float8_t => 'double' );
    }
    else {
        $conf->data->set( float8_t => 'double' );
        print <<'END';

Can't find a float type with size 8, conversion ops might fail!

END
    }
}

sub _handle_hugeintvalsize {
    my $conf = shift;
    my $arg = shift;
    if ( ! defined( $arg->{hugeintval}{hugeintvalsize} )
        || $arg->{hugeintval}{hugeintvalsize} == $arg->{intvalsize} )
    {

        # Could not find anything bigger than intval.
        $conf->data->set(
            hugeintval     => $arg->{intval},
            hugeintvalsize => $arg->{intvalsize},
        );
    }
}

sub _probe_for_hugefloatval {
    my $conf = shift;
    my $size;
    $conf->cc_gen('config/auto/sizes/test3_c.in');
    $conf->cc_build();
    $size = eval $conf->cc_run();
    $conf->cc_clean();
    return $size;
}

sub _set_hugefloatval {
    my ( $conf, $size ) = @_;
    if ( $size ) {
        $conf->data->set(
            hugefloatval     => 'long double',
            hugefloatvalsize => $size
        );
    }
    else {
        $conf->data->set(
            hugefloatval     => 'double',
            hugefloatvalsize => $conf->data->get('doublesize')
        );
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
