=head1 Simple Variables

PIR has two kinds of variables. The simplest kind are the temporary variables
(also called "symbolic registers").  The names of these variables have a
dollar sign, a single letter, and a number. The letter in the name corresponds
to the type of the variable, I for integer, N for number (float), S for string,
and P for PMC (any kind of object).

=cut

.sub main :main

    $I0 = 42         # set temp integer var to the integer value 42

    $N3 = 3.14159    # set temp float var to an approximation of pi

    $S5 = "Hello"    # set temp string var to "Hello"

    $P0 = new String
    $P0 = "Ford"     # set temp PMC var to "Ford"

    print $I0
    print "\n"

    print $N3
    print "\n"

    print $S5
    print "\n"

    print $P0
    print "\n"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

