# Sample co-routines in Parrot
#
# Create 2 coroutines
#
set_addr I0, MYCOROUTINE 
new P0, .ParrotCoroutine, I0 
save P0
new P0, .ParrotCoroutine, I0 
# Calling convention says P0 will contain the sub so..
print "Calling 1st co-routine\n"
callco
callco
callco
restore P0
print "Calling 2nd co-routine\n"
callco
callco
callco
end

# A coroutine
MYCOROUTINE:
print "Entry\n"
yield
print "Resumed\n"
yield
print "Done\n"
ret

