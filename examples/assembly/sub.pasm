# Sample co-routines in Parrot
#
# Create 2 coroutines
#
set_addr I0, SUB 
new P0, .ParrotSub, I0 
save P0
new P0, .ParrotSub, I0 
# Calling convention says P0 will contain the sub
call
restore P0
# Call second one
call
end

# A coroutine
SUB:
print "Hello subroutine\n"
ret

