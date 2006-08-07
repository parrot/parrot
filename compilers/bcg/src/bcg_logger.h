#ifndef PARROT_BCG_LOGGER_H_GUARD
#define PARROT_BCG_LOGGER_H_GUARD

#include "bcg.h"

#define MAX_MESSAGE_SIZE 1024
#define BCG_THROW(bcg,excp)   longjmp((bcg)->jump_location, excp);

void bcg_throw_exception(BCG_info * bcg_info, const int code,
                         const char *format, ...);

#endif /* PARROT_BCG_LOGGER_H_GUARD */
