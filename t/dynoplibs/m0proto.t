#!./parrot
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/dynoplibs/m0proto.t - prototype m0 dynops

=cut

.loadlib 'm0proto_ops'

.sub main :main
    .include 'test_more.pir'

    plan(1)
    'm0_hello_word'()

.end

.sub m0_hello_word
    .local pmc ctx
    ctx = m0_new_ctx
    m0_cstr_var ctx, 0, "hello, word"
    m0_cstr_var ctx, 1, "\n"
    m0_int_var ctx, 2, 1234567
    m0_int_var ctx, 3, 1

    m0_add_i ctx, 4, 3, 2
    m0_print_i ctx, 4, 0, 0
    m0_print_s ctx, 1, 0, 0
    m0_print_s ctx, 0, 0, 0
    m0_print_s ctx, 1, 0, 0
    ok(1, "hello world doesn't crash")
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
