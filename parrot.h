/* parrot.h
 *
 * General header file includes for the parrot interpreter
 *
 */

#if !defined(PARROT_PARROT_H_GUARD)
#define PARROT_PARROT_H_GUARD

#if defined(INSIDE_GLOBAL_SETUP)
#define VAR_SCOPE 
#else
#define VAR_SCOPE extern
#endif

#include "config.h"

#include <stdlib.h>
#include <stdio.h>
//#include <types.h>
#include <time.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>

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

#include "global_setup.h"
#include "string.h"
#include "interpreter.h"
#include "register.h"
#include "exceptions.h"
#include "memory.h"
#include "bytecode.h"
#include "io.h"
#include "op.h"
#include "events.h"

#endif
