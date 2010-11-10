# Copyright (C) 2009, Parrot Foundation.

=head1 NAME

examples/benchmarks/rand.pir - rand dynop benchmark

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/rand.pir [count]

=head1 DESCRIPTION

Times the computation of C<count> (default 1e8) random numbers using
the C<rand> dynop.

=cut

.loadlib 'math_ops'

.sub _main
    .param pmc argv

    .local int count
    count = 1e8

    .local int argc
    argc = argv
    if argc <= 1 goto no_arg
    $S0 = argv[1]
    count = $S0
no_arg:

    count /= 8

    .local num t0, t1, t2, t3, t4, t5, t6
    .local num r_num, min_num, max_num
    .local int r_int, min_int, max_int
    .local int i

    min_num = 1.0
    max_num = 20.0
    min_int = 1
    max_int = 20

    .local num tn0, tn1, tnull
    tn0 = time
    i = count
  null_loop_top:
    dec i
    if i > 0 goto null_loop_top
    tn1 = time
    tnull = tn1 - tn0

    t0 = time
    i = count
  t0_top:
    r_num = rand
    r_num = rand
    r_num = rand
    r_num = rand
    r_num = rand
    r_num = rand
    r_num = rand
    r_num = rand
    dec i
    if i > 0 goto t0_top

    t1 = time
    i = count
  t1_top:
    r_int = rand
    r_int = rand
    r_int = rand
    r_int = rand
    r_int = rand
    r_int = rand
    r_int = rand
    r_int = rand
    dec i
    if i > 0 goto t1_top

    t2 = time
    i = count
  t2_top:
    r_num = rand max_num
    r_num = rand max_num
    r_num = rand max_num
    r_num = rand max_num
    r_num = rand max_num
    r_num = rand max_num
    r_num = rand max_num
    r_num = rand max_num
    dec i
    if i > 0 goto t2_top

    t3 = time
    i = count
  t3_top:
    r_int = rand max_int
    r_int = rand max_int
    r_int = rand max_int
    r_int = rand max_int
    r_int = rand max_int
    r_int = rand max_int
    r_int = rand max_int
    r_int = rand max_int
    dec i
    if i > 0 goto t3_top

    t4 = time
    i = count
  t4_top:
    r_num = rand min_num, max_num
    r_num = rand min_num, max_num
    r_num = rand min_num, max_num
    r_num = rand min_num, max_num
    r_num = rand min_num, max_num
    r_num = rand min_num, max_num
    r_num = rand min_num, max_num
    r_num = rand min_num, max_num
    dec i
    if i > 0 goto t4_top

    t5 = time
    i = count
  t5_top:
    r_int = rand min_int, max_int
    r_int = rand min_int, max_int
    r_int = rand min_int, max_int
    r_int = rand min_int, max_int
    r_int = rand min_int, max_int
    r_int = rand min_int, max_int
    r_int = rand min_int, max_int
    r_int = rand min_int, max_int
    dec i
    if i > 0 goto t5_top

    t6 = time

    report('null loop  ', tn0, tn1, 0,   count)

    count *= 8

    report('num        ', t0, t1, tnull, count)
    report('int        ', t1, t2, tnull, count)
    report('num_max    ', t2, t3, tnull, count)
    report('int_max    ', t3, t4, tnull, count)
    report('num_min_max', t4, t5, tnull, count)
    report('int_min_max', t5, t6, tnull, count)
.end

.sub report
    .param string name
    .param num    start
    .param num    end
    .param num    null_time
    .param int    count

    .local num run_time
    run_time  = end - start
    run_time -= null_time
    if run_time > 0 goto time_ok
    run_time  = .000001
  time_ok:

    .local num per_second
    .local int ps
    per_second = count / run_time
    ps = per_second

    print name
    print ': '
    print ps
    print ' per second ('
    print count
    print ' / '
    print run_time
    print " seconds)\n"
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
