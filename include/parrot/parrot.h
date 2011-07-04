/* parrot.h
 *  Copyright (C) 2001-2009, Parrot Foundation.
 *  Overview:
 *     General header file includes for the parrot interpreter
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

/*
    This file contains definitions for functions and data structures used by
    Parrot. This file is currently included in almost all Parrot source files
    and is typically required in add-in extensions. This file is *not* used
    when embedding Parrot. For embedding, use <parrot/api.h>. For extensions,
    you probably also need <parrot/extend.h> in addition to <parrot/parrot.h>.

    In the future, <parrot/parrot.h> might not be required for extensions. For
    now, it is required for most purposes because the extending API is not
    stable or mature enough to be used without parrot.h.
*/

#ifndef PARROT_PARROT_H_GUARD
#define PARROT_PARROT_H_GUARD

#include "parrot/core_types.h"

#if defined(INSIDE_GLOBAL_SETUP)
#  define VAR_SCOPE
#else
#  define VAR_SCOPE extern
#endif /* INSIDE_GLOBAL_SETUP */

#define PARROT_IN_CORE

#include "parrot/config.h"

/* ANSI C89 headers */
#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <errno.h>
#include <string.h>
#include <ctype.h>

/* Other headers, where available */

#ifdef PARROT_HAS_HEADER_SYSTYPES
#  include <sys/types.h>
#endif /* PARROT_HAS_HEADER_SYSTYPES */

#ifdef PARROT_HAS_HEADER_UNISTD
#  include <unistd.h>
#endif /* PARROT_HAS_HEADER_UNISTD */

#ifdef PARROT_HAS_HEADER_SYSMMAN
#  include <sys/mman.h>
#  ifndef MAP_FAILED
#    define MAP_FAILED -1
#  endif
#endif /* PARROT_HAS_HEADER_SYSMMAN */

#ifdef PARROT_HAS_HEADER_SYSTIME
#  include <sys/time.h>
#endif /* PARROT_HAS_HEADER_SYSTIME */

#ifdef PARROT_HAS_HEADER_TIME
#  include <time.h>
#endif /* PARROT_HAS_HEADER_TIME */

#ifdef PARROT_HAS_HEADER_FCNTL
#  include <fcntl.h>
#endif /* PARROT_HAS_HEADER_FCNTL */

#ifdef PARROT_HAS_HEADER_SYSSTAT
#  include <sys/stat.h>
#endif /* PARROT_HAS_HEADER_SYSSTAT */

#ifdef PARROT_HAS_HEADER_SETJMP
#  include <setjmp.h>
typedef jmp_buf Parrot_jump_buff;
#endif /* PARROT_HAS_HEADER_SETJMP */

#ifdef PARROT_HAS_HEADER_LIMITS
#  include <limits.h>
#endif /* PARROT_HAS_HEADER_LIMITS */

#ifdef PARROT_HAS_LIBFFI
#  include <ffi.h>
#endif

#define NUM_REGISTERS 32
#define PARROT_MAGIC 0x13155a1

typedef void STRING_FUNCS;
typedef struct parrot_interp_t Interp;

/* weird architectures might need this, s. C-FAQ 5.17
 *
 * the SET_NULL macros are only for system, where a NULL pointer
 * isn't represented by zeroes, so don't use these, for resetting
 * non-null pointers
 */

/*  Casting between pointers and integers:  If pointers and integers
    are the same size, then direct casting is fine.  If pointers and
    integers are not the same size, then the compiler might complain.
    Also, there's a possible loss of information in going from (for
    example) a 64-bit integer to a 32-bit pointer.

    These casts silence the warnings but do no limits checks.
    Perhaps a different set should be defined (and only compiled if
    explicitly Configured in) which do limits checks?
    A. D. Aug. 6, 2002.
*/
#if PTR_SIZE == INTVAL_SIZE
#  define INTVAL2PTR(any, d)    ((any)(d))
#  define UINTVAL2PTR(any, d)    ((any)(d))
#else
#  if PTR_SIZE == LONG_SIZE
#    define INTVAL2PTR(any, d)    ((any)(unsigned long)(d))
#    define UINTVAL2PTR(any, d)    ((any)(unsigned long)(d))
#  else
#    define INTVAL2PTR(any, d)    ((any)(unsigned int)(d))
#    define UINTVAL2PTR(any, d)    ((any)(unsigned int)(d))
#  endif /* PTR_SIZE == LONG_SIZE */
#endif /* PTR_SIZE == INTVAL_SIZE */
#define PTR2INTVAL(p)    INTVAL2PTR(INTVAL, (p))
#define PTR2UINTVAL(p)    UINTVAL2PTR(UINTVAL, (p))

/*
 * some compilers don't like lvalue casts, so macroize them
 *
 * NOTE: Under no circumstances is it permitted to use this macro on types
 *       that are not effectively guaranteed to be compatible.
 *       Good:  int->unsigned; long->unsigned long; struct*->struct*; char*->void*
 *       Bad:   integral->pointer;  struct*->char*
 */

#ifdef __GCC__
#  define LVALUE_CAST(type, val) ((type)(val))
#else
#  define LVALUE_CAST(type, val) (*((type *)&(val)))
#endif /* __GCC__ */

/* some SGI compilers have an offsetof()
 * definition that doesn't work for us. */
#if defined(__sgi) && defined(_COMPILER_VERSION) && (_COMPILER_VERSION >= 400)
#  undef offsetof
#  define offsetof(s, m) (size_t)(&((((s) *)0)->(m)))
#endif

/* work around warning:
 * cast discards qualifiers from pointer target type
 * for usage grep e.g. in string.c
 * The casted to type must differ only in constness,
 * to allow a stricter compiler check in C++ builds.
 */

#ifndef __cplusplus

#define DECL_CONST_CAST_OF(CCTYPE) \
    union { const CCTYPE *__c_ptr; CCTYPE *__ptr; } __ptr_u

#define DECL_CONST_CAST \
    DECL_CONST_CAST_OF(void)

#define PARROT_const_cast(t, b) ((t)(__ptr_u.__c_ptr = (b), __ptr_u.__ptr))

#else

#define DECL_CONST_CAST_OF(CCTYPE)
#define DECL_CONST_CAST
#define PARROT_const_cast(t, b) (const_cast<t>(b))

#endif

/* define some shortcuts for dealing with function pointers */
/* according to ANSI C, casting between function and non-function pointers is
 * no good.  So we should use "funcptr_t" in place of void* when dealing with
 * function pointers and NULLfunc in place of NULL */
typedef void (*funcptr_t)(void);
#define NULLfunc (funcptr_t)NULL

/* define macros for converting between data and function pointers.  As it
 * turns out, ANSI C does appear to permit you to do this conversion if you
 * convert the value to an integer (well, a value type large enough to hold
 * a pointer) in between.  Believe it or not, this even works on TenDRA (tcc).
 *
 * NOTE!  UINTVAL is incorrect below.  It should be UINTPTR or something like
 * that. The equivalent of C99's uintptr_t- a non-pointer data type that can
 * hold a pointer.
 */
#define D2FPTR(x) UINTVAL2PTR(funcptr_t, PTR2UINTVAL(x))
#define F2DPTR(x) UINTVAL2PTR(void *, PTR2UINTVAL((funcptr_t) (x)))

/* On Win32 we need the constant O_BINARY for open() (at least for Borland C),
   but on UNIX it doesn't exist, so set it to 0 if it's not defined
 */
#ifndef O_BINARY
#  define O_BINARY 0
#endif /* O_BINARY */

/* Hide our struct copying behind macros */
/* Copying to struct pointer from struct pointer */
#define STRUCT_COPY(d, s)    (PARROT_ASSERT(d), PARROT_ASSERT(s), *(d)=*(s))
#define STRUCT_COPY_N(d, s, n) (PARROT_ASSERT(d), PARROT_ASSERT(s), PARROT_ASSERT(sizeof (*(d))==sizeof (*(s))), memcpy((d), (s), sizeof (*(d))*(n)))
/* Copying to struct pointer from struct */
#define STRUCT_COPY_FROM_STRUCT(d, s)    (PARROT_ASSERT(d), *(d)=(s))

/* internationalization settings */
#ifdef    PARROT_HAS_GETTEXT
#  include <libintl.h>
#  define _(s)                 gettext(s)
#  define gettext_noop(s)      (s)
#  define N_(s)                gettext_noop(s)
#  define PARROT_TEXTDOMAIN(d) textdomain(d)
#  define PARROT_BINDTEXTDOMAIN(p, d) bindtextdomain((p), (d))
#else
#  define _(s)                 (s)
#  define N_(s)                (s)
#  define PARROT_TEXTDOMAIN(d)
#  define PARROT_BINDTEXTDOMAIN(p, d)
#endif /* PARROT_HAS_GETTEXT */

#define PACKAGE     "parrot"
#define LOCALEDIR  "."

typedef struct _hash Hash;
typedef struct PackFile_ByteCode PackFile_ByteCode;

#include "parrot/settings.h"
#include "parrot/enums.h"
#include "parrot/platform_interface.h"
#include "parrot/global_setup.h"
#include "parrot/caches.h"
#include "parrot/interpreter.h"
#include "parrot/datatypes.h"
#include "parrot/encoding.h"
#include "parrot/string.h"
#include "parrot/hash.h"
#include "parrot/pmc_freeze.h"
#include "parrot/vtable.h"
#include "parrot/context.h"
#include "parrot/exceptions.h"
#include "parrot/warnings.h"
#include "parrot/memory.h"
#include "parrot/packfile.h"
#include "parrot/io.h"
#include "parrot/op.h"
#include "parrot/pmc.h"
#include "parrot/gc_api.h"
#include "parrot/string_funcs.h"
#include "parrot/misc.h"
#include "parrot/sub.h"
#include "parrot/call.h"
#include "parrot/key.h"
#include "parrot/exit.h"
#include "parrot/nci.h"
#include "parrot/thread.h"
#include "parrot/scheduler.h"
#include "parrot/oo.h"
#include "parrot/vtables.h"
#include "parrot/multidispatch.h"
#include "parrot/library.h"
#include "parrot/namespace.h"
#include "parrot/hll.h"
#include "parrot/pbcversion.h"

#endif /* PARROT_PARROT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
