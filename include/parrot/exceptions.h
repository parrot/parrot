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
void internal_exception(int exitcode, const char *format, ...);
void real_exception(struct Parrot_Interp *interpreter,
        void *ret_addr, int exitcode,  const char *format, ...);
void do_panic(struct Parrot_Interp *interpreter, const char *message,
              const char *file, int line);

#define PANIC(message)\
        do_panic(interpreter, message, __FILE__, __LINE__)

/* Exception Types */
/* &gen_from_def(except_types.pasm) prefix(EXCEPTION_) */

#define BAD_BUFFER_SIZE 1
#define MISSING_ENCODING_NAME 1
#define INVALID_STRING_REPRESENTATION 1
#define ICU_ERROR 1
#define UNIMPLEMENTED 1

#define NULL_REG_ACCESS 1
#define NO_REG_FRAMES 1
#define SUBSTR_OUT_OF_STRING 1
#define ORD_OUT_OF_STRING 1
#define MALFORMED_UTF8 1
#define MALFORMED_UTF16 1
#define MALFORMED_UTF32 1
#define INVALID_CHARACTER 1
#define INVALID_CHARTYPE 1
#define INVALID_ENCODING 1
#define INVALID_CHARCLASS 1
#define NEG_REPEAT 1
#define NEG_SUBSTR 1
#define NEG_SLEEP 1
#define NEG_CHOP 1
#define INVALID_OPERATION 1
#define ARG_OP_NOT_HANDLED 1
#define KEY_NOT_FOUND 1
#define JIT_UNAVAILABLE 1
#define EXEC_UNAVAILABLE 1
#define INTERP_ERROR 1
#define PREDEREF_LOAD_ERROR 1
#define PARROT_USAGE_ERROR 1
#define PIO_ERROR 1
#define PARROT_POINTER_ERROR 1
#define DIV_BY_ZERO 1
#define PIO_NOT_IMPLEMENTED 1
#define ALLOCATION_ERROR 1
#define INTERNAL_PANIC 1
#define OUT_OF_BOUNDS 1
#define JIT_ERROR 1
#define EXEC_ERROR 1
#define ILL_INHERIT 2
#define NO_PREV_CS 3
#define NO_CLASS 2
#define LEX_NOT_FOUND 4
#define GLOBAL_NOT_FOUND 5
#define METH_NOT_FOUND 6
#define WRITE_TO_CONSTCLASS 7
#define NOSPAWN 8
#define INTERNAL_NOT_IMPLEMENTED 9
#define ERR_OVERFLOW 10

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
    long error;                         /* s. above */
    STRING *msg;                        /* may be NULL */
    void *resume;                       /* opcode_t* for resume or NULL */
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
