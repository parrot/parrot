/*
 * Copyright (C) 2002-2007, The Perl Foundation.
 */

#ifndef PARROT_IMCC_SETS_H_GUARD
#define PARROT_IMCC_SETS_H_GUARD

typedef struct _Set {
   int length;
   unsigned char* bmp;
} Set;

/* HEADERIZER BEGIN: compilers/imcc/sets.c */

void set_add( NOTNULL(Set *s), int element )
        __attribute__nonnull__(1);

void set_clear( NOTNULL(Set *s) )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int set_contains( NOTNULL(const Set *s), int element )
        __attribute__nonnull__(1);

PARROT_MALLOC
Set* set_copy( NOTNULL(Set *s) )
        __attribute__nonnull__(1);

int set_equal( NOTNULL(const Set *s1), NOTNULL(const Set *s2) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int set_first_zero( NOTNULL(const Set *s) )
        __attribute__nonnull__(1);

void set_free( NOTNULL(Set *s) )
        __attribute__nonnull__(1);

PARROT_MALLOC
Set * set_intersec( NOTNULL(const Set *s1), NOTNULL(const Set *s2) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void set_intersec_inplace( NOTNULL(Set *s1), NOTNULL(const Set *s2) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_MALLOC
Set* set_make( int length );

PARROT_MALLOC
Set* set_make_full( int length );

PARROT_MALLOC
Set * set_union( NOTNULL(const Set *s1), NOTNULL(const Set *s2) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: compilers/imcc/sets.c */

#endif /* PARROT_IMCC_SETS_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

