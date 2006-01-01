/*
 * math stuff
 */

/*
 * force atan2() to use IEEE behavior
 */

#include <math.h>
#if defined(__GNUC__) && defined(_LIB_VERSION)
    _LIB_VERSION_TYPE _LIB_VERSION = _IEEE_;
#endif
