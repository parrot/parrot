#! perl
# Copyright (C) 2007, Parrot Foundation.
# 002-messages.t

use strict;
use warnings;
use Carp;
use Test::More tests => 13;
use lib qw( lib );
use Parrot::Configure::Messages qw|
    print_introduction
    print_conclusion
|;
use IO::CaptureOutput qw| capture |;

my $parrot_version = '0.4.10';
my $make_version   = 'gnu make';

{
    my ( $rv, $stdout );
    capture(
        sub { $rv = print_introduction($parrot_version); },
        \$stdout,
    );
    ok( $rv, "print_introduction() returned true" );

    # Following test is definitive.
    like( $stdout, qr/$parrot_version/,
        "Message included Parrot version number supplied as argument" );

    # Following tests are NOT definitive.  They will break if content of
    # strings printed by function is changed.
    like( $stdout, qr/Parrot\sVersion/i, "Message included string 'Parrot version'" );
    like( $stdout, qr/Configure/i,       "Message included string 'Configure'" );
    like( $stdout, qr/Copyright/i,       "Message included copyright notice" );
}

{
    my ( $rv, $stdout );
    my $pseudo_conf = {
        log => [],
    };
    my $args = {};
    capture(
        sub { $rv = print_conclusion($pseudo_conf, $make_version, $args); },
        \$stdout,
    );
    ok( $rv, "print_conclusion() returned true" );

    # Following test is definitive.
    like( $stdout, qr/$make_version/, "Message included make version supplied as argument" );

}

{
    my ( $rv, $stdout, $stderr );
    my $pseudo_conf = {
        log => [],
    };
    my $args = { silent => 1 };
    capture(
        sub { $rv = print_conclusion($pseudo_conf, $make_version, $args); },
        \$stdout,
        \$stderr,
    );
    ok( $rv, "print_conclusion() returned true" );

    # Following test is definitive.
    ok( ! $stdout, "Configure.pl operated silently, as requested" );
}

{
    my ( $rv, $stdout, $stderr );
    my $pseudo_conf = {
        log => [
            undef,
            {   step    => q{init::manifest} },
        ],
    };
    my $args = {};
    capture(
        sub { $rv = print_conclusion($pseudo_conf, $make_version, $args); },
        \$stdout,
        \$stderr,
    );
    ok(! defined $rv, "print_conclusion() returned undefined value" );

    ok( ! $stdout,
        "Because of the error, nothing printed to standard output");
    like( $stderr,
        qr/During configuration the following steps failed:.*init::manifest/s,
        "Got expected message re configuration step failure" );
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
