# Sample sub-routines in Parrot
#
# Create 2 subroutines
#
set_addr I0, SUB
new P0, .Sub
set P0, I0
save P0
new P0, .Sub
set P0, I0
invokecc # Call the sub in P0, store the current continuation in P1
restore P0
# Call second one
invokecc
end

# A subroutine
SUB:
print "Hello subroutine\n"
invoke P1

