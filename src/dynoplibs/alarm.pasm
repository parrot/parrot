# test program vor event handling
# -b, -g, -S run cores only by now

    loadlib P1, "myops_ops"
    find_global P0, "_alarm"
    alarm 2.0, P0
    set I0, 1
loop:
    sleep 1
    print I0
    print "\n"
    inc I0
    # check_events
    le I0, 3, loop
    print "done.\n"
    end
.pcc_sub _alarm:
    print "alarm\n"
    invoke P1
