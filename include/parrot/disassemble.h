/* embed.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
 *  Overview:
 *     This is the Parrot embedding system--the only part of Parrot that
 *     the outside world should see.
 *  References:
 *      embed.c, docs/embed.pod.
 */

#ifndef PARROT_DISASSEMBLE_H_GUARD
#define PARROT_DISASSEMBLE_H_GUARD

#include "parrot/parrot.h"
#include "parrot/core_types.h"  /* types used */
#include "parrot/compiler.h"    /* compiler capabilities */
#include "parrot/config.h"      /* PARROT_VERSION... */
#include "parrot/interpreter.h" /* give us the interpreter flags */
#include "parrot/warnings.h"    /* give us the warnings flags    */

typedef enum {
    enum_DIS_BARE      = 1,
    enum_DIS_HEADER    = 2
} Parrot_disassemble_options;

/* HEADERIZER BEGIN: src/disassemble.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_disassemble(PARROT_INTERP,
    ARGIN_NULLOK(const char *outfile),
    Parrot_disassemble_options options)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_disassemble __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/disassemble.c */


#endif /* PARROT_DISASSEMBLE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
