#ifndef PARROT_BCG_H_GUARD
#define PARROT_BCG_H_GUARD

#define PARROT_IN_EXTENSION
#include "parrot/parrot.h"

#define BCG_TRY(bcg_info)  do { \
                             (bcg_info)->error_code=0; \
                             switch (setjmp((bcg_info)->jump_location)) { \
                               case 0:
#define BCG_CATCH(excp)          break; \
                               case excp:
#define BCG_END_TRY          } \
                          } while (0)
#define BCG_EXCEPTION 1

typedef struct bcg_info_t {
    Interp *interp;             /* Reference to parrot interpreter. */
    int error_code;             /* The BCG error code. */
    char *error_msg;            /* Error message. */
    jmp_buf jump_location;      /* The loaction to jump on exception . */
    void *private_info;         /* Private BCG information. */
} BCG_info;

/* BCG_info creation and destruction functions. */
PARROT_DYNEXT_EXPORT BCG_info *BCG_create(void);
PARROT_DYNEXT_EXPORT void BCG_destroy(BCG_info * bcg_info);

/* Byte Code Generation API. */
PARROT_DYNEXT_EXPORT void BCG_start_code_gen(BCG_info * bcg_info);
PARROT_DYNEXT_EXPORT void BCG_end_code_gen(BCG_info * bcg_info);
PARROT_DYNEXT_EXPORT void BCG_start_sub(BCG_info * bcg_info, char *sub_name, char *pragma);
PARROT_DYNEXT_EXPORT void BCG_end_sub(BCG_info * bcg_info);
PARROT_DYNEXT_EXPORT void BCG_start_call(BCG_info * bcg_info, char *sub_name);
PARROT_DYNEXT_EXPORT void BCG_end_call(BCG_info * bcg_info);
PARROT_DYNEXT_EXPORT void BCG_start_op(BCG_info * bcg_info, char *op);
PARROT_DYNEXT_EXPORT void BCG_end_op(BCG_info * bcg_info);
PARROT_DYNEXT_EXPORT void BCG_var(BCG_info * bcg_info, char *var_name, char var_type);
PARROT_DYNEXT_EXPORT void BCG_val(BCG_info * bcg_info, char *val, char val_type);
PARROT_DYNEXT_EXPORT void BCG_label(BCG_info * bcg_info, char *label);

/* Functions to manipulate the internals of BCG_info structure. */
//void BCG_set_interpreter(BCG_info *bcg_info, Interp *interp);
//char *BCG_get_error_message(BCG_info *bcg_info);
//int BCG_get_error_code(BCG_info *bcg_info);

PARROT_DYNEXT_EXPORT void BCG_print_pasm(BCG_info *bcg_info);
#endif /* PARROT_BCG_H_GUARD */
