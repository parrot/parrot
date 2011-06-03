/* compiler.h
 *  Copyright (C) 2007-2011, Parrot Foundation.
 *  Overview:
 *     defines compiler capabilities
 */

#ifndef PARROT_COMPILER_H_GUARD
#define PARROT_COMPILER_H_GUARD

/*
 * This set of macros define capabilities that may or may not be available
 * for a given compiler.  They are based on GCC's __attribute__ functionality.
 */

#ifdef HASATTRIBUTE_NEVER_WORKS
 #  error This attribute can never succeed.  Something has mis-sniffed your configuration.
#endif
#ifdef HASATTRIBUTE_DEPRECATED
#  ifdef _MSC_VER
#    define __attribute__deprecated__       __declspec(deprecated)
#  else
#    define __attribute__deprecated__       __attribute__((__deprecated__))
#  endif
#endif
#ifdef HASATTRIBUTE_FORMAT
#  define __attribute__format__(x, y, z)    __attribute__((format((x), (y), (z))))
#endif
#ifdef HASATTRIBUTE_MALLOC
#  define __attribute__malloc__             __attribute__((__malloc__))
#endif
#ifdef HASATTRIBUTE_NONNULL
#ifndef __cplusplus
/* g++ has some problem with this attribute */
#  define __attribute__nonnull__(a)         __attribute__((__nonnull__(a)))
#endif
#endif
#ifdef HASATTRIBUTE_NORETURN
#  ifdef _MSC_VER
#    define __attribute__noreturn__         __declspec(noreturn)
#  else
#    ifdef __clang__
#      define __attribute__noreturn__         __attribute__((analyzer_noreturn))
#    else
#      define __attribute__noreturn__         __attribute__((__noreturn__))
#    endif
#  endif
#endif
#ifdef HASATTRIBUTE_PURE
#  define __attribute__pure__               __attribute__((__pure__))
#endif
#ifdef HASATTRIBUTE_CONST
#  define __attribute__const__              __attribute__((__const__))
#endif
#ifdef HASATTRIBUTE_UNUSED
#  define __attribute__unused__             __attribute__((__unused__))
#endif
#ifdef HASATTRIBUTE_WARN_UNUSED_RESULT
#  define __attribute__warn_unused_result__ __attribute__((__warn_unused_result__))
#endif
#ifdef HASATTRIBUTE_HOT
#  define __attribute__hot__                __attribute__((__hot__))
#endif
#ifdef HASATTRIBUTE_COLD
#  define __attribute__cold__               __attribute__((__cold__))
#endif

/* If we haven't defined the attributes yet, define them to blank. */
#ifndef __attribute__deprecated__
#  define __attribute__deprecated__
#endif
#ifndef __attribute__format__
#  define __attribute__format__(x, y, z)
#endif
#ifndef __attribute__malloc__
#  define __attribute__malloc__
#endif
#ifndef __attribute__nonnull__
#  define __attribute__nonnull__(a)
#endif
#ifndef __attribute__noreturn__
#  define __attribute__noreturn__
#endif
#ifndef __attribute__const__
#  define __attribute__const__
#endif
#ifndef __attribute__pure__
#  define __attribute__pure__
#endif
#ifndef __attribute__unused__
#  define __attribute__unused__
#endif
#ifndef __attribute__warn_unused_result__
#  define __attribute__warn_unused_result__
#endif
#ifndef __attribute__hot__
#  define __attribute__hot__
#endif
#ifndef __attribute__cold__
#  define __attribute__cold__
#endif


/* Shim arguments are arguments that must be included in your function,
 * but serve no purpose inside.  Mark them with the SHIM() macro so that
 * the compiler and/or lint know that it's OK it's unused.  Shim arguments
 * get "_unused" added to them so that you can't accidentally use them
 * without removing the shim designation.
 */
#define SHIM(a) /*@unused@*/ a ##_unused __attribute__unused__

/* UNUSED() is the old way we handled shim arguments Should still be
   used in cases where the argument should, at some point be used.
 */
#ifdef __clang__
#  define UNUSED(a) (void)(a);
#else
#  define UNUSED(a) /*@-noeffect*/if (0) (void)(a)/*@=noeffect*/;
#endif

#ifdef PARROT_HAS_HEADER_SAL
/*
 * Microsoft provides two annotations mechanisms.  __declspec, which has been
 * around for a while, and Microsoft's standard source code annotation
 * language (SAL), introduced with Visual C++ 8.0.
 * See <http://msdn2.microsoft.com/en-us/library/ms235402(VS.80).aspx>,
 * <http://msdn2.microsoft.com/en-us/library/dabb5z75(VS.80).aspx>.
 */
#  include <sal.h>
#  define PARROT_CAN_RETURN_NULL      /*@null@*/ __maybenull
#  define PARROT_CANNOT_RETURN_NULL   /*@notnull@*/ __notnull
#else
#  define PARROT_CAN_RETURN_NULL      /*@null@*/
#  define PARROT_CANNOT_RETURN_NULL   /*@notnull@*/
#endif /* PARROT_HAS_HEADER_SAL */

#define PARROT_DEPRECATED           __attribute__deprecated__

#define PARROT_IGNORABLE_RESULT
#define PARROT_WARN_UNUSED_RESULT   __attribute__warn_unused_result__

#define PARROT_PURE_FUNCTION        __attribute__pure__  __attribute__warn_unused_result__
/* Pure functions have no side-effects, and depend only on parms or globals. e.g. strlen() */
/* "Many functions have no effects except the return value and their
    return value depends only on the parameters and/or global
    variables. Such a function can be subject to common subexpression
    elimination and loop optimization just as an arithmetic operator
    would be. For example, "PARROT_PURE_FUNCTION int square(int x)"
    says that the hypothetical function square is safe to call fewer
    times than the program says.

    Some of common examples of pure functions are strlen or
    memcmp. Interesting non-pure functions are functions with infinite
    loops or those depending on volatile memory or other system resource,
    that may change between two consecutive calls (such as feof in a
    multithreading environment)." -- http://gcc.gnu.org/onlinedocs/gcc/Function-Attributes.html
*/

#define PARROT_CONST_FUNCTION       __attribute__const__ __attribute__warn_unused_result__
/* Const functions are pure functions, and also do not examine targets of pointer args or globals. e.g. sqrt() */
/* "Many functions do not examine any values except their arguments,
    and have no effects except the return value. Basically this is just
    slightly more strict class than the pure attribute below, since
    function is not allowed to read global memory. Note that a function
    that has pointer arguments and examines the data pointed to must
    not be declared const. Likewise, a function that calls a non-const
    function usually must not be const. It does not make sense for a
    const function to return void."
        -- http://gcc.gnu.org/onlinedocs/gcc/Function-Attributes.html
*/

#define PARROT_DOES_NOT_RETURN              /*@noreturn@*/ __attribute__noreturn__
#define PARROT_DOES_NOT_RETURN_WHEN_FALSE   /*@noreturnwhenfalse@*/
#define PARROT_MALLOC                       /*@only@*/ __attribute__malloc__ __attribute__warn_unused_result__

/* Hot functions can be optimized by the compiler. */
#define PARROT_HOT                          __attribute__hot__
#define PARROT_COLD                         __attribute__cold__

/* Macros for exposure tracking for splint. */
/* See http://www.splint.org/manual/html/all.html section 6.2 */
#define PARROT_OBSERVER                     /*@observer@*/
#define PARROT_EXPOSED                      /*@exposed@*/

/* Function argument instrumentation */
/* For explanations of the annotations, see http://www.splint.org/manual/manual.html */

#ifdef PARROT_HAS_HEADER_SAL
#  define NOTNULL(x)                  /*@notnull@*/ __notnull x
    /* The pointer passed may not be NULL */

#  define NULLOK(x)                   /*@null@*/ __maybenull x
    /* The pointer passed may be NULL */

#  define ARGIN(x)                    /*@in@*/ /*@notnull@*/ __in x
#  define ARGIN_NULLOK(x)             /*@in@*/ /*@null@*/ __in_opt x
    /* The pointer target must be completely defined before being passed */
    /* to the function. */

#  define ARGOUT(x)                   /*@out@*/ /*@notnull@*/ __out x
#  define ARGOUT_NULLOK(x)            /*@out@*/ /*@null@*/ __out_opt x
    /* The pointer target will be defined by the function */

#  define ARGMOD(x)                   /*@in@*/ /*@notnull@*/ __inout x
#  define ARGMOD_NULLOK(x)            /*@in@*/ /*@null@*/ __inout_opt x
    /* The pointer target must be completely defined before being passed, */
    /* and MAY be modified by the function. */

#  define FUNC_MODIFIES(x)            /*@modifies x@*/
    /* Never applied by a human, only by the headerizer. */

#else

#  define NOTNULL(x)                  /*@notnull@*/ x
    /* The pointer passed may not be NULL */

#  define NULLOK(x)                   /*@null@*/ x
    /* The pointer passed may be NULL */

#  define ARGIN(x)                    /*@in@*/ /*@notnull@*/ x
#  define ARGIN_NULLOK(x)             /*@in@*/ /*@null@*/ x
    /* The pointer target must be completely defined before being passed */
    /* to the function. */

#  define ARGOUT(x)                   /*@out@*/ /*@notnull@*/ x
#  define ARGOUT_NULLOK(x)            /*@out@*/ /*@null@*/ x
    /* The pointer target will be defined by the function */

#  define ARGMOD(x)                   /*@in@*/ /*@notnull@*/ x
#  define ARGMOD_NULLOK(x)            /*@in@*/ /*@null@*/ x
    /* The pointer target must be completely defined before being passed, */
    /* and MAY be modified by the function. */

#  define FUNC_MODIFIES(x)            /*@modifies x@*/
    /* Never applied by a human, only by the headerizer. */

#endif

#define ARGFREE(x)                          /*@only@*/ /*@out@*/ /*@null@*/ x
    /* From the Splint manual: The parameter to free() must reference */
    /* an unshared object.  Since the parameter is declared using "only", */
    /* the caller may not use the referenced object after the call, and */
    /* may not pass in a reference to a shared object.  There is nothing */
    /* special about malloc and free --  their behavior can be described */
    /* entirely in terms of the provided annotations. */
#define ARGFREE_NOTNULL(x)                  /*@only@*/ /*@out@*/ /*@notnull@*/ x

#endif /* PARROT_COMPILER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
