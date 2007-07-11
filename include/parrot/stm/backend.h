#ifndef PARROT_STM_BACKEND_H_GUARD
#define PARROT_STM_BACKEND_H_GUARD

#  include <parrot/parrot.h>

#  define STM_PROFILE 0

struct Parrot_STM_PMC_handle_data;

typedef struct Parrot_STM_PMC_handle_data *Parrot_STM_PMC_handle;

/* HEADERIZER BEGIN: src/stm/backend.c */

void Parrot_freeze_STM_PMC_handle( PARROT_INTERP,
    IMAGE_IO *io /*NN*/,
    Parrot_STM_PMC_handle handle /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void Parrot_STM_abort( PARROT_INTERP )
        __attribute__nonnull__(1);

Parrot_STM_PMC_handle Parrot_STM_alloc( PARROT_INTERP, PMC *pmc )
        __attribute__nonnull__(1);

PMC * Parrot_STM_begin_update( PARROT_INTERP, Parrot_STM_PMC_handle handle )
        __attribute__nonnull__(1);

int Parrot_STM_commit( PARROT_INTERP )
        __attribute__nonnull__(1);

void Parrot_STM_destroy( PARROT_INTERP )
        __attribute__nonnull__(1);

void Parrot_STM_destroy_extracted( PARROT_INTERP, void *saved_log_data )
        __attribute__nonnull__(1);

void Parrot_STM_dump_profile( PARROT_INTERP )
        __attribute__nonnull__(1);

void * Parrot_STM_extract( PARROT_INTERP )
        __attribute__nonnull__(1);

void Parrot_STM_mark_extracted( PARROT_INTERP, void *saved_log_data )
        __attribute__nonnull__(1);

void Parrot_STM_mark_pmc_handle( PARROT_INTERP, Parrot_STM_PMC_handle handle )
        __attribute__nonnull__(1);

void Parrot_STM_mark_transaction( PARROT_INTERP )
        __attribute__nonnull__(1);

void Parrot_STM_merge_profile( Interp *d /*NN*/, Interp *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PMC * Parrot_STM_read( PARROT_INTERP, Parrot_STM_PMC_handle handle )
        __attribute__nonnull__(1);

void Parrot_STM_replay_extracted( PARROT_INTERP, void *saved_log_data )
        __attribute__nonnull__(1);

void Parrot_STM_start_transaction( PARROT_INTERP )
        __attribute__nonnull__(1);

int Parrot_STM_transaction_depth( PARROT_INTERP )
        __attribute__nonnull__(1);

int Parrot_STM_validate( PARROT_INTERP )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

void Parrot_STM_wait( PARROT_INTERP )
        __attribute__nonnull__(1);

void Parrot_STM_write( PARROT_INTERP,
    Parrot_STM_PMC_handle handle,
    PMC* new_value )
        __attribute__nonnull__(1);

Parrot_STM_PMC_handle Parrot_thaw_STM_PMC_handle( PARROT_INTERP,
    IMAGE_IO *io /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/stm/backend.c */

#endif /* PARROT_STM_BACKEND_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
