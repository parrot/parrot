# Copyright (C) 2004-2009, Parrot Foundation.
# $Id$

.sub bench :main
    .param pmc argv
    .local int argc
    argc = argv
    .local pmc N
    N = new 'Integer'
    N = 24
    if argc <= 1 goto noarg
    $S0 = argv[1]
    N = $S0
noarg:
    .local num start
    time start

    .local pmc A
    .local pmc B
    .local pmc b

    A = newclass "A"
    B = subclass  A, "B"

    b = new "B"

    .local pmc r
    r = b."fib"(N)

    .local num fin
    time fin
    print "fib("
    print N
    print ") = "
    print r
    print " "
    sub fin, start
    print fin
    print "s\n"
    end
.end

.namespace ["A"]

.sub fib :method
    .param pmc n
    if n >= 2 goto rec
    .return (n)
rec:
    .local pmc n1
    .local pmc n2
    .local pmc r1
    .local pmc r2
    n1 = new 'Integer'
    n2 = new 'Integer'
    n1 = n - 1
    n2 = n - 2
    r1 = self."fibA"(n1)
    r2 = self."fibB"(n2)
    n = new 'Integer'
    n = r1 + r2
    .return (n)
.end

.sub fibA :method
    .param pmc n
    if n >= 2 goto rec
    .return (n)
rec:
    .local pmc n1
    .local pmc n2
    .local pmc r1
    .local pmc r2
    n1 = new 'Integer'
    n2 = new 'Integer'
    n1 = n - 1
    n2 = n - 2
    r1 = self."fib"(n1)
    r2 = self."fibB"(n2)
    n = new 'Integer'
    n = r1 + r2
    .return (n)
.end

.namespace ["B"]

.sub fibB :method
    .param pmc n
    if n >= 2 goto rec
    .return (n)
rec:
    .local pmc n1
    .local pmc n2
    .local pmc r1
    .local pmc r2
    n1 = new 'Integer'
    n2 = new 'Integer'
    n1 = n - 1
    n2 = n - 2
    r1 = self."fib"(n1)
    r2 = self."fibA"(n2)
    n = new 'Integer'
    n = r1 + r2
    .return (n)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
