# Copyright (C) 2001-2003, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/headers.pm - C headers

=head1 DESCRIPTION

Probes for various C headers.

=cut

package auto::headers;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);
use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Probe for C headers};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    _set_from_Config($conf);

    my @extra_headers = _list_extra_headers($conf);

    my @found_headers;
    foreach my $header (@extra_headers) {
        my $pass = 0;

        # First try with just the header. If that fails, try with all the
        # headers we found so far. This is somewhat a hack, but makes probing
        # work on *BSD where some headers are documented as relying on others
        # being included first.
        foreach my $use_headers ( [$header], [ @found_headers, $header ] ) {
            $conf->data->set( TEMP_testheaders =>
                join( '', map { "#include <$_>\n" } @$use_headers ) );
            $conf->data->set( TEMP_testheader => $header );

            $conf->cc_gen('config/auto/headers/test_c.in');

            $conf->data->set( TEMP_testheaders => undef );
            $conf->data->set( TEMP_testheader  => undef );

            eval { $conf->cc_build(); };
            if ( !$@ && $conf->cc_run() =~ /^$header OK/ ) {
                $pass = 1;
                push @found_headers, $header;
            }
            $conf->cc_clean();
            last if $pass;
        }

        my $flag = "i_$header";
        $flag =~ s/\.h$//g;
        $flag =~ s/\///g;
        $conf->debug("$flag: $pass\n");
        $conf->data->set( $flag => $pass ? 'define' : undef );
    }

    return 1;
}

sub _set_from_Config {
    my $conf = shift;
    # Perl 5's Configure system doesn't call this by its full name, which may
    # confuse use later, particularly once we break free and start doing all
    # probing ourselves
    my %mapping = ( i_niin => "i_netinetin" );

    for ( grep { /^i_/ } $conf->data->keys_p5() ) {
        $conf->data->set( $mapping{$_} || $_ => $conf->data->get_p5($_) );
    }
}

sub _list_extra_headers {
    my $conf = shift;
    # some headers may not be probed-for by Perl 5, or might not be
    # properly reflected in %Config (i_fcntl seems to be wrong on my machine,
    # for instance).
    #
    # FreeBSD wants this order:
    #include <sys/types.h>
    #include <sys/socket.h>
    #include <netinet/in.h>
    #include <arpa/inet.h>
    # hence add sys/types.h to the reprobe list, and have 2 goes at getting
    # the header.
    my @extra_headers = qw(malloc.h fcntl.h setjmp.h pthread.h signal.h
        sys/types.h sys/socket.h netinet/in.h arpa/inet.h
        sys/stat.h sysexit.h limits.h);

    # more extra_headers needed on mingw/msys; *BSD fails if they are present
    if ( $conf->data->get('OSNAME_provisional') eq "msys" ) {
        push @extra_headers, qw(sysmman.h netdb.h);
    }

    if ( $conf->data->get('OSNAME_provisional') eq "MSWin32" ) {
        # Microsoft provides two annotations mechanisms.  __declspec, which
        # has been around for a while, and Microsoft's standard source code
        # annotation language (SAL), introduced with Visual C++ 8.0.  See
        # <http://msdn2.microsoft.com/en-us/library/ms235402(VS.80).aspx>,
        # <http://msdn2.microsoft.com/en-us/library/dabb5z75(VS.80).aspx>.
        push @extra_headers, qw(sal.h);
    }

    return @extra_headers;
}


1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
