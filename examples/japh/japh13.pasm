# 2 threads, synced by sleeping time only
    find_global P6, "_th"
    new P5, .ParrotThread
    find_method P0, P5, "thread3"
    new P7, .PerlString
    set P7, "Js nte artHce\n"
    set I3, 3
    invoke
    new P5, .ParrotThread
    set P7, "utaohrPro akr"
    invoke
    end
.pcc_sub _th:
    set S5, P7
l:
    substr S0, S5, I0, 1
    print S0
    inc I0
    sleep 0.1
    if S0, l
    invoke P1
