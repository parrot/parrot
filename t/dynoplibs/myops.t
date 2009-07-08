#! perl
# Copyright (C) 2006-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;

=head1 NAME

t/dynoplibs/myops.t - Test for the ops in src/dynoplibs/myops.ops

=head1 SYNOPSIS

    % prove t/dynoplibs/myops.t

=head1 DESCRIPTION

Tests the sample dynamic op library "myops".

=cut

$ENV{TEST_PROG_ARGS} ||= '';

my $is_ms_win32 = $^O =~ m!MSWin32!;
my $is_mingw    = $is_ms_win32
    && grep { $PConfig{cc} =~ /\b$_\b/ } qw(gcc gcc.exe);

pir_output_is( <<'CODE', <<'OUTPUT', 'fortytwo' );
.loadlib "myops_ops"
.sub main :main
    $I0 = fortytwo
    print $I0
    print "\n"
.end
CODE
42
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
