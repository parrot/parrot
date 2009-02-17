/* Copyright (C) 2003-2008, Parrot Foundation.  */

/*
 * exec_dep.h
 *
 * SVN Info
 *    $Id$
 * Overview:
 *    i386 dependent functions to emit an executable.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.6.9
 * Notes:
 * References:
 */

#ifndef PARROT_I386_EXEC_DEP_H_GUARD
#define PARROT_I386_EXEC_DEP_H_GUARD

/* HEADERIZER BEGIN: src/exec_dep.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void offset_fixup(ARGMOD(Parrot_exec_objfile_t *obj))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*obj);

void Parrot_exec_cpcf_op(ARGMOD(Parrot_jit_info_t *jit_info), PARROT_INTERP)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*jit_info);

void Parrot_exec_normal_op(
     ARGMOD(Parrot_jit_info_t *jit_info),
    PARROT_INTERP)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*jit_info);

void Parrot_exec_normal_op(
    ARGMOD(Parrot_jit_info_t *jit_info),
    PARROT_INTERP)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*jit_info);

void Parrot_exec_restart_op(
    ARGMOD(Parrot_jit_info_t *jit_info),
    PARROT_INTERP)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*jit_info);

#define ASSERT_ARGS_offset_fixup __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(obj)
#define ASSERT_ARGS_Parrot_exec_cpcf_op __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(jit_info) \
    || PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_exec_normal_op __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(jit_info) \
    || PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_exec_normal_op __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(jit_info) \
    || PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_exec_restart_op __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(jit_info) \
    || PARROT_ASSERT_ARG(interp)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/exec_dep.c */

#endif /* PARROT_I386_EXEC_DEP_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
