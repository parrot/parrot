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
    my $unamep;
    eval {
       chomp( $unamep  = `uname -p` ) unless ($^O eq 'MSWin32');
    };
    $data{unamep} = (! $@ and $unamep)
        ? $unamep
        : undef;
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->debug("\n");

    my $archname = $conf->data->get('archname');
    # This was added to convert IA64.ARCHREV_0 on HP-UX, TT #645, TT #653
    $archname =~ s|\.|_|g;
    my ( $cpuarch, $osname ) = split( /-/, $archname );


    $conf->debug(
        "determining operating system and cpu architecture\n",
        "archname: $archname\n")
    ;

    if ( !defined $osname ) {
        ( $osname, $cpuarch ) = ( $cpuarch, q{} );
    }

    # This was added to convert 9000/800 to 9000_800 on HP-UX
    $cpuarch =~ s|/|_|g;

    # On OS X if you are using the Perl that shipped with the system
    # the above split fails because archname is "darwin-thread-multi-2level".
    if ( $cpuarch =~ /darwin/ ) {
        $osname = 'darwin';
        $cpuarch = ( $self->{unamep} eq 'powerpc' )
            ? 'ppc'
            : 'i386';
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
        # That's only the perl value, and is the same for both i386
        # and amd64.  Use uname -p instead to find the processor type.
        chomp($archname = `uname -p`);
        $cpuarch = $archname;
    }

    if ( $archname =~ m/powerpc/ ) {
        $cpuarch = 'ppc';
    }

    $cpuarch =~ s/armv[34]l?/arm/i;
    $cpuarch =~ s/i[456]86/i386/i;
    $cpuarch =~ s/x86_64/amd64/i;

    $conf->data->set(
        cpuarch  => $cpuarch,
        osname   => $osname
    );

    $conf->data->set( 'platform' => $self->_get_platform( $conf ) );

    _report_verbose( $conf );

    return 1;
}

sub _get_platform {
    my ($self, $conf) = @_;
    my $platform = lc ( $conf->data->get('osname') );

    $platform = "win32" if $platform =~ /^msys/;
    $platform = "win32" if $platform =~ /^mingw/;
    $platform =~ s/^ms//;

    if ( ( split m/-/, $conf->data->get('archname'), 2 )[0] eq 'ia64' ) {
        $platform = 'ia64';
    }

    $platform = 'generic' unless -d "config/gen/platform/$platform";

    return $platform;
}

sub _report_verbose {
    my ($conf) = @_;
    $conf->debug(
        "osname:   ", $conf->data->get('osname'), "\n",
        "cpuarch:  ", $conf->data->get('cpuarch'), "\n",
        "platform: ", $conf->data->get('platform'), "\n",
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
