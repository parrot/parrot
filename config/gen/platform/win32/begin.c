/*
 * Copyright (C) 2004-2010, Parrot Foundation.
 */

#include <windows.h>

#ifdef __MINGW32__
#  include <w32api.h>
#  if WINVER < Windows2000
#    error Minimum requirement for Parrot on Windows is Windows 2000 - might want to check windef.h
#  endif
#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
