#! parrot
# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 NAME

t/op/annotate.t - Test .annotate directive

=head1 SYNOPSIS

    % prove t/op/annotate.t

=head1 DESCRIPTION

Test various use cases of the annotate directive.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(15)

    'no_annotations'()
    'annotations_exception'()
    'annotations_ops'()
.end


.sub 'no_annotations'
    push_eh failed
    die "OH NOES!"

  failed:
    .local pmc exception
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


# Local Variables:
#   mode: pir 
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
