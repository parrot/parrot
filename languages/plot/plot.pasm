# Plot
# Copyright (C) 2001-2003 The Perl Foundation.  All Rights Reserved.
.macro cs_case(S, L)
    newsub P16, .Sub, .L
    store_lex -1, .S, P16
.endm

.macro cs_falsecase(S)
    newsub P16, .Sub, _ret_scheme_f
    store_lex -1, .S, P16
.endm

.macro cs_truecase(S)
    newsub P16, .Sub, _ret_scheme_t
    store_lex -1, .S, P16
.endm

.macro def_self_eval (P,N,L)
    new_pad 1
    newsub .P, .Closure, _self_eval
    store_lex -1, "eval", .P
    newsub .P, .Closure, .$DISPATCH
    store_lex 0, .N, .P
    branch .$END
.local $DISPATCH:
    save P0
    find_lex P0, S5
    invoke
.local $ERR:
    throw P0
.local $END:
.endm

    new_pad 0

# Making (p)/nil
    .def_self_eval(P16, "()", nil)
    .cs_case("print", _nil_print)
    .cs_case("car", _self_eval)
    .cs_case("cdr", _self_eval)
    .cs_truecase("nil?")
    pop_pad
    branch NIL_END

_nil_print:
    print "'()"
    find_lex P5, "#t"
    invoke P1

_self_eval:
    restore P5
    invoke P1

NIL_END:

SCHEME_T:
    .def_self_eval(P16, "#t", nil)
    .cs_case("print", _scheme_t_print)
    .cs_case("car", _scheme_error)
    .cs_case("cdr", _scheme_error)
    .cs_falsecase("nil?")
    pop_pad
    branch SCHEME_T_END

_scheme_t_print:
    print "#t"
    restore P5
    invoke P1 

_ret_scheme_t:
    find_lex P5, "#t"
    invoke P1

SCHEME_T_END:

SCHEME_F:
    .def_self_eval(P16, "#f", nil)
    .cs_case("print", _scheme_f_print)
    .cs_case("car", _scheme_error)
    .cs_case("cdr", _scheme_error)
    .cs_falsecase("nil?")
    pop_pad
    branch SCHEME_F_END

_scheme_f_print:
    print "#f"
    find_lex P5, "#t"
    invoke P1

_ret_scheme_f:
    find_lex P5, "#f"
    invoke P1 

SCHEME_F_END:

.macro make_dispatcher( S )
    newsub P16, .Closure, .$DISPATCH
    store_lex 0, .S, P16
    branch .$END
.local $DISPATCH:
    set P0, P5
    set P2, P5
    set S5, .S
    invoke
.local $END:
.endm

    .make_dispatcher("nil?")
    .make_dispatcher("print")
    .make_dispatcher("println")
    .make_dispatcher("car")
    .make_dispatcher("cdr")

branch END

_scheme_error:
    find_lex P5, "#f"
    print "Oopsie!"

END:
