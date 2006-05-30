# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

examples/benchmarks/arriter.pir - Iterator Benchmark

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/arriter.pir

=head1 DESCRIPTION

Hand crafted PIR code version of F<examples/benchmarks/arriter.pl> as
it might come out of a compiler.

=head1 SEE ALSO

F<examples/benchmarks/arriter.pl>,
F<examples/benchmarks/arriter_o1.pir>.

=cut

.sub arriter :main
.include "iterator.pasm"

# declaration of lexicals
    $P20 = new .Hash
    .lex "%ha", $P20
    $P21 = new .Undef
    .lex "$i", $P21
    $P22 = new .ResizablePMCArray
    .lex "@k", $P22
    $P23 = new .ResizablePMCArray
    .lex "@nk", $P23
    $P24 = new .Undef
    .lex "$s", $P24

# same as @k = qw( A B C D E F G H I J ); 
    find_lex $P29 , "$i"
    $P29 = 0
for_1_start:
    unless $P29 < 10 goto for_1_end
        $P26 = new .Undef
        $P26 = 65
        $P27 = new .Undef
        $P27 = add $P26, $P29
        $I0 = $P27
        $S0 = chr $I0
        find_lex $P28 , "$s"
        $P28 = new .Undef
        $P28 = $S0
        push $P22, $P28
        inc $P29
        branch for_1_start
for_1_end:

# set up all 5 element permutations of qw( A B C D E F G H I J )
    $P29 = new .Undef
    .lex "e", P29
    $P29 = 0
for_2_start:
    unless $P29 <= 3 goto for_2_end
        find_lex $P30 , "$i"
        $P30 = 0
for_3_start:
        unless $P30 < 10 goto for_3_end
            find_lex $P31 , "@k"
            $P32 = new Iterator, $P31
            $P32 = .ITERATE_FROM_START
iter_1_start:
            unless $P32 goto iter_1_end
                $P33 = new .Undef
                $P33 = 65
                $P34 = new .Undef
                add $P34, $P33, $P30        # 65 + $i
                $I0 = $P34
                $S0 = chr $I0
                $P35 = new .Undef
                $P35 = $S0
                shift $P36, $P32                # $s
                # $P37 goes into the aggregate and can not be
                # pulled out of loop
                $P37 = new .Undef
                concat $P37, $P36, $P35
                $P38 = find_lex "@nk"
                push $P38, $P37
                branch iter_1_start
iter_1_end:
        inc $P30
        branch for_3_start
for_3_end:
        $P39 = find_lex "@nk"
        # XXX why does this not work ?
        # $P40 = find_lex "@k"
        # clone $P40, $P39
        clone $P22, $P39
        $P39 = 0
        inc $P29
        branch for_2_start
for_2_end:

    # XXX why does this not work ?
    # $P41 = find_lex "@k"
    # $I0 = $P22
    $I0 = $P22
    print $I0
    print "\n"

    # XXX why does this not work ?
    #$P42 = new Iterator, $P41
    $P42 = new Iterator, $P22
    $P42 = .ITERATE_FROM_START
    $P43 = find_lex "%ha"
    $I1 = 0
iter_2_start:
    unless $P42 goto iter_2_end
        inc $I1
        shift $P44, $P42
        $S0 = $P44
        $P43[$S0] = 1
        branch iter_2_start
iter_2_end:

    print $I1
    print "\n"
    $I0 = $P43
    print $I0
    print "\n"
    $I0 = defined $P43["AAAAA"]
    print $I0
    $I0 = defined $P43["ABCDE"]
    print $I0
    $I0 = defined $P43["BBBBB"]
    print $I0
    $I0 = defined $P43["CCCCC"]
    print $I0
    $I0 = defined $P43["HHHHH"]
    print $I0
    $I0 = defined $P43["IIIII"]
    print $I0
    print "\n"
.end
