# 2 threads are alternately printing the JaPH
# synchronization is done via a TQueue
    find_global P6, "_th1"
    new P5, .ParrotThread
    find_method P0, P5, "thread3"
    new P8, .TQueue
    new P9, .PerlInt
    push P8, P9
    new P7, .PerlString
    set P7, "Js nte artHce\n"
    set I3, 4
    invoke
    new P5, .ParrotThread
    find_global P6, "_th2"
    set P7, "utaohrPro akr"
    invoke
    end
.pcc_sub _th1:
w1: sleep 0.001
    defined I1, P8
    unless I1, w1
    shift P9, P8
    set S5, P7
    substr S0, S5, I0, 1
    print S0
    inc I0
    if S0, w1
    invoke P1
.pcc_sub _th2:
w2: sleep 0.001
    defined I1, P8
    if I1, w2
    set S5, P7
    substr S0, S5, I0, 1
    print S0
    inc I0
    new P9, .PerlInt
    push P8, P9
    if S0, w2
    invoke P1
