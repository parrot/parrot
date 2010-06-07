#! parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 Builtins

Variour helper builtins.

=cut
.namespace []

.sub 'lc'
    .param string arg
    $S0 = downcase arg
    .return ($S0)
.end

.sub 'uc'
    .param string arg
    $S0 = upcase arg
    .return ($S0)
.end

.sub 'defined'
    .param pmc thing
    $I0 = defined thing
    .return ($I0)
.end

.sub 'clone'
    .param pmc what
    $P0 = clone what
    .return ($P0)
.end

.sub 'elements'
    .param pmc p
    $I0 = elements p
    .return ($I0)
.end


.sub 'substr'
    .param string orig
    .param int    from
    .param int    len
    $S0 = substr orig, from, len
    .return ($S0)
.end

.sub 'match'
    .param string pattern
    .param string subject

    .local pmc recomp, resub, match, recache

    load_bytecode 'PGE.pbc'

    #hash cache mapping patterns to subs, avoiding unneeded recompilation
    recache = get_hll_global ['Ops';'Op'], '%recache'
    $I0 = isnull recache
    if $I0 goto no_cache
    $I0 = exists recache[pattern]
    if $I0 goto found_re
    goto no_re

  no_cache:
    recache = new ['Hash']

  no_re:
    recomp = compreg 'PGE::Perl6Regex'
    resub = recomp(pattern)
    recache[pattern] = resub

  found_re:
    resub = recache[pattern]
    set_hll_global ['Ops';'Op'], '%recache', recache

    match = resub(subject)
    if match goto found_match
    .return (0)
  found_match:
    .return (1)
.end

.sub 'die'
    .param string why       :optional
    .param int    has_why   :opt_flag

    die why
.end

.sub 'slurp'
    .param string file
    .local pmc pio
    pio = new ['FileHandle']
    pio.'open'(file)
    $S0  = pio.'readall'()
    pio.'close'()
    .return ($S0)
.end

.sub 'split' :multi(_,_)
    .param string splitter
    .param string buf

    $P0 = split splitter, buf
    .return ($P0)
.end

.sub 'split' :multi('Sub', _)
    .param pmc regex
    .param pmc str
    .param int count        :optional
    .param int has_count    :opt_flag
    .local pmc match
    .local pmc retv
    .local int start_pos
    .local int end_pos
    .local int zwm_start

    $S0 = str
    retv = new 'ResizableStringArray'
    start_pos = 0

    # per Perl 5's negative LIMIT behavior
    unless has_count goto positive_count
    if count < 1 goto done

  positive_count:
    match = regex($S0)
    if match goto loop
    retv.'push'($S0)
    goto done

  loop:
    unless has_count goto skip_count
    dec count
    unless count < 1 goto skip_count
    $S1 = substr $S0, start_pos
    retv.'push'($S1)
    goto done
  next_zwm:
    zwm_start = start_pos
  inc_zwm:
    inc start_pos
    match = regex($S0, 'continue' => start_pos)
    end_pos = match.'from'()
    unless start_pos == end_pos goto inc_zwm
    start_pos = zwm_start
    end_pos -= start_pos
    goto add_str
  skip_count:
    match = regex($S0, 'continue' => start_pos)
    end_pos = match.'from'()
    $I99 = match.'to'()
    if $I99 == end_pos goto next_zwm
    end_pos -= start_pos
  add_str:
    $S1 = substr $S0, start_pos, end_pos
    retv.'push'($S1)
    unless match goto done
    $I0 = match.'to'()
    if $I0 == start_pos goto zero_width
    start_pos = $I0
    goto loop
  zero_width:
    inc start_pos
    goto loop

  done:
    .return(retv)
.end

.sub 'list'
    .param pmc l :slurpy
    .return (l)
.end

.sub 'sprintf'
    .param string format
    .param pmc    args :slurpy

    $S0 = sprintf format, args
    .return($S0)
.end

.sub 'say'
    .param string arg
    say arg
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
