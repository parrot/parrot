#ifndef PARROT_BCG_BCG_H_GUARD
#define PARROT_BCG_BCG_H_GUARD

#include "parrot/parrot.h"

#define BCG_TRY(a)  do{ a->error_code=0; switch(setjmp(a->jump_location)){ case 0:
#define BCG_CATCH(x)     break; case x:
#define BCG_END_TRY      } }while(0)
#define BCG_THROW(a,b)  longjmp(a->jump_location,b);
#define BCG_EXCEPTION 1

typedef enum bcg_state {
    BCG_STATE_INIT = 0x0,
    BCG_STATE_IN_CODEGEN = 0x1,
    BCG_STATE_IN_SUB = 0x2,
    BCG_STATE_IN_OP = 0x4,
    BCG_STATE_IN_CALL = 0x8
} BCGState;

typedef struct bcg_t {
    int state;                  /* The byte code generation state. */
    Interp *interpreter;        /* Reference to parrot interpreter. */
    UINTVAL error_code;         /* The BCG error code. */
    char *error_msg;            /* Error message. */
    jmp_buf jump_location;      /* The loaction to jump to when exception occurs */
} BCG;

/* BCG creation and destruction functions. */
BCG *BCG_create(void);
void BCG_destroy(BCG *bcg);

/* BCG state management functions. */
void BCG_set_state(BCG *bcg, BCGState state);
void BCG_unset_state(BCG *bcg, BCGState state);
int BCG_in_state(BCG *bcg, BCGState state);

/* Byte Code Generation API. */
void BCG_start_code_gen(BCG *bcg);
void BCG_end_code_gen(BCG *bcg);
void BCG_start_sub(BCG *bcg, char *subName, char *pragma);
void BCG_end_sub(BCG *bcg);
void BCG_start_call(BCG *bcg, char *subName);
void BCG_end_call(BCG *bcg);
void BCG_start_op(BCG *bcg, char *op);
void BCG_end_op(BCG *bcg);
void BCG_var(BCG *bcg, char *varName, char varType);
void BCG_val(BCG *bcg, char *val);
void BCG_label(BCG *bcg, char *label);

/*TODO: Move this to appropriate header file*/
void BCG_throw_exception(BCG *bcg, char *message);

#endif /* PARROT_BCG_BCG_H_GUARD */
