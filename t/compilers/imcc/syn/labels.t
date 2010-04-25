#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

.sub main :main
    .include 'test_more.pir'
    plan(4)

    test_goto_1()
    test_goto_2()
    test_illegal_label()
.end

.sub test_goto_1
    goto foo
    .return()
  foo:
    ok(1, 'goto 1')
.end

.sub test_goto_2
    goto foo
  bar:
    ok(1, 'goto 2')
    .return()
  foo:
    ok(1, 'goto 2')
    goto bar
.end

.sub test_illegal_label
    dies_ok( <<'CODE', 'illegal label' )
.sub bogus :main
    goto _function
    print "never\n"
    .return()
.end
.sub _function
    print "in function\n"
    .return()
.end
CODE
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
