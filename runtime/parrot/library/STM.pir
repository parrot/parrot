.namespace [ 'STM' ]

.sub _init :load
    # print "loaded STM runtime library\n"
    # Create globals
    $P0 = new ResizablePMCArray
    store_global 'STM', 'ends', $P0
    $P0 = new ResizableIntegerArray
    store_global 'STM', 'statuses', $P0
.end

.const int STATUS_COMMIT = 0
.const int STATUS_REDO = 1
.const int STATUS_RETRY = 2
.const int STATUS_COMMIT_MERGE= 3
.const int STATUS_EXTRACT = 4
.const int STATUS_ABORT = 5
.const int STATUS_NONE_SUCH = 0xf 

.const int STATUS_MASK = 0xf

.const int STATUS_FLAG_CHOICE_PART = 0x10
.const int STATUS_FLAG_CHOICE_BUILD_WAIT = 0x20
.const int STATUS_FLAG_CHOICE_PART_INNER = 0x40
.const int STATUS_FLAG_MASK = 0xf0

# _transaction (closure, flags, args...)
# run closure in its own transaction
# TODO: exception handling
.sub _transaction
    .param pmc closure
    .param int tx_flags :optional
    .param pmc args :slurpy
    .lex 'closure', closure
    .lex 'args', args
    
    .local pmc the_result

restart_tx:
    .local pmc statuses
    statuses = global 'statuses'
    tx_flags = bor tx_flags, STATUS_COMMIT
    push statuses, tx_flags 

    #print "ENTER TX\n"

    the_result = new Undef
    
    .local pmc _thelper
    _thelper = global '_transaction_helper'

    $P0 = newclosure _thelper
    stm_start
    .pcc_begin
    .pcc_call $P0
    .result the_result :slurpy
    .pcc_end
done_tx:
    #stm_depth $I0
    #print "at depth "
    #print $I0
    #print "\n"
    .local pmc ends
    ends = global 'ends'
    $P0 = pop ends
    .local int status
    statuses = global 'statuses'
    status = pop statuses
    status = band status, STATUS_MASK
    if status == STATUS_COMMIT goto do_commit
    if status == STATUS_REDO goto do_redo
    if status == STATUS_RETRY goto do_retry
    if status == STATUS_COMMIT_MERGE goto do_commit_merge
    if status == STATUS_EXTRACT goto do_extract
    if status == STATUS_ABORT goto do_abort
    print "unknown status; assuming redo\n"
do_redo:
    #print "REDO\n"
    stm_abort
    goto restart_tx
do_extract:
    #print "EXTRACT\n"
    $P0 = new STMLog
    stm_abort
    .return (STATUS_EXTRACT, $P0, the_result)
do_commit:
    #print "COMMIT\n"
    stm_commit restart_tx 
    stm_validate kill_outer
    goto do_return
do_retry:
    #print "WAIT\n"
    stm_wait kill_outer
    goto restart_tx
do_abort:
    #print "ABORT\n"
    stm_abort
    goto do_return
do_commit_merge:
    #print "COMMIT MERGE\n"
    stm_commit restart_tx
    _end_tx()

kill_outer:
    #print "outer transaction invalid\n"
    _set_status(STATUS_REDO)
    _end_tx()

do_return:
    #stm_depth $I0
    #print "at depth "
    #print $I0
    #print "\n"
    $P0 = new Undef
    .return (status, $P0, the_result)
.end

.include 'interpinfo.pasm'
.sub _transaction_helper :outer(_transaction)
    .local pmc the_cont
    .local pmc closure
    .local pmc args
    .local pmc ends
    closure = find_lex 'closure'
    args = find_lex 'args'
    the_cont = interpinfo .INTERPINFO_CURRENT_CONT
    ends = global 'ends'
    push ends, the_cont
    .return closure(args :flat)
.end

.sub _end_tx
    .local pmc ends
    ends = global 'ends'
    .local pmc end 
    end = ends[-1]
    $P0 = end() # workaround?
    .return (42)
.end

.sub _cur_status
    .local pmc statuses
    statuses = global 'statuses'
    $I0 = statuses 
    if $I0 == 0 goto none_such
    $I0 = $I0 - 1
    $I0 = statuses[$I0]
    .return ($I0)
none_such:
    .return (STATUS_NONE_SUCH)
.end


.sub _set_status
    .param int new_status
    .local pmc statuses
    statuses = global 'statuses'
    $I0 = pop statuses
    push statuses, new_status
.end

.sub retry
    .local int status
    status = _cur_status()
    $I0 = band status, STATUS_FLAG_CHOICE_PART
    if $I0 != 0 goto choice_part
    $I0 = band status, STATUS_FLAG_CHOICE_PART_INNER
    if $I0 != 0 goto inner_choice_part
    _set_status(STATUS_RETRY)
    _end_tx()

    # if we are nested, merge all the way up to the first
    # choice part transaction and capture the whole thing
inner_choice_part:
    .local pmc statuses
    .local int this_status
    .local pmc this_end
    .local int i
    statuses = global 'statuses'
    
    i = statuses 
    dec i
loop:
    status = statuses[i]
    $I0 = band status, STATUS_FLAG_CHOICE_PART_INNER
    if $I0 == 0 goto last_part
    statuses[i] = STATUS_COMMIT_MERGE
    dec i
    goto loop
last_part:
    statuses[i] = STATUS_EXTRACT
    _end_tx()
choice_part:
    _set_status(STATUS_EXTRACT)
    _end_tx()
.end

.sub choice 
    .param pmc choices :slurpy
    
    .const .Sub _choice_internal = "_choice_internal"

    .local pmc result 
    result = transaction(_choice_internal, choices)
    .return (result)
.end

.sub _choice_internal 
    .param pmc choices
    .local pmc save
    .local pmc save_one
    .local pmc the_result
    .local int status 
    .local int i

    save = new FixedPMCArray
    $I0 = choices
    save = $I0
    i = 0
loop:
    if $I0 <= i goto done
    $P0 = choices[i]
    (status, save_one, the_result) = _transaction($P0, STATUS_FLAG_CHOICE_PART)
    if status == STATUS_COMMIT goto finished
    if status != STATUS_EXTRACT goto unexpected
    save[i] = save_one
    inc i
    branch loop
done:
    
    i = 0
replay_loop:
    if $I0 <= i goto done_replay
    $P0 = save[i]
    $P0.'replay'()
    inc i
    branch replay_loop
done_replay:
    retry()


unexpected:
    if status == STATUS_ABORT goto do_abort
    print "choice got unexpected status ("
    print status
    print ")\n"
    end
do_abort:
    _set_status(STATUS_ABORT)
    .return ()
finished:
    _set_status(STATUS_COMMIT)
    .return (the_result :flat)
.end

.sub validate
    # print "STM::validate()\n"
    stm_validate is_invalid
    .return ()
is_invalid:
    _set_status(STATUS_REDO)
    _end_tx()
.end

.sub give_up 
    # print "STM::give_up()\n"
    _set_status(STATUS_ABORT)
.end

.sub redo
    # print "STM::redo()\n"
    _set_status(STATUS_REDO)
    _end_tx()
.end

.sub transaction
    .param pmc closure
    .param pmc args :slurpy
    .local int status

    $P0 = global '_transaction'
    # print "STM::transaction("
    # print closure
    # print ", ...)\n"
    status = _cur_status()
    #print "status = "
    #print status
    #print "\n"
    status = band status, STATUS_FLAG_MASK
    #print "now status = "
    #print status
    #print "\n"
    if status == STATUS_FLAG_CHOICE_PART goto choice_part
    goto run
choice_part:
    status = STATUS_FLAG_CHOICE_PART_INNER
run:
    (status, $P0, $P1) = $P0(closure, status, args :flat)
    .return ($P1 :flat)
.end

