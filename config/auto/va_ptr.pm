# Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

config/auto/va_ptr.pm - va_list to va_ptr conversion test

=head1 DESCRIPTION

Tests which kind of PARROT_VA_TO_VAPTR to use, register or stack.

Sets VA_PTR_FLOATVAL to the floatval type which can be passed through va_list,
if double or the choosen floatval.

=cut

package auto::va_ptr;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Test the type of va_ptr};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my ($va_type, $va_ptr_floatval, $res, $failed);
    my $floatval = $conf->data->get('nv'),

    $conf->cc_gen('config/auto/va_ptr/test_c.in');

    # first see if at least double works ok
    eval { $conf->cc_build("-DVA_TYPE_STACK -DFLOATVAL=double"); };
    if ( $@ or ($res = $conf->cc_run_capture() !~ /^ok/) ) {
        eval { $conf->cc_build("-DVA_TYPE_REGISTER -DFLOATVAL=double"); };
        if ( $@ or ($res = $conf->cc_run_capture() !~ /^ok/) ) {
            $failed = 1;
        }
        $va_type = 'register';
    }
    else {
        $va_type = 'stack';
    }
    if ($failed) {
	die "Unknown va_ptr type, even with double\n";
    }
    elsif ($floatval ne "double") {
	$conf->debug("va_type_${va_type} double ok\n");
	eval { $conf->cc_build("-DVA_TYPE_".uc($va_type)." -DFLOATVAL=\"$floatval\""); };
	if ( $@ or ($res = $conf->cc_run_capture() !~ /^ok/) ) {
	    $conf->debug("va_type_${va_type} $floatval failed\n");
	    $floatval = "double";
	}
	$self->set_result("$va_type ($floatval)");
    }
    else {
	$self->set_result($va_type);
    }
    $conf->cc_clean();
    $conf->data->set( va_ptr_type => $va_type, va_ptr_floatval => $floatval );

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
