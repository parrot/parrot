# Copyright (C) 2014, Parrot Foundation.

=head1 NAME

config/auto/expect.pm - HAS_BUILTIN_EXPECT

=head1 DESCRIPTION

Check if the compiler understands __builtin_expect

=cut

package auto::expect;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your compiler support __builtin_expect};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    # gcc and clang should have it
    if (_test($conf)) {
        $conf->data->set( 'HAS_BUILTIN_EXPECT' => 1 );
        $conf->debug("DEBUG: __builtin_expect detected\n");
        $self->set_result('yes');
    }
    else {
        $conf->data->set( 'HAS_BUILTIN_EXPECT' => 0 );
        $conf->debug("DEBUG: __builtin_expect not detected\n");
        $self->set_result('no');
    }
    return 1;
}

#################### INTERNAL SUBROUTINES ####################

sub _test {
    my ($conf) = @_;

    $conf->cc_gen('config/auto/expect/test_c.in');
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
