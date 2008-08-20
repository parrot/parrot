# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/funcptr.pm - Function Pointer Casts

=head1 DESCRIPTION

Verifies that the compiler supports function pointer casts.

=cut

package auto::funcptr;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does compiler support function pointer casts};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $jitcapable = $conf->data->get('jitcapable');

    if ($jitcapable) {
        $conf->cc_gen('config/auto/funcptr/test_c.in');
        eval { $conf->cc_build(); };

        if ( $@ || $conf->cc_run() !~ /OK/ ) {
            _cast_void_pointers_msg();
            exit(-1);
        }
        $conf->cc_clean();
        $self->_set_positive_result($conf);
    }

    return 1;
}

sub _cast_void_pointers_msg {
            print <<"END";
Although it is not required by the ANSI C standard,
Parrot requires the ability to cast from void pointers to function
pointers for its JIT support.

Your compiler does not appear to support this behavior with the
flags you have specified.  You must adjust your settings in order
to use the JIT code.

If you wish to continue without JIT support, please re-run this script
With the '--jitcapable=0' argument.
END
}

sub _set_positive_result {
    my ($self, $conf) = @_;
    print " (yes) " if $conf->options->get('verbose');
    $self->set_result('yes');
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
