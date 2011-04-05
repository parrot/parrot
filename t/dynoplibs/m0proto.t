#!./parrot
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/dynoplibs/m0proto.t - prototype m0 dynops

=cut

.loadlib 'm0proto_ops'

.sub main :main
    .include 'test_more.pir'
    $P0 = loadlib 'm0ctx'

    plan(4)
    'm0_hello_word'()
    'm0_maths'()
    'm0_alloc_free'()

.end

.sub m0_hello_word
    .include "m0proto_names.pir"
    .local pmc ctx
    ctx = m0_new_ctx
    m0_cstr_var ctx, 0, "hello, word\n"
    m0_cstr_var ctx, 1, "\n"

    m0_load_var ctx, s0, 0, 0
    m0_load_var ctx, s1, 1, 0

    m0_print_s  ctx, s0, x, x
    m0_print_s  ctx, s1, x, x
    ok(1, "hello world doesn't crash")
.end

.sub m0_maths
    .include "m0proto_names.pir"
    .local pmc ctx
    ctx = m0_new_ctx
    m0_cstr_var ctx, 0, "\n"
    m0_int_var  ctx, 1, 1234567
    m0_int_var  ctx, 2, 1
    m0_num_var  ctx, 3, 1.01
    m0_num_var  ctx, 4, 2.002

    m0_load_var ctx, s0, 0, 0
    m0_load_var ctx, i0, 1, 0
    m0_load_var ctx, i1, 2, 0

    m0_add_i    ctx, i0, i0, i1
    m0_print_i  ctx, i1, x,  x
    m0_print_s  ctx, s0, x,  x

    ok(1, "int addition doesn't crash")

    m0_load_var ctx, n0, 3, 0
    m0_load_var ctx, n1, 4, 0
    m0_add_n    ctx, n0, n0, n1
    m0_print_n  ctx, n0, x,  x
    m0_print_s  ctx, s0, x,  x

    ok(1, "num addition doesn't crash")
.end

.sub m0_alloc_free
    .include "m0proto_names.pir"
    .local pmc ctx
    ctx = m0_new_ctx

    m0_int_var ctx, 0, 128

    m0_load_var ctx, i0, 0,  0
    m0_alloc    ctx, i1, i0, x
    m0_free     ctx, i1, x,  x
    ok(1, "alloc/free doesn't crash")
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
