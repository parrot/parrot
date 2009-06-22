# $Id$
# Copyright (C) 2009, Parrot Foundation.

=head1 Builtins

Variour helper builtins.

=cut
.namespace []

.sub 'uc'
    .param string arg
    $S0 = upcase arg
    .return ($S0)
.end

.sub 'join'
    .param string joiner
    .param pmc args

    unless args goto done
    $S0 = join joiner, args
  done:
    .return ($S0)
.end

.sub 'defined'
    .param pmc thing
    $I0 = defined thing
    .return ($I0)
.end

.sub 'exists'
    .param pmc where
    .param pmc what
    $I0 = exists where[what]
    .return ($I0)
.end

.sub 'clone'
    .param pmc what
    $P0 = clone what
    .return ($P0)
.end


=item deep_clone

Create a deep clone of C<what>.  Note: This sub assumes that any element of
C<what> which doesn't provide scalar is an aggregate PMC.  It also assumes that
any nested aggregates work correctly with iterators and can be resized.  This
is not intended to be a general-use sub.

=cut

.include 'iterator.pasm'

.sub 'deep_clone'
    .param pmc what

    .local int does_scalar, does_hash, does_array
    does_scalar = does what, 'scalar'
    does_hash   = does what, 'hash'
    does_array  = does what, 'array'
    if does_scalar == 1 goto clone_scalar
  
  clone_aggregate:
    .local pmc it, key, val, cloned, cloned_val
    .local int i

    cloned = clone what
    it = iter what
    if does_hash goto hash_iter_loop
    unless does_array goto idk

    i = 0
  array_iter_loop:
    unless it goto array_iter_end
    val = shift it
    (cloned_val) = 'deep_clone'(val)
    cloned[i] = cloned_val
    i += 1
    goto array_iter_loop
  array_iter_end:
    .return (cloned)

  hash_iter_loop:
    unless it goto hash_iter_end
    key = shift it
    $S0 = typeof key
    val = what[key]
    (cloned_val) = 'deep_clone'(val)
    cloned[key] = cloned_val
    goto hash_iter_loop
  hash_iter_end:
    .return (cloned)

  clone_scalar:
    $P0 = clone what
    .return ($P0)

  idk:
    $S0 = typeof what
    $S0 = "don't know how to clone" . $S0
    die $S0
.end

.sub 'substr'
    .param string orig
    .param int    from
    .param int    len
    $S0 = substr orig, from, len
    .return ($S0)
.end

.sub 'chars'
    .param string s
    $I0 = length s
    .return ($I0)
.end

.sub 'elements'
    .param pmc p
    $I0 = elements p
    .return ($I0)
.end

.sub 'freeze'
    .param pmc p
    $S0 = freeze p
    .return ($S0)
.end

.sub 'json'
    .param pmc p
    load_bytecode 'JSON.pbc'
    $S0 = _json(p, 1)
    .return ($S0)
.end

.sub 'thaw'
    .param string filename

    .local string frozen
    .local pmc pio
    pio = new ['FileHandle']
    frozen = pio.'readall'(filename)
    $P0 = thaw frozen
    .return ($P0)

.end

# Extend various Parrot's PMCs to play nicely with NQP.
.namespace ['Hash']

.sub 'keys' :method
    .local pmc res, it
    res = new 'ResizableStringArray'
    it = iter self
  loop:
    unless it goto done
    $P0 = shift it
    $S0 = $P0
    push res, $S0
    goto loop
  done:

    .return(res)

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
