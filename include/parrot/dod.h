/* dod.h 
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Handles dead object destruction of the various headers
 *  Data Structure and Algorithms:
 *     
 *  History:
 *     Initial version by Mike Lambert on 2002.05.27
 *  Notes:
 *  References:
 */
 
#if !defined(PARROT_DOD_H_GUARD)
#define PARROT_DOD_H_GUARD

#include "parrot/parrot.h"

void Parrot_do_dod_run(struct Parrot_Interp *);
PMC *trace_system_stack(struct Parrot_Interp *, PMC *);

/* Functions needed for custom DOD routines */

PMC * mark_used(PMC *used_pmc, PMC *current_end_of_list);

static void
buffer_lives(Buffer *buffer)
{
    buffer->flags |= BUFFER_live_FLAG;
}


#endif /* PARROT_DOD_H */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
