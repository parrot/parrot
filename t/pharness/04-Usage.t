#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 04-Usage.t

use strict;
use warnings;

use lib qw( lib );
use Test::More;
eval {
    use Parrot::Config qw( %PConfig );
};
plan( skip_all => 't/harness only runs once configuration has completed' )
    if $@;
plan( tests =>  2 );
use Carp;
use Parrot::Harness::Options qw( Usage );
use IO::CaptureOutput qw| capture |;

{
    my $stdout;
    capture(
        sub { Usage(); },
        \$stdout,
    );
    like($stdout,
        qr/perl\st\/harness\s\[options\]\s\[testfiles\]/,
        "Got expected Usage message"
    );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

04-Usage.t - test Parrot::Harness::Options

=head1 SYNOPSIS

    % prove t/pharness/04-Usage.t

=head1 DESCRIPTION

This file holds tests for Parrot::Harness::Options::Usage().

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Harness::Options, F<t/harness>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
