# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

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

    $conf->cc_gen('config/auto/sizes/test_c.in');
    $conf->cc_build();
    my %results = eval $conf->cc_run();
    $conf->cc_clean();

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

    return 1;
}

#################### INTERNAL SUBROUTINES ####################

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

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
