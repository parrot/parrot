# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

examples/pir/life.pir - Conway's Life

=head1 SYNOPSIS

    % ./parrot examples/pir/life.pir

=head1 DESCRIPTION

Runs Conway's Life cellular automata
(L<http://ddi.cs.uni-potsdam.de/HyFISCH/Produzieren/lis_projekt/proj_gamelife/ConwayScientificAmerican.htm>).

=head1 TODO

Convert this into proper PIR.

=head1 SEE ALSO

F<examples/library/ncurses_life.pir>.

=cut

.sub 'life' :main
        .param pmc argv
        .local int max_generations
        .local pmc jmpstack
                   jmpstack = new 'ResizableIntegerArray'

        # First the generation count
        $I15 = argv
        if $I15 < 2 goto USE_DEFAULT_MAX_GENERATIONS
        $S5 = argv[1]
        $I2 = $S5
        print "Running "
        print $I2
        print " generations.\n"
        goto MAX_GENERATIONS_IS_NOW_KNOWN
USE_DEFAULT_MAX_GENERATIONS:
        print "Running 5000 generations by default.\n"
        set $I2, 5000
MAX_GENERATIONS_IS_NOW_KNOWN:
        print "\n"

        # Note the time
        time $N5
        # If true, we don't print
        set $I12, 0
        set $S0,  "               "
        set $S1,  "               "
        set $S2,  "               "
        set $S3,  "               "
        set $S4,  "   **          "
        set $S5,  " *    *        "
        set $S6,  "       *       "
        set $S7,  " *     *       "
        set $S8,  "  ******       "
        set $S9,  "               "
        set $S10, "               "
        set $S11, "               "
        set $S12, "               "
        set $S13, "               "
        set $S14, "               "
        set $S15, ""
        $S15 = concat $S15, $S0
        $S15 = concat $S15, $S1
        $S15 = concat $S15, $S2
        $S15 = concat $S15, $S3
        $S15 = concat $S15, $S4
        $S15 = concat $S15, $S5
        $S15 = concat $S15, $S6
        $S15 = concat $S15, $S7
        $S15 = concat $S15, $S8
        $S15 = concat $S15, $S9
        $S15 = concat $S15, $S10
        $S15 = concat $S15, $S11
        $S15 = concat $S15, $S12
        $S15 = concat $S15, $S13
        $S15 = concat $S15, $S14
        local_branch jmpstack,  dump
        set $I0, 0
loop:	ge $I0, $I2, getout
        inc $I0
        mod $I31,$I0,100
        if $I31, skip
        $P0 = getinterp
        $P1 = $P0.'stderr_handle'()
        print $P1, "."
skip:

        local_branch jmpstack,  generate

        local_branch jmpstack,  dump
        branch loop
getout:	time $N6
        sub $N7, $N6, $N5
        print "\n"
        print $I2
        print " generations in "
        print $N7
 	print " seconds. "
        set $N8, $I2
        div $N1, $N8, $N7
        print $N1
        print " generations/sec\n"

        interpinfo $I1, 1
        print "A total of "
        print $I1
        print " bytes were allocated\n"

        interpinfo $I1, 2
        print "A total of "
        print $I1
        print " GC runs were made\n"

        interpinfo $I1, 3
        print "A total of "
        print $I1
        print " collection runs were made\n"

        interpinfo $I1, 10
        print "Copying a total of "
        print $I1
        print " bytes\n"

        interpinfo $I1, 5
        print "There are "
        print $I1
        print " active Buffer structs\n"

        interpinfo $I1, 7
        print "There are "
        print $I1
        print " total Buffer structs\n"


        end

# $S15 has the incoming string, $S0 is scratch, $S1 is scratch, $S2 is scratch
#
# $I0 is the length of the string
# $I1 is the current cell we're checking
# $I2 is the count for that cell
# $I3 is the offset to the neighbor
generate:
        .local int save_I0, save_I1, save_I2, save_I3
        save_I0 = $I0
        save_I1 = $I1
        save_I2 = $I2
        save_I3 = $I3
        length $I0, $S15
        set $S1, ""
        set $I1, 0
genloop:
        set $I2, 0
NW:
        set $I3, -16
        add $I3, $I3, $I0
        add $I3, $I3, $I1
        mod $I3, $I3, $I0
        # $S0 is always overwritten, so reuse it
        substr $S0, $S15, $I3, 1
        ne $S0, "*", North
        inc $I2
North:
        set $I3, -15
        add $I3, $I3, $I0
        add $I3, $I3, $I1
        mod $I3, $I3, $I0
        substr $S0, $S15, $I3, 1
        ne $S0, "*", NE
        inc $I2
NE:
        set $I3, -14
        add $I3, $I3, $I0
        add $I3, $I3, $I1
        mod $I3, $I3, $I0
        substr $S0, $S15, $I3, 1
        ne $S0, "*", West
        inc $I2
West:
        set $I3, -1
        add $I3, $I3, $I0
        add $I3, $I3, $I1
        mod $I3, $I3, $I0
        substr $S0, $S15, $I3, 1
        ne $S0, "*", East
        inc $I2
East:
        set $I3, 1
        add $I3, $I3, $I0
        add $I3, $I3, $I1
        mod $I3, $I3, $I0
        substr $S0, $S15, $I3, 1
        ne $S0, "*", SW
        inc $I2
SW:
        set $I3, 14
        add $I3, $I3, $I0
        add $I3, $I3, $I1
        mod $I3, $I3, $I0
        substr $S0, $S15, $I3, 1
        ne $S0, "*", South
        inc $I2
South:
        set $I3, 15
        add $I3, $I3, $I0
        add $I3, $I3, $I1
        mod $I3, $I3, $I0
        substr $S0, $S15, $I3, 1
        ne $S0, "*", SE
        inc $I2
SE:
        set $I3, 16
        add $I3, $I3, $I0
        add $I3, $I3, $I1
        mod $I3, $I3, $I0
        substr $S0, $S15, $I3, 1
        ne $S0, "*", check
        inc $I2
check:
        substr $S0, $S15, $I1, 1
        eq $S0, "*", check_alive

# If eq 3, put a star in else a space
check_dead:
        eq $I2, 3, star
        branch space

check_alive:
        lt $I2, 2, space
        gt $I2, 3, space
        branch star

space:
        $S1 = concat $S1, " "
        branch iter_done
star:
        $S1 = concat $S1, "*"
iter_done:
        inc $I1
        lt $I1, $I0, genloop
done:
        set $S15, $S1
        $I3 = save_I3
        $I2 = save_I2
        $I1 = save_I1
        $I0 = save_I0
        local_return jmpstack

# $S15 has the incoming string, $S0 is scratch
dump:
        if $I12, dumpend
        print "\f"
        print "\n\n\n\n\n\n\n\n\n\n\n"
        print "------------- generation "
        print $I0
        print " -------------\n"
        set $I10, 0
        set $I11, 14
printloop:
        substr $S0, $S15, $I10, 15
        print $S0
        print "\n"
        add $I10, $I10, 15
        dec $I11
        ge $I11, 0, printloop
        sleep 1
dumpend:
        local_return jmpstack

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
