/* exceptions.h
 *  Copyright (C) 2001-2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
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
    E_Exception,
      E_SystemExit,
      E_StopIteration,
      E_StandardError,
        E_KeyboardInterrupt,
        E_ImportError,
        E_EnvironmentError,
          E_IOError,
          E_OSError,
            E_WindowsError,
            E_VMSError,
        E_EOFError,
        E_RuntimeError,
          E_NotImplementedError,
          E_LibraryNotLoadedError,
        E_NameError,
          E_UnboundLocalError,
        E_AttributeError,
        E_SyntaxError,
          E_IndentationError,
            E_TabError,
        E_TypeError,
        E_AssertionError,
        E_LookupError,
          E_IndexError,
          E_KeyError,
        E_ArithmeticError,
          E_OverflowError,
          E_ZeroDivisionError,
          E_FloatingPointError,
        E_ValueError,
          E_UnicodeError,
            E_UnicodeEncodeError,
            E_UnicodeDecodeError,
            E_UnicodeTranslateError,
        E_ReferenceError,
        E_SystemError,
        E_MemoryError,
        E_LAST_PYTHON_E = E_MemoryError,

        BAD_BUFFER_SIZE,
        MISSING_ENCODING_NAME,
        INVALID_STRING_REPRESENTATION,
        ICU_ERROR,
        UNIMPLEMENTED,

        NULL_REG_ACCESS,
        NO_REG_FRAMES,
        SUBSTR_OUT_OF_STRING,
        ORD_OUT_OF_STRING,
        MALFORMED_UTF8,
        MALFORMED_UTF16,
        MALFORMED_UTF32,
        INVALID_CHARACTER,
        INVALID_CHARTYPE,
        INVALID_ENCODING,
        INVALID_CHARCLASS,
        NEG_REPEAT,
        NEG_SUBSTR,
        NEG_SLEEP,
        NEG_CHOP,
        INVALID_OPERATION,
        ARG_OP_NOT_HANDLED,
        KEY_NOT_FOUND,
        JIT_UNAVAILABLE,
        EXEC_UNAVAILABLE,
        INTERP_ERROR,
        PREDEREF_LOAD_ERROR,
        PARROT_USAGE_ERROR,
        PIO_ERROR,
        PARROT_POINTER_ERROR,
        DIV_BY_ZERO,
        PIO_NOT_IMPLEMENTED,
        ALLOCATION_ERROR,
        INTERNAL_PANIC,
        OUT_OF_BOUNDS,
        JIT_ERROR,
        EXEC_ERROR,
        ILL_INHERIT,
        NO_PREV_CS,
        NO_CLASS,
        LEX_NOT_FOUND,
        PAD_NOT_FOUND,
        ATTRIB_NOT_FOUND,
        GLOBAL_NOT_FOUND,
        METH_NOT_FOUND,
        WRITE_TO_CONSTCLASS,
        NOSPAWN,
        INTERNAL_NOT_IMPLEMENTED,
        ERR_OVERFLOW,
        LOSSY_CONVERSION,
        ROLE_COMPOSITION_METH_CONFLICT
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

/* Right now there's nothing special for the jump buffer, but there might be
 * one later, so we wrap it in a struct so that we can expand it later */
typedef struct parrot_exception_t {
    Parrot_jump_buff destination;       /* jmp_buf */
    INTVAL severity;                    /* s. above */
    long error;                         /* exception_type_enum */
    STRING *msg;                        /* may be NULL */
    void *resume;                       /* opcode_t* for resume or NULL */
    struct parrot_exception_t *prev;    /* interpreters handler stack */
    long language;                      /* what is this? */
    long system;                        /* what is this? */
} Parrot_exception;

/* HEADERIZER BEGIN: src/exceptions.c */

PARROT_API
PARROT_DOES_NOT_RETURN
void do_exception( PARROT_INTERP, INTVAL severity, long error )
        __attribute__nonnull__(1);

PARROT_API
void free_internal_exception( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
size_t handle_exception( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
PARROT_DOES_NOT_RETURN
void internal_exception( int exitcode, NOTNULL(const char *format), ... )
        __attribute__nonnull__(2);

PARROT_API
PARROT_WARN_UNUSED_RESULT
PMC* new_c_exception_handler( PARROT_INTERP, Parrot_exception *jb )
        __attribute__nonnull__(1);

PARROT_API
void new_internal_exception( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
PARROT_DOES_NOT_RETURN
void Parrot_confess(
    NOTNULL(const char *cond),
    NOTNULL(const char *file),
    unsigned int line )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void Parrot_pop_mark( PARROT_INTERP, INTVAL mark )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_push_action( PARROT_INTERP, PMC *sub )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_push_mark( PARROT_INTERP, INTVAL mark )
        __attribute__nonnull__(1);

PARROT_API
void pop_exception( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
void push_exception( PARROT_INTERP, NOTNULL(PMC *handler) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void push_new_c_exception_handler( PARROT_INTERP, Parrot_exception *jb )
        __attribute__nonnull__(1);

PARROT_API
PARROT_DOES_NOT_RETURN
void real_exception( PARROT_INTERP,
    NULLOK(void *ret_addr),
    int exitcode,
    NOTNULL(const char *format),
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

PARROT_API
PARROT_WARN_UNUSED_RESULT
opcode_t * rethrow_exception( PARROT_INTERP, NOTNULL(PMC *exception) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_CAN_RETURN_NULL
opcode_t * throw_exception( PARROT_INTERP, PMC *exception, void *dest )
        __attribute__nonnull__(1);

void destroy_exception_list( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_DOES_NOT_RETURN
void do_panic(
    NULLOK_INTERP,
    NULLOK(const char *message),
    NULLOK(const char *file),
    unsigned int line );

void Parrot_init_exceptions( PARROT_INTERP )
        __attribute__nonnull__(1);

void really_destroy_exception_list( NULLOK(Parrot_exception *e) );
PARROT_DOES_NOT_RETURN
void rethrow_c_exception( PARROT_INTERP )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/exceptions.c */

#define PANIC(interp, message) do_panic(interp, message, __FILE__, __LINE__)

#define PARROT_ASSERT(x) ((void) ((x) ? 0 : Parrot_confess(#x, __FILE__, __LINE__)))


#endif /* PARROT_EXCEPTIONS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
