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

#if !defined(CAN_BUILD_CALL_FRAMES)
/* All our static functions that call in various ways. Yes, terribly
   hackish, but that's just fine */

/* Return void, take nothing */
static void pcf_v_v(struct Parrot_Interp *interpreter, PMC *self) {
  void (*pointer)();
  pointer = self->cache.struct_val;
  (void)(*pointer)();
  interpreter->ctx.int_reg.registers[0] = 0;
  interpreter->ctx.int_reg.registers[1] = 0;
  interpreter->ctx.int_reg.registers[2] = 0;
  interpreter->ctx.int_reg.registers[3] = 0;
  interpreter->ctx.int_reg.registers[4] = 0;
  return;
}

/* Return int, take nothing */
static void pcf_i_v(struct Parrot_Interp *interpreter, PMC *self) {
  int (*pointer)();
  int return_data;
  pointer = self->cache.struct_val;
  return_data = (int)(*pointer)();
  interpreter->ctx.int_reg.registers[5] = return_data;
  interpreter->ctx.int_reg.registers[0] = 0;
  interpreter->ctx.int_reg.registers[1] = 1;
  interpreter->ctx.int_reg.registers[2] = 0;
  interpreter->ctx.int_reg.registers[3] = 0;
  interpreter->ctx.int_reg.registers[4] = 0;
  return;
}

/* Return double, take nothing */
static void pcf_d_v(struct Parrot_Interp *interpreter, PMC *self) {
  double (*pointer)();
  double return_data;
  pointer = self->cache.struct_val;
  return_data = (double)(*pointer)();
  interpreter->ctx.num_reg.registers[5] = return_data;
  interpreter->ctx.int_reg.registers[0] = 0;
  interpreter->ctx.int_reg.registers[1] = 0;
  interpreter->ctx.int_reg.registers[2] = 0;
  interpreter->ctx.int_reg.registers[3] = 0;
  interpreter->ctx.int_reg.registers[4] = 1;
  return;
}

/* Return double, take double */
static void pcf_d_d(struct Parrot_Interp *interpreter, PMC *self) {
  double (*pointer)();
  double return_data;

  pointer = self->cache.struct_val;
  return_data = (double)(*pointer)(interpreter->ctx.num_reg.registers[5]);
  interpreter->ctx.num_reg.registers[5] = return_data;
  interpreter->ctx.int_reg.registers[0] = 0;
  interpreter->ctx.int_reg.registers[1] = 0;
  interpreter->ctx.int_reg.registers[2] = 0;
  interpreter->ctx.int_reg.registers[3] = 0;
  interpreter->ctx.int_reg.registers[4] = 1;
  return;
}

#endif



/* This function serves a single purpose. It takes the function
   signature for a C function we want to call and returns a pointer
   to a function that can call it. */
void *build_call_func(struct Parrot_Interp *interpreter, String *signature) {
#if defined(CAN_BUILD_CALL_FRAMES)
  /* This would be a good place to put the code that builds the
     frames. Undoubtedly painfully platform-dependent */
  abort("Oh, no you can't!");
#else
  /* And in here is the platform-independent way. Which is to say
     "here there be hacks" */
  if (0 == string_length(signature)) return pcf_v_v;
  if (!string_compare(interpreter, signature, string_from_c_string(interpreter, "i", 1)))
    return pcf_i_v;
  if (!string_compare(interpreter, signature, string_from_c_string(interpreter, "d", 1)))
    return pcf_d_v;
  if (!string_compare(interpreter, signature, string_from_c_string(interpreter, "dd", 2)))
    return pcf_d_d;

  return NULL;
#endif
}

