# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/va_ptr.pm - va_list to va_ptr conversion test

=head1 DESCRIPTION

Tests which kind of PARROT_VA_TO_VAPTR to use.

=cut

package auto::va_ptr;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description = 'Test the type of va_ptr (this test is likely to segfault)';

@args = qw();

sub runstep
{
    my ($self, $conf) = @_;

    my $va_type;
    cc_gen('config/auto/va_ptr/test_c.in');
    eval { cc_build('-DVA_TYPE_X86'); };

    if ($@ || cc_run() !~ /^ok/) {
        eval { cc_build('-DVA_TYPE_PPC'); };
        if ($@ || cc_run() !~ /^ok/) {
            die "Unknown va_ptr type";
        }
        $va_type = 'ppc';
    } else {
        $va_type = 'x86';
    }
    cc_clean();
    $self->set_result($va_type);
    $conf->data->set(va_ptr_type => $va_type);

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
