
#include "imc.h"

/* XXX */
#define fatal(e, s1, s2) do { \
    fprintf(stderr, "%s: %s", s1, s2); \
    exit(e); \
} while (0)

Set*
set_make (int length)
{
    Set *s = mem_sys_allocate(sizeof(Set));
    s->length = length;
    s->bmp = mem_sys_allocate_zeroed(length/8 + 1);
    return s;
}

Set*
set_make_full (int length)
{
    Set *s = set_make(length);
    int i;
    int bytes = length/8;

    if (bytes)
        memset(s->bmp, 0xff, bytes);
    i = bytes * 8;
    for (; i < length; i++) {
        set_add(s, i);
    }

    return s;
}

void
set_free (Set *s)
{
    mem_sys_free(s->bmp);
    mem_sys_free(s);
}

void
set_clear(Set *s)
{
    memset(s->bmp, 0, s->length/8 +1);
}

Set*
set_copy (Set *s1)
{
    Set *s = set_make(s1->length);

    memcpy(s->bmp, s1->bmp, s->length/8 + 1);
    return s;
}


int
set_equal (Set *s1, Set *s2)
{
    int mask;
    int bytes = s1->length/8;
    if (s1->length != s2->length) {
        fatal(1, "set_equal", "Sets don't have the same length\n");
    }

    if (bytes)
        if (memcmp(s1->bmp, s2->bmp, bytes) != 0)
            return 0;
    if (s1->length % 8 == 0)
        return 1;
    mask = (1 << (s1->length % 8)) - 1;
    if ((s1->bmp[bytes] & mask) != (s2->bmp[bytes] & mask))
        return 0;
    return 1;
}

void
set_add(Set *s, int element)
{
    s->bmp[element >> 3] |= (1 << (element & 7));
}

int
set_contains(Set *s, int element)
{
#ifdef __LCC__
    /* workaround for another lcc bug.. */
    int tmp = (1 << (element & 7));
    return s->bmp[element >> 3] & tmp;
#else
    return s->bmp[element >> 3] & (1 << (element & 7));
#endif
}

Set *
set_union(Set *s1, Set *s2)
{
    int i;
    Set *s = set_make(s1->length);

    if (s1->length != s2->length) {
        fatal(1, "set_union", "Sets don't have the same length\n");
    }
    for (i=0; i< (s1->length/8) + 1; i++) {
        s->bmp[i] = s1->bmp[i] | s2->bmp[i];
    }

    return s;
}



Set *
set_intersec(Set *s1, Set *s2)
{
    int i;
    Set *s = set_make(s1->length);

    if (s1->length != s2->length) {
        fatal(1, "set_intersec", "Sets don't have the same length\n");
    }
    for (i=0; i< (s1->length/8) + 1; i++) {
        s->bmp[i] = s1->bmp[i] & s2->bmp[i];
    }

    return s;
}

void
set_intersec_inplace(Set *s1, Set *s2)
{
    int i;

    if (s1->length != s2->length) {
        fatal(1, "set_intersec_inplace", "Sets don't have the same length\n");
    }

    for (i=0; i< (s1->length/8)+1 ; i++) {
        s1->bmp[i] &= s2->bmp[i];
    }
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
