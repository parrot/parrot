#
# euclid.pasm
#
# Knuth, Donald E.
# The Art of Computer Programming
# Volume 1: Fundamental Algorithms
# Third Edition
#
# Section 1.1
# Algorithm E (Euclid's algorithm)
# Page 2
#
# I1: m
# I2: n
# I3: zero
# I4: r
#
# E1: Find remainder.
# E2: Is it zero?
# E3: Reduce.
#
MAIN:   set_i_ic I1, 96
        set_i_ic I2, 64
        set_i_ic I3, 0
        set_s_sc S1, "Algorithm E (Euclid's algorithm)"
        print_s S1
E1:     mod_i I4, I1, I2
E2:     eq_i_ic I4, I3, DONE, E3
E3:     set_i I1, I2
        set_i I2, I4
        branch_ic E1
DONE:   print_i I2
        end
