# Copyright (C) 2001-2015, Parrot Foundation.

=head1 NAME

config/auto/arch - Determine CPU architecture and operating system

=head1 DESCRIPTION

Determines the CPU architecture, the operating system.

This code was formerly part of configuration step class auto::jit.

This checks for the inherited perl5 architecture, not for possible
commandline overrides, such as -m64, -m32, mabi=64 or -Wl,-melf_x86_64.
See auto::gcc for those as they are compiler specific. (TT 356, GH #1181)

=cut

package auto::arch;

use strict;
use warnings;


use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine CPU architecture and type, and OS};
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
        "determining operating system and cpu architecture and type\n",
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
            : 'x86';
    }

    # cpuarch and osname are reversed in archname on windows
    elsif ( $cpuarch =~ /MSWin32/ ) {
        $cpuarch = ( $osname =~ /x64/ ) ? 'amd64' : 'i386';
        $osname = 'MSWin32';
    }
    elsif ( $osname =~ /cygwin/i || $cpuarch =~ /cygwin/i ) {
        $cpuarch = 'x86'; # TODO 64 how?
        $osname  = 'cygwin';
    }
    elsif ( $osname =~ /msys/i || $cpuarch =~ /msys/i ) {
        # msys-perl is 32bit-only, so we use the information provided by
        # the OS. Might be incorrect in case of mingw32 on 64bit hardware.
        $cpuarch = lc (
            $ENV{PROCESSOR_ARCHITEW6432} ||
            $ENV{PROCESSOR_ARCHITECTURE} ||
            'x86'
        );
        $osname = 'msys';
    }
    elsif ( $cpuarch eq 'i86pc' and $osname eq 'solaris' ) {
        # That's only the perl value, and is the same for both i386
        # and amd64.  Use uname -p instead to find the processor type.
        chomp($archname = `uname -p`);
        $cpuarch = $archname;
    }
    elsif ( $osname =~ /^VMS/ ) {
        ($cpuarch = $osname) =~ s/^VMS_//;
        $osname = 'VMS';
    }

    if ( $archname =~ m/powerpc/ ) {
        $cpuarch = 'ppc';
    }

    $cpuarch =~ s/armv[347]l?/arm/i;
    $cpuarch =~ s/i[456]86/i386/i;
    $cpuarch =~ s/x86_64/amd64/i;
    $cpuarch =~ s/x86/i386/i;

    my $cpu_type = "unknown";
    eval {
        if ( -e '/proc/cpuinfo' ) {
            $cpu_type = _parse_cpuinfo('cat /proc/cpuinfo',
                                       qr/model name\s+:/);
        } elsif ($^O eq 'solaris' and -x '/usr/bin/kstat') {
            $cpu_type = _parse_cpuinfo('/usr/bin/kstat -m cpu_info',
                                       qr/brand/);
        } elsif ($^O eq 'darwin' and -x '/usr/sbin/system_profiler') {
            $cpu_type = _parse_cpuinfo('/usr/sbin/system_profiler SPHardwareDataType',
                                       qr/Processor Name:/i);
            $cpuarch = 'amd64' if $cpu_type =~ /^Intel Core/;
        } elsif ($^O eq 'MSWin32' and defined $ENV{PROCESSOR_IDENTIFIER}) {
            $cpu_type = $ENV{PROCESSOR_IDENTIFIER};
        }
    };
    if ($conf->options->get('m')) {
        if ($conf->options->get('m') eq '64' and $cpuarch eq 'i386') {
            $cpuarch = 'amd64';
        }
        elsif ($conf->options->get('m') eq '32' and $cpuarch eq 'amd64') {
            $cpuarch = 'i386';
        }
    }

    $conf->data->set(
        cpuarch  => $cpuarch,
        cputype  => $cpu_type,
        osname   => $osname,
    );

    $conf->data->set( 'platform' => $self->_get_platform( $conf ) );
    $conf->data->set( 'osvers' => $conf->data->get('osvers_provisional') )
        unless $conf->data->get('osvers');

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

    $platform = 'generic' unless -d "src/platform/$platform";

    return $platform;
}

sub _parse_cpuinfo {
    my ($cmd, $match) = @_;
    my $cpu_info;
    chomp( $cpu_info = qx{ $cmd } );
    my @cpu_info_lines = split /\n/, $cpu_info;
    my ($model_name) = map m/$match(.*)$/, @cpu_info_lines;
    if ( defined $model_name ) {
        $model_name =~ s/^\s+//;
        return $model_name;
    }
    else {
        return 'unknown';
    }
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
