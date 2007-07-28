
#include "imc.h"
#include "sets.h"

/* HEADERIZER HFILE: compilers/imcc/sets.h */

/* XXX */
#define fatal(e, s1, s2) do { \
    fprintf(stderr, "%s: %s", s1, s2); \
    exit(e); \
} while (0)

#define NUM_BYTES(length) ((length / 8) + 1)

PARROT_MALLOC
Set*
set_make(int length)
{
    Set * const s = mem_allocate_typed(Set);
    s->length     = length;
    s->bmp        = mem_sys_allocate_zeroed(NUM_BYTES(length));
    return s;
}

PARROT_MALLOC
Set*
set_make_full(int length)
{
    Set * const s   = set_make(length);
    const int bytes = NUM_BYTES(length);
    int i;

    if (bytes)
        memset(s->bmp, 0xff, bytes);

    return s;
}

void
set_free(NOTNULL(Set *s))
{
    if (s->bmp)
        mem_sys_free(s->bmp);
    mem_sys_free(s);
}

void
set_clear(NOTNULL(Set *s))
{
    memset(s->bmp, 0, NUM_BYTES(s->length));
}

PARROT_MALLOC
Set*
set_copy(NOTNULL(Set *s))
{
    Set * const d = set_make(s->length);

    memcpy(d->bmp, s->bmp, NUM_BYTES(d->length));
    return d;
}


int
set_equal(NOTNULL(const Set *s1), NOTNULL(const Set *s2))
{
    int mask;
    const int bytes = s1->length / 8;

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

    for (i=0; i < NUM_BYTES(s1->length); i++) {
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

    for (i=0; i < NUM_BYTES(s1->length); i++) {
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

    for (i=0; i < NUM_BYTES(s1->length); i++) {
        s1->bmp[i] &= s2->bmp[i];
    }
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
