/*
 * itimer stuff
 */

#ifdef PARROT_HAS_SETITIMER

/*
 * Start a system timer with the passed value in milli seconds.
 *
 * The handle is that, what new_sys_timer_ms() returned.
 * We could pass ITIMER_REAL in handle, but for now we ignore it
 * as we are just having one timer.
 */

void
start_sys_timer_ms(void *handle, int ms)
{
    struct itimerval its;
    memset(&its, 0, sizeof(its));
    if (ms) {
	its.it_interval.tv_sec = its.it_value.tv_sec = ms/1000;
	its.it_interval.tv_usec = its.it_value.tv_usec = 1000 *(ms%1000);
    }
    setitimer(ITIMER_REAL, &its, NULL);
}

/* Stop the given timer. */
void
stop_sys_timer_ms(void *handle)
{
    start_sys_timer_ms(handle, 0);
}

/*
 * Return the programmed timer interval or 0 if none for the
 * given timer handle.
 */

int
get_sys_timer_ms(void *handle)
{
    struct itimerval ots;
    getitimer(ITIMER_REAL, &ots);
    return ots.it_interval.tv_sec * 1000 + ots.it_interval.tv_usec/1000;
}

/*
 * Create a new system timer with ~ms resolution.
 * The returned handle is passed to the other timer functions.
 */
void *
new_sys_timer_ms()
{
    return 0;
}

#else
#endif
