# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/fib.imc - Fibonacci Benchmark

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/fib.imc n

=head1 DESCRIPTION

Calculates the Fibonacci Number for C<n> (defaults to 28 if
unspecified).

=cut

.sub _main
    .param pmc argv
    .sym int argc
    argc = argv
    .sym int N
    N = 28
    if argc <= 1 goto noarg
    $S0 = argv[1]
    N = $S0
noarg:
    .sym float start
    .sym pmc fib
    .sym int r
    time start
    r = _fib(N)
    .sym float fin
    time fin
    print "fib("
    print N
    print ") = "
    print r
    print " "
    fin -= start
    print fin
    print "s\n"
    end
.end

.sub _fib
    .param int n
    if n < 2 goto ret
    .sym int n1, n2, r1, r2
    n1 = n - 1
    n2 = n - 2
    r1 = _fib(n1)
    r2 = _fib(n2)
    n = r1 + r2
ret:
    .pcc_begin_return
    .return n
    .pcc_end_return
.end

=head1 SEE ALSO

F<examples/benchmarks/fib.pl>.

=cut
