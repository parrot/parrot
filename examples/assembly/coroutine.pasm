# Sample co-routines in Parrot
#
# Create 2 coroutines
#
set_addr I0, MYCOROUTINE
new P0, .Coroutine
set P0, I0
save P0
new P0, .Coroutine
set P0, I0
# Calling convention says P0 will contain the sub so..
print "Calling 1st co-routine\n"
invoke
invoke
invoke
restore P0
print "Calling 2nd co-routine\n"
invoke
invoke
invoke
end

# A coroutine
MYCOROUTINE:
print "Entry\n"
invoke
print "Resumed\n"
invoke
print "Done\n"
invoke

