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
# Calling convention says P0 will contain the sub
invoke
restore P0
# Call second one
invoke
end

# A subroutine
SUB:
print "Hello subroutine\n"
ret

