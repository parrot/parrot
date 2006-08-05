#ifndef PARROT_BCG_PRIVATE_H_GUARD
#define PARROT_BCG_PRIVATE_H_GUARD

#include "parrot/parrot.h"

typedef enum bcg_state_t {
    BCG_STATE_INIT = 0,
    BCG_STATE_IN_CODEGEN = 1 << 0,
    BCG_STATE_IN_SUB = 1 << 1,
    BCG_STATE_IN_OP = 1 << 2,
    BCG_STATE_IN_CALL = 1 << 3
} bcg_state;

#endif /* PARROT_BCG_PRIVATE_H_GUARD */
