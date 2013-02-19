/*
Copyright (C) 2010, Parrot Foundation.
$Id$
*/

#ifndef PARROT_ALARM_H_GUARD
#define PARROT_ALARM_H_GUARD

/* HEADERIZER BEGIN: src/alarm.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
int Parrot_alarm_check(ARGMOD(UINTVAL* last_serial))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(* last_serial);

PARROT_EXPORT
void Parrot_alarm_set(FLOATVAL when);

PARROT_EXPORT
void Parrot_alarm_wait_for_next_alarm(PARROT_INTERP);

void Parrot_alarm_init(void);
#define ASSERT_ARGS_Parrot_alarm_check __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(last_serial))
#define ASSERT_ARGS_Parrot_alarm_set __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_alarm_wait_for_next_alarm \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_alarm_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/alarm.c */

#endif /* PARROT_ALARM_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
