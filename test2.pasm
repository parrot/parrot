        set_i_ic I2, 1
        set_i_ic I1, 0
        set_s_sc S1, "Hello World"
REDO:   eq_i_ic I1, I2, DONE, NEXT
NEXT:   length_s_i I1, S1
        print_s S1
        chopn_s_ic S1, 1
        branch_ic REDO
DONE:   end
