.include "except_types.pasm"

.sub 'test_no_eh'
    $P0 = box 1
    .return ($P0)
.end

.sub 'test_push_eh'
    new $P424, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P424, control_return
    push_eh $P424

    $P0 = box 1
    .return ($P0)

  control_return:
    .local pmc exception
    .get_results (exception)
    getattribute $P0, exception, "payload"

    .return ($P0)
.end

.sub 'test_push_cached_eh'

    push_cached_eh .CONTROL_RETURN, control_return

    $P0 = box 1
    .return ($P0)

  control_return:
    .local pmc exception
    .get_results (exception)
    getattribute $P0, exception, "payload"

    .return ($P0)
.end

.sub 'test_push_cached_eh_deeply'
    .param int depth    :optional
    .param int has_depth :opt_flag

    unless has_depth goto check
    depth = 10000

  check:
    if depth !=0 goto recure
    .tailcall "test_push_cached_eh"()

  recure:
    dec depth
    "test_push_cached_eh_deeply"(depth)
.end

.sub 'benchmark'
    .param pmc      sub
    .param string   desc

    .local num start_time
    start_time = time
 
    $I0 = 0
  loop_1:
    if $I0 > 10000000 goto loop_1_end
    sub()
    inc $I0
    goto loop_1
  loop_1_end:

    $N1 = time
    $N2 = $N1 - start_time
    print desc
    print " "
    say $N2

.end

.sub 'test' :main

    .const "Sub" test_no_eh = "test_no_eh"
    "benchmark"(test_no_eh, "no_eh")

    .const "Sub" test_push_cached_eh = "test_push_cached_eh"
    "benchmark"(test_push_cached_eh, "push_cached_eh")

    .const "Sub" test_push_cached_eh_deeply = "test_push_cached_eh_deeply"
    "benchmark"(test_push_cached_eh_deeply, "push_cached_eh_deeply")

    .const "Sub" test_push_eh = "test_push_eh"
    "benchmark"(test_push_eh, "push_eh")
.end


