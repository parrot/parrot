/* Interpreter.c
 *
 * Main interpreter code
 *
 */


#include "parrot.h"

void runops (struct Perl_Interp *interpreter, IV *code) {
  while (code) {
    IV *(*func)();
    void **foo;
    foo = (void *)interpreter->opcode_funcs;
    (void *)func = foo[*code];
    //    printf("code %i\n", *code);
    code = func(code, interpreter)
    CHECK_EVENTS(interpreter);
  }
}

struct Perl_Interp *make_interpreter() {
  struct Perl_Interp *interpreter;
  /* Get an empty interpreter from system memory */
  interpreter = Sys_Allocate(sizeof(struct Perl_Interp));
  /* Set up the memory allocation system */
  Setup_Allocator(interpreter);

  /* Set up the initial register chunks */
  interpreter->int_reg_base = Allocate_Aligned(sizeof(struct IRegChunk));
  interpreter->num_reg_base = Allocate_Aligned(sizeof(struct NRegChunk));
  interpreter->string_reg_base = Allocate_Aligned(sizeof(struct SRegChunk));
  interpreter->pmc_reg_base = Allocate_Aligned(sizeof(struct PRegChunk));

  /* Set up the initial register frame pointers */
  interpreter->int_reg = &interpreter->int_reg_base->IReg[0];
  interpreter->num_reg = &interpreter->num_reg_base->NReg[0];
  interpreter->string_reg = &interpreter->string_reg_base->SReg[0];
  interpreter->pmc_reg = &interpreter->pmc_reg_base->PReg[0];

  /* Initialize the integer register chunk */
  interpreter->int_reg_base->used = 1;
  interpreter->int_reg_base->free = FRAMES_PER_INT_REG_CHUNK - 1;
  interpreter->int_reg_base->next = NULL;
  interpreter->int_reg_base->prev = NULL;

  /* Initialize the initial numeric register chunk */
  interpreter->num_reg_base->used = 1;
  interpreter->num_reg_base->free = FRAMES_PER_NUM_REG_CHUNK - 1;
  interpreter->num_reg_base->next = NULL;
  interpreter->num_reg_base->prev = NULL;

  /* Initialize the inital string register chunk */
  interpreter->string_reg_base->used = 1;
  interpreter->string_reg_base->free = FRAMES_PER_STR_REG_CHUNK - 1;
  interpreter->string_reg_base->next = NULL;
  interpreter->string_reg_base->prev = NULL;

  /* Initialize the initial PMC register chunk. Gotta NULL them out,
     too, otherwise we might GC Wrong Things later */
  interpreter->pmc_reg_base->used = 1;
  interpreter->pmc_reg_base->free = FRAMES_PER_PMC_REG_CHUNK - 1;
  interpreter->pmc_reg_base->next = NULL;
  interpreter->pmc_reg_base->prev = NULL;
  clear_p(interpreter);

  /* Need a default stack */
  interpreter->stack_base = Allocate_New_Stack();

  /* Need an empty stash */
  interpreter->perl_stash = Allocate_New_Stash();

  /* The default opcode function table would be a good thing here... */
  {
    void **foo;
    foo = Sys_Allocate(2048 * sizeof(void *));

    foo[0] = set_i_ic;
    foo[1] = add_i;
    foo[7] = sub_i;
    foo[8] = mul_i;
    foo[9] = div_i;
    foo[2] = eq_i_ic;
    foo[3] = time_i;
    foo[4] = print_i;
    foo[5] = branch_ic;
    foo[6] = end;
    foo[10] = if_i_ic;
    foo[11] = inc_i;
    foo[12] = inc_i_ic;
    foo[13] = dec_i;
    foo[14] = dec_i_ic;
    foo[15] = jump_i;
    foo[16] = set_n_nc;
    foo[17] = add_n;
    foo[18] = sub_n;
    foo[19] = mul_n;
    foo[20] = div_n;
    foo[21] = eq_n_ic;
    foo[22] = time_n;
    foo[23] = print_n;
    foo[24] = if_n_ic;
    foo[25] = inc_n;
    foo[26] = inc_n_nc;
    foo[27] = dec_n;
    foo[28] = dec_n_nc;
    foo[29] = iton_n_i;
    foo[30] = ntoi_i_n;
    (void *)interpreter->opcode_funcs = foo;
  }

  /* In case the I/O system needs something */
  Init_IO(interpreter);

  /* Done. Return and be done with it */
  return interpreter;

}
