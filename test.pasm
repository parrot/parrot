        time_i I1
        set_i_ic I2, 0
        set_n_nc N1, 50
        print_n N1
        set_n_nc N2, 5
        print_n N2
        add_n N1, N1, N2
        print_n N1
        set_i_ic I3, 1
        set_i_ic I4, 10000000
REDO:   eq_i_ic I2, I4, DONE, NEXT
NEXT:   add_i I2, I2, I3
        branch_ic REDO
DONE:   time_i I5
        print_i I1
        print_i I5
        print_i I2
        sub_i I2, I5, I1
        print_i I2
        set_i_ic I1, 3
        mul_i I4, I4, I1
        iton_n_i N1, I4
        iton_n_i N2, I2
        print_i I4
        print_n N1
        print_i I2
        print_n N2
        div_n N1, N1, N2
        print_n N1
        end
