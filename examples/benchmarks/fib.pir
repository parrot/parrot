# Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

examples/benchmarks/fib.pir - Fibonacci Benchmark

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/fib.pir n

=head1 DESCRIPTION

Calculates the Fibonacci Number for C<n> (defaults to 28 if
unspecified).

=cut

.sub main :main
    .param pmc argv

    .local int argc
    argc = argv

    .local int N
    N = 28

    if argc <= 1 goto noarg
    N = argv[1]

noarg:
    .local int r
    r = fib(N)

    print "fib("
    print N
    print ") = "
    say r
.end

.sub fib
    .param int n

    if n < 2 goto ret

    .local int n1, n2, r1, r2
    n1 = n - 1
    n2 = n - 2
    r1 = fib(n1)
    r2 = fib(n2)
    n = r1 + r2
ret:
    .return (n)
.end

=head1 SEE ALSO

F<examples/benchmarks/fib.pl>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
