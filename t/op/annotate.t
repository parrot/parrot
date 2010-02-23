#! parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/annotate.t - Test .annotate directive

=head1 SYNOPSIS

    % prove t/op/annotate.t

=head1 DESCRIPTION

Test various use cases of the annotate directive.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(33)

    'no_annotations'()
    'annotations_exception'()
    'annotations_ops'()
    'backtrace_annotations'()
    'parrotinterpreter_annotations'()
    'eval_test'()
.end


.sub 'no_annotations'
    push_eh failed
    die "OH NOES!"

  failed:
    .local pmc exception
    pop_eh
    .get_results (exception)
    $P0 = exception.'annotations'()
    isa_ok ($P0, 'Hash', 'annotations gives back hash')
    $I0 = elements $P0
    is ($I0, 0, 'annotations hash empty when none in effect')
    $P0 = exception.'annotations'('line')
    $I0 = isnull $P0
    ok ($I0, 'get null PMC when no annotation in effect')
.end


.sub 'annotations_exception'
    .annotate "file", "foo.p6"
    .annotate "line", 1
    push_eh failed
    .annotate "line", 2
    $S0 = "OMGWTFBBQ"
    die $S0
    .annotate "line", 3

  failed:
    .local pmc exception
    pop_eh
    .get_results (exception)

    $P0 = exception.'annotations'('file')
    is ($P0, 'foo.p6', "file annotation got OK")
    $P0 = exception.'annotations'('line')
    is ($P0, 2, "line annotation got OK")

    $P0 = exception.'annotations'()
    isa_ok ($P0, 'Hash', 'annotations gives back hash')
    $I0 = elements $P0
    is ($I0, 2, 'annotations hash is right size')
    $P1 = $P0["file"]
    is ($P1, 'foo.p6', "file annotation got OK from hash")
    $P1 = $P0["line"]
    is ($P1, 2, "line annotation got OK from hash")
.end


.sub 'annotations_ops'
    .annotate 'file', 'loo.py'
    .annotate 'line', 1

    $P1 = annotations 'file'
    is ($P1, 'loo.py', 'annotations_p_sc op returned correct thing')
    $S0 = 'line'
    $P1 = annotations $S0
    is ($P1, 1,        'annotations_p_s op returned correct thing')

    .annotate 'line', 2
    $P0 = annotations
    .annotate 'line', 3

    isa_ok ($P0, 'Hash', 'annotations_p op gives back hash')
    $I0 = elements $P0
    is ($I0, 2, 'annoations op gave hash with right number of elements')
    $S0 = $P0['file']
    is ($S0, 'loo.py', 'annotations_p op gave back correct hash')
    $I1 = $P0['line']
    is ($I1, 2, 'annotations_p op gave back correct hash')
.end


.sub 'backtrace_annotations'
    push_eh failed
    'foo'()

  failed:
    .local pmc exception, bt, frame, ann
    pop_eh
    .get_results (exception)
    bt = exception.'backtrace'()
    $I0 = elements bt
    $I0 = $I0 > 3
    ok ($I0, 'backtrace has enough elements')

    frame = bt[0]
    $S0 = frame["sub"]
    is ($S0, 'baz', 'frame 0 has right sub name')
    ann = frame["annotations"]
    $S0 = ann["file"]
    is ($S0, 'baz.pm', 'frame 0 has right file annotation')
    $I0 = ann["line"]
    is ($I0, 2, 'frame 0 has right line annotation')

    frame = bt[1]
    $S0 = frame["sub"]
    is ($S0, 'bar', 'frame 1 has right sub name')
    ann = frame["annotations"]
    $S0 = ann["file"]
    is ($S0, 'foo.p6', 'frame 1 has right file annotation')
    $I0 = ann["line"]
    is ($I0, 5, 'frame 1 has right line annotation')

    frame = bt[2]
    $S0 = frame["sub"]
    is ($S0, 'foo', 'frame 2 has right sub name')
    ann = frame["annotations"]
    $S0 = ann["file"]
    is ($S0, 'foo.p6', 'frame 2 has right file annotation')
    $I0 = ann["line"]
    is ($I0, 2, 'frame 2 has right line annotation')
.end

# Test subs for backtrace_annotations
.sub 'foo'
    .annotate 'file', 'foo.p6'
    .annotate 'line', 1
    noop
    .annotate 'line', 2
    'bar'()
    .annotate 'line', 3
.end
.sub 'bar'
    .annotate 'line', 4
    noop
    .annotate 'line', 5
    'baz'()
.end
.sub 'baz'
    .annotate 'file', 'baz.pm'
    .annotate 'line', 1
    noop
   .annotate 'line', 2
   die "LOL HALP I HAZ A FAIL"
.end


.sub 'parrotinterpreter_annotations'
    .annotate 'file', 'answer.p6'
    .annotate 'line', 42
    $P0 = getinterp

    .annotate 'line', 43
    'test_callee'()
.end

.sub 'test_callee'
    .annotate 'line', 100
    $P0 = getinterp
    $P1 = $P0['annotations'; 1]
    $S0 = $P1['file']
    'is'($S0, 'answer.p6', 'annotations for caller sub returend with level 1')
    $I0 = $P1['line']
    'is'($I0, 43, 'annotations from caller sub returned at point of call with level 1')
    'test_outer'()
.end

.sub 'test_outer' :outer('parrotinterpreter_annotations')
    .annotate 'line', 101
    $P0 = getinterp
    $P1 = $P0['outer'; 'annotations'; 1]
    $S0 = $P1['file']
    'is'($S0, 'answer.p6', 'annotations for outer sub returend with level 1')
    $I0 = $P1['line']
    'is'($I0, 43, 'annotations from outer sub returned at point of call with level 1')
.end


.sub 'eval_test'
    .annotate 'file', 'a.tcl'
    .annotate 'line', 3
    $P1 = compreg 'PIR'
    $S0 = <<"END_PIR"
.sub 'joe'
    .annotate 'file', 'b.tcl'
    die "what?"
.end
END_PIR
    $P2 = $P1($S0)
    push_eh eek
    joe()
    pop_eh
    die "Should not get here!"

  eek:
    .get_results($P3)
    pop_eh
    $P3 = $P3.'backtrace'()

    $P4 = $P3[0]
    $P4 = $P4['annotations']
    $S0 = $P4['file']
    'is'($S0, 'b.tcl', 'annotation from eval code OK')
    $I0 = exists $P4['line']
    'is'($I0, 0, 'no line annotation (since it was not set)')

    $P4 = $P3[1]
    $P4 = $P4['annotations']
    $S0 = $P4['file']
    'is'($S0, 'a.tcl', 'annotation from caller of eval code OK')
    $I0 = $P4['line']
    'is'($I0, 3, 'annotation from caller of eval code OK')
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
