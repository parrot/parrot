# JaPH utilizing exceptions, a bit obfuscated too
    bounds 1
    trace 0
    newsub P0, .Exception_Handler, _x
    set_eh P0
    newclass P1, "YaPH"
    find_method P0, P1, "Just another Parrot Hacker\n"
    invoke
_x: set S0, P5["_message"]
    set I0, 8
    substr S0, S0, I0, 27
    shr I0, 1
    bsr I0
    substr S0, 0x17c, I0, S0
    ret
