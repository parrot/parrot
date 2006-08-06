#ifndef PARROT_BCG_PRIVATE_H_GUARD
#define PARROT_BCG_PRIVATE_H_GUARD

#include "parrot/parrot.h"
#include "bcg.h"

#define BCG_INFO_PRIV(bcg) ((bcg_info_private*)(bcg->private_info))

typedef enum bcg_state_t {
    BCG_STATE_INIT = 0,
    BCG_STATE_IN_CODEGEN = 1 << 0,
    BCG_STATE_IN_SUB = 1 << 1,
    BCG_STATE_IN_OP = 1 << 2,
    BCG_STATE_IN_CALL = 1 << 3
} bcg_state;

typedef struct bcg_info_private_t {
    int state;
} bcg_info_private;

typedef struct bcg_unit_t {
    char *name;
} bcg_unit;

#endif /* PARROT_BCG_PRIVATE_H_GUARD */
