#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 002-messages.t

use strict;
use warnings;
use Carp;
use Test::More tests => 12;
use lib qw( lib );
use_ok(
    'Parrot::Configure::Messages', qw|
        print_introduction
        print_conclusion
        |
);
use_ok("Parrot::IO::Capture::Mini");

my $parrot_version = '0.4.10';
my $make_version   = 'gnu make';

{
    my ( $tie, $rv, $msg );
    $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    $rv = print_introduction($parrot_version);
    ok( $rv, "print_introduction() returned true" );
    $msg = $tie->READLINE;

    # Following test is definitive.
    like( $msg, qr/$parrot_version/,
        "Message included Parrot version number supplied as argument" );

    # Following tests are NOT definitive.  They will break if content of
    # strings printed by function is changed.
    like( $msg, qr/Parrot\sVersion/i, "Message included string 'Parrot version'" );
    like( $msg, qr/Configure/i,       "Message included string 'Configure'" );
    like( $msg, qr/Copyright/i,       "Message included copyright notice" );
    undef $tie;
}

{
    my ( $tie, $rv, @lines, $msg );
    $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    my $pseudo_conf = {
        log => [],
    };
    $rv = print_conclusion($pseudo_conf, $make_version);
    ok( $rv, "print_conclusion() returned true" );
    @lines = $tie->READLINE;
    $msg = join("/n", @lines);

    # Following test is definitive.
    like( $msg, qr/$make_version/, "Message included make version supplied as argument" );

    undef $tie;
}

{
    my ( $tie, $rv, @lines, $msg );
    $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    my $pseudo_conf = {
        log => [
            undef,
            {   step    => q{init::manifest} },
        ],
    };
    $rv = print_conclusion($pseudo_conf, $make_version);
    ok(! defined $rv, "print_conclusion() returned undefined value" );
    @lines = $tie->READLINE;
    $msg = join("/n", @lines);

    like( $msg,
        qr/During configuration the following steps failed:.*init::manifest/s,
        "Got expected message re configuration step failure" );

    undef $tie;
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

002-messages.t - test Parrot::Configure::Messages

=head1 SYNOPSIS

    % prove t/configure/components/002-messages.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by
Parrot::Configure::Messages.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure::Messages, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
