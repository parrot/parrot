#! perl
# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;
use Parrot::Test::Util::Runloop;

=head1 NAME

t/codingstd/cuddled_else.t - checks for cuddled elses in source and headers

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/cuddled_else.t

    # test specific files
    % perl t/codingstd/cuddled_else.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that files do not use cuddled else, that is an else on the same
line as the closing brace of the if part.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? <@ARGV> : (
    $DIST->get_c_language_files(),
    $DIST->get_perl_language_files(),
);


Parrot::Test::Util::Runloop->testloop(
    name        => 'no cuddled elses',
    files       => [@files],
    per_line    => sub { $_[0] !~ /}\s*else\s*{/ },
    diag_prefix => 'Cuddled else found'
);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
