# $Id$

# Go north.
# Befunge stack unchanged.
# delta <- (0,-1)
FLOW_GO_NORTH:
        set I2, 0
        branch MOVE_PC

# Go east.
# Befunge stack unchanged.
# delta <- (1,0)
FLOW_GO_EAST:
        set I2, 1
        branch MOVE_PC

# Go south.
# Befunge stack unchanged.
# delta <- (0,1)
FLOW_GO_SOUTH:
        set I2, 2
        branch MOVE_PC
        
# Go west.
# Befunge stack unchanged.
# delta <- (-1,0)
FLOW_GO_WEST:
        set I2, 3
        branch MOVE_PC

FLOW_GO_AWAY:
        save 4
        bsr MATHS_RAND
        pushi
        restore I10
        set I2, I10
        save I2
        popi
        restore I2
        branch MOVE_PC
        
# East/West if.
# Befunge stack:
#   before:     ... b
#   after:      ...
# delta <- if (b) (-1,0) else (1,0)
FLOW_EW_IF:
        set I10, P2
        unless I10, FLOW_EW_IF_POP_1
        pop I10, P2
FLOW_EW_IF_POP_1:       
        eq I10, 0, FLOW_GO_EAST
        branch FLOW_GO_WEST

# North/South if.
# Befunge stack:
#   before:     ... b
#   after:      ...
# delta <- if (b) (0,-1) else (0,1)
FLOW_NS_IF:
        set I10, P2
        unless I10, FLOW_NS_IF_POP_1
        pop I10, P2
FLOW_NS_IF_POP_1:       
        eq I10, 0, FLOW_GO_SOUTH
        branch FLOW_GO_NORTH


# Greater than. 
# Befunge stack:        
#   before:     ... a b
#   after:      ... a>b
# Result is either 1 or 0.
FLOW_COMPARE:
        pushi
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
        popi
        branch MOVE_PC
        
# Toggle string mode.
# Befunge stack unchanged.
FLOW_TOGGLE_STRING_MODE:
        eq I4, 1, FLOW_TOGGLE_STRING_MODE_OFF
        set I4, 1
        branch MOVE_PC
FLOW_TOGGLE_STRING_MODE_OFF:      
        set I4, 0
        branch MOVE_PC
        
# Trampoline.
# Befunge stack unchanged.
# Skip next instruction (pos < pos + delta)
FLOW_BRIDGE:
        set I4, 2
        branch MOVE_PC

# Stop.
# Befunge stack unchanged.
# End program.
FLOW_END:
        set I4, 3
        branch MOVE_PC
