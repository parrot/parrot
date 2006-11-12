#ifndef PARROT_BCG_LOGGER_H_GUARD
#define PARROT_BCG_LOGGER_H_GUARD

#include "bcg.h"

#define MAX_MESSAGE_SIZE 1024
#define BCG_THROW(bcg,excp)   longjmp((bcg)->jump_location, excp);

void bcg_throw_exception(BCG_info * bcg_info, const int code,
                         const char *format, ...);

#ifdef WIN32
#if !defined(vsnprintf)
#define vsnprintf _vsnprintf
#endif /* defined(vsnprintf) */
#endif /* WIN32 */

#endif /* PARROT_BCG_LOGGER_H_GUARD */
