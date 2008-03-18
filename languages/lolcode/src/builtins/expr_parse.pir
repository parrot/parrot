=head1

expr_parse.pir - parse an expression and dispatch function calls with their appropriate arguments.

=cut

.namespace

.sub 'setup_global_parsing_tokens' :init :load :anon
    $P0 = new 'String'
    $P0 = 'MKAY end of statement marker'
    store_global 'MKAY', $P0
.end

.sub 'expr_parse'
    .param pmc tokens :slurpy

    .local pmc t_iter
    t_iter = new 'Iterator', tokens

    .local pmc sub_stack
    .local pmc val_stack
    .local pmc arity_stack

    sub_stack = new 'ResizablePMCArray'
    val_stack = new 'ResizablePMCArray'
    arity_stack = new 'ResizableIntegerArray'

    .local pmc mkay
    mkay = find_name 'MKAY'
  it_loop:
    unless t_iter goto it_done
      .local pmc item
      .local pmc sub_to_call
      .local pmc args_array
      item = shift t_iter
      $I0 = isntsame item, mkay
    if $I0 goto check_type
      has_slurpy:
      sub_to_call = pop sub_stack
      $I0 = shift arity_stack
      args_array = new 'ResizablePMCArray'
      getting_varargs:
        $P1 = pop val_stack
        $I0 = issame $P1, mkay
        if $I0 goto call_the_sub
        unshift args_array, $P1
        goto getting_varargs
      got_varargs:
    check_type:
      $I0 = isa item, 'Sub'
    unless $I0 goto has_val
      $P0 = inspect item
      $I2 = $P0['pos_slurpy']
      unless $I2 goto no_slurpy
        push sub_stack, item
        unshift arity_stack, -1
        push val_stack, mkay
      goto end_fixed
      no_slurpy:
        $I1 = item.arity()
        push sub_stack, item
        unshift arity_stack, $I1
      end_fixed:
      goto skip_val
    has_val:
      push val_stack, item
      $I0 = arity_stack[0]
      $I0 -= 1
      arity_stack[0] = $I0
    skip_val:
    call_check:
      $I0 = arity_stack[0]
      unless $I0 == 0 goto skip_call
      sub_to_call = pop sub_stack
      $I1 = sub_to_call.arity()
      args_array = new 'ResizablePMCArray'
    args_loop:
      if $I1 == 0 goto args_loop_end
      $I1 -= 1
      $P1 = pop val_stack
      unshift args_array, $P1
      goto args_loop
    args_loop_end:
      $I2 = shift arity_stack
      call_the_sub:
      $P2 = sub_to_call(args_array :flat)
      push val_stack, $P2
      $I0 = arity_stack[0]
      $I0 -= 1
      arity_stack[0] = $I0
      goto call_check
    skip_call:
    goto it_loop
it_done:
    $I0 = elements sub_stack
    if $I0 == 0 goto no_leftover_function
    sub_to_call = pop sub_stack
    args_array = new 'ResizablePMCArray'
    $P2 = new 'Iterator', val_stack
    getting_more_varargs:
      $I1 = elements val_stack
      unless $I1 goto got_more_varargs
      $P1 = pop val_stack
      $I0 = issame $P1, mkay
      if $I0 goto got_more_varargs
      unshift args_array, $P1
      goto getting_more_varargs
    got_more_varargs:
    $P0 = sub_to_call(args_array :flat)
    push val_stack, $P0
    no_leftover_function:
    .local pmc return_val
    return_val = pop val_stack
    .return (return_val)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

