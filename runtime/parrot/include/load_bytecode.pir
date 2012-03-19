.sub '__load_bytecode' :anon
    .param string pbc_name
    .param string tag :optional
    .param int has_tag :opt_flag

    if has_tag goto have_tag
    tag = 'load'
  have_tag:

    $P0 = load_bytecode pbc_name
    $I0 = $P0.'is_initialized'(tag)
    if $I0 goto done_initialization

    $P1 = $P0.'subs_by_tag'(tag)
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:

    $P0.'mark_initialized'(tag)
  done_initialization:
    .return($P0)
.end
