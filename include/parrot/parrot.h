/* parrot.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     General header file includes for the parrot interpreter
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

/* Only parrot core files should include this file.  
   Extensions should include <parrot/extend.h>.
   Programs embedding parrot should include <parrot/embed.h>.
*/

#if !defined(PARROT_PARROT_H_GUARD)
#define PARROT_PARROT_H_GUARD

#if defined(INSIDE_GLOBAL_SETUP)
#  define VAR_SCOPE
#else
#  define VAR_SCOPE extern
#endif

#define PARROT_IN_CORE

#include "parrot/config.h"

#include <stdlib.h>
#include <stdio.h>
/*#include <types.h> */

#ifdef WIN32
#  include <io.h>
#endif

#ifdef HAS_HEADER_UNISTD
#  include <unistd.h>
#endif

#ifdef HAS_HEADER_SYSMMAN
#  include <sys/mman.h>
#endif

#ifdef HAS_HEADER_SYSTIME
#  include <sys/time.h>
#endif

#ifdef HAS_HEADER_MATH
#  include <math.h>
#endif

#ifdef HAS_HEADER_FCNTL
#  include <fcntl.h>
#endif

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <ctype.h>

#define NUM_REGISTERS 32
#define PARROT_MAGIC 0x13155a1

typedef struct PMC PMC;
typedef unsigned char BOOLVAL;
typedef void STRING_FUNCS;
typedef void REGEX;
typedef void* BIGINT;
typedef void* BIGFLOAT;

/* define some shortcuts for dealing with function pointers */
/* according to ANSI C, casting between function and non-function pointers is
 * no good.  So we should use "funcptr_t" in place of void* when dealing with
 * function pointers and NULLfunc in place of NULL */
typedef void (*funcptr_t)(void);
#define NULLfunc (funcptr_t)0

/* Provide support for inline keyword where available.  Just make sure to use
 * "INLINE" instead and it will DTRT. */
#ifdef __cplusplus
#  define INLINE inline
#else
#  ifdef __GNUC__
#    define INLINE __inline__
#  else 
#    define INLINE
#  endif
#endif

/* On Win32 we need the constant O_BINARY for open() (at least for Borland C), 
   but on UNIX it doesn't exist, so set it to 0 if it's not defined
 */
#ifndef O_BINARY
    #define O_BINARY 0
#endif

/* define a macro to acknowledge an unused argument, and silence a "helpful"
   compiler warning. gcc will emit a warning on an empty if body unless {} is
   used to make an empty block.  */
#define UNUSED(a) if (a) {}

#include "parrot/platform.h"
#include "parrot/global_setup.h"
#include "parrot/interpreter.h"
#include "parrot/encoding.h"
#include "parrot/chartype.h"
#include "parrot/string.h"
#include "parrot/key.h"
#include "parrot/vtable.h"
#include "parrot/register.h"
#include "parrot/regfuncs.h"
#include "parrot/exceptions.h"
#include "parrot/warnings.h"
#include "parrot/memory.h"
#include "parrot/packfile.h"
#include "parrot/io.h"
#include "parrot/op.h"
#include "parrot/pmc.h"
#include "parrot/events.h"
#include "parrot/stacks.h"
#include "parrot/resources.h"
#include "parrot/string_funcs.h"
#include "parrot/misc.h"
#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
