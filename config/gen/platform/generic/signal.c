/*
 * Signal handling stuff
 */

#ifdef PARROT_HAS_HEADER_SIGNAL
#include <signal.h>
/*
 * for now use signal based functions
 */

Parrot_sighandler_t
Parrot_set_sighandler(int signum, Parrot_sighandler_t handler)
{
    return signal(signum, handler);
}
#endif
