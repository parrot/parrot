require 'test'
plan 4


todo 'rework this test after we can loop thru all the object in the system, then we can verify they were destroyed'
status = GC.disable
is status, 'false', '.disable on GC'

status = GC.enable
is status, 'true', '.enable on GC'

status = GC.disable
is status, 'false', '.disable on GC'

GC.start
pass '.start on GC'
