# Copyright (C) 2001-2012, Parrot Foundation.

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

    my @std_ints   = ( 'short', 'int', 'long', 'long long' );
    my @std_floats = ( 'float', 'double', 'long double' );
    my @extra_ints = ( '__int16', '__int32', '__int64' );

    my $sizes = _get_sizes($conf, values %types, @extra_ints);

    $conf->data->set( HAS_LONGLONG => $sizes->{'long long'} ? 1 : 0 );

    _handle_ptrcast(
        $conf, \%types, $sizes, [ @std_ints, @extra_ints ]);

    for ( keys %types ) {
        $conf->data->set( $_.'size' => $sizes->{$types{$_}} );
    }

    _set_intval_range($conf);
    _set_floatval_range($conf);

    # not as portable as possible, but should cover common architectures
    # extend list of types as necessary

    _set_fixed($conf, $sizes, 'int', 2, [ 'short', 'int', '__int16' ]);
    _set_fixed($conf, $sizes, 'int', 4, [ 'int', 'long', '__int32' ]);

    _handle_int64($conf, $sizes, [ 'long', 'long long', '__int64' ]);

    _set_fixed($conf, $sizes, 'float', 4, [ 'float', 'double' ]);
    _set_fixed($conf, $sizes, 'float', 8, [ 'double', 'long double' ]);

    _set_huge($conf, $sizes, 'int',
        [ reverse(@std_ints), reverse(@extra_ints), $types{intval} ] );

    _set_huge($conf, $sizes, 'float',
        [ reverse(@std_floats), $types{numval} ] );

    return 1;
}

#################### INTERNAL SUBROUTINES ####################

sub test_size {
    my ($conf, $type) = @_;

    $conf->data->set( TEMP_type => $type );
    $conf->cc_gen('config/auto/sizes/test_c.in');
    eval { $conf->cc_build() };
    my $ret = $@ ? 0 : eval $conf->cc_run();
    $conf->cc_clean();

    return $ret;
}

sub _get_sizes {
    my $conf = shift;
    my %sizes = map { $_ => 0 } @_;
    $sizes{$_} = test_size($conf, $_) for keys %sizes;
    return \%sizes;
}

sub _find_type_eq {
    my ($sizesref, $size, $checklist) = @_;
    for ( @$checklist ) {
        return $_ if $sizesref->{$_} == $size;
    }
}

sub _find_type_ge {
    my ($sizesref, $size, $checklist) = @_;
    for ( @$checklist ) {
        return $_ if $sizesref->{$_} >= $size;
    }
}

sub _find_type_max {
    my ($sizesref, $checklist) = @_;
    my $size = 0;
    my $type;

    for ( @$checklist ) {
        if ( $sizesref->{$_} > $size ) {
            $type = $_;
            $size = $sizesref->{$_};
        }
    }

    return $type;
}

sub _set_fixed {
    my ($conf, $sizesref, $kind, $size, $checklist) = @_;
    my $type = _find_type_eq($sizesref, $size, $checklist);
    my $name = $kind.$size.'_t';

    if ( defined $type ) {
        $conf->data->set( $name => $type );
        return 1;
    }
    else {
        $conf->data->set( $name => $checklist->[0] );
        print <<END;

Can't find $kind type with size $size, conversion ops might fail!

END
        return 0;
    }
}

sub _set_huge {
    my ($conf, $sizesref, $kind, $checklist) = @_;
    my $type = _find_type_max($sizesref, $checklist);
    my $size = $sizesref->{$type};

    $conf->data->set(
        'huge'.$kind.'val'     => $type,
        'huge'.$kind.'valsize' => $size
    );
}

sub _set_intval_range {
    my $conf = shift;
    my $ivmin;
    my $ivmax;
    my $iv = $conf->data->get('iv');

    if ( ( $iv eq 'short' ) || ( $iv eq 'short int' ) ) {
        $ivmin = 'SHRT_MIN';
        $ivmax = 'SHRT_MAX';
    }
    elsif ( $iv eq 'int' ) {
        $ivmin = 'INT_MIN';
        $ivmax = 'INT_MAX';
    }
    elsif ( ( $iv eq 'long' ) || ( $iv eq 'long int' ) ) {
        $ivmin = 'LONG_MIN';
        $ivmax = 'LONG_MAX';
    }
    elsif ( ( $iv eq 'long long' ) || ( $iv eq 'long long int' ) ) {
        # The assumption is that a compiler that have the long long type
        # also provides its limit macros.
        $ivmin = 'LLONG_MIN';
        $ivmax = 'LLONG_MAX';
    }
    else {
        my $size = $conf->data->get('intvalsize');
        my $n = 8 * $size;

        $ivmin = -2 ** ($n - 1);
        $ivmax = 2 ** ($n - 1) - 1;

        print <<END;

Your chosen integer type '$iv' does not look like a standard type.
The range of representable values has been computed assuming a padding-free,
two's complement representation and CHAR_BIT == 8.

END
    }

    $conf->data->set( intvalmin   => $ivmin );
    $conf->data->set( intvalmax   => $ivmax );
}

sub _set_floatval_range {
    my $conf = shift;
    my $nvmin;
    my $nvmax;
    my $nv = $conf->data->get('nv');

    if ( $nv eq  'float') {
        $nvmin = 'FLT_MIN';
        $nvmax = 'FLT_MAX';
    }
    elsif ( $nv eq 'double' ) {
        $nvmin = 'DBL_MIN';
        $nvmax = 'DBL_MAX';
    }
    elsif ( $nv eq 'long double' ) {
        $nvmin = 'LDBL_MIN';
        $nvmax = 'LDBL_MAX';
    }
    else {
        print <<END;

Your chosen numeric type '$nv' does not look like a standard type.
The range of representable values cannot be computed for arbitrary
floating-point types.

END
        die "Configure.pl: Cannot find limits for type '$nv'\n";
    }

    $conf->data->set( floatvalmin => $nvmin );
    $conf->data->set( floatvalmax => $nvmax );
}

sub _handle_ptrcast {
    my ($conf, $typesref, $sizesref, $checklist) = @_;
    my $intvalsize = $sizesref->{$typesref->{'intval'}};
    my $ptrsize = $sizesref->{$typesref->{'ptr'}};
    my $intptr = _find_type_ge($sizesref, $ptrsize, $checklist);

    if ( defined $intptr ) {
        $conf->data->set( ptrcast => 'unsigned '.$intptr );
    }
    else {
        die "Configure.pl: No int type of at least pointer size found.\n";
    }

    return if $intvalsize >= $ptrsize;
    if ( $conf->options->get('intval') or $conf->options->get('ask') ) {
        print <<END;

Hmm, I see your chosen INTVAL is of smaller size than your pointers. Parrot
should still compile and run, but you may see a ton of warnings.

END
    }
    else {
        $typesref->{intval} = $intptr;
        $conf->data->set( iv => $intptr );
        $typesref->{opcode} = $intptr;
        $conf->data->set( opcode_t => $intptr );
    }
}

sub _handle_int64 {
    my ($conf, $sizesref, $checklist) = @_;
    my $has_int64 = _set_fixed($conf, $sizesref, 'int', 8, $checklist);

    $conf->data->set( HAS_INT64 => $has_int64 );

    if ( not $has_int64 ) {
        print <<'END';
64-bit support disabled.

END
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
