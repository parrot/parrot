#ifndef PARROT_STM_BACKEND_H_GUARD
#define PARROT_STM_BACKEND_H_GUARD

#  include <parrot/parrot.h>

#  define STM_PROFILE 0

struct Parrot_STM_PMC_handle_data;

typedef struct Parrot_STM_PMC_handle_data *Parrot_STM_PMC_handle;

/* HEADERIZER BEGIN: src/stm/backend.c */

void Parrot_freeze_STM_PMC_handle( Interp *interp /*NN*/,
    IMAGE_IO *io /*NN*/,
    Parrot_STM_PMC_handle handle /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void Parrot_STM_abort( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

Parrot_STM_PMC_handle Parrot_STM_alloc( Interp *interp /*NN*/, PMC *pmc )
        __attribute__nonnull__(1);

PMC * Parrot_STM_begin_update( Interp *interp /*NN*/,
    Parrot_STM_PMC_handle handle )
        __attribute__nonnull__(1);

int Parrot_STM_commit( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void Parrot_STM_destroy( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void Parrot_STM_destroy_extracted( Interp *interp /*NN*/,
    void *saved_log_data )
        __attribute__nonnull__(1);

void Parrot_STM_dump_profile( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void * Parrot_STM_extract( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void Parrot_STM_mark_extracted( Interp *interp /*NN*/, void *saved_log_data )
        __attribute__nonnull__(1);

void Parrot_STM_mark_pmc_handle( Interp *interp /*NN*/,
    Parrot_STM_PMC_handle handle )
        __attribute__nonnull__(1);

void Parrot_STM_mark_transaction( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void Parrot_STM_merge_profile( Interp *d /*NN*/, Interp *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PMC * Parrot_STM_read( Interp *interp /*NN*/, Parrot_STM_PMC_handle handle )
        __attribute__nonnull__(1);

void Parrot_STM_replay_extracted( Interp *interp /*NN*/,
    void *saved_log_data )
        __attribute__nonnull__(1);

void Parrot_STM_start_transaction( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

int Parrot_STM_transaction_depth( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

int Parrot_STM_validate( Interp *interp /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

void Parrot_STM_wait( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void Parrot_STM_write( Interp *interp /*NN*/,
    Parrot_STM_PMC_handle handle,
    PMC* new_value )
        __attribute__nonnull__(1);

Parrot_STM_PMC_handle Parrot_thaw_STM_PMC_handle( Interp *interp /*NN*/,
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
