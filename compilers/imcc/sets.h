/*
 * Copyright (C) 2002-2009, Parrot Foundation.
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
Set* set_copy(ARGMOD(imc_info_t * imcc), ARGIN(const Set *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

PARROT_PURE_FUNCTION
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
Set * set_intersec(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const Set *s1),
    ARGIN(const Set *s2))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc);

void set_intersec_inplace(ARGMOD(Set *s1), ARGIN(const Set *s2))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Set* set_make(ARGMOD(imc_info_t * imcc), unsigned int length)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(* imcc);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Set* set_make_full(ARGMOD(imc_info_t * imcc), unsigned int length)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(* imcc);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Set * set_union(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const Set *s1),
    ARGIN(const Set *s2))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc);

#define ASSERT_ARGS_set_add __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_set_clear __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_set_contains __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_set_copy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_set_equal __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s1) \
    , PARROT_ASSERT_ARG(s2))
#define ASSERT_ARGS_set_first_zero __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_set_free __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_set_intersec __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(s1) \
    , PARROT_ASSERT_ARG(s2))
#define ASSERT_ARGS_set_intersec_inplace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s1) \
    , PARROT_ASSERT_ARG(s2))
#define ASSERT_ARGS_set_make __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_set_make_full __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_set_union __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(s1) \
    , PARROT_ASSERT_ARG(s2))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/sets.c */

#endif /* PARROT_IMCC_SETS_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

