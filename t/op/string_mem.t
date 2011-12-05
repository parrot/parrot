#!./parrot
# Copyright (C) 2008-2010, Parrot Foundation.

=head1 NAME

t/op/string-mem.t - test memory representation related string operations


=head1 SYNOPSIS

    % prove t/op/string_mem.t

=head1 DESCRIPTION

Tests string ops related to low-level representation of strings, such as:

=over

=item *

stringinfo

=item *

pin/unpin

=back

=cut

.include 'stringinfo.pasm'
.include 'interpinfo.pasm'

.const int TESTS = 7

.sub _main :main
    .include 'test_more.pir'

    plan(TESTS)

    test_stringinfo()
    $S0 = interpinfo .INTERPINFO_GC_SYS_NAME
    if $S0 != "ms" goto dont_run_hanging_tests
    test_pin_unpin()
    goto test_end
  dont_run_hanging_tests:
    skip(2, "Test disabled on not GC MS")
  test_end:
.end

.sub test_stringinfo

    $S1 = "Hello, world"
    $S0 = $S1
    $I0 = stringinfo $S0, .STRINGINFO_STRSTART
    $I1 = stringinfo $S1, .STRINGINFO_STRSTART
    is($I0, $I1, "stringinfo - test STRSTART can see COW in action")

    $I0 = stringinfo $S0, .STRINGINFO_HEADER
    $I1 = stringinfo $S1, .STRINGINFO_HEADER
    is($I0, $I1, "stringinfo - STRHEADER on full COW strings keeps same value")

    $S2 = substr $S0, 7
    is($S2, "world", "sanity check")
    $I4 = stringinfo $S0, .STRINGINFO_STRSTART
    $I2 = stringinfo $S2, .STRINGINFO_STRSTART
    $I3 = $I2 - $I4
    is($I3, 7, "stringinfo - STRSTART can see COW in action")

    $I2 = stringinfo $S2, .STRINGINFO_HEADER
    isnt($I0, $I2, "stringinfo - STRHEADER on different COW strings same value")
.end

.sub test_pin_unpin

    .local int init, before, after

    $S0 = 'life'
    $S1 = 'life'
    $S2 = 'life'
    $S3 = 'life'
    $S4 = 'life'
    $S5 = 'life'
    $S6 = 'love'
    $S7 = 'life'
    $S8 = 'life'
    $S9 = 'life'

    pin $S6
    null $S0
    null $S1
    null $S2
    null $S3
    null $S4
    null $S5
    null $S7
    null $S8
    null $S9

    init = stringinfo $S6, .STRINGINFO_STRSTART

    $I0 = interpinfo .INTERPINFO_GC_COLLECT_RUNS
  loop1:
    collect
    $I1 = interpinfo .INTERPINFO_GC_COLLECT_RUNS
    eq $I0, $I1, loop1

    before = stringinfo $S6, .STRINGINFO_STRSTART
    unpin $S6

    $I0 = interpinfo .INTERPINFO_GC_COLLECT_RUNS
  loop2:
    collect
    $I1 = interpinfo .INTERPINFO_GC_COLLECT_RUNS
    eq $I0, $I1, loop1

    after = stringinfo $S6, .STRINGINFO_STRSTART

    is( init, before, "pin/collect didn't change memory address" )
    $I0 = cmp after, before
    print "# init: "
    $S0 = init
    print init
    print ", before: "
    $S0 = before
    print before
    print ", after: "
    $S0 = after
    print after
    print ", cmp: "
    $S0 = $I0
    say $S0
    ok( $I0, "location of string changed by unpin/collect" )
.end

#.constant STRINGINFO_STRSTART	2
#.constant STRINGINFO_BUFLEN	3
#.constant STRINGINFO_FLAGS	4
#.constant STRINGINFO_BUFUSED	5
#.constant STRINGINFO_STRLEN	6

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
