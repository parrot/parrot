#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynpmc/instrumentgc.t - test the InstrumentGC dynpmc

=head1 SYNOPSIS

        % prove t/dynpmc/instrumentGC.t

=head1 DESCRIPTION

Tests the gc notification interface provided by the InstrumentGC.pmc.

=cut

.include 'call_bits.pasm'
.loadlib 'os'

.sub main :main
    .include 'test_more.pir'

    # Load the Instrument library.
    load_bytecode 'Instrument/InstrumentLib.pbc'

    plan(29)

    setup()
    test_get_groups()
    test_insert_hooks()
    test_remove_hooks()
    test_sample_notification()
    cleanup()

    .return()
.end


.sub setup
    # Set up the GC function groups.
    .local pmc groups
    groups = new ['Hash']

    # allocate.
    $P0 = new ['ResizableStringArray']
    push $P0, 'allocate_pmc_header'
    push $P0, 'allocate_string_header'
    push $P0, 'allocate_bufferlike_header'
    push $P0, 'allocate_pmc_attributes'
    push $P0, 'allocate_string_storage'
    push $P0, 'allocate_buffer_storage'
    push $P0, 'allocate_fixed_size_storage'
    push $P0, 'allocate_memory_chunk'
    push $P0, 'allocate_memory_chunk_with_interior_pointers'
    groups['allocate'] = $P0

    # reallocate.
    $P0 = new ['ResizableStringArray']
    push $P0, 'reallocate_string_storage'
    push $P0, 'reallocate_buffer_storage'
    push $P0, 'reallocate_memory_chunk'
    push $P0, 'reallocate_memory_chunk_with_interior_pointers'
    groups['reallocate'] = $P0

    # free.
    $P0 = new ['ResizableStringArray']
    push $P0, 'free_pmc_header'
    push $P0, 'free_string_header'
    push $P0, 'free_bufferlike_header'
    push $P0, 'free_pmc_attributes'
    push $P0, 'free_fixed_size_storage'
    push $P0, 'free_memory_chunk'
    groups['free'] = $P0

    # administration.
    $P0 = new ['ResizableStringArray']
    push $P0, 'finalize_gc_system'
    push $P0, 'destroy_child_interp'
    push $P0, 'do_gc_mark'
    push $P0, 'compact_string_pool'
    push $P0, 'mark_special'
    push $P0, 'pmc_needs_early_collection'
    push $P0, 'init_pool'
    push $P0, 'block_mark'
    push $P0, 'unblock_mark'
    push $P0, 'block_sweep'
    push $P0, 'unblock_sweep'
    groups['administration'] = $P0

    # Set groups as global.
    set_global '%gc_groups', groups

    # Create a simple program to test that events are raised.
    .local string program
    program = <<'PROG'
.loadlib 'os'
.sub main :main
    $P0 = new ['OS']
    $P0 = new ['Undef']
    sweep 1
    collect
.end
PROG

    # Write to file.
    .local pmc fh
    fh = new ['FileHandle']
    fh.'open'('t/dynpmc/instrumentgc-test1.pir', 'w')
    fh.'puts'(program)
    fh.'close'()
.end

.sub cleanup
    # Remove the op test program.
    .local pmc os
    os = new ['OS']
    os.'rm'('t/dynpmc/instrumentgc-test1.pir')
.end

.sub test_get_groups
    # Ensure that the list of function names
    #  returned for a group matches what it is supposed to return.
    .local pmc groups, gc, instr

    instr = new ['Instrument']
    gc    = instr['gc']

    # Setup the lists.
    groups = get_global '%gc_groups'

    # Test each group.
    .local pmc group_iter, cur_group, cur_list, got_list
    group_iter = iter groups
    GROUP:
      unless group_iter goto END_GROUP
      cur_group = shift group_iter
      $S0       = cur_group

      cur_list  = groups[cur_group]
      got_list  = gc.'get_hook_list'($S0)

      # Check counts.
      $I0  = cur_list
      $I1  = got_list
      $S1  = 'Group: Entry count matches for group '
      $S1 .= $S0
      is($I0, $I1, $S1)

      # Check individual entry.
      $I3 = is_same_set(cur_list, got_list)
      $S1  = 'Group: Entries match for group '
      $S1 .= $S0
      is($I3, 1, $S1)

      goto GROUP
    END_GROUP:

    # Test individual entry.
    # Sample: allocate_pmc_header
    $P0 = gc.'get_hook_list'('allocate_pmc_header')
    $I0 = $P0
    is($I0, 1, 'Individual: Entry count correct.')
    $S0 = $P0[0]
    is($S0, 'allocate_pmc_header', 'Individual: Entry listing correct.')

    # Test non-existent individual entry.
    # Sample: non-existent.
    .local pmc eh
    eh = new ['ExceptionHandler']
    set_addr eh, NON_EXISTENT_OK
    push_eh eh

    $P0 = gc.'get_hook_list'('non-existent')

    ok(0, 'Individual: Non-existent entry fail.')
    goto NON_EXISTENT_END

    NON_EXISTENT_OK:
      ok(1, 'Individual: Non-existent entry ok.')

    NON_EXISTENT_END:

    #Done.
.end

.sub test_insert_hooks
    .local pmc instr, gc, groups

    instr  = new ['Instrument']
    gc     = instr['gc']
    groups = get_global '%gc_groups'

    # Test inserting an individual hook.
    # sample: allocate_pmc_header
    gc.'insert_gc_hook'('allocate_pmc_header')
    $P0 = gc.'get_instrumented_list'()
    $I0 = $P0
    is($I0, 1, 'Insert: Insert single hook count ok.')
    $S0 = $P0[0]
    is($S0, 'allocate_pmc_header', 'Insert: Insert single hook name ok.')

    # Test inserting the same hook again.
    gc.'insert_gc_hook'('allocate_pmc_header')
    $P0 = gc.'get_instrumented_list'()
    $I0 = $P0
    is($I0, 1, 'Re-insert: Re-inserting single hook count ok.')
    $S0 = $P0[0]
    is($S0, 'allocate_pmc_header', 'Re-insert: Re-inserting single hook name ok.')

    # Remove the hook before testing inserting groups.
    gc.'remove_gc_hook'('allocate_pmc_header')
    gc.'remove_gc_hook'('allocate_pmc_header')

    # Test inserting a group of hooks.
    # sample: free
    gc.'insert_gc_hook'('free')
    $P0 = gc.'get_instrumented_list'()
    $P1 = groups['free']
    $I0 = $P0
    $I1 = $P1
    is($I0, $I1, 'Insert group: Count ok.')
    $I2 = is_same_set($P0, $P1)
    is($I2, 1, 'Insert group: Names ok.')

    # Test inserting a non-existent hook.
    # sample: non-existent.
    .local pmc eh
    eh = new ['ExceptionHandler']
    set_addr eh, NON_EXISTENT_OK
    push_eh eh

    gc.'insert_gc_hook'('non-existent')

    ok(0, 'Insert: Non-existent entry fail.')
    goto NON_EXISTENT_END

    NON_EXISTENT_OK:
      ok(1, 'Insert: Non-existent entry ok.')

    NON_EXISTENT_END:

    #Done
.end

.sub test_remove_hooks
    .local pmc instr, gc, groups

    instr  = new ['Instrument']
    gc     = instr['gc']
    groups = get_global '%gc_groups'

    # Test removing an individual hook.
    # sample: allocate_pmc_header
    gc.'insert_gc_hook'('allocate_pmc_header')
    gc.'remove_gc_hook'('allocate_pmc_header')
    $P0 = gc.'get_instrumented_list'()
    $I0 = $P0
    is($I0, 0, 'Remove: Single hook removal ok.')

    # Test insert 2 hooks, remove 1 hook.
    # sample: allocate_pmc_header, free_pmc_header
    gc.'insert_gc_hook'('allocate_pmc_header')
    gc.'insert_gc_hook'('free_pmc_header')
    gc.'remove_gc_hook'('free_pmc_header')
    $P0 = gc.'get_instrumented_list'()
    $I0 = $P0
    is($I0, 1, 'Remove2: Removal count ok.')
    $S0 = $P0[0]
    is($S0, 'allocate_pmc_header', 'Remove2: Removal name ok.')
    gc.'remove_gc_hook'('allocate_pmc_header')

    # Test removing of groups.
    # sample: allocate
    gc.'insert_gc_hook'('allocate')
    gc.'remove_gc_hook'('allocate')
    $P0 = gc.'get_instrumented_list'()
    $I0 = $P0
    is($I0, 0, 'Remove Group: Removal ok.')

    # Test removing a non-existent hook.
    # sample: non-existent.
    .local pmc eh
    eh = new ['ExceptionHandler']
    set_addr eh, NON_EXISTENT_OK
    push_eh eh

    gc.'remove_gc_hook'('non-existent')

    ok(0, 'Remove: Non-existent removal fail.')
    goto NON_EXISTENT_END

    NON_EXISTENT_OK:
      ok(1, 'Remove: Non-existent removal ok.')

    NON_EXISTENT_END:

    # Test removing a hook too many times.
    # sample: non-existent.
    eh = new ['ExceptionHandler']
    set_addr eh, TOO_MANY_OK
    push_eh eh

    gc.'insert_gc_hook'('allocate_pmc_header')
    gc.'remove_gc_hook'('allocate_pmc_header')
    gc.'remove_gc_hook'('allocate_pmc_header')

    ok(0, 'Remove: Too many removal fail.')
    goto TOO_MANY_END

    TOO_MANY_OK:
      ok(1, 'Remove: Too many removal ok.')

    TOO_MANY_END:

    #Done
.end

.sub test_sample_notification
    .local pmc instr, gc_event, args, gc_class

    $S0  = 't/dynpmc/instrumentgc-test1.pir'
    args = new ['ResizableStringArray']
    push args, $S0

    gc_class = get_hll_global ['Instrument';'Event'], 'GC'
    gc_event = gc_class.'new'()
    instr    = new ['Instrument']

    # Test do_gc_mark
    gc_event.'inspect'('do_gc_mark')
    gc_event.'callback'('sample_notification_callback')

    instr.'attach'(gc_event)
    instr.'run'($S0, args)

.end

.sub sample_notification_callback
    .param pmc data

    # Event fired.
    ok(1, 'Event: Event fired.')

    ## Test the interesting bits.

    # Test line.
    $I0 = data['line']
    is($I0, 5, 'Event: Line ok.')

    # Test file.
    $S0 = data['file']
    is($S0, 't/dynpmc/instrumentgc-test1.pir', 'Event: File ok.')

    # Test sub.
    $S0 = data['sub']
    is($S0, 'main', 'Event: Sub ok.')

    # Test type.
    $S0 = data['type']
    is($S0, 'do_gc_mark', 'Event: Type ok.')
.end

# Helper sub: Check if 2 sets with unique items are the same.
.sub is_same_set
    .param pmc arr1
    .param pmc arr2
    .local pmc hash

    $I0 = arr1
    $I1 = arr2
    if $I0 != $I1 goto NO

    hash = new ['Hash']

    # Build the comparison hash
    $I3 = 0
    INSERT_LOOP:
      if $I3 >= $I0 goto END_INSERT_LOOP

      $S0       = arr1[$I3]
      hash[$S0] = 1

      inc $I3
      goto INSERT_LOOP
    END_INSERT_LOOP:

    # Check the contents of arr2
    $I3 = 0
    CHECK_LOOP:
      if $I3 >= $I0 goto END_CHECK_LOOP

      $S0 = arr2[$I3]
      $I4 = exists hash[$S0]

      if $I4 == 0 goto NO

      inc $I3
      goto CHECK_LOOP
    END_CHECK_LOOP:

    YES:
      .return(1)

    NO:
      .return(0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
