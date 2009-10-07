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
        $self->set_result('yes');
        $conf->data->set( has_llvm => 1 );
    }

    return 1;
}

#sub _probe_for_llvm {
#    my $conf = shift;
#    my $variations_ref = shift;
#    my $verbose = shift;
#    my ($llvm, $has_llvm);
#    while (defined (my $t = shift(@$variations_ref))) {
#        my $output = capture_output( $t, '--version' ) || '';
#        print $output, "\n" if $verbose;
#        $has_llvm = _probe_for_llvm_output($output, $verbose);
#        $llvm = $t if $has_llvm;
#        last if $has_llvm;
#    }
#    return ($llvm, $has_llvm);
#}
#
#sub _probe_for_llvm_output {
#    my ($output, $verbose) = @_;
#    my $has_llvm = ( $output =~ m/Exuberant Ctags/ ) ? 1 : 0;
#    print $has_llvm, "\n" if $verbose;
#    return $has_llvm;
#}
#
#sub _evaluate_llvm {
#    my ($self, $conf, $llvm, $has_llvm) = @_;
#    if ($has_llvm) {
#        $conf->data->set( llvm => $llvm );
#        $self->set_result( 'yes' );
#    }
#    else {
#        $conf->data->set( llvm => 'llvm' );
#        $self->set_result( 'no' );
#    }
#}

1;

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

