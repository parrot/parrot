/* interpreter.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The interpreter api handles running the operations
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/interp_guts.h"
#include "parrot/oplib/core_ops.h"
#include "parrot/runops_cores.h"
#ifdef HAS_JIT
#include "parrot/jit.h"
#endif


/*=for api interpreter check_fingerprint
 * TODO: Not really part of the API, but here's the docs.
 * Check the bytecode's opcode table fingerprint.
 */
static void
check_fingerprint(struct Parrot_Interp *interpreter) {
/*    if (PNCONST == 0) { */

    return;

#if 0
    if (interpreter->code->const_table->const_count == 0) {
        fprintf(stderr, "Warning: Bytecode does not include opcode table fingerprint!\n");
    }
    else {
        const char * fp_data;
        INTVAL           fp_len;

        fp_data = PCONST(0)->string->bufstart;
        fp_len  = PCONST(0)->string->buflen;
        
        if (strncmp(OPCODE_FINGERPRINT, fp_data, fp_len)) {
            fprintf(stderr, "Error: Opcode table fingerprint in bytecode does not match interpreter!\n");
            fprintf(stderr, "       Bytecode:    %*s\n", 
                    (int) -fp_len, fp_data);
            fprintf(stderr, "       Interpreter: %s\n", OPCODE_FINGERPRINT);
            exit(1);
        }
    }
#endif

}


/*=for api interpreter runops_generic
 * TODO: Not really part of the API, but here's the docs.
 * Generic runops, which takes a function pointer for the core.
 */
static void
runops_generic (opcode_t * (*core)(struct Parrot_Interp *, opcode_t *), 
                struct Parrot_Interp *interpreter, opcode_t * pc) {
    opcode_t * code_start;
    UINTVAL    code_size;
    opcode_t * code_end;

    check_fingerprint(interpreter);

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    pc = core(interpreter, pc);

    if (pc && (pc < code_start || pc >= code_end)) {
        fprintf(stderr, "Error: Control left bounds of byte-code block (now at location %d)!\n", (int) (pc - code_start));
        exit(1);
    }
}

/*=for api interpreter init_prederef
 */

static void *       prederef_oplib_handle = NULL;
static oplib_init_f prederef_oplib_init   = NULL;
static op_lib_t *   prederef_oplib        = NULL;
static INTVAL       prederef_op_count     = 0;
static op_info_t *  prederef_op_info      = NULL;
static op_func_t *  prederef_op_func      = NULL;

static void
init_prederef(struct Parrot_Interp * interpreter)
{
  char file_name[50];
  char func_name[50];

  sprintf(file_name, "lib%s_prederef.so.%s", PARROT_CORE_OPLIB_NAME,
    PARROT_VERSION);

  sprintf(func_name, "Parrot_DynOp_%s_prederef_%d_%d_%d",
    PARROT_CORE_OPLIB_NAME, PARROT_MAJOR_VERSION,
    PARROT_MINOR_VERSION, PARROT_PATCH_VERSION);

  /*
  ** Get a handle to the library file:
  */

  prederef_oplib_handle = Parrot_dlopen(file_name);

  if (!prederef_oplib_handle) {
    fprintf(stderr, "Unable to dynamically load oplib file '%s' for oplib '%s_prederef' version %s!\n",
      file_name, PARROT_CORE_OPLIB_NAME, PARROT_VERSION);

    exit(1);
  }

  /*
  ** Look up the init function:
  */

  prederef_oplib_init   = (oplib_init_f)Parrot_dlsym(prederef_oplib_handle, func_name);

  if (!prederef_oplib_init) {
    fprintf(stderr, "No exported symbol for oplib init function '%s' from oplib file '%s' for oplib '%s_prederef' version %s!\n",
      func_name, file_name, PARROT_CORE_OPLIB_NAME, PARROT_VERSION);

    exit(1);
  }

  /*
  ** Run the init function to get the oplib info:
  */

  prederef_oplib        = prederef_oplib_init();

  if (!prederef_oplib) {
    fprintf(stderr, "No oplib info returned by oplib init function '%s' from oplib file '%s' for oplib '%s_prederef' version %s!\n",
      func_name, file_name,
      PARROT_CORE_OPLIB_NAME, PARROT_VERSION);
    exit(1);
  }

  /*
  ** Validate the op count:
  */

  prederef_op_count     = prederef_oplib->op_count;

  if (prederef_op_count <= 0) {
    fprintf(stderr, "Illegal op count (%d) from oplib file '%s' for oplib '%s_prederef' version %s!\n",
      (int)prederef_op_count, file_name,
      PARROT_CORE_OPLIB_NAME, PARROT_VERSION);
    exit(1);
  }

  /*
  ** Validate the op info table:
  */

  prederef_op_info      = prederef_oplib->op_info_table;

  if (!prederef_op_info) {
    fprintf(stderr, "No op info table in oplib file '%s' for oplib '%s_prederef' version %s!\n",
      file_name,
      PARROT_CORE_OPLIB_NAME, PARROT_VERSION);
    exit(1);
  }

  /*
  ** Validate the op func table:
  */

  prederef_op_func      = prederef_oplib->op_func_table;

  if (!prederef_op_func) {
    fprintf(stderr, "No op func table in oplib file '%s' for oplib '%s_prederef' version %s!\n",
      file_name,
      PARROT_CORE_OPLIB_NAME, PARROT_VERSION);
    exit(1);
  }
}

/*=for api interpreter stop_prederef
 */

static void
stop_prederef(void)
{
  prederef_op_func      = NULL;
  prederef_op_info      = NULL;
  prederef_op_count     = 0;

  Parrot_dlclose(prederef_oplib_handle);

  prederef_oplib        = NULL;
  prederef_oplib_init   = NULL;
  prederef_oplib_handle = NULL;
}

/*=for api interpreter prederef
 */

static void **
prederef(void ** pc_prederef, struct Parrot_Interp * interpreter)
{
  size_t      offset = pc_prederef - interpreter->prederef_code;
  opcode_t *  pc     = ((opcode_t *)interpreter->code->byte_code) + offset;
  op_info_t * opinfo = &prederef_op_info[*pc];
  int         i;

  for (i = 0; i < opinfo->arg_count; i++) {
    switch (opinfo->types[i]) {
      case PARROT_ARG_OP:
        pc_prederef[i] = (void *)prederef_op_func[pc[i]];
        break;
  
      case PARROT_ARG_I:
        pc_prederef[i] = (void *)&interpreter->int_reg->registers[pc[i]];
        break;
    
      case PARROT_ARG_N:
        pc_prederef[i] = (void *)&interpreter->num_reg->registers[pc[i]];
        break;
    
      case PARROT_ARG_P:
        pc_prederef[i] = (void *)&interpreter->pmc_reg->registers[pc[i]];
        break;
    
      case PARROT_ARG_S:
        pc_prederef[i] = (void *)&interpreter->string_reg->registers[pc[i]];
        break;

      case PARROT_ARG_IC:
        pc_prederef[i] = (void *)pc[i];
        break;

      case PARROT_ARG_NC:
        pc_prederef[i] = (void *)
                &interpreter->code->const_table->constants[pc[i]]->number;
        break;

      case PARROT_ARG_PC:
/*        pc_prederef[i] = (void *)
                 &interpreter->code->const_table->constants[pc[i]]->pmc; */
          fprintf(stderr, "PMC constants not yet supported!\n");
          exit(1);
        break;

      case PARROT_ARG_SC:
        pc_prederef[i] = (void *) 
                &interpreter->code->const_table->constants[pc[i]]->string;
        break;

      default:
        break;
    }

    if (opinfo->types[i] != PARROT_ARG_IC && pc_prederef[i] == 0) {
      fprintf(stderr, "Prederef generated a NULL pointer for arg of type %d!\n", opinfo->types[i]);
      exit(1);
    }
  }


  return pc_prederef;
}


/*=for api interpreter runops_jit
 */
static void
runops_jit (struct Parrot_Interp *interpreter, opcode_t * pc) {
#ifdef HAS_JIT
    opcode_t * code_start;
    UINTVAL    code_size;
    opcode_t * code_end;
    jit_f      jit_code;

    check_fingerprint(interpreter);

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    jit_code = build_asm(interpreter, pc, code_start, code_end);
    (jit_code)();
#endif
    return;

}


/*=for api interpreter runops_prederef
 */
static void
runops_prederef (struct Parrot_Interp *interpreter, opcode_t * pc, 
                 void ** pc_prederef) {
    opcode_t * code_start;
    UINTVAL    code_size;
    opcode_t * code_end;
    void **    code_start_prederef;

    check_fingerprint(interpreter);

    code_start = (opcode_t *)interpreter->code->byte_code;
    code_size  = interpreter->code->byte_code_size;
    code_end   = (opcode_t *)(interpreter->code->byte_code + code_size);

    code_start_prederef = pc_prederef;

    init_prederef(interpreter);

    while (pc_prederef) {
      pc_prederef = 
              ((op_func_prederef_t)*pc_prederef) (pc_prederef, interpreter);
    }

    stop_prederef();

    if (pc_prederef == 0) {
      pc = 0;
    }
    else {
      pc = code_start + (pc_prederef - code_start_prederef);
    }

    if (pc && (pc < code_start || pc >= code_end)) {
        fprintf(stderr, "Error: Control left bounds of byte-code block (now at location %d)!\n", (int) (pc - code_start));
        exit(1);
    }
}


/*=for api interpreter runops
 * run parrot operations until the program is complete
 */
void
runops (struct Parrot_Interp *interpreter, struct PackFile * code, 
        size_t offset) {
    opcode_t * (*core)(struct Parrot_Interp *, opcode_t *);

    interpreter->code          = code;
    interpreter->resume_offset = offset;
    interpreter->resume_flag   = 1;

    while (interpreter->resume_flag) {
        int        which = 0;
        opcode_t * pc    = (opcode_t *)
                interpreter->code->byte_code + interpreter->resume_offset;

        interpreter->resume_offset = 0;
        interpreter->resume_flag   = 0;

        which |= interpreter->flags & PARROT_BOUNDS_FLAG  ? 0x01 : 0x00;
        which |= interpreter->flags & PARROT_PROFILE_FLAG ? 0x02 : 0x00;
        which |= interpreter->flags & PARROT_TRACE_FLAG   ? 0x04 : 0x00;

        core = which ? runops_slow_core : runops_fast_core;

        if ((interpreter->flags & PARROT_PROFILE_FLAG) != 0) {
            unsigned int i;

            if (interpreter->profile == NULL) {
                interpreter->profile = (INTVAL *)
                    mem_sys_allocate(interpreter->op_count * sizeof(INTVAL));
            }

            for (i = 0; i < interpreter->op_count; i++) {
                interpreter->profile[i] = 0;
            }
        }

        if ((interpreter->flags & PARROT_PREDEREF_FLAG) != 0) {
          offset = pc - (opcode_t *)interpreter->code->byte_code;

          if (!interpreter->prederef_code) {
            size_t N = interpreter->code->byte_code_size;
            size_t i;
            void ** temp = (void **)malloc(N * sizeof(void *));

            for (i = 0; i < N; i++) {
              temp[i] = (void *)prederef;
            }

            interpreter->prederef_code = temp;
          }

          runops_prederef(interpreter, pc, 
                          interpreter->prederef_code + offset);
        }
        else if ((interpreter->flags & PARROT_JIT_FLAG) != 0) {
          if (!JIT_CAPABLE) {
            fprintf(stderr, 
    "Error: PARROT_JIT_FLAG is set, but interpreter is not JIT_CAPABLE!\n");
            exit(1);
          }

          runops_jit(interpreter, pc);
        }
        else {
          runops_generic(core, interpreter, pc);
        }
    }

    if (interpreter->prederef_code) {
      free(interpreter->prederef_code);
      interpreter->prederef_code = NULL;
    }
}

/*=for api interpreter make_interpreter
 *  Create the Parrot interpreter.  Allocate memory and clear the registers.
 */
struct Parrot_Interp *
make_interpreter(INTVAL flags) {
    struct Parrot_Interp *interpreter;
    /* Get an empty interpreter from system memory */
    interpreter = mem_sys_allocate((UINTVAL)sizeof(struct Parrot_Interp));
    /* Set up the memory allocation system */
    mem_setup_allocator(interpreter);

    /* Initialize interpreter's flags */
    interpreter->flags = flags;

    /* Set up defaults for line/package/file */
    interpreter->current_line = 0;
    interpreter->current_file = NULL;
    interpreter->current_package = NULL;
    
    /* Set up the initial register chunks */
    interpreter->int_reg_base = mem_allocate_aligned(sizeof(struct IRegChunk));
    interpreter->num_reg_base = mem_allocate_aligned(sizeof(struct NRegChunk));
    interpreter->string_reg_base =
            mem_allocate_aligned(sizeof(struct SRegChunk));
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
    
    /* Initialize the inital string register chunk, be sure to
       NULL out the strings because string functions rely
       on NULL strings */
    interpreter->string_reg_base->used = 1;
    interpreter->string_reg_base->free = FRAMES_PER_STR_REG_CHUNK - 1;
    interpreter->string_reg_base->next = NULL;
    interpreter->string_reg_base->prev = NULL;
    Parrot_clear_s(interpreter);
    
    /* Initialize the initial PMC register chunk. Gotta NULL them out,
       too, otherwise we might GC Wrong Things later */
    interpreter->pmc_reg_base->used = 1;
    interpreter->pmc_reg_base->free = FRAMES_PER_PMC_REG_CHUNK - 1;
    interpreter->pmc_reg_base->next = NULL;
    interpreter->pmc_reg_base->prev = NULL;
    Parrot_clear_p(interpreter);
    
    /* Need a user stack */
    new_stack(interpreter, &interpreter->user_stack_base,
              &interpreter->user_stack_top);
    
    /* And a control stack */
    new_stack(interpreter, &interpreter->control_stack_base,
              &interpreter->control_stack_top);

    /* Need an empty stash */
    interpreter->perl_stash = mem_allocate_new_stash();
    
    /* Load the core op func and info tables */
    interpreter->op_lib        = PARROT_CORE_OPLIB_INIT();
    interpreter->op_count      = interpreter->op_lib->op_count;
    interpreter->op_func_table = interpreter->op_lib->op_func_table;
    interpreter->op_info_table = interpreter->op_lib->op_info_table;
    
    /* In case the I/O system needs something */
    PIO_init(interpreter);
    
    /* Done. Return and be done with it */

    interpreter->code = (struct PackFile *)NULL;
    interpreter->profile = (INTVAL *)NULL;

    interpreter->resume_flag   = 0;
    interpreter->resume_offset = 0;

    interpreter->prederef_code = (void **)NULL;

    return interpreter;   
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
