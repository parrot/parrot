# 2 threads are alternately printing the JaPH
# synchronization is done via a TQueue
    find_global P5, "_th1"              # locate thread function
    new P2, .ParrotThread               # create a new thread
    find_method P0, P2, "thread3"       # a shared thread's entry
    new P7, .TQueue                     # create a Queue object
    new P8, .PerlInt                    # and a PerlInt
    push P7, P8                         # push the PerlInt onto queue
    new P6, .PerlString                 # create new string
    set P6, "Js nte artHce\n"
    set I3, 3                           # thread function gets 3 args
    invoke                              # _th1.run(P5,P6,P7)
    new P2, .ParrotThread               # same for a second thread
    find_global P5, "_th2"
    set P6, "utaohrPro akr"             # set string to 2nd thread's
    invoke                              # ... data, run 2nd thread too
    end                                 # Parrot joins both

  .pcc_sub _th1:                        # 1st thread function
  w1: sleep 0.001                       # wait a bit and schedule
    defined I1, P7                      # check if queue entry is ...
    unless I1, w1                       # ... defined, yes: it's ours
    set S5, P6                          # get string param
    substr S0, S5, I0, 1                # extract next char
    print S0                            # and print it
    inc I0                              # increment char pointer
    shift P8, P7                        # pull item off from queue
    if S0, w1                           # then wait again, if todo
    invoke P1                           # done with string

  .pcc_sub _th2:                        # 2nd thread function
  w2: sleep 0.001
    defined I1, P7                      # if queue entry is defined
    if I1, w2                           # then wait
    set S5, P6
    substr S0, S5, I0, 1                # if not print next char
    print S0
    inc I0
    new P8, .PerlInt                    # and put a defined entry
    push P7, P8                         # onto the queue so that
    if S0, w2                           # the other thread will run
    invoke P1                           # done with string

