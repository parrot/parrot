/*
 * Signal handling stuff
 */

#ifdef PARROT_HAS_HEADER_SIGNAL
#  include <signal.h>
/*
 * for now use signal based functions
 */

#  ifndef S_SPLINT_S
Parrot_sighandler_t
Parrot_set_sighandler(int signum, Parrot_sighandler_t handler)
{
    return signal(signum, handler);
}
#  endif
#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
