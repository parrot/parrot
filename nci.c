/* nci.c
 *  Copyright: 2001, 2002 Yet Another Society
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Native Call Interface routines. The code needed to build a
 *     parrot to C call frame is in here
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/* This function serves a single purpose. It takes the function
   signature for a C function we want to call and returns a pointer
   to a function that can call it. */
void *build_call_func(Parrot_Interp *interpreter, String *signature) {
#if defined(CAN_BUILD_CALL_FRAMES)
  /* This would be a good place to put the code that builds the
     frames. Undoubtedly painfully platform-dependent */
  abort("Oh, no you can't!");
#else
  /* And in here is the platform-independent way. Which is to say
     "here there be hacks" */
  return NULL;
#endif
}

#if !defined(CAN_BUILD_CALL_FRAMES)
/* Return void, take nothing */
static void pcf_v_v(Parrot_Interp *interpreter, void (*pointer)()) {
  (void)(*pointer)();
  return;
}
#endif
