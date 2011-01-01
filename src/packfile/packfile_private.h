/*
Copyright (C) 2001-2010, Parrot Foundation.
This program is free software. It is subject to the same license as
Parrot itself.

=head1 NAME

src/packfile/packfile_private.h - private header file for the packfile subsystem

=head1 DESCRIPTION

This is a private header file for the packfile subsystem. It contains definitions
that are only for use in the packfile and don't need to be included in the rest of
Parrot.
*/



/* HEADERIZER BEGIN: src/packfile/execute.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void do_sub_pragmas(PARROT_INTERP,
    ARGIN(PackFile_ByteCode *self),
    pbc_action_enum_t action,
    ARGIN_NULLOK(PMC *eval_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_do_sub_pragmas __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packfile/execute.c */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
