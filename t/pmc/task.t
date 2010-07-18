#! parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

.sub main
    .include 'test_more.pir'

    plan(1)

    ok1()

    $P0 = new 'Task'
.end

.sub ok1
    say "ok 1"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
