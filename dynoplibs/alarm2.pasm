# test program vor event handling
# -b, -g, -S run cores only by now

    loadlib P1, "myops_ops"
    find_global P0, "_alarm3"
    alarm 3.3, 0.4, P0
    find_global P0, "_alarm2"
    alarm 2.2, P0
    find_global P0, "_alarm"
    alarm 1.5, 2.0, P0
    set I0, 1
loop:
    sleep 1
    print I0
    print "\n"
    inc I0
    le I0, 5, loop
    print "done.\n"
    end
.pcc_sub _alarm:
    print "alarm\n"
    invoke P1
.pcc_sub _alarm2:
    print "alarm2\n"
    invoke P1
.pcc_sub _alarm3:
    print "alarm3\n"
    invoke P1
