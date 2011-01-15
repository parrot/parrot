#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/orderedhashiterator.t - Ordered Hash Iterator

=head1 SYNOPSIS

    % prove t/pmc/orderedhashiterator.t

=head1 DESCRIPTION

Do almost nothing test. Main purpose of OrderedHashIterator covered by
t/pmc/orderedhash.t.

=cut

.include 'iterator.pasm'
.include 'except_types.pasm'

.sub 'main' :main
    .include 'test_more.pir'

    plan(7)

    'test_init'()
    'test_bad_type'()
    'test_shift'()
    'test_pop'()
    'test_clone'()
.end

.sub 'test_init'
    .local pmc oh, it
    .local int i, i2
    # We can't create OrderedHashIterator directly
    i = 1
    push_eh fail
    oh = new ['OrderedHashIterator']
    i = 0
  fail:
    pop_eh
    ok(i, "Can't create OrderedHashIterator directly")

    oh = new ['OrderedHash']
    it = iter oh
    sweep 1 # Make sure the mark vtable is covered
    i = isa it, 'Iterator'
    i2 = isa it, 'OrderedHashIterator'
    add i, i2
    is(i, 2, 'OrderedHashIterator has proper type')

    # elements and get_integer should both return 0
    i = elements it
    i2 = it
    add i, i2
    is(i, 0, 'iterator for empty OrderedHash has size 0')
.end

.sub 'test_bad_type'
    .local pmc oh, it, eh
    .local int i
    oh = new ['OrderedHash']
    it = iter oh
    i = 1
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_INVALID_OPERATION)
    set_label eh, catch
    push_eh eh
    it = 9999 # Let's hope it will never be a valid iteration type
    i = 0
  catch:
    finalize eh
    pop_eh
    ok(i, 'invalid iteration type throws')
.end

.sub 'test_shift'
    .local pmc oh, it, eh, p
    .local int i
    oh = new ['OrderedHash']
    it = iter oh
    i = 1
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    set_label eh, catch
    push_eh eh
    p = shift it
    i = 0
  catch:
    finalize eh
    pop_eh
    ok(i, 'shift_pmc in empty OH throws')
.end

.sub 'test_pop'
    .local pmc oh, it, eh, p
    .local int i
    oh = new ['OrderedHash']
    it = iter oh
    it = .ITERATE_FROM_END
    i = 1
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    set_label eh, catch
    push_eh eh
    p = pop it
    i = 0
  catch:
    finalize eh
    pop_eh
    ok(i, 'pop_pmc in empty OH throws')
.end

.sub 'test_clone'
    .local pmc oh, it, cl
    .local int result
    oh = new ['OrderedHash']
    it = iter oh

    # This chekcs the de facto behavior for code coverage purposes.
    cl = clone it
    result = isnull cl
    ok(result, 'clone of OHI gives null')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
