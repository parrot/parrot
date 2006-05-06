/* compiler.h
 *  Copyright: 2006 The Perl Foundation.  All Rights Reserved.
 *  SVN Info
 *     $Id: exceptions.h 11903 2006-03-14 20:49:11Z bernhard $
 *  Overview:
 *     defines compiler capabilities
 */

#if !defined(PARROT_COMPILER_H_GUARD)
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
#ifndef __attribute__pure__
#  define __attribute__pure__
#endif
#ifndef __attribute__unused__
#  define __attribute__unused__
#endif
#ifndef __attribute__warn_unused_result__
#  define __attribute__warn_unused_result__
#endif

#endif /* PARROT_COMPILER_H_GUARD */
