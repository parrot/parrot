# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/llvm - Check whether the Low Level Virtual Machine is present

=head1 DESCRIPTION

Determines whether the Low Level Virtual Machine (LLVM) is installed and
functional on the system.  It is OK when it
doesn't exist.

=cut

package auto::llvm;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is LLVM installed};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get( 'verbose' );

    my @llvm_components = (
        [ 'llvm-gcc'    => 'llvm-gcc' ],
        [ 'lli'         => 'Low Level Virtual Machine' ],
        [ 'llc'         => 'Low Level Virtual Machine' ],
    );
    my $sanity_check = 0;
    foreach my $prog (@llvm_components) {
        my $output = capture_output( $prog->[0], '--version' );
        print $output, "\n" if $verbose;
        my $exp = $prog->[1];
        unless ( $output =~ m/$exp/s ) {
            $sanity_check++;
            print "Could not get expected '--version' output for $prog->[0]\n"
                if $verbose;
        }
    }
    if ( $sanity_check ) {
        $self->set_result('no');
        $conf->data->set( has_llvm => '' );
    }
    else {

        # Here we will take a simple C file, compile it into an LLVM bitcode
        # file, execute it as bitcode, then compile it to native assembly
        # using the LLC code generator, then assemble the native assembly
        # language file into a program and execute it.  Cf.:
        # http://llvm.org/releases/2.5/docs/GettingStarted.html#overview

        $self->set_result('yes');
        $conf->data->set( has_llvm => 1 );
    }

    return 1;
}

1;

=head1 AUTHOR

James E Keenan

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

