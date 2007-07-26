# Copyright (C) 2001-2007, The Perl Foundation.
# $Id: gcc.pm 20151 2007-07-24 12:35:13Z paultcochrane $

=head1 NAME

config/auto/backtrace.pm - GNU C Compiler

=head1 DESCRIPTION

Determines whether libc has the backtrace* functions (glibc only).

=cut

package auto::backtrace;

use strict;
use warnings;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description = 'Determining whether libc has the backtrace* functions (glibc only)';

@args = qw(verbose);

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get('verbose');

    cc_gen("config/auto/backtrace/test_c.in");

# If the program builds (e.g. the linker found backtrace* in libc) then we have
# the glibc backtrace symbols.  If the program fails to build for whatever
# reason we're just going to assume that the build failure is because these
# symbols are missing.
    my $glibc_backtrace;
    eval {
        cc_build();
    };
    if (not $@) {
        $glibc_backtrace = 1;
    }
    cc_clean();

    $conf->data->set(
            glibc_backtrace => $glibc_backtrace,
    );

    if ($glibc_backtrace) {
        $self->set_result("yes");
    } else {
        $self->set_result("no");
    }

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
