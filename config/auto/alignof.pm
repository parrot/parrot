# Copyright (C) 2012, Parrot Foundation.

=head1 NAME

config/auto/alignof.pm - clang++ offsetof values

=head1 DESCRIPTION

Determines the offsetof() values of our types, if the compiler cannot do
compile-time ALIGNOF definitions via offsetof(). clang++ or strict C++
compilers need this step, to calculate these pre-compiled PARROT_ALIGNOF_*
definitions.

=cut

package auto::alignof;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine offsetof values for our types};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    # This step only needed for clang++
    if (test_if_needed($conf)) {
        # Can do compile-time ALIGNOF definitions via offsetof()
        $conf->data->set( 'HAS_COMPILER_OFFSETOF_ALIGNOF' => 1 );
        $conf->debug("DEBUG: auto::alignof is only needed for clang++\n");
        $self->set_result('skipped');
        return 1;
    }
    # Need pre-compiled PARROT_ALIGNOF_* definitions
    $conf->data->set( 'HAS_COMPILER_OFFSETOF_ALIGNOF' => 0 );

    my %types = (
        intval     => $conf->data->get('iv'),
        floatval   => $conf->data->get('nv'),
        stringptr  => 'STRING *',
        pmcptr     => 'PMC *',
        char       => 'char',
        short      => 'short',
        int        => 'int',
        long       => 'long',
        uchar      => 'unsigned char',
        ushort     => 'unsigned short',
        uint       => 'unsigned int',
        ulong      => 'unsigned long',
        float      => 'float',
        double     => 'double',
        longdouble => 'long double',
        Parrot_Int1 => 'char',
        Parrot_Int2 => 'short',
        Parrot_Int4 => 'int',
        Parrot_Int8 => 'long long',
        charptr    => 'char *',
        voidptr    => 'void *',
        funcptr_t  => 'funcptr_t',
        longlong   => 'long long',
        ulonglong  => 'unsigned long long',
        __float128 => '__float128',
    );

    my $alignof = '';
    for my $name (keys %types) {
        my $type = $types{$name};
        my $value = test_alignof($conf, $name, $type);
        $alignof .= ' '.$name;
        if ($value) {
            $conf->data->set( 'PARROT_ALIGNOF_'.$name => $value );
        }
    }
    $conf->data->set( 'alignof' => $alignof );
    $self->set_result('done');

    return 1;
}

#################### INTERNAL SUBROUTINES ####################

sub test_if_needed {
    my ($conf) = @_;

    $conf->data->set( TEMP_type => 'int' );
    my ($cc_inc, $ccflags) = $conf->data->get( 'cc_inc', 'ccflags' );
    $conf->cc_gen('config/auto/alignof/test_c.in');
    eval { $conf->cc_build("$cc_inc -DCHECK_COMPILER_OFFSETOF_ALIGNOF") };
    my $ret = $@ ? 0 : eval $conf->cc_run();
    $conf->cc_clean();

    return $ret;
}

sub test_alignof {
    my ($conf, $name, $type) = @_;

    $conf->data->set( TEMP_type => $type );
    my ($cc_inc, $ccflags) = $conf->data->get( 'cc_inc', 'ccflags' );
    $conf->cc_gen('config/auto/alignof/test_c.in');
    eval { $conf->cc_build("$cc_inc -x c++") };
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
