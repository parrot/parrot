/* resources */
#include <assert.h>
#include "parrot/parrot.h"

void
Parrot_go_collect(struct Parrot_Interp *interpreter)
{
    if (interpreter->GC_block_level) {
        return;
    }
    interpreter->collect_runs++;        /* fake it */
}

void *
Parrot_reallocate(struct Parrot_Interp *interpreter, void *from, size_t size)
{
    Buffer *buffer = from;
    void *p;
    size_t oldlen = buffer->buflen;
    p = realloc(buffer->bufstart, size);
    if (size > buffer->buflen)
        memset((char *)p + oldlen, 0, size - oldlen);
    buffer->buflen = size;
    buffer->bufstart = p;
    return p;
}

void *
Parrot_allocate(struct Parrot_Interp *interpreter, void *buffer, size_t size)
{
    Buffer *b = buffer;
    b->bufstart = calloc(1, size);
    b->buflen = size;
    return b;
}

void *
Parrot_reallocate_string(struct Parrot_Interp *interpreter, STRING *str,
                         size_t size)
{
    void *p;
    size_t pad, rsize;
    pad = STRING_ALIGNMENT - 1;
    /* 2 chars string tail, first seems to be clobbered */
    size = ((size + pad + 2) & ~pad) - 2;
    p = realloc(str->bufstart, size + 2);
    str->strstart = str->bufstart = p;
    ((char *)str->bufstart)[size + 1] = 0;
    str->buflen = size;
    return p;
}

void *
Parrot_allocate_string(struct Parrot_Interp *interpreter, STRING *str,
                       size_t size)
{
    void *p = 0;
    size_t pad;
#if 0
    if (size)
#endif
    {
#if 0
        pad = STRING_ALIGNMENT - 1;
        size = ((size + pad + 2) & ~pad) - 2;
#endif
        p = calloc(1, size + 2);
    }
    str->strstart = str->bufstart = p;
    str->buflen = size;
    return str;
}

void
Parrot_initialize_memory_pools(struct Parrot_Interp *interpreter)
{
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
