/*
 * memalign related stuff
 */

#if defined(PARROT_HAS_POSIX_MEMALIGN)
#include <stdlib.h>

void *
Parrot_memalign(size_t align, size_t size)
{
    void *p;
    int i = posix_memalign(&p, align, size);
    return i == 0 ? p : NULL;
}

#elif defined(PARROT_HAS_MEMALIGN)

#if defined(PARROT_HAS_HEADER_MALLOC)
#include <malloc.h>
#else
#include <stdlib.h>
#endif

void *
Parrot_memalign(size_t align, size_t size)
{
    return memalign(align, size);
}

#endif

void
Parrot_free_memalign(void *p)
{
    free(p);
}
