/*
 * $Id$
 * Copyright (C) 2002-2008, The Perl Foundation.
 */

#ifndef PARROT_IMCC_SETS_H_GUARD
#define PARROT_IMCC_SETS_H_GUARD

typedef struct _Set {
   unsigned int   length;
   unsigned char *bmp;
} Set;

/* HEADERIZER BEGIN: compilers/imcc/sets.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void set_add(ARGMOD(Set *s), unsigned int element)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*s);

void set_clear(ARGMOD(Set *s))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*s);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int set_contains(ARGIN(const Set *s), unsigned int element)
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Set* set_copy(ARGIN(const Set *s))
        __attribute__nonnull__(1);

int set_equal(ARGIN(const Set *s1), ARGIN(const Set *s2))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
unsigned int set_first_zero(ARGIN(const Set *s))
        __attribute__nonnull__(1);

void set_free(ARGMOD(Set *s))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*s);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Set * set_intersec(ARGIN(const Set *s1), ARGIN(const Set *s2))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_intersec_inplace(ARGMOD(Set *s1), ARGIN(const Set *s2))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Set* set_make(unsigned int length);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Set* set_make_full(unsigned int length);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Set * set_union(ARGIN(const Set *s1), ARGIN(const Set *s2))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/sets.c */

#endif /* PARROT_IMCC_SETS_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

