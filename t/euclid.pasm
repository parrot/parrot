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
# I4: r
#
# E1: Find remainder.
# E2: Is it zero?
# E3: Reduce.
#
main:   set    I1, 96
        set    I2, 64
        set    S1, "Algorithm E (Euclid's algorithm)"
        print  S1
e1:     mod    I4, I1, I2
e2:     eq     I4, 0, done
e3:     set    I1, I2
        set    I2, I4
        branch e1
done:   print  I2
        end
