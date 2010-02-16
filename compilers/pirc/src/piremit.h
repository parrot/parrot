/*
 * $Id$
 * Copyright (C) 2008, Parrot Foundation.
 */

#ifndef PARROT_PIR_PIREMIT_H_GUARD
#define PARROT_PIR_PIREMIT_H_GUARD

/* forward declaration */
struct lexer_state;
struct constant;

/* HEADERIZER BEGIN: compilers/pirc/src/piremit.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void emit_pbc(ARGIN(lexer_state * const lexer), ARGIN(const char *outfile))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void emit_pir_subs(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const outfile))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void print_constant(
    ARGIN(lexer_state * const lexer),
    ARGIN(constant * const c))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void print_expr(
    ARGIN(lexer_state * const lexer),
    ARGIN(expression * const expr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void print_expressions(
    ARGIN(lexer_state * const lexer),
    ARGIN(expression * const expr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void print_instruction(
    ARGIN(lexer_state * const lexer),
    ARGIN(instruction * const ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void print_key(ARGIN(lexer_state * const lexer), ARGIN(key * const k))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void print_statement(
    ARGIN(lexer_state * const lexer),
    ARGIN(subroutine * const sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void print_subs(struct ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

void print_target(ARGIN(lexer_state * const lexer), ARGIN(target * const t))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_emit_pbc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(outfile))
#define ASSERT_ARGS_emit_pir_subs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(outfile))
#define ASSERT_ARGS_print_constant __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(c))
#define ASSERT_ARGS_print_expr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(expr))
#define ASSERT_ARGS_print_expressions __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(expr))
#define ASSERT_ARGS_print_instruction __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_print_key __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(k))
#define ASSERT_ARGS_print_statement __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(sub))
#define ASSERT_ARGS_print_subs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_print_target __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(t))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/pirc/src/piremit.c */

#endif /* PARROT_PIR_PIREMIT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
