#! perl -w
# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/shared_ref.pl - Shared reference between threads

=head1 SYNOPSIS

    % time perl examples/benchmarks/shared_ref.pl

=head1 DESCRIPTION

Shares references between threads.

=cut

use strict;
use threads;
use threads::shared;

for my $i (0..99_999) {
    my $r :shared;
    my $j :shared;
    $r = \$j;
    $$r = $i;
}

=head1 SEE ALSO

F<examples/benchmarks/shared_ref.pasm>.

=cut
