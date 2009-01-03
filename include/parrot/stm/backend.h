/*
 * $Id$
 * Copyright (C) 2006-2007, The Perl Foundation
 */

#ifndef PARROT_STM_BACKEND_H_GUARD
#define PARROT_STM_BACKEND_H_GUARD

#  include <parrot/parrot.h>

#  define STM_PROFILE 0

struct Parrot_STM_PMC_handle_data;

typedef struct Parrot_STM_PMC_handle_data *Parrot_STM_PMC_handle;

/* HEADERIZER BEGIN: src/stm/backend.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_freeze_STM_PMC_handle(PARROT_INTERP,
    ARGMOD(IMAGE_IO *io),
    ARGIN(Parrot_STM_PMC_handle handle))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*io);

void Parrot_STM_abort(PARROT_INTERP)
        __attribute__nonnull__(1);

Parrot_STM_PMC_handle Parrot_STM_alloc(PARROT_INTERP,
    ARGIN_NULLOK(PMC *pmc))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC * Parrot_STM_begin_update(PARROT_INTERP, Parrot_STM_PMC_handle handle)
        __attribute__nonnull__(1);

int Parrot_STM_commit(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_STM_destroy(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_STM_destroy_extracted(SHIM_INTERP,
    ARGMOD_NULLOK(void *saved_log_data))
        FUNC_MODIFIES(*saved_log_data);

void Parrot_STM_dump_profile(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
void * Parrot_STM_extract(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_STM_mark_extracted(PARROT_INTERP,
    ARGMOD_NULLOK(void *saved_log_data))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*saved_log_data);

void Parrot_STM_mark_pmc_handle(PARROT_INTERP, Parrot_STM_PMC_handle handle)
        __attribute__nonnull__(1);

void Parrot_STM_mark_transaction(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_STM_merge_profile(ARGOUT(Interp *d), ARGOUT(Interp *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*d)
        FUNC_MODIFIES(*s);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_STM_read(PARROT_INTERP, Parrot_STM_PMC_handle handle)
        __attribute__nonnull__(1);

void Parrot_STM_replay_extracted(PARROT_INTERP,
    ARGMOD_NULLOK(void *saved_log_data))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*saved_log_data);

void Parrot_STM_start_transaction(PARROT_INTERP)
        __attribute__nonnull__(1);

int Parrot_STM_transaction_depth(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
int Parrot_STM_validate(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_STM_wait(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_STM_write(PARROT_INTERP,
    Parrot_STM_PMC_handle handle,
    ARGIN_NULLOK(PMC* new_value))
        __attribute__nonnull__(1);

Parrot_STM_PMC_handle Parrot_thaw_STM_PMC_handle(PARROT_INTERP,
    ARGIN(IMAGE_IO *io))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_freeze_STM_PMC_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(io) \
    || PARROT_ASSERT_ARG(handle)
#define ASSERT_ARGS_Parrot_STM_abort __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_alloc __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_begin_update __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_commit __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_destroy_extracted __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_Parrot_STM_dump_profile __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_extract __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_mark_extracted __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_mark_pmc_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_mark_transaction __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_merge_profile __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(d) \
    || PARROT_ASSERT_ARG(s)
#define ASSERT_ARGS_Parrot_STM_read __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_replay_extracted __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_start_transaction __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_transaction_depth __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_validate __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_wait __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_STM_write __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_thaw_STM_PMC_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(io)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/stm/backend.c */

#endif /* PARROT_STM_BACKEND_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
