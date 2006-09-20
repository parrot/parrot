#if !defined(PARROT_STM_BACKEND_H_GAURD)
#define PARROT_STM_BACKEND_H_GAURD

#include <parrot/parrot.h>

#define STM_PROFILE 0

#if STM_PROFILE
void Parrot_STM_merge_profile(Interp *dest, Interp *source);

void Parrot_STM_dump_profile(Interp *);
#endif

struct Parrot_STM_PMC_handle_data;

typedef struct Parrot_STM_PMC_handle_data *Parrot_STM_PMC_handle;

Parrot_STM_PMC_handle Parrot_STM_alloc(Interp *, PMC *);

void Parrot_STM_destroy(Interp *);

void Parrot_STM_start_transaction(Interp *);

PMC *Parrot_STM_read(Interp *, Parrot_STM_PMC_handle);

PMC *Parrot_STM_begin_update(Interp *, Parrot_STM_PMC_handle);

void Parrot_STM_write(Interp *, Parrot_STM_PMC_handle, PMC *);

int Parrot_STM_commit(Interp *);

void Parrot_STM_abort(Interp *);

void Parrot_STM_wait(Interp *);

int Parrot_STM_validate(Interp *);

void Parrot_STM_mark_transaction(Interp *);

void Parrot_STM_mark_pmc_handle(Interp *, Parrot_STM_PMC_handle);

int Parrot_STM_transaction_depth(Interp *);

Parrot_STM_PMC_handle Parrot_thaw_STM_PMC_handle(Interp *interp, IMAGE_IO *io);

void Parrot_freeze_STM_PMC_handle(Interp *interp, IMAGE_IO *io, Parrot_STM_PMC_handle handle);

void *Parrot_STM_extract(Interp *interp);

void Parrot_STM_replay_extracted(Interp *interp, void *);

void Parrot_STM_mark_extracted(Interp *interp, void *);

void Parrot_STM_destroy_extracted(Interp *interp, void *);

#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
