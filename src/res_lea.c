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

/*
 * COWable objects (strings or Buffers) use an int at bufstart
 * for refcounting in DOD
 * bufstart is incremented by that int
 */
void *
Parrot_reallocate(struct Parrot_Interp *interpreter, void *from, size_t size)
{
    Buffer * buffer = from;
    void *p;
    size_t oldlen = buffer->buflen;
    if (!buffer->bufstart) {
        buffer->bufstart = calloc(1, size + sizeof(int));
        LVALUE_CAST(int *, buffer->bufstart)++;
    }
    else {
        if (!size) {    /* realloc(3) does free, if size == 0 here */
            return buffer->bufstart;    /* do nothing */
        }
        p =  realloc((int*)buffer->bufstart - 1, size + sizeof(int));
        *(LVALUE_CAST(int *, p)++) = 0;
        if (size > buffer->buflen)
            memset((char*)p + oldlen, 0, size - oldlen);
        buffer->bufstart = p;
    }
    buffer->buflen = size;
    return buffer->bufstart;
}

void *
Parrot_allocate(struct Parrot_Interp *interpreter, void *buffer, size_t size)
{
    Buffer * b = buffer;
    b->bufstart = malloc(size + sizeof(int));
    *(LVALUE_CAST(int *, b->bufstart)++) = 0;
    b->buflen = size;
    return b;
}

void *
Parrot_allocate_zeroed(struct Parrot_Interp *interpreter, void *buffer,
        size_t size)
{
    Buffer * b = buffer;
    b->bufstart = calloc(1, size + sizeof(int));
    *(LVALUE_CAST(int *, b->bufstart)++) = 0;  /*   *( (int*) b->bufstart ++ ) = 0 */
    b->buflen = size;
    return b;
}


void *
Parrot_reallocate_string(struct Parrot_Interp *interpreter, STRING *str,
                         size_t size)
{
    void *p;
    size_t pad;
    if (!str->bufstart)
        Parrot_allocate_string(interpreter, str, size);
    else if (size) {
        pad = STRING_ALIGNMENT - 1;
        size = ((size + pad + sizeof(int)) & ~pad);
        p = realloc((char *)((int*)str->bufstart - 1), size);
        str->bufstart = str->strstart = (char *)p + sizeof(int);
        /* usable size at bufstart */
        str->buflen = size - sizeof(int);
    }
    return str->strstart;
}

void *
Parrot_allocate_string(struct Parrot_Interp *interpreter, STRING *str,
                       size_t size)
{
    void *p;
    size_t pad;
    pad = STRING_ALIGNMENT - 1;
    size = ((size + pad + sizeof(int)) & ~pad);
    p = calloc(1, size);
    *(int*)p = 0;
    str->bufstart = str->strstart = (char *)p + sizeof(int);
    str->buflen = size - sizeof(int);
    return str;
}

void
Parrot_initialize_memory_pools(struct Parrot_Interp *interpreter)
{
}
void
Parrot_destroy_memory_pools(Interp *interpreter)
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
