## $Id$

=head1 NAME

src/classes/CardinalArray.pir - Cardinal CardinalArray class and related functions
Stolen from Rakudo

=head1 Methods

=over 4

=cut

.namespace ['CardinalArray']

.sub 'onload' :anon :load :init
    .local pmc cardinalmeta, arrayproto, interp, core_type, hll_type
    cardinalmeta = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    arrayproto = cardinalmeta.'new_class'('CardinalArray', 'parent'=>'ResizablePMCArray CardinalObject')
    cardinalmeta.'register'('ResizablePMCArray', 'parent'=>'CardinalObject', 'protoobject'=>arrayproto)
    core_type = get_class 'ResizablePMCArray'
    hll_type = get_class 'CardinalArray'

    interp = getinterp
    interp.'hll_map'(core_type, hll_type)

.end

=item get_string()    (vtable method)

Return the elements of the list concatenated.

=cut

.sub 'get_string' :vtable :method
    $S0 = join ', ', self
    $S0 = concat '[', $S0
    $S0 = concat $S0, ']'
    .return ($S0)
.end

.sub 'initialize' :method :multi(_)
        noop
.end

.include "hllmacros.pir"
.sub 'initialize' :method :multi(_,CardinalInteger)
    .param pmc size
    .local pmc i
    i = new 'CardinalInteger'
    i = 0
    $P0 = get_hll_global 'nil'
    .DoWhile( {
                self[i] = $P0
                inc i
              }, i < size)
.end

=item to_s()    (method)

Return a CardinalString representing the Array.

=cut

.sub 'to_s' :method
    $S0 = join '', self
    $P0 = new 'CardinalString'
    $P0 = $S0
    .return($P0)
.end

=item clone()    (vtable method)

Clones the list.

=cut

.sub 'clone' :vtable :method
    $P0 = 'list'(self)
    .return ($P0)
.end

=item clear()    (method)

Removes all elements from the array.

=cut

.sub 'clear' :method
    self = 0
.end

=item fill(value)

Fill C<self> with C<value>
Doesnt work, but it should be close...

=cut

.sub 'fill' :method
    .param pmc value
    .param int offset :optional
    .param int end_index :optional

    unless end_index goto set_index
    unless offset goto set_offset
    goto do_fill

    set_index:
        end_index = self.'length'()
        unless offset goto set_offset
        goto do_fill
    set_offset:
        offset = 0
        goto do_fill
    do_fill:
        $P0 = new 'CardinalString'
        $P0 = value
        splice self, value, offset, end_index
        .return (self)
.end

=item ACCEPTS(topic)

=cut

.sub 'ACCEPTS' :method
    .param pmc topic
    .local int i

    .local string what
    what = topic.'WHAT'()
    if what == "CardinalArray" goto acc_list
    goto no_match

acc_list:
    # Smartmatch against another list. Smartmatch each
    # element.
    .local int count_1, count_2
    count_1 = elements self
    count_2 = elements topic
    if count_1 != count_2 goto no_match
    i = 0
list_cmp_loop:
    if i >= count_1 goto list_cmp_loop_end
    .local pmc elem_1, elem_2
    elem_1 = self[i]
    elem_2 = topic[i]
    ($I0) = elem_1.'ACCEPTS'(elem_2)
    unless $I0 goto no_match
    inc i
    goto list_cmp_loop
list_cmp_loop_end:
    goto match

no_match:
    $P0 = get_hll_global ['Bool'], 'False'
    .return($P0)
match:
    $P0 = get_hll_global ['Bool'], 'True'
    .return($P0)
.end


=item elems()

Return the number of elements in the list.

=cut

.sub 'elems' :method
    $I0 = elements self
    .return ($I0)
.end

=item

Return the class name

=cut

.sub 'class' :method
    .tailcall self.'WHAT'()
.end

=item sort()

Return a sorted copy of the list

=cut

.sub 'sort' :method
    .param pmc by              :optional
    .param int has_by          :opt_flag
    if has_by goto have_by
    by = get_hll_global 'infix:cmp'
  have_by:

    .local pmc list, fpa
    .local int elems

    list = self
    elems = list.'elems'()
    fpa = new 'FixedPMCArray'
    fpa = elems

    .local int i
    i = 0
  fpa_loop:
    unless i < elems goto fpa_end
    $P0 = list[i]
    fpa[i] = $P0
    inc i
    goto fpa_loop
  fpa_end:
    fpa.'sort'(by)
    .tailcall 'list'(fpa :flat)
.end

.sub 'sort!' :method
    .param pmc by              :optional
    .param int has_by          :opt_flag
    if has_by goto have_by
    by = get_hll_global 'infix:cmp'
  have_by:
    $P0 = self.'sort'()
    self = 0
    self.'append'($P0)
.end

=item uniq(...)

=cut

# TODO Rewrite it. It's too naive.

.sub uniq :method
    .local pmc ulist
    .local pmc key
    .local pmc val
    .local pmc uval
    .local int len
    .local int i
    .local int ulen
    .local int ui

    ulist = new 'CardinalArray'
    len = self.'elems'()
    i = 0

  loop:
    if i == len goto done

    val = self[i]

    ui = 0
    ulen = ulist.'elems'()
    inner_loop:
        if ui == ulen goto inner_loop_done

        uval = ulist[ui]
        if uval == val goto found

        inc ui
        goto inner_loop
    inner_loop_done:

    ulist.'push'(val)

    found:

    inc i
    goto loop

  done:
    .return(ulist)
.end

.sub 'uniq!' :method
    $P0 = self.'uniq'()
    self = 0
    self.'append'($P0)
.end

.sub 'max' :method
  $P0 = 'infix:max'(self)
  .return($P0)
.end

.sub 'min' :method
  $P0 = 'infix:min'(self)
  .return($P0)
.end

=item include?(ELEMENT)

Return true if self contains ELEMENT

=cut
.sub 'include?' :method
    .param pmc args
    .local pmc iter
    iter = new 'Iterator', self
  iter_loop:
    unless iter goto done_f
    $P0 = shift iter
    eq $P0, args, done_t
    goto iter_loop
   done_f:
        $P0 = get_hll_global ['Bool'], 'False'
        .return($P0)
   done_t:
        $P0 = get_hll_global ['Bool'], 'True'
        .return($P0)
.end

=item
Return true is C<self> is of size 0
=cut
.sub 'empty?' :method
    .local int len
    len = self.'length'()
    if len == 0 goto empty
    goto not_empty
    empty:
       $P0 = get_hll_global ['Bool'], 'True'
       .return ($P0)
    not_empty:
        $P0 = get_hll_global ['Bool'], 'False'
        .return ($P0)
.end

=item unshift(ELEMENTS)

Prepends ELEMENTS to the front of the list.

=cut

.sub 'unshift' :method
    .param pmc args :slurpy
    .local int narg
    .local int i

    narg = args
    i = 0

    .local pmc tmp
  loop:
    if i == narg goto done
    pop tmp, args
    unshift self, tmp
    inc i
    goto loop
  done:
.end

=item keys()

Returns a CardinalArray containing the keys of the CardinalArray.

=cut

.sub 'keys' :method
    .local pmc elem
    .local pmc res
    .local int len
    .local int i

    res = new 'CardinalArray'
    len = elements self
    i = 0

  loop:
    if i == len goto done

    elem = new 'CardinalInteger'
    elem = i
    res.'push'(elem)

    inc i
    goto loop

  done:
    .return(res)
.end

=item values()

Returns a CardinalArray containing the values of the CardinalArray.

=cut

.sub 'values' :method
    .local pmc elem
    .local pmc res
    .local int len
    .local int i

    res = new 'CardinalArray'
    len = elements self
    i = 0

  loop:
    if i == len goto done

    elem = new 'CardinalInteger'
    elem = self[i]
    res.'push'(elem)

    inc i
    goto loop

  done:
    .return(res)
.end

=item shift()

Shifts the first item off the list and returns it.

=cut

.sub 'shift' :method
    .local pmc x
    x = shift self
    .return (x)
.end

=item pop()

Treats the list as a stack, popping the last item off the list and returning it.

=cut

.sub 'pop' :method
    .local pmc x
    .local int len

    len = elements self

    if len == 0 goto empty
    pop x, self
    goto done

  empty:
    x = undef()
    goto done

  done:
    .return (x)
.end

=item push(ELEMENTS)

Treats the list as a stack, pushing ELEMENTS onto the end of the list.  Returns the new length of the list.

=cut

.sub 'push' :method
    .param pmc args :slurpy
    .local int len
    .local pmc tmp
    .local int i

    len = args
    i = 0

  loop:
    if i == len goto done
    shift tmp, args
    push self, tmp
    inc i
    goto loop
  done:
    len = elements self
    .return (len)
.end

=item join(SEPARATOR)

Returns a string comprised of all of the list, separated by the string SEPARATOR.  Given an empty list, join returns the empty string. SEPARATOR is an optional parameter

=cut

.sub 'join' :method
    .param string sep :optional
    .local string res
    .local string tmp
    .local int len
    .local int i

    res = ""

    len = elements self
    if len == 0 goto done

    len = len - 1
    i = 0

  loop:
    if i == len goto last

    tmp = self[i]
    concat res, tmp
    concat res, sep

    inc i
    goto loop

  last:
    tmp = self[i]
    concat res, tmp

  done:
    $S0 = res
    .return(res)
.end

=item reverse()

Returns a list of the elements in revese order.

=cut

.sub 'reverse' :method
    .local pmc res
    .local int len
    .local int i

    res = new 'CardinalArray'

    len = elements self
    if len == 0 goto done
    i = 0

    .local pmc elem
loop:
    if len == 0 goto done

    dec len
    elem = self[len]
    res[i] = elem
    inc i

    goto loop

done:
    .return(res)
.end

=item reverse!()

Reverses a list in place.  Destructive update.
Returns self.

=cut

.sub 'reverse!' :method
    .local int pos
    .local int len
    .local pmc tmp1
    .local pmc tmp2
    pos = elements self
    len = pos
    dec len
    pos = pos / 2
  loop:
    if pos == 0 goto done
    dec pos
    tmp1 = self[pos]
    $I0 = len-pos
    tmp2 = self[$I0]
    self[pos] = tmp2
    self[$I0] = tmp1
    goto loop
  done:
    .return(self)
.end

=item delete()

Deletes the given element from the CardinalArray, replacing them with Undef.
Returns the item if found, otherwise returns the result of running the block
if passed, otherwise returns nil.

=cut

.sub delete :method
    .param pmc item
    .param pmc block :optional :named('!BLOCK')
    .param int block_flag :opt_flag
    .local pmc nil
    .local pmc elem
    .local int len
    .local int i
    .local pmc return
    .local pmc nil

    nil = new 'NilClass'
    return = nil

    len = elements self
    i = 0

  loop:
    if i == len goto done

    elem = self[i]


    $I0 = elem == item
    if $I0, found
    inc i

    goto loop
  found:
    return = item
    delete self[i]
    dec len
    goto loop
  done:
    $I0 = return == nil
    if $I0, not_found
    .return(return)
  not_found:
    if block_flag, have_block
    .return(return)
  have_block:
    $P0 = block()
    .return($P0)
.end

=item exists(INDEX)

Checks to see if the specified index or indices have been assigned to.  Returns a Bool value.

=cut

.sub exists :method
    .param pmc indices :slurpy
    .local int test
    .local int len
    .local pmc res
    .local int ind
    .local int i

    test = 1
    len = elements indices
    i = 0

  loop:
    if i == len goto done

    ind = indices[i]

    test = exists self[ind]
    if test == 0 goto done

    inc i
    goto loop

  done:
    .tailcall 'prefix:?'(test)
.end

=item kv()

=cut

.sub kv :method
    .local pmc elem
    .local pmc res
    .local int len
    .local int i

    res = new 'CardinalArray'
    len = elements self
    i = 0

  loop:
    if i == len goto done

    elem = new 'CardinalInteger'
    elem = i
    res.'push'(elem)

    elem = self[i]
    res.'push'(elem)

    inc i
    goto loop

  done:
    .return(res)
.end

=item pairs()

=cut

.sub pairs :method
    .local pmc pair
    .local pmc key
    .local pmc val
    .local pmc res
    .local int len
    .local int i

    res = new 'CardinalArray'
    len = elements self
    i = 0

  loop:
    if i == len goto done

    key = new 'CardinalInteger'
    key = i

    val = self[i]

    pair = new 'Pair'
    pair[key] = val

    res.'push'(pair)

    inc i
    goto loop

  done:
    .return(res)
.end

=item grep(...)

=cut

.sub grep :method
    .param pmc test
    .param pmc block :named('!BLOCK')
    .local pmc retv
    .local pmc block_res
    .local pmc block_arg
    .local int narg
    .local int i

    retv = new 'CardinalArray'
    narg = elements self
    i = 0

  loop:
    if i == narg goto done
    block_arg = self[i]
    $P0 = 'infix:=~'(block_arg, test)
    unless $P0 goto next
    block_res = block(block_arg)
    if block_res goto grepped
    goto next

  grepped:
    retv.'push'(block_res)
    goto next

  next:
    inc i
    goto loop

  done:
    .return(retv)
.end

=item first(...)

=cut

.sub first :method :multi(CardinalArray,_)
    .param int count
    .local pmc newlist
    .local pmc item
    .local int elems
    .local int i

    newlist = new 'CardinalArray'

    elems = elements self
    le count, elems, sufficient_elements
    count = elems
  sufficient_elements:

    i = 0

  loop:
    if i == count goto done
    item = self[i]
    item = clone item

    push newlist, item

    inc i
    goto loop
  done:
    .return(newlist)
.end

.sub first :method :multi(CardinalArray)
    .local pmc item
    $I0 = elements self
    eq $I0, 0, empty
    item = self[0]
    .return (item)
  empty:
    item = new 'Undef'
    .return (item)
.end

=item first(...)

=cut

.sub last :method :multi(CardinalArray,_)
    .param int count
    .local pmc newlist
    .local pmc item
    .local int elems
    .local int i

    newlist = new 'CardinalArray'

    elems = elements self
    count = elems - count
    ge count, 0, sufficient_elements
    count = 0
  sufficient_elements:

    i = elems - 1

  loop:
    lt i, count, done
    item = self[i]
    item = clone item

    unshift newlist, item

    dec i
    goto loop
  done:
    .return(newlist)
.end

.sub last :method :multi(CardinalArray)
    .local pmc item
    $I0 = elements self
    eq $I0, 0, empty
    dec $I0
    item = self[$I0]
    .return (item)
  empty:
    item = new 'Undef'
    .return (item)
.end

=item each(block)

Run C<block> once for each item in C<self>, with the item passed as an arg.

=cut

.sub 'each' :method
    .param pmc block :named('!BLOCK')
    $P0 = new 'Iterator', self
  each_loop:
    unless $P0 goto each_loop_end
    $P1 = shift $P0
    block($P1)
    goto each_loop
  each_loop_end:
.end

.sub 'each_with_index' :method
    .param pmc block :named('!BLOCK')
    .local int len
    len = elements self
    $I0 = 0
  each_loop:
    if $I0 == len goto each_loop_end
    $P0 = self[$I0]
    block($P0,$I0)
    inc $I0
    goto each_loop
  each_loop_end:
.end

=item collect(block)

Run C<block> once for each item in C<self>, with the item passed as an arg.
Creates a new Array containing the results and returns it.

=cut

.sub 'collect' :method
    .param pmc block :named('!BLOCK')
    .local pmc result
    result = new 'CardinalArray'
    $P0 = new 'Iterator', self
  each_loop:
    unless $P0 goto each_loop_end
    $P1 = shift $P0
    $P2 = block($P1)
    result.'push'($P2)
    goto each_loop
  each_loop_end:
    .return (result)
.end

=item flatten

 recursively flatten any inner arrays into a single outer array

=cut
.sub 'flatten' :method
    .local pmc returnMe
    .local pmc iterator
    returnMe = new 'CardinalArray'
    iterator = new 'Iterator', self
  each_loop:
    unless iterator goto each_loop_end
    $P1 = shift iterator
    #if $P1 is an array call flatten
    $I0 = isa $P1, 'CardinalArray'
    if $I0 goto inner_flatten
    push returnMe, $P1
    goto each_loop
  inner_flatten:
    $P2 = $P1.'flatten'()
    $P3 = new 'Iterator', $P2
    inner_loop:
        unless $P3 goto each_loop
        $P4 = shift $P3
        push returnMe, $P4
        goto inner_loop
    goto each_loop
  each_loop_end:
  .return(returnMe)
.end

=item size

Retrieve the number of elements in C<self>

=cut
.sub 'size' :method
     $I0 = self
     .return($I0)
.end

=item length

Retrieve the number of elements in C<self>

=cut
.sub 'length' :method
     $I0 = self
     .return($I0)
.end

=item at(index)

    Retrieve element from position C<index>.

=cut
.sub 'at' :method
    .param pmc i
    $P0 = self[i]
    .return($P0)
.end

.sub '[]' :method
    .param pmc i
    $P0 = self[i]
    .return($P0)
.end

.sub '[]=' :method
    .param pmc k
    .param pmc v
    self[k] = v
    .return()
.end


=item slice

Retrieve the number of elements in C<self>

=cut
.sub 'slice' :method
    .param int start
    .param int end
    .local pmc returnMe
    returnMe = new 'CardinalArray'
    $I0 = start
  each_loop:
    unless $I0 <= end goto each_loop_end
    $P0 = self[$I0]
    inc $I0
    push returnMe, $P0
    goto each_loop
  each_loop_end:
  .return(returnMe)
.end

=item zip

The zip operator.

=cut

.sub 'zip' :method
    .param pmc args :slurpy
    .local int num_args
    .local pmc zipped
    num_args = elements args

    zipped = new 'CardinalArray'

    # Get minimum element count - what we'll zip to.
    .local pmc iterator, args_iter, arg, item
    .local int i
    iterator = new 'Iterator', self
    i = 0

  setup_loop:
    unless iterator, setup_loop_done
    args_iter = new 'Iterator', args
    item = new 'CardinalArray'
    $P0 = shift iterator
    item.'push'($P0)
  inner_loop:
    unless args_iter, inner_loop_done
    arg = shift args_iter
    $P0 = arg[i]
    unless null $P0 goto arg_not_null
    $P0 = get_hll_global 'nil'
  arg_not_null:
    item.'push'($P0)
    goto inner_loop
  inner_loop_done:
    inc i
    zipped.'push'(item)
    goto setup_loop
  setup_loop_done:

    .return (zipped)
.end

=back

=head1 Functions

=over 4

=item C<list(...)>

Build a CardinalArray from its arguments.

=cut

.namespace []

.sub 'list'
    .param pmc args            :slurpy
    .local pmc list, item
    list = new 'CardinalArray'
  args_loop:
    unless args goto args_end
    item = shift args
    $I0 = defined item
    unless $I0 goto add_item
    $I0 = isa item, 'CardinalArray'
    if $I0 goto add_item
    $I0 = does item, 'array'
    unless $I0 goto add_item
    splice args, item, 0, 0
    goto args_loop
  add_item:
    push list, item
    goto args_loop
  args_end:
    .return (list)
.end


=item C<infix:,(...)>

Operator form for building a list from its arguments.

=cut

.sub 'infix:,'
    .param pmc args            :slurpy
    .tailcall 'list'(args :flat)
.end


=item C<infix:Z(...)>

The zip operator.

=cut

.sub 'infix:Z'
    .param pmc args # :slurpy
    .local int num_args
    num_args = elements args

    # Empty list of no arguments.
    if num_args > 0 goto has_args
    $P0 = new 'CardinalArray'
    .return($P0)
has_args:

    # Get minimum element count - what we'll zip to.
    .local int min_elem
    .local int i
    i = 0
    $P0 = args[0]
    min_elem = elements $P0
min_elems_loop:
    if i >= num_args goto min_elems_loop_end
    $P0 = args[i]
    $I0 = elements $P0
    unless $I0 < min_elem goto not_min
    min_elem = $I0
not_min:
    inc i
    goto min_elems_loop
min_elems_loop_end:

    # Now build result list of lists.
    .local pmc res
    res = new 'CardinalArray'
    i = 0
zip_loop:
    if i >= min_elem goto zip_loop_end
    .local pmc cur_list
    cur_list = new 'CardinalArray'
    .local int j
    j = 0
zip_elem_loop:
    if j >= num_args goto zip_elem_loop_end
    $P0 = args[j]
    $P0 = $P0[i]
    cur_list[j] = $P0
    inc j
    goto zip_elem_loop
zip_elem_loop_end:
    res[i] = cur_list
    inc i
    goto zip_loop
zip_loop_end:

    .return(res)
.end


=item C<infix:X(...)>

The non-hyper cross operator.

=cut

.sub 'infix:X'
    .param pmc args            :slurpy
    .local pmc res
    res = new 'CardinalArray'

    # Algorithm: we'll maintain a list of counters for each list, incrementing
    # the counter for the right-most list and, when it we reach its final
    # element, roll over the counter to the next list to the left as we go.
    .local pmc counters
    .local pmc list_elements
    .local int num_args
    counters = new 'FixedIntegerCardinalArray'
    list_elements = new 'FixedIntegerCardinalArray'
    num_args = elements args
    counters = num_args
    list_elements = num_args

    # Get element count for each list.
    .local int i
    .local pmc cur_list
    i = 0
elem_get_loop:
    if i >= num_args goto elem_get_loop_end
    cur_list = args[i]
    $I0 = elements cur_list
    list_elements[i] = $I0
    inc i
    goto elem_get_loop
elem_get_loop_end:

    # Now we'll start to produce them.
    .local int res_count
    res_count = 0
produce_next:

    # Start out by building list at current counters.
    .local pmc new_list
    new_list = new 'CardinalArray'
    i = 0
cur_perm_loop:
    if i >= num_args goto cur_perm_loop_end
    $I0 = counters[i]
    $P0 = args[i]
    $P1 = $P0[$I0]
    new_list[i] = $P1
    inc i
    goto cur_perm_loop
cur_perm_loop_end:
    res[res_count] = new_list
    inc res_count

    # Now increment counters.
    i = num_args - 1
inc_counter_loop:
    $I0 = counters[i]
    $I1 = list_elements[i]
    inc $I0
    counters[i] = $I0

    # In simple case, we just increment this and we're done.
    if $I0 < $I1 goto inc_counter_loop_end

    # Otherwise we have to carry.
    counters[i] = 0

    # If we're on the first element, all done.
    if i == 0 goto all_done

    # Otherwise, loop.
    dec i
    goto inc_counter_loop
inc_counter_loop_end:
    goto produce_next

all_done:
    .return(res)
.end


=item C<infix:min(...)>

The min operator.

=cut

.sub 'infix:min'
    .param pmc args

    # If we have no arguments, undefined.
    .local int elems
    elems = elements args
    if elems > 0 goto have_args
    $P0 = undef()
    .return($P0)
have_args:

    # Find minimum.
    .local pmc cur_min
    .local int i
    cur_min = args[0]
    i = 1
    .local pmc compare
    compare = get_hll_global 'infix:<=>'
find_min_loop:
    if i >= elems goto find_min_loop_end
    $P0 = args[i]
    #$I0 = cur_min.'infix:cmp'($P0)
    $I0 = cur_min.compare($P0)
    if $I0 != 1 goto not_min
    set cur_min, $P0
not_min:
    inc i
    goto find_min_loop
find_min_loop_end:

    .return(cur_min)
.end


=item C<infix:max(...)>

The max operator.

=cut

.sub 'infix:max'
    .param pmc args

    # If we have no arguments, undefined.
    .local int elems
    elems = elements args
    if elems > 0 goto have_args
    $P0 = undef()
    .return($P0)
have_args:

    # Find maximum.
    .local pmc cur_max
    .local int i
    cur_max = args[0]
    i = 1
    .local pmc compare
    compare = get_hll_global 'infix:<=>'
find_max_loop:
    if i >= elems goto find_max_loop_end
    $P0 = args[i]
    #$I0 = 'infix:<=>'($P0, cur_max)
    $I0 = cur_max.compare($P0)
    if $I0 != -1 goto not_max
    set cur_max, $P0
not_max:
    inc i
    goto find_max_loop
find_max_loop_end:

    .return(cur_max)
.end

=item C<reverse(LIST)>

Returns the elements of LIST in the opposite order.

=cut

.sub 'reverse'
    .param pmc list :slurpy
    .local string type
    .local pmc retv
    .local pmc elem
    .local int len
    .local int i

    len = elements list

    if len > 1 goto islist

    # If we're not a list, check if we're a string.
    elem = list[0]
    typeof type, elem

    # This is a bit of a work around - some operators (ie. ~) return
    # a String object instead of a CardinalString.
    eq type, 'String', parrotstring
    eq type, 'CardinalString', perl6string
    goto islist

  parrotstring:
    .local string tmps
    tmps = elem
    elem = new 'CardinalString'
    elem = tmps

  perl6string:
    retv = elem.'reverse'()
    goto done

  islist:
    retv = new 'CardinalArray'
    i = 0

  loop:
    if i == len goto done
    elem = list[i]
    retv.'unshift'(elem)
    inc i
    goto loop

  done:
    .return(retv)
.end

.sub keys :multi('CardinalArray')
  .param pmc list

  .tailcall list.'keys'()
.end

.sub values :multi('CardinalArray')
  .param pmc list

  .tailcall list.'values'()
.end

.sub delete :multi('CardinalArray')
  .param pmc list
  .param pmc indices :slurpy

  .tailcall list.'delete'(indices :flat)
.end

.sub exists :multi('CardinalArray')
  .param pmc list
  .param pmc indices :slurpy

  .tailcall list.'exists'(indices :flat)
.end

.sub kv :multi('CardinalArray')
    .param pmc list

    .tailcall list.'kv'()
.end

.sub pairs :multi('CardinalArray')
    .param pmc list

    .tailcall list.'pairs'()
.end

.sub grep :multi(_,'CardinalArray')
    .param pmc test
    .param pmc list :slurpy

    .tailcall list.'grep'(test)
.end

.sub first :multi(_,'CardinalArray')
    .param pmc test
    .param pmc list :slurpy

    .tailcall list.'first'(test)
.end

.sub 'infix:<<' :multi('CardinalArray',_)
    .param pmc array
    .param pmc item
    push array, item
    .return(array)
.end

## TODO: join map reduce sort zip

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
