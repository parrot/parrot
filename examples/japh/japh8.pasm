# Little Endian only using struct
    new P1, .PerlArray
    push P1, -100
    push P1, 28
    push P1, I0
    new P0, .ManagedStruct, P1
    set P0[0], 1953723722
    set P0[0;1], 1869504800
    set P0[0;2], 1919248500
    set P0[0;3], 1918980128
    set P0[0;4], 544501618
    set P0[0;5], 1801675080
    set P0[0;6], 1879732837
    set P1[0], -93
    assign P0, P1
l:  set I0, P0[0;I1]
    chr S0, I0
    print S0
    inc I1
    lt I1, 27, l
    end

