#!./parrot
# Copyright (C) 2008, Parrot Foundation.
# $Id$

.include 'hllmacros.pir'
.sub main :main
    .include 'test_more.pir'

    plan(17)

    ok(1, 'included .hll macros definitions')

    ok(1, 'before embedded newline') .NL() ok(1, 'after embedded newline')

    $I0 = 0
    $I1 = 1
    .If($I0 != $I1, {
      ok (1, '.If with true condition')
    })
    .If($I0 == $I1, {
      ok (0, '.If with false condition')
    })

    .Unless($I0 == $I1, {
      ok (1, '.Unless with false condition')
    })
    .Unless($I0 != $I1, {
      ok (0, '.Unless with true condition')
    })

    .IfElse($I0 != $I1, {
      ok (1, '.IfElse, true if')
    }, {
      ok (0, '.IfElse, true else')
    })
    .IfElse($I0 == $I1, {
      ok (0, '.IfElse, false if')
    }, {
      ok (1, '.IfElse, false else')
    })

    $I2 = 0
    .While( $I2<10, {
      inc $I2
    })
    .IfElse($I2 == 10, {
      ok (1, '.While doing something')
    }, {
      ok (0, '.While doing something')
    })

    .While( 1==0, {
      ok (0, 'while body should never happen')
    })

    $I2 = 0
    .DoWhile({
      ok (1, '.DoWhile doing something when the condition is false')
    }, $I2)

    $I2 = 0
    .DoWhile({
      inc $I2
    }, $I2<10)
    .IfElse($I2 == 10, {
      ok (1, '.DoWhile doing something')
    }, {
      ok (0, '.DoWhile doing something')
    })

    $I2 = 0
    .Loop({
        .IfElse($I2==10,{
            goto loop_done
        }, {
            inc $I2
        })
    })
loop_done:
    .IfElse($I2 == 10, {
        ok (1, '.Loop worked')
    }, {
        ok (0, '.Loop failed')
    })

    .For({
        $I2 = 0
        $I3 = 0
        ok (1, 'initial condition')
    }, $I2 < 3, {
        inc $I2
    }, {
        inc $I3
    })
    .IfElse($I2 == 3, {
        ok (1, '.For continue worked')
    }, {
        ok (0, '.For continue failed')
    })
    .IfElse($I3 == 3, {
        ok (1, '.For body worked')
    }, {
        ok (0, '.For body failed')
    })

    $P1 = new 'ResizablePMCArray'
    push $P1, 'one'
    push $P1, 'two'
    push $P1, 'three'

    .Foreach($S0, $P1, {
      $S1 = '.Foreach' . $S0
      ok(1, $S1)
    })

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
