package Parrot::Pmc2c::PMC::STMRef;

# Copyright (C) 2007, The Perl Foundation.
# $Id$

use base 'Parrot::Pmc2c::PMC::Ref';
use strict;
use warnings;

=head1 Parrot::Pmc2c::STMRef Instance Methods

=cut

sub prederef {
    my ( $self, $method ) = @_;
    my $name = $method->name;

    my $code = <<'EOC';
    PMC *real_pmc;
    Parrot_STM_PMC_handle handle;
    PARROT_ASSERT(pmc->vtable->pmc_class != pmc);
    handle   = (Parrot_STM_PMC_handle)PMC_struct_val(pmc);
EOC

    if ( $self->vtable_method_does_write($name) ) {    # RT#43749 is this good enough?
        $code .= <<'EOC';
    real_pmc = Parrot_STM_begin_update(interp, handle);
EOC
    }
    else {
        $code .= <<'EOC';
    real_pmc = Parrot_STM_read(interp, handle);
EOC
    }
}

sub raw_deref {
    return 'real_pmc';
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
