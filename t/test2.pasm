        set_i_ic I2, 1
        set_i_ic I1, 0
        set_s_sc S1, "Hello World"
        set_i_ic I3, 0
        set_i_ic I4, 0
        length_i_s I5, S1
WAX:    substr_s_s_i S2, S1, I3, I4
        print_s S2
        add_i I4, I4, I2
        eq_i_ic I4, I5, WANE, WAX
WANE:   length_i_s I1, S1
        print_s S1
        chopn_s_ic S1, 1
        eq_i_ic I1, I3, DONE, WANE
DONE:   end
