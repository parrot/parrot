        time_i I1
        set_i_ic I2, 0
        set_i_ic I3, 1
        set_i_ic I4, 100000000
	set_s_sc S0, "\nIterations: "
	print_s S0
	print_i I4
REDO:   eq_i_ic I2, I4, DONE
        add_i I2, I2, I3
        branch_ic REDO
DONE:   time_i I5
	set_s_sc S0, "\nStart time: "
	print_s S0
        print_i I1
	set_s_sc S0, "\nEnd time: "
	print_s S0
        print_i I5

	set_s_sc S0, "\nCount: "
	print_s S0
        print_i I2

	set_s_sc S0, "\nElapsed time:"
	print_s S0
        sub_i I2, I5, I1
        print_i I2

        set_i_ic I1, 3
        mul_i I4, I4, I1
        iton_n_i N1, I4
        iton_n_i N2, I2
	set_s_sc S0, "\nEstimated ops:"
	print_s S0
        print_i I4

	set_s_sc S0, "\nEstimated ops (numerically):"
	print_s S0
        print_n N1

	set_s_sc S0, "\nElapsed time:"
	print_s S0
        print_i I2

	set_s_sc S0, "\nElapsed time:"
	print_s S0
        print_n N2

        div_n N1, N1, N2
	set_s_sc S0, "\nOps/sec:"
	print_s S0
        print_n N1

	set_s_sc S0, "\n"
	print_s S0
        end
