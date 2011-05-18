/* exceptions.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
 *  Overview:
 *     define the internal interpreter exceptions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_EXCEPTIONS_H_GUARD
#define PARROT_EXCEPTIONS_H_GUARD

#include "parrot/compiler.h"

/* Prototypes */

/* Exception Types
 * the first types are real exceptions and have Python exception
 * names.
 */

/* &gen_from_enum(except_types.pasm) */
typedef enum {
    EXCEPTION_BAD_BUFFER_SIZE,
    EXCEPTION_MISSING_ENCODING_NAME,
    EXCEPTION_INVALID_STRING_REPRESENTATION,
    EXCEPTION_ICU_ERROR,
    EXCEPTION_UNIMPLEMENTED,

    EXCEPTION_NULL_REG_ACCESS,
    EXCEPTION_NO_REG_FRAMES,
    EXCEPTION_SUBSTR_OUT_OF_STRING,
    EXCEPTION_ORD_OUT_OF_STRING,
    EXCEPTION_MALFORMED_UTF8,
    EXCEPTION_MALFORMED_UTF16,
    EXCEPTION_MALFORMED_UTF32,
    EXCEPTION_INVALID_CHARACTER,
    EXCEPTION_INVALID_CHARTYPE,
    EXCEPTION_INVALID_ENCODING,
    EXCEPTION_INVALID_CHARCLASS,
    EXCEPTION_NEG_REPEAT,
    EXCEPTION_NEG_SUBSTR,
    EXCEPTION_NEG_SLEEP,
    EXCEPTION_NEG_CHOP,
    EXCEPTION_INVALID_OPERATION,
    EXCEPTION_ARG_OP_NOT_HANDLED,
    EXCEPTION_KEY_NOT_FOUND,
    EXCEPTION_JIT_UNAVAILABLE,
    EXCEPTION_EXEC_UNAVAILABLE,
    EXCEPTION_INTERP_ERROR,
    EXCEPTION_PARROT_USAGE_ERROR,
    EXCEPTION_PIO_ERROR,
    EXCEPTION_PARROT_POINTER_ERROR,
    EXCEPTION_DIV_BY_ZERO,
    EXCEPTION_PIO_NOT_IMPLEMENTED,
    EXCEPTION_ALLOCATION_ERROR,
    EXCEPTION_INTERNAL_PANIC,
    EXCEPTION_OUT_OF_BOUNDS,
    EXCEPTION_JIT_ERROR,
    EXCEPTION_EXEC_ERROR,
    EXCEPTION_ILL_INHERIT,
    EXCEPTION_NO_PREV_CS,
    EXCEPTION_NO_CLASS,
    EXCEPTION_LEX_NOT_FOUND,
    EXCEPTION_PAD_NOT_FOUND,
    EXCEPTION_ATTRIB_NOT_FOUND,
    EXCEPTION_GLOBAL_NOT_FOUND,
    EXCEPTION_EXTERNAL_ERROR,
    EXCEPTION_METHOD_NOT_FOUND,
    EXCEPTION_VTABLE_NOT_FOUND,
    EXCEPTION_WRITE_TO_CONSTCLASS,
    EXCEPTION_NOSPAWN,
    EXCEPTION_INTERNAL_NOT_IMPLEMENTED,
    EXCEPTION_ERR_OVERFLOW,
    EXCEPTION_LOSSY_CONVERSION,
    EXCEPTION_ROLE_COMPOSITION_METHOD_CONFLICT,
    EXCEPTION_UNEXPECTED_NULL,
    EXCEPTION_LIBRARY_ERROR,
    EXCEPTION_LIBRARY_NOT_LOADED,
    EXCEPTION_SYNTAX_ERROR,
    EXCEPTION_MALFORMED_PACKFILE,

    CONTROL_RETURN,
    CONTROL_OK,
    CONTROL_BREAK,
    CONTROL_CONTINUE,
    CONTROL_ERROR,
    CONTROL_TAKE,
    CONTROL_LEAVE,
    CONTROL_EXIT,

    CONTROL_LOOP_NEXT,
    CONTROL_LOOP_LAST,
    CONTROL_LOOP_REDO
} exception_type_enum;

/* &end_gen */

/* &gen_from_enum(except_severity.pasm) subst(s/(\w+)/uc($1)/e) */

typedef enum {
    EXCEPT_normal  = 0,
    EXCEPT_warning = 1,
    EXCEPT_error   = 2,
    EXCEPT_severe  = 3,
    EXCEPT_fatal   = 4,
    EXCEPT_doomed  = 5,
    EXCEPT_exit    = 6
} exception_severity;

/* &end_gen */

/* HEADERIZER BEGIN: src/exceptions.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void do_panic(
    NULLOK_INTERP,
    ARGIN_NULLOK(const char *message),
    ARGIN_NULLOK(const char *file),
    unsigned int line);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void exit_fatal(int exitcode, ARGIN(const char *format), ...)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN_WHEN_FALSE
void Parrot_assert(
    INTVAL condition,
    ARGIN(const char *condition_string),
    ARGIN(const char *file),
    unsigned int line)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void Parrot_confess(
    ARGIN(const char *cond),
    ARGIN(const char *file),
    unsigned int line)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_ex_add_c_handler(PARROT_INTERP, ARGIN(Parrot_runloop *jp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_ex_build_exception(PARROT_INTERP,
    INTVAL severity,
    long error,
    ARGIN_NULLOK(STRING *msg))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_ex_mark_unhandled(PARROT_INTERP, ARGIN(PMC *exception))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void Parrot_ex_rethrow_from_c(PARROT_INTERP, ARGIN(PMC *exception))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
opcode_t * Parrot_ex_rethrow_from_op(PARROT_INTERP, ARGIN(PMC *exception))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void Parrot_ex_throw_from_c(PARROT_INTERP, ARGIN(PMC *exception))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void Parrot_ex_throw_from_c_args(PARROT_INTERP,
    ARGIN_NULLOK(void *ret_addr),
    int exitcode,
    ARGIN(const char *format),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t * Parrot_ex_throw_from_op(PARROT_INTERP,
    ARGIN(PMC *exception),
    ARGIN_NULLOK(void *dest))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
opcode_t * Parrot_ex_throw_from_op_args(PARROT_INTERP,
    ARGIN_NULLOK(void *dest),
    int ex_type,
    ARGIN(const char *format),
    ...)
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

PARROT_DOES_NOT_RETURN
PARROT_COLD
void die_from_exception(PARROT_INTERP, ARGIN(PMC *exception))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
STRING * Parrot_ex_build_complete_backtrace_string(PARROT_INTERP,
    ARGIN(PMC * ex))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_print_backtrace(void);
#define ASSERT_ARGS_do_panic __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_exit_fatal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(format))
#define ASSERT_ARGS_Parrot_assert __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(condition_string) \
    , PARROT_ASSERT_ARG(file))
#define ASSERT_ARGS_Parrot_confess __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(cond) \
    , PARROT_ASSERT_ARG(file))
#define ASSERT_ARGS_Parrot_ex_add_c_handler __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(jp))
#define ASSERT_ARGS_Parrot_ex_build_exception __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_ex_mark_unhandled __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(exception))
#define ASSERT_ARGS_Parrot_ex_rethrow_from_c __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(exception))
#define ASSERT_ARGS_Parrot_ex_rethrow_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(exception))
#define ASSERT_ARGS_Parrot_ex_throw_from_c __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(exception))
#define ASSERT_ARGS_Parrot_ex_throw_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(format))
#define ASSERT_ARGS_Parrot_ex_throw_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(exception))
#define ASSERT_ARGS_Parrot_ex_throw_from_op_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(format))
#define ASSERT_ARGS_die_from_exception __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(exception))
#define ASSERT_ARGS_Parrot_ex_build_complete_backtrace_string \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ex))
#define ASSERT_ARGS_Parrot_print_backtrace __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/exceptions.c */

#define PANIC(interp, message) do_panic((interp), (message), __FILE__, __LINE__)

/* having a modified version of PARROT_ASSERT which resolves as an integer
 * rvalue lets us put ASSERT_ARGS() at the top of the list of local variables.
 * Thus, we can catch bad pointers before any of the local initialization
 * logic is run.  And it always returns 0, so headerizer can chain them in
 * ASSERT_ARGS_* macros like:
 * int _ASSERT_ARGS = PARROT_ASSERT_ARG(a) || PARROT_ASSERT_ARG(b) || ...
 */
#ifdef NDEBUG
#  define PARROT_ASSERT(x) /*@-noeffect@*/((void)0)/*@=noeffect@*/
#  define PARROT_ASSERT_ARG(x) (0)
#  define PARROT_FAILURE(x) /*@-noeffect@*/((void)0)/*@=noeffect@*/
#  define PARROT_ASSERT_MSG(x, s) /*@-noeffect@*/((void)0)/*@=noeffect@*/
#  define ASSERT_ARGS(a)
#else
#  define PARROT_ASSERT(x) (x) ? ((void)0) : Parrot_confess(#x, __FILE__, __LINE__)
#  define PARROT_ASSERT_ARG(x) ((x) ? (0) : (Parrot_confess(#x, __FILE__, __LINE__), 0))
#  define PARROT_FAILURE(x) Parrot_confess((x), __FILE__, __LINE__)
#  define PARROT_ASSERT_MSG(x, s) ((x) ? (0) : (Parrot_confess(s, __FILE__, __LINE__), 0))

#  ifdef __GNUC__
#    define ASSERT_ARGS(a) ASSERT_ARGS_ ## a ;
#  else
#    define ASSERT_ARGS(a)
#  endif /* __GNUC__ */

#endif /* NDEBUG */

#endif /* PARROT_EXCEPTIONS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
