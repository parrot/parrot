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

int set_contains( NOTNULL(const Set *s), int element )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

Set* set_copy( NOTNULL(Set *s1) )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__
        __attribute__malloc__;

int set_equal( NOTNULL(const Set *s1), NOTNULL(const Set *s2) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int set_first_zero( NOTNULL(const Set *s) )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

void set_free( NOTNULL(Set *s) )
        __attribute__nonnull__(1);

Set * set_intersec( NOTNULL(const Set *s1), NOTNULL(const Set *s2) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__
        __attribute__malloc__;

void set_intersec_inplace( NOTNULL(Set *s1), NOTNULL(const Set *s2) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

Set* set_make( int length )
        __attribute__warn_unused_result__
        __attribute__malloc__;

Set* set_make_full( int length )
        __attribute__warn_unused_result__
        __attribute__malloc__;

Set * set_union( NOTNULL(const Set *s1), NOTNULL(const Set *s2) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__
        __attribute__malloc__;

/* HEADERIZER END: compilers/imcc/sets.c */

#endif /* PARROT_IMCC_SETS_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

