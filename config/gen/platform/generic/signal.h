/*
 * $Id$
 * Copyright (C) 2004-2007, The Perl Foundation.
 */

#ifndef PARROT_PLATFORM_GENERIC_SIGNAL_H_GUARD
#define PARROT_PLATFORM_GENERIC_SIGNAL_H_GUARD
/*
 * Signal handling stuff
 */

#if defined(PARROT_HAS_HEADER_SIGNAL) && defined(PARROT_HAS_HEADER_SYSTYPES)
#  include <signal.h>
#  include <sys/types.h>
#  define DUMPCORE() raise(SIGQUIT); exit(EXIT_FAILURE);
#endif

#ifdef PARROT_HAS_HEADER_SIGNAL
#  undef Parrot_set_sighandler
#  ifdef PARROT_HAS___SIGHANDLER_T
#    ifdef S_SPLINT_S
    typedef void (*__sighandler_t)(int);
#    endif
    typedef __sighandler_t Parrot_sighandler_t;
#  else
    typedef void (*Parrot_sighandler_t) (int);
#  endif /* PARROT_HAS___SIGHANDLER_T */

    Parrot_sighandler_t Parrot_set_sighandler(int s, Parrot_sighandler_t f);
#endif /* PARROT_HAS_HEADER_SIGNAL */

#endif /* PARROT_PLATFORM_GENERIC_SIGNAL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
