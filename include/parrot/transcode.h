/* transcode.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api header for the transcoding subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_TRANSCODE_H_GUARD)
#define PARROT_TRANSCODE_H_GUARD

#include "parrot/parrot.h"

typedef STRING* (*transcode_t)(struct Parrot_Interp *interpreter, STRING* from, STRING* to);

VAR_SCOPE transcode_t Parrot_transcode_table[enc_max][enc_max];

void
transcode_init(void);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
