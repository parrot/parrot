# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/arch - Determine CPU architecture and operating system

=head1 DESCRIPTION

Determines the CPU architecture, the operating system.

This code was formerly part of configuration step class auto::jit.

TODO #356: This checks for the perl5 architecture, not for possible
commandline overrides, such as -m64, -m32 or -Wl,-melf_x86_64.

=cut

package auto::arch;

use strict;
use warnings;


use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine CPU architecture and OS};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get('verbose');
    $verbose and print "\n";

    my $archname = $conf->data->get('archname');
    my ( $cpuarch, $osname ) = split( /-/, $archname );

    # This was added to convert IA64.ARCHREV_0 on HP-UX, TT #645
    $archname =~ s|\.|_|g;

    if ($verbose) {
        print "determining operating system and cpu architecture\n";
        print "archname: <$archname>\n";
    }

    if ( !defined $osname ) {
        ( $osname, $cpuarch ) = ( $cpuarch, q{} );
    }

    # This was added to convert 9000/800 to 9000_800 on HP-UX
    $cpuarch =~ s|/|_|g;

    # On OS X if you are using the Perl that shipped with the system
    # the above split fails because archname is "darwin-thread-multi-2level".
    if ( $cpuarch =~ /darwin/ ) {
        $osname = 'darwin';
         if ( $conf->data->get('byteorder') =~ /^1234/ ) {
            $cpuarch = 'i386';
        }
        else {
            $cpuarch = 'ppc';
        }
    }

    # cpuarch and osname are reversed in archname on windows
    elsif ( $cpuarch =~ /MSWin32/ ) {
        $cpuarch = ( $osname =~ /x64/ ) ? 'amd64' : 'i386';
        $osname = 'MSWin32';
    }
    elsif ( $osname =~ /cygwin/i || $cpuarch =~ /cygwin/i ) {
        $cpuarch = 'i386';
        $osname  = 'cygwin';
    }
    elsif ( $cpuarch eq 'i86pc' and $osname eq 'solaris' ) {
        # That's only the perl 32/64 bit setting. We can override it with
        # -m64 / -m32 for ccflags and ldflags though.
        $cpuarch = $archname =~ /-64int/ ? 'x86_64' : 'i386';
    }

    if ( $archname =~ m/powerpc/ ) {
        $cpuarch = 'ppc';
    }

    $cpuarch =~ s/armv[34]l?/arm/i;
    $cpuarch =~ s/i[456]86/i386/i;
    $cpuarch =~ s/x86_64/amd64/i;

    print "osname: $osname\ncpuarch: $cpuarch\n" if $verbose;

    $conf->data->set(
        cpuarch  => $cpuarch,
        osname   => $osname
    );

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
