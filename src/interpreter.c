/* Interpreter.c
 *
 * Main interpreter code
 *
 */


#include "parrot.h"
#include "interp_guts.h"

void
runops (struct Perl_Interp *interpreter, IV *code) {
  /* Move these out of the inner loop. No need to redeclare 'em each
     time through */
  IV *(*func)();
  void **temp; 

  if (Parrot_num_string_constants == 0) {
    printf("Warning: Bytecode does not include opcode table fingerprint!\n");
  } else {
    const char * fp_data;
    IV           fp_len;

    fp_data = Parrot_string_constants[0]->bufstart;
    fp_len  = Parrot_string_constants[0]->buflen;

    if (strncmp(OPCODE_FINGERPRINT, fp_data, fp_len)) {
      printf("Error: Opcode table fingerprint in bytecode does not match interpreter!\n");
      printf("       Bytecode:    %*s\n", -fp_len, fp_data);
      printf("       Interpreter: %s\n", OPCODE_FINGERPRINT);
      exit(1);
    }
  }

  while (*code) {
    DO_OP(code, temp, func, interpreter);
  }
}

struct Perl_Interp *
make_interpreter() {
  struct Perl_Interp *interpreter;
  /* Get an empty interpreter from system memory */
  interpreter = mem_sys_allocate(sizeof(struct Perl_Interp));
  /* Set up the memory allocation system */
  mem_setup_allocator(interpreter);

  /* Set up the initial register chunks */
  interpreter->int_reg_base = mem_allocate_aligned(sizeof(struct IRegChunk));
  interpreter->num_reg_base = mem_allocate_aligned(sizeof(struct NRegChunk));
  interpreter->string_reg_base = mem_allocate_aligned(sizeof(struct SRegChunk));
  interpreter->pmc_reg_base = mem_allocate_aligned(sizeof(struct PRegChunk));

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
  Parrot_clear_p(interpreter);

  /* Need a default stack */
  interpreter->stack_base = mem_allocate_new_stack();

  /* Need an empty stash */
  interpreter->perl_stash = mem_allocate_new_stash();

  /* The default opcode function table would be a good thing here... */
  {
    void **foo;
    foo = mem_sys_allocate(2048 * sizeof(void *));

    BUILD_TABLE(foo);

    interpreter->opcode_funcs = (void*)foo;
  }

  /* In case the I/O system needs something */
  Init_IO(interpreter);

  /* Done. Return and be done with it */
  return interpreter;

}
