#if !defined(PARROT_EMBED_H_GUARD)
#define PARROT_EMBED_H_GUARD

#include "parrot/config.h"

typedef int Parrot_flag;
typedef void * Parrot_flag_val;

/* plucked these straight from interpreter.h */
#define PARROT_DEBUG_FLAG    0x01  /* We're debugging */
#define PARROT_TRACE_FLAG    0x02  /* We're tracing execution */
#define PARROT_BOUNDS_FLAG   0x04  /* We're tracking byte code bounds */
#define PARROT_PROFILE_FLAG  0x08  /* We're gathering profile information */
#define PARROT_PREDEREF_FLAG 0x10  /* We're using the prederef runops */
#define PARROT_JIT_FLAG      0x20  /* We're using the jit runops */

/* These two are basically Magic Cookies to the outside world. */
struct Parrot_Interp;
struct PackFile;

struct Parrot_Interp *interp_new();

void Parrot_init(struct Parrot_Interp *);

void Parrot_setflag(struct Parrot_Interp *, Parrot_flag, Parrot_flag_val);

struct PackFile * Parrot_readbc(struct Parrot_Interp *, char *);

void Parrot_loadbc(struct Parrot_Interp *, struct PackFile *);

void Parrot_runcode(struct Parrot_Interp *, int argc, char *argv[]);

void Parrot_destroy(struct Parrot_Interp *);

#endif
