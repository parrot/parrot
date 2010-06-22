/*
Copyright (C) 2010, Parrot Foundation.
$Id$
*/

#ifndef PARROT_ALARM_H_GUARD
#define PARROT_ALARM_H_GUARD

typedef unsigned int Parrot_alarm_state;

/* HEADERIZER BEGIN: src/alarm.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_alarm_init(void);

PARROT_EXPORT
void Parrot_alarm_set(FLOATVAL when);

PARROT_EXPORT
int Parrot_alarm_check(Parrot_alarm_state* last_serial);

void Parrot_alarm_callback(NULLOK(int sig_number));
void Parrot_alarm_set(FLOATVAL wait);
#define ASSERT_ARGS_Parrot_alarm_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_alarm_set __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_alarm_triggered __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_alarm_callback __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_alarm_set __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/alarm.c */

#endif /* PARROT_ALARM_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
