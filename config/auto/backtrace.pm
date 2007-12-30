# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/backtrace.pm - GNU C Compiler

=head1 DESCRIPTION

Determines whether libc has the backtrace* functions (glibc only).

=cut

package auto::backtrace;

use strict;
use warnings;

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determining whether libc has the backtrace* functions (glibc only)};
    $data{args}        = [ qw( verbose ) ];
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $anyerror = _probe_for_backtrace($conf);

    $self->_evaluate_backtrace($conf, $anyerror);

    return 1;
}

sub _probe_for_backtrace {
    my $conf = shift;
    $conf->cc_gen("config/auto/backtrace/test_c.in");

    # If the program builds (e.g. the linker found backtrace* in libc)
    # then we have the glibc backtrace symbols.  If the program fails to
    # build for whatever reason we're just going to assume that the
    # build failure is because these symbols are missing.

    eval { $conf->cc_build(); };
    my $anyerror = $@;
    $conf->cc_clean();
    return $anyerror;
}

sub _evaluate_backtrace {
    my ($self, $conf, $anyerror) = @_;
    if ( $anyerror ) {
        $self->set_result("no");
    } else {
        $conf->data->set( glibc_backtrace => 1 );
        $self->set_result("yes");
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
