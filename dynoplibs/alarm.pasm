# test program vor event handling
# -b, -g, -S run cores only by now

    loadlib P1, "myops_ops"
    find_global P0, "_alarm"
    alarm 2.5, P0
    null I0
loop:
    sleep 1
    print I0
    print "\n"
    inc I0
    # check_events
    branch loop
    end
.pcc_sub _alarm:
    print "alarm\n"
    exit 0
