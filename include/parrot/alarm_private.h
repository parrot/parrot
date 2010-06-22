/*
Copyright (C) 2010, Parrot Foundation.
$Id$
*/

#ifndef PARROT_ALARM_PRIVATE_GUARD_H
#define PARROT_ALARM_PRIVATE_GUARD_H

#include "parrot.h"

typedef struct Parrot_alarm_queue {
    FLOATVAL when;
    int alarm_set;
    struct Parrot_alarm_queue *next;
} Parrot_alarm_queue;

#endif /* PARROT_ALARM_PRIVATE_GUARD_H */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
