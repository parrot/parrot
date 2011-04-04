#!./parrot
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/dynoplibs/m0proto.t - prototype m0 dynops

=cut

.loadlib 'm0proto_ops'

.sub main :main
    .include 'test_more.pir'

    plan(3)
    'm0_hello_word'()
    'm0_maths'()

.end

.sub m0_hello_word
    .local pmc ctx
    ctx = m0_new_ctx
    m0_cstr_var ctx, 0, "hello, word"
    m0_cstr_var ctx, 1, "\n"

    m0_print_s ctx, 0, 0, 0
    m0_print_s ctx, 1, 0, 0
    ok(1, "hello world doesn't crash")
.end

.sub m0_maths
    .local pmc ctx
    ctx = m0_new_ctx
    m0_cstr_var ctx, 0, "\n"
    m0_int_var ctx, 1, 1234567
    m0_int_var ctx, 2, 1

    m0_num_var ctx, 3, 1.01
    m0_num_var ctx, 4, 2.002

    m0_add_i   ctx, 1, 1, 2
    m0_print_i ctx, 1, 0, 0
    m0_print_s ctx, 0, 0, 0

    ok(1, "int addition doesn't crash")

    m0_add_n   ctx, 3, 3, 4
    m0_print_n ctx, 3, 0, 0
    m0_print_s ctx, 0, 0, 0

    ok(1, "num addition doesn't crash")
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
