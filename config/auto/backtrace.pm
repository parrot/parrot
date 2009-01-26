# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/backtrace.pm - GNU C Compiler

=head1 DESCRIPTION

Determines whether libc has the backtrace* functions.  The backtrace() and
backtrace_symbols() functions exist in GNU libc, and also in OS X versions
10.5+.

=cut

package auto::backtrace;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does libc have the backtrace* functions};
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
    # then we have the "backtrace" and "backtrace_symbols" functions.  If the
    # program fails to build for whatever reason we're just going to assume
    # that the build failure is because these symbols are missing.

    eval { $conf->cc_build(); };
    my $anyerror = $@;
    $conf->cc_clean();
    return $anyerror;
}

sub _probe_for_dlinfo {
    my $conf = shift;
    $conf->cc_gen("config/auto/backtrace/test_dlinfo_c.in");

    # If the program compiles, the Dl_info struct is available

    eval { $conf->cc_compile(); };
    my $anyerror = $@;
    $conf->cc_clean();
    return $anyerror;
}

sub _evaluate_backtrace {
    my ($self, $conf, $anyerror) = @_;
    if ( $anyerror ) {
        $self->set_result("no");
    }
    else {
        my $dlinfoerror = _probe_for_dlinfo($conf);
        $conf->data->set ( PARROT_HAS_DLINFO => 1 ) unless $anyerror;
        $conf->data->set( backtrace => 1 );
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
