# 2 timer subs are alternately spitting out the JaPH
.include "timer.pasm"
    new P7, .PerlString
    set P7, "Just another Parrot Hacker\n"
    store_global "t", P7
    new P1, .PerlArray
    push P1, .PARROT_TIMER_NSEC
    push P1, 0.001
    push P1, .PARROT_TIMER_HANDLER
    find_global P2, "_t1"
    push P1, P2
    push P1, .PARROT_TIMER_REPEAT
    push P1, -1
    push P1, .PARROT_TIMER_RUNNING
    push P1, 1
    new P0, .Timer, P1
    find_global P2, "_t2"
    set P1[3], P2
    new P0, .Timer, P1
w:
    sleep 0.0001
    find_global P0, "t"
    set S0, P0
    if S0, w
    end
.pcc_sub _t1:
    find_global P0, "t"
    set S0, P0
    length I0, S0
    unless I0, e1
    band I0, 2
    unless I0, e1
    substr S1, S0, 0, 1, ""
    print S1
e1:
    invoke P1

.pcc_sub _t2:
    find_global P0, "t"
    set S0, P0
    length I0, S0
    unless I0, e2
    band I0, 2
    if I0, e2
    substr S1, S0, 0, 1, ""
    print S1
e2:
    invoke P1

