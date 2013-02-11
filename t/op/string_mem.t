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
