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
#include <time.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>

#define NUM_REGISTERS 32
#define PARROT_MAGIC 0x13155a1

struct PMC {
  VTABLE *vtable;
  IV flags;
  DPOINTER *data;
  union {
    IV int_val;
    NV num_val;
    DPOINTER *struct_val;
  } cache;
  SYNC *synchronize;
};

typedef struct PMC PMC;

typedef void STRING_FUNCS;

#include "parrot/global_setup.h"
#include "parrot/string.h"
#include "parrot/interpreter.h"
#include "parrot/register.h"
#include "parrot/exceptions.h"
#include "parrot/memory.h"
#include "parrot/bytecode.h"
#include "parrot/io.h"
#include "parrot/op.h"
#include "parrot/events.h"

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
