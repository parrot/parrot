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

#if !defined(PARROT_PARROT_H_GUARD)
#define PARROT_PARROT_H_GUARD

#if defined(INSIDE_GLOBAL_SETUP)
#define VAR_SCOPE
#else
#define VAR_SCOPE extern
#endif

#include "parrot/config.h"

#include <stdlib.h>
#include <stdio.h>
/*#include <types.h> */

#include "parrot/platform.h"

#ifdef WIN32
#	include <io.h>
#endif

#ifdef HAS_HEADER_UNISTD
#	include <unistd.h>
#endif

#ifdef HAS_HEADER_SYSMMAN
#	include <sys/mman.h>
#endif

#ifdef HAS_HEADER_SYSTIME
#	include <sys/time.h>
#endif

#ifdef HAS_HEADER_MATH
#	include <math.h>
#endif

#ifdef HAS_HEADER_FCNTL
#	include <fcntl.h>
#endif

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>

#define NUM_REGISTERS 32
#define PARROT_MAGIC 0x13155a1

typedef struct PMC PMC;
typedef unsigned char BOOLVAL;
typedef void STRING_FUNCS;
typedef void REGEX;
typedef void BIGINT;
typedef void BIGFLOAT;

#include "parrot/global_setup.h"
#include "parrot/interpreter.h"
#include "parrot/encoding.h"
#include "parrot/chartype.h"
#include "parrot/string.h"
#include "parrot/vtable.h"
#include "parrot/register.h"
#include "parrot/exceptions.h"
#include "parrot/memory.h"
#include "parrot/packfile.h"
#include "parrot/io.h"
#include "parrot/op.h"
#include "parrot/pmc.h"
#include "parrot/events.h"
#include "parrot/stacks.h"
#include "parrot/resources.h"
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
