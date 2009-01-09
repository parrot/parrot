# $Id$

# ** direction changing

#
# go east.
# befunge stack unchanged.
# delta <- (1,0)
.sub "flow__go_east"
    $P0 = get_global "status"
    $P0["dir"] = 1
    set_global "status", $P0
.end

#
# go north.
# befunge stack unchanged.
# delta <- (1,0)
.sub "flow__go_north"
    $P0 = get_global "status"
    $P0["dir"] = 0
    set_global "status", $P0
.end

#
# go south.
# befunge stack unchanged.
# delta <- (-1,0)
#
.sub "flow__go_south"
    $P0 = get_global "status"
    $P0["dir"] = 2
    set_global "status", $P0
.end

#
# go west.
# befunge stack unchanged.
# delta <- (-1,0)
#
.sub "flow__go_west"
    $P0 = get_global "status"
    $P0["dir"] = 3
    set_global "status", $P0
.end


# ** ifs & comparisons

#
# flow__if_horizontal()
#
# east/west if.
# befunge stack:
#   before:     ... b
#   after:      ...
# delta <- if (b) (-1,0) else (1,0)
.sub "flow__if_horizontal"
    $I0 = stack__pop()
    if $I0 == 0 goto FLOW__IF_HORIZONTAL__FALSE
    flow__go_west()
    .return()
  FLOW__IF_HORIZONTAL__FALSE:
    flow__go_east()
.end

#
# flow__if_vertical()
#
# north/south if.
# befunge stack:
#   before:     ... b
#   after:      ...
# delta <- if (b) (0,-1) else (0,1)
.sub "flow__if_vertical"
    $I0 = stack__pop()
    if $I0 == 0 goto FLOW__IF_HORIZONTAL__FALSE
    flow__go_south()
    .return()
  FLOW__IF_HORIZONTAL__FALSE:
    flow__go_north()
.end


# ** flag handling

#
# toggle string mode.
# befunge stack unchanged.
#
.sub "flow__toggle_string_mode"
    $P0 = get_global "status"
    $I0 = $P0["flag"]

    if $I0 == 1 goto FLOW__TOGGLE_STRING_MODE__OFF
    $P0["flag"] = 1
    goto FLOW__TOGGLE_STRING_MODE__DONE

  FLOW__TOGGLE_STRING_MODE__OFF:
    $P0["flag"] = 0

  FLOW__TOGGLE_STRING_MODE__DONE:
    set_global "status", $P0
.end


#
# flow__trampoline(bool)
#
# set/remove trampoline flag.
# befunge stack unchanged.
#
.sub "flow__trampoline"
    .param int val
    $P0 = get_global "status"
    $P0["flag"] = val
    set_global "status", $P0
.end

=pod

FLOW_GO_AWAY:
    save 4
    bsr MATHS_RAND
    restore I10
    set I2, I10
    save I2
    restore I2
    branch MOVE_PC



# Greater than.
# Befunge stack:
#   before:     ... a b
#   after:      ... a>b
# Result is either 1 or 0.
FLOW_COMPARE:
    set I10, P2
    unless I10, FLOW_COMPARE_POP_1
    pop I10, P2
FLOW_COMPARE_POP_1:
    set I11, P2
    unless I11, FLOW_COMPARE_POP_2
    pop I11, P2
FLOW_COMPARE_POP_2:
    set I12, 1
    gt I11, I10, FLOW_COMPARE_TRUE
    set I12, 0
FLOW_COMPARE_TRUE:
    push P2, I12
    branch MOVE_PC



# Stop.
# Befunge stack unchanged.
# End program.
FLOW_END:
    set I4, 3
    branch MOVE_PC

=cut

########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

