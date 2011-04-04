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
    .include "m0proto_names.pir"

    .local pmc ctx
    ctx = m0_new_ctx
    m0_cstr_var ctx, i0, "hello, word"
    m0_cstr_var ctx, i1, "\n"

    m0_print_s ctx, i0, x, x
    m0_print_s ctx, i1, x, x
    ok(1, "hello world doesn't crash")
.end

.sub m0_maths
    .include "m0proto_names.pir"
    .local pmc ctx
    ctx = m0_new_ctx
    m0_cstr_var ctx, s0, "\n"
    m0_int_var  ctx, i0, 1234567
    m0_int_var  ctx, i1, 1

    m0_num_var  ctx, n0, 1.01
    m0_num_var  ctx, n1, 2.002

    m0_add_i    ctx, i0, i0, i1
    m0_print_i  ctx, i1, x,  x
    m0_print_s  ctx, s0, x,  x

    ok(1, "int addition doesn't crash")

    m0_add_n    ctx, n0, n0, n1
    m0_print_n  ctx, n0, x,  x
    m0_print_s  ctx, s0, x,  x

    ok(1, "num addition doesn't crash")
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
