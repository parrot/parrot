#! ./parrot
# Copyright (C) 2010, Parrot Foundation.

.include 't/compilers/opsc/common.pir'

.sub 'main' :main

    .include 'test_more.pir'
    load_bytecode 'opsc.pbc'

    plan(12)

    test_parse_basic_op()
    test_parse_many_ops()
    test_parse_header()
    test_parse_params()
    test_parse_flags()
.end

.sub "test_parse_basic_op"
    .local string buf
    .local pmc res

    buf = <<"END"
inline op noop() {
}
END

    "_parse_buffer"(buf)
    is(1, 1, "Simple noop parsed")

    buf = <<"END"
inline op noop() {
    foo
}
END

    "_parse_buffer"(buf)
    is(1, 1, "noop body parsed")

    buf = <<"END"
inline op noop() {
    foo {
        bar{};
    }
}
END

    "_parse_buffer"(buf)
    is(1, 1, "noop nested body parsed")


.end

.sub "test_parse_many_ops"
    .local string buf
    .local pmc res

    buf = <<"END"


=item noop

asdfs

=cut

inline op noop() {
}

=item halt

asdsad

=cut

inline op halt() {
}

=head2

ads

=cut

inline op rule_the_world() {
}


END

    res = "_parse_buffer"(buf)
    is(1, 1, "Multiple ops parsed")

    $I0 = res['body';'op']
    is($I0, 3, "...and we have 3 ops")

.end

# test parsing ops file header.
.sub "test_parse_header"
    .local string buf
    .local pmc res

    buf = <<"END"
/*
** core.ops
*/

BEGIN_OPS_PREAMBLE

#include "parrot/dynext.h"
#include "parrot/embed.h"
#include "parrot/runcore_api.h"
#include "../pmc/pmc_continuation.h"
#include "../pmc/pmc_parrotlibrary.h"

END_OPS_PREAMBLE

=head1 NAME

core.ops - Core Opcodes

=cut

=head1 DESCRIPTION

Parrot's core library of ops.

Core operations are primarily flow control and interpreter
introspection.

=cut

inline op noop() {
}

END

    res = "_parse_buffer"(buf)
    is(1, 1, "Header parsed")

    $I0 = res['body';'op']
    is($I0, 1, "...and we have our op")

.end

.sub "test_parse_params"
    .local string buf
    .local pmc res

    buf = <<"END"

inline op reserved(inconst INT) {
    /* reserve 1 entries */
}

END

    "_parse_buffer"(buf)
    is(1, 1, "Op with single param parsed")

    buf = <<"END"

inline op add(out INT, inconst INT, inconst INT) {
}

END

    "_parse_buffer"(buf)
    is(1, 1, "Op with multiple param parsed")

.end

.sub "test_parse_flags"
    .local string buf
    .local pmc res

    buf = <<"END"

inline op hcf() :flow :deprecated {
}

END

    res = "_parse_buffer"(buf)
    is(1, 1, "Op with flags parsed")

    .local pmc op
    op = res['body';'op';0;'op_flag']
    $S0 = op[0]
    is($S0, ":flow ", "First flag parsed")
    $S0 = op[1]
    is($S0, ":deprecated ", "Second flag parsed")
.end

# Don't forget to update plan!

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
