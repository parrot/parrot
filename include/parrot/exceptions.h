/* exceptions.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     define the internal interpreter exceptions
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_EXCEPTIONS_H_GUARD)
#define PARROT_EXCEPTIONS_H_GUARD


/* Prototypes */
void Parrot_init_exceptions(Interp *interpreter);

void internal_exception(int exitcode, const char *format, ...);
void real_exception(Interp *interpreter,
        void *ret_addr, int exitcode,  const char *format, ...);
void do_panic(Interp *interpreter, const char *message,
              const char *file, int line);

#define PANIC(message)\
        do_panic(interpreter, message, __FILE__, __LINE__)

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
        GLOBAL_NOT_FOUND,
        METH_NOT_FOUND,
        WRITE_TO_CONSTCLASS,
        NOSPAWN,
        INTERNAL_NOT_IMPLEMENTED,
        ERR_OVERFLOW
} exception_type_enum;

/* &end_gen */

/* &gen_from_enum(except_severity.pasm) subst(s/(\w+)/uc($1)/e) */

typedef enum {
    EXCEPT_normal = 0,
    EXCEPT_warning = 1,
    EXCEPT_error = 2,
    EXCEPT_severe = 3,
    EXCEPT_fatal = 4,
    EXCEPT_doomed = 5,
    EXCEPT_exit = 6
} exception_severity;

/* &end_gen */

/* Right now there's nothing special for the jump buffer, but there might be one later, so we wrap it in a struct so that we can expand it later */
struct parrot_exception_t {
    Parrot_jump_buff destination;       /* jmp_buf */
    exception_severity severity;        /* s. above */
    long error;                         /* exception_type_enum */
    STRING *msg;                        /* may be NULL */
    void *resume;                       /* opcode_t* for resume or NULL */
    int runloop_level;                  /* for reentering run loop */
    struct parrot_exception_t *prev;    /* interpreters handler stack */
    long language;                      /* what is this? */
    long system;                        /* what is this? */
};

typedef struct parrot_exception_t Parrot_exception;
/*
 * user level exception handling
 */
void push_exception(Parrot_Interp, PMC *);
void pop_exception(Parrot_Interp);
void * throw_exception(Parrot_Interp, PMC *, void *);
void * rethrow_exception(Parrot_Interp, PMC *);

size_t handle_exception(Parrot_Interp);

PMC* new_c_exception_handler(Parrot_Interp, Parrot_exception *jb);
void push_new_c_exception_handler(Parrot_Interp, Parrot_exception *jb);
void rethrow_c_exception(Parrot_Interp interpreter);

/*
 * internal exception handling
 */
void do_exception(Parrot_Interp, exception_severity severity, long error);
void new_internal_exception(Parrot_Interp);

/*
 * control stack marks and action
 */

void Parrot_push_mark(Interp *, INTVAL mark);
void Parrot_pop_mark(Interp *, INTVAL mark);
void Parrot_push_action(Interp *, PMC *sub);

#endif /* PARROT_EXCEPTIONS_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
