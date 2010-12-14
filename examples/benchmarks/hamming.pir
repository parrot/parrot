# Copyright (C) 2009, Parrot Foundation.

=head1 NAME

examples/benchmarks/hamming.pir - calculate hamming distance between two strings

=head1 SYNOPSIS

    ./parrot examples/benchmarks/hamming.pir foobar foozibar

=head1 DESCRIPTION

Calculate the number of characters that are different between two strings.
Strings need not be the same length. This benchmark should be useful for
looking into the performance of String PMC -> string conversion and function calls.

=cut

.sub main
    .param pmc argv
    .local pmc s1, s2
    .local int argc
    $S0  = shift argv  # get rid of filename
    argc = argv

    s1 = new 'String'
    s2 = new 'String'

    if argc == 2 goto get_args

    s1 = "bbbcdebbbcdebbcdebcdbcdebbcdebebbcdebcdebbcdebbbcdebbcdebbcdebbcdebcdef"
    s2 = "acdbcdeabcdeaeaabcdeabbcdeadeaeabcdebcdeabcdeaabcdeabcdeabcdeabcdebcdef"
    goto get_distance
  get_args:
    s1 = argv[0]
    s2 = argv[1]
  get_distance:
    $I0 = distance(s1,s2)
    print $I0
    print "\n"
.end

.sub distance
    .param string s1
    .param string s2
    .local int dist
    .local int min, max
    dist = 0

    $I0  = length s1
    $I1  = length s2
    min  = $I0
    max  = $I1
    if $I0 < $I1 goto calc_dist
    min = $I1
    max = $I0

  calc_dist:
    dist = max - min

    .local int k
    k = 0
  loop:
    $S1 = get_char(s1,k)
    $S2 = get_char(s2,k)


    $I4 = $S1 != $S2

    dist += $I4
    inc k
    if  k >= min goto done
    goto loop
  done:
    .return (dist)
.end

.sub get_char
    .param string s
    .param int k
    $S0 = substr s, k, 1
    .return ($S0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

