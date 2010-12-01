# Copyright (C) 2004-2009, Parrot Foundation.

.sub bench :main
    .param pmc argv
    .local int argc
    argc = argv
    .local pmc N
    N = new 'Integer'
    if argc <= 1 goto noarg
    $S0 = argv[1]
    N = $S0
    goto begin
noarg:
    N = 24
begin:

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
    .param int n
    if n >= 2 goto rec
    .return (n)
rec:
    .local int prev
    .local int r1
    prev = n
    dec prev
    r1 = self."fibA"(prev)

    dec prev
    .local int r2
    r2 = self."fibB"(prev)

    n = r1 + r2
    .return (n)
.end

.sub fibA :method
    .param int n
    if n >= 2 goto rec
    .return (n)
rec:
    .local int prev
    prev = n

    dec prev
    .local int r1
    r1 = self."fib"(prev)

    dec prev
    .local int r2
    r2 = self."fibB"(prev)

    n = r1 + r2
    .return (n)
.end

.namespace ["B"]

.sub fibB :method
    .param int n
    if n >= 2 goto rec
    .return (n)
rec:
    .local int prev
    prev = n

    dec prev
    .local int r1
    r1 = self."fib"(prev)

    dec prev
    .local int r2
    r2 = self."fibA"(prev)

    n = r1 + r2
    .return (n)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
