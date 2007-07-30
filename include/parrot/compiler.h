/* compiler.h
 *  Copyright (C) 2006, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     defines compiler capabilities
 */

#ifndef PARROT_COMPILER_H_GUARD
#define PARROT_COMPILER_H_GUARD

/*
 * This set of macros define capabilities that may or may not be available
 * for a given compiler.  They are based on GCC's __attribute__ functionality.
 * Over in Perl 5 world, we determine whether these capabilities exist at
 * ./Configure time.  For now, you'll have to do it by hand.
 */

#ifdef HASATTRIBUTE_FORMAT
#  define __attribute__format__(x,y,z)      __attribute__((format(x,y,z)))
#endif
#ifdef HASATTRIBUTE_MALLOC
#  define __attribute__malloc__             __attribute__((__malloc__))
#endif
#ifdef HASATTRIBUTE_NONNULL
#  define __attribute__nonnull__(a)         __attribute__((nonnull(a)))
#endif
#ifdef HASATTRIBUTE_NORETURN
#  define __attribute__noreturn__           __attribute__((noreturn))
#endif
#ifdef HASATTRIBUTE_PURE
#  define __attribute__pure__               __attribute__((pure))
#endif
#ifdef HASATTRIBUTE_CONST
#  define __attribute__const__              __attribute__((const))
#endif
#ifdef HASATTRIBUTE_UNUSED
#  define __attribute__unused__             __attribute__((unused))
#endif
#ifdef HASATTRIBUTE_WARN_UNUSED_RESULT
#  define __attribute__warn_unused_result__ __attribute__((warn_unused_result))
#endif

/* If we haven't defined the attributes yet, define them to blank. */
#ifndef __attribute__format__
#  define __attribute__format__(x,y,z)
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


/* Shim arguments are arguments that must be included in your function,
 * but serve no purpose inside.  Mark them with the SHIM() macro so that
 * the compiler and/or lint know that it's OK it's unused.  Shim arguments
 * get "_unused" added to them so that you can't accidentally use them
 * without removing the shim designation.
 */
#define SHIM(a) /*@unused@*/ /*@null@*/ a##_unused __attribute__unused__

/* UNUSED() is the old way we handled shim arguments Should still be
   used in cases where the argument should, at some point be used.
 */
#define UNUSED(a) if (0) (void)(a);

#define PARROT_CAN_RETURN_NULL      /*@null@*/
#define PARROT_CANNOT_RETURN_NULL   /*@notnull@*/

#define PARROT_IGNORABLE_RESULT
#define PARROT_WARN_UNUSED_RESULT   __attribute__warn_unused_result__

#define PARROT_PURE_FUNCTION        __attribute__pure__ __attribute__warn_unused_result__
#define PARROT_CONST_FUNCTION       __attribute__const__ __attribute__warn_unused_result__
#define PARROT_DOES_NOT_RETURN      /*@noreturn@*/ __attribute__noreturn__
#define PARROT_MALLOC               __attribute__malloc__ __attribute__warn_unused_result__

#define NOTNULL(x)                  /*@notnull@*/ x
#define NULLOK(x)                   /*@null@*/ x

#define ARGOUT(x)                   /*@notnull@*/ /*@out@*/ x
#define ARGINOUT(x)                 /*@notnull@*/ /*@in@*/ /*@out@*/ x
#define ARGOUT_NULLOK(x)            /*@out@*/ x


#endif /* PARROT_COMPILER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
