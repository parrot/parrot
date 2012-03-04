#! ./parrot-nqp

Q:PIR {
    # We want Test::More features for testing. Not NQP's builtin.
    .include "test_more.pir"
    load_bytecode "opsc.pbc"
};

my $c := pir::compreg__ps('Ops');

parse_ok($c, q|
inline op noop() {
}
| , "Empty op parsed");

parse_ok($c, q|
inline op noop() {
    foo();
}
|, "Simple call op parsed");

parse_ok($c, q|
inline op noop() {
    foo(42);
}
|, "Complex call op parsed");

parse_ok($c, q|
inline op noop() {
    foo("Answer", 42);
}
|, "More complex call op parsed");

# Declarations

parse_ok($c, q|
inline op noop() {
    char bar;
}
|, "Simple declaration parsed");

parse_ok($c, q|
inline op noop() {
    Interp * const new_interp;
}
|, "Complex declaration parsed");

parse_ok($c, q|
inline op noop() {
    Interp * const new_interp = foo();
}
|, "More complex declaration parsed");

parse_ok($c, q|
inline op noop() {
    Interp * const new_interp = foo("Answer", 42);
}
|, "Really complex declaration parsed");

parse_ok($c, q|
inline op noop(in PMC) {
    foo = bar;
}|, "Simple assignment");

# "Macro"

parse_ok($c, q|
inline op noop(in PMC) {
    foo($1);
}|, "Simple register");

parse_ok($c, q|
inline op noop(out PMC, in INT) {
    $1 = foo($2);
}|, "Simple register assignment");

parse_ok($c, q|
inline op noop(out PMC, in INT) {
    opcode_t * next = expr NEXT();
}|, "expr NEXT");

parse_ok($c, q|
inline op noop(out PMC, in INT) {
    opcode_t * const next = expr NEXT();
}|, "const expr NEXT");


parse_ok($c, q|
inline op noop(out PMC, in INT) {
        opcode_t *dest = Parrot_ex_throw_from_op_args(
            interp, expr NEXT(), EXCEPTION_NO_CLASS,
            "Class '%Ss' not found", VTABLE_get_repr(interp, $4));
}|, "expr NEXT 2");

parse_ok($c, q|
inline op noop(out PMC, in INT) {
    opcode_t * dest;
    goto ADDRESS(dest);
}|, "goto ADDRESS");



# Casting

parse_ok($c, q|
inline op noop(out PMC, in INT) {
    $1 = (PMC*)foo($2);
}|, "Casting works");

parse_ok($c, q|
inline op set(out INT, in NUM) :base_core {
    $1 = (INTVAL)($2);
}|, "Casting works 2");

parse_ok($c, q|
inline op set(out INT, in NUM) :base_core {
    $1 = PTR2INTVAL(optcode_t *, dest);
}|, "Casting works 3");

parse_ok($c, q|
inline op set(out INT, in NUM) :base_core {
    $1 = (INTVAL)dest;
}|, "Casting works 4");

# Control statements

parse_ok($c, q|
inline op noop(out PMC, in INT) {
    if (foo())
        $1 = bar();
}|, "Simple 'if'");

parse_ok($c, q|
inline op noop(out PMC, in INT) {
    if (foo()) {
        baz($2);
        $1 = bar();
    }
}|, "Complex 'if'");

parse_ok($c, q|
inline op noop(out PMC, in INT) {
    if (foo()) {
        $1 = bar();
    }
    else {
        $1 = baz();
    }
}|, "Simple 'if-else'");

parse_ok($c, q|
inline op noop(out PMC, in INT) {
    if (foo())
        $1 = bar();
    else
        $1 = baz();
}|, "Parenthises less 'if-else'");


parse_ok($c, q«
inline op noop(out PMC, in INT) {
    switch ($2) {
    }
}
», "Simple switch");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    switch ($2) {
        case 42:
            break;
    }
}
», "Simple switch 2");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    switch ($2) {
        case 42:
            goto NEXT();
            break;
    }
}
», "Simple switch 3");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    switch ($2) {
        case 24:
            goto NEXT();
            break;
        case 42:
            goto NEXT();
            break;
    }
}
», "Comples switch with two cases");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    switch ($2) {
        default:
            goto NEXT();
            break;
    }
}
», "Simple switch with default");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    switch ($2) {
        case 42:
            break;
        default:
            goto NEXT();
            break;
    }
}
», "Complex switch with case and default");

parse_ok($c, q«
inline op if (invar INT, inconst LABEL) {
    if ($1 != 0)
        goto OFFSET($2);
}
», "core.ops 'if'");


parse_ok($c, q«
inline op noop(out PMC, in INT) {
    $1 = $2 & 1 | 2 ^ 3;
}», "Binary ops");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    gc_flags = $1->flags;
}», "Pointer access");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    gc_flags = foo->flags;
}», "Pointer access 2");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    gc_flags = foo(foo->flags);
}», "Pointer access 3");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    gc_flags = $1->foo->bar->baz;
}», "Nested pointer access");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    Parrot_Int gc_flags = $1->flags & PObj_GC_all_FLAGS;
}», "Pointer access in declarator");


parse_ok($c, q«
inline op noop(out PMC, in INT) {
    $1 |= $2;
    $1 &= $2;
    $1 ^= $2;
}», "Binary assignment");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    PMC_data(clone)        = NULL;
}», "LHS expr assignment");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    $1 = sizeof (PMC);
}», "Space between function call");


parse_ok($c, q«
inline op noop(out PMC, in INT) {
    $1 = foo() ? bar() : baz ();
}», "Ternary op");


# Check blockoid
parse_ok($c, q«
inline op noop(out PMC, in INT) {
    if (foo()) {
    }
    bar();
}», "Blockoid finish statement");

# Statement controls

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    for (;;) {
        foo()
    }
}», "Empty 'for' parsed");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    do {
        foo()
    } while(1);
}», "Simple 'do-while' parsed");



# Final big test?
parse_ok($c, q«
inline op copy(inout PMC, invar PMC) :base_mem {
    if (PMC_IS_NULL($1)) {
        opcode_t * const dest = expr NEXT();
        opcode_t * const handler = Parrot_ex_throw_from_op_args(interp, dest,
                EXCEPTION_NULL_REG_ACCESS, "Null PMC in copy");
        goto ADDRESS(handler);
    }
    else {
        PMC   * const clone = VTABLE_clone(interp, $2);
        /* Preserve the metadata on the destination. */
        PMC   * const meta  = VTABLE_getprops(interp, $1);
        /* We have to preserve GC flags of original PMC */
        Parrot_UInt   gc_flags = $1->flags & PObj_GC_all_FLAGS;

        /* avoid leaks and unreachable memory by destroying the destination PMC */
        Parrot_pmc_destroy(interp, $1);

        /* the source PMC knows how to clone itself, but we must reuse the
         * destination header */
        memmove($1, clone, sizeof (PMC));

        /* Restore old flags and soil destination. We've changed it */
        $1->flags |= gc_flags;
        PARROT_GC_WRITE_BARRIER(interp, $1);

        /* don't let the clone's destruction destroy the destination's data */
        PObj_custom_destroy_CLEAR(clone);
        PMC_data(clone)        = NULL;
        PMC_metadata(clone)    = NULL;

        /* Restore metadata. */
        if (!PMC_IS_NULL(meta)) {
            PMC * const iter = VTABLE_get_iter(interp, meta);
            while (VTABLE_get_bool(interp, iter)) {
                STRING * const key = VTABLE_shift_string(interp, iter);
                PMC * const value  = VTABLE_get_pmc_keyed_str(interp, meta, key);
                VTABLE_setprop(interp, $1, key, value);
            }
        }
    }
}
», "Big test passed");



parse_ok($c, q«
inline op noop(out PMC, in INT) {
    if (PMC_IS_NULL($1) || $1->vtable->base_type != enum_class_ResizableIntegerArray) {
        opcode_t * const handler = Parrot_ex_throw_from_op_args(interp, dest,
            EXCEPTION_INVALID_OPERATION,
            "Must pass a valid integer array to 'local_return'");
        goto ADDRESS(handler);
    }
}», "Complex if");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    /* The return address must be within the current code segment. */
    if (! (next >= interp->code->base.data
           && next < (interp->code->base.data + interp->code->base.size))) {
        opcode_t * const handler = Parrot_ex_throw_from_op_args(interp, dest,
            EXCEPTION_INVALID_OPERATION,
            "Address for 'local_return' must be within the current code segment");
        goto ADDRESS(handler);
    }
}», "Complex if 2");

parse_ok($c, q«
inline op local_return(invar PMC) :flow {
    INTVAL return_addr;
    opcode_t *next;
    opcode_t * const dest = expr NEXT();

    if (PMC_IS_NULL($1) || $1->vtable->base_type != enum_class_ResizableIntegerArray) {
        opcode_t * const handler = Parrot_ex_throw_from_op_args(interp, dest,
            EXCEPTION_INVALID_OPERATION,
            "Must pass a valid integer array to 'local_return'");
        goto ADDRESS(handler);
    }

    return_addr = VTABLE_pop_integer(interp, $1);
    next = INTVAL2PTR(opcode_t *, return_addr);

    /* The return address must be within the current code segment. */
    if (! (next >= interp->code->base.data
           && next < (interp->code->base.data + interp->code->base.size))) {
        opcode_t * const handler = Parrot_ex_throw_from_op_args(interp, dest,
            EXCEPTION_INVALID_OPERATION,
            "Address for 'local_return' must be within the current code segment");
        goto ADDRESS(handler);
    }

    goto ADDRESS(next);
}», "core.ops local_return");

parse_ok($c, q«
inline op noop(out PMC, in INT) {
    foo = bar[42];
}», "Array access");

done_testing();


sub parse_ok($c, $buf, $descriptor) {
    try {
        _parse($c, $buf);
        ok(1, $descriptor);
        CATCH {
            ok(0, $descriptor);
            diag($!);
        }
    }
}

sub _parse($c, $buf) {
    my $res := $c.parse($buf, :target<parse>);
#    _dumper($res);
    $res;
}

INIT {
    pir::load_bytecode("dumper.pbc");
}

# vim: ft=perl6
