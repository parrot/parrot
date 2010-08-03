/* instrument_extern.h
 *  Copyright (C) 2010, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     This header defines as extern functions that are
 *     implemented in Instrument.pmc but used by others.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_INSTRUMENT_EXTERN_H_GUARD
#define PARROT_INSTRUMENT_EXTERN_H_GUARD

extern probe_list_t *fire_callbacks(PARROT_INTERP, probe_list_t *callbacks, PMC *data, PMC *instr);
extern PMC *instrument_pack_params(PARROT_INTERP, const char *format, ...);

/* Linked List operations */
extern probe_list_t *probe_list_create_list(PARROT_INTERP);
extern probe_node_t *probe_list_create_node(PARROT_INTERP);
extern void          probe_list_delete_list(PARROT_INTERP, probe_list_t *list);
extern void          probe_list_delete_node(PARROT_INTERP, probe_node_t *node);
extern void          probe_list_push(PARROT_INTERP, probe_list_t *list, PMC *item);
extern PMC          *probe_list_pop(PARROT_INTERP, probe_list_t *list);
extern PMC          *probe_list_remove(PARROT_INTERP, probe_list_t *list, probe_node_t *node);
extern probe_node_t *probe_list_find(PARROT_INTERP, probe_list_t *list, PMC *val);
extern void          probe_list_append(PARROT_INTERP, probe_list_t *dest, probe_list_t *src);

#endif /* PARROT_INSTRUMENT_EXTERN_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */