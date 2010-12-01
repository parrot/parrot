#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/op/64bit.t - Testing integer ops on 64-bit platforms

=head1 SYNOPSIS

        % prove t/op/64bit.t

=head1 DESCRIPTION

Test integer operations on platforms with 64-bit integers.
Tests are skipped on other platforms.

=cut

.sub main :main
    .include "iglobals.pasm"
    .include 'test_more.pir'

    # Check to see if this is 64 bit
    .local pmc interp     # a handle to our interpreter object.
    interp = getinterp
    .local pmc config
    config = interp[.IGLOBALS_CONFIG_HASH]
    .local int intvalsize
    intvalsize = config['intvalsize']

    plan(5)

    if intvalsize == 8 goto is_64_bit
       skip(5, "this is not a 64 bit platform")
    goto end

  is_64_bit:

    # setup TODO for platform 'MSWin32'
    .local string osname
    osname = config['osname']
    .local int todo_1
    todo_1 = 0
    unless  osname == "MSWin32" goto do_test
    todo_1 = 1

  do_test:

    bitops64(todo_1)

  end:
.end


.sub bitops64
        # check bitops for 8-byte ints
        .param int todo_1

        set $I0, 0xffffffffffffffff

        if todo_1 goto do_todo
        is( $I0, -1, 'bitops64' )
        goto test_2

      do_todo:
        if $I0 == -1 goto todo_pass
        todo ( 0, 'bitops64', 'not working on MSWin32, amd64' )
        goto test_2
      todo_pass:
        todo ( 1, 'bitops64', 'not working on MSWin32, amd64' )

      test_2:
        set $I1, 0x00000000ffffffff
        is( $I1, 4294967295, 'bitops64' )

        set $I0, $I1
        shl $I0, $I0, 32
        is( $I0, -4294967296, 'bitops64' )

        band $I2, $I0, $I1
        is( $I2, 0, 'bitops64' )

        bor $I2, $I0, $I1
        is( $I2, -1, 'bitops64' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
