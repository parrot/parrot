/*
Copyright (C) 2010, Parrot Foundation.
$Id$
*/

#ifndef PARROT_ALARM_PRIVATE_H_GUARD
#define PARROT_ALARM_PRIVATE_H_GUARD

#include "parrot.h"

typedef struct Parrot_alarm_queue {
    FLOATVAL when;
    struct Parrot_alarm_queue *next;
} Parrot_alarm_queue;

#endif /* PARROT_ALARM_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
