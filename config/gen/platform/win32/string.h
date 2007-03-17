#ifndef PLATFORM_WIN32_STRING_H
#  define PLATFORM_WIN32_STRING_H

#  include <string.h>

#  ifdef _MSC_VER
#    if _MSC_VER >= 1400
#      define strdup _strdup
#    endif
#  endif

#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
