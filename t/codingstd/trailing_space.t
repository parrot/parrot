#! perl
# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Parrot::Distribution;
use Test::More tests => 1;
use Parrot::Test::Util::Runloop;

=head1 NAME

t/codingstd/trailing_space.t - checks for superfluous trailing space or tab characters

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/trailing_space.t

    # test specific files
    % perl t/codingstd/trailing_space.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that files don't have trailing space or tab characters between the
last nominal character on the line and the end of line character.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;

my @files = @ARGV ? <@ARGV> : (
    $DIST->get_c_language_files(),
    $DIST->get_make_language_files(),
    $DIST->get_perl_language_files(),
    $DIST->get_pir_language_files(),
);

Parrot::Test::Util::Runloop->testloop(
    name     => 'no trailing whitespace',
    files    => [@files],
    per_line => sub { $_[0] !~ m{[ \t]$}m },
    diag_prefix => 'Trailing space or tab char found'
);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
