
#include "imc.h"
#include "sets.h"

/* HEADERIZER HFILE: compilers/imcc/sets.h */

/* XXX */
#define fatal(e, s1, s2) do { \
    fprintf(stderr, "%s: %s", s1, s2); \
    exit(e); \
} while (0)

PARROT_MALLOC
Set*
set_make(int length)
{
    Set * const s = mem_sys_allocate(sizeof (Set));
    s->length = length;
    s->bmp = mem_sys_allocate_zeroed(length/8 + 1);
    return s;
}

PARROT_MALLOC
Set*
set_make_full(int length)
{
    Set * const s = set_make(length);
    int i;
    const int bytes = length/8;

    if (bytes)
        memset(s->bmp, 0xff, bytes);
    i = bytes * 8;
    for (; i < length; i++) {
        set_add(s, i);
    }

    return s;
}

void
set_free(NOTNULL(Set *s))
{
    mem_sys_free(s->bmp);
    mem_sys_free(s);
}

void
set_clear(NOTNULL(Set *s))
{
    memset(s->bmp, 0, s->length/8 +1);
}

PARROT_MALLOC
Set*
set_copy(NOTNULL(Set *s1))
{
    Set * const s = set_make(s1->length);

    memcpy(s->bmp, s1->bmp, s->length/8 + 1);
    return s;
}


int
set_equal(NOTNULL(const Set *s1), NOTNULL(const Set *s2))
{
    int mask;
    const int bytes = s1->length/8;

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
set_add(NOTNULL(Set *s), int element)
{
    s->bmp[element >> 3] |= (1 << (element & 7));
}

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int
set_first_zero(NOTNULL(const Set *s))
{
    int i;
    for (i = 0; i < s->length; ++i)
        if (!set_contains(s, i))
            return i;
    return s->length;
}

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int
set_contains(NOTNULL(const Set *s), int element)
{
#ifdef __LCC__
    /* workaround for another lcc bug.. */
    const int tmp = (1 << (element & 7));
    return s->bmp[element >> 3] & tmp;
#else
    return s->bmp[element >> 3] & (1 << (element & 7));
#endif
}

PARROT_MALLOC
Set *
set_union(NOTNULL(const Set *s1), NOTNULL(const Set *s2))
{
    int i;
    Set * const s = set_make(s1->length);

    if (s1->length != s2->length) {
        fatal(1, "set_union", "Sets don't have the same length\n");
    }
    for (i=0; i< (s1->length/8) + 1; i++) {
        s->bmp[i] = s1->bmp[i] | s2->bmp[i];
    }

    return s;
}



PARROT_MALLOC
Set *
set_intersec(NOTNULL(const Set *s1), NOTNULL(const Set *s2))
{
    int i;
    Set * const s = set_make(s1->length);

    if (s1->length != s2->length) {
        fatal(1, "set_intersec", "Sets don't have the same length\n");
    }
    for (i=0; i< (s1->length/8) + 1; i++) {
        s->bmp[i] = s1->bmp[i] & s2->bmp[i];
    }

    return s;
}

void
set_intersec_inplace(NOTNULL(Set *s1), NOTNULL(const Set *s2))
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
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
