/*
** packdump.c
**
** Functions for dumping packfile structures
**
** Copyright (C) 2001-2002 Gregor N. Purdy. All rights reserved.
** This program is free software. It is subject to the same
** license as Parrot itself.
**
** $Id$
*/

#include "parrot/parrot.h"
#include "parrot/packfile.h"

/*
** FIXME: this should also be segmentized.
** For now just remove some warnings
*/

void PackFile_dump(struct Parrot_Interp *, struct PackFile *);
static void PackFile_FixupTable_dump(struct Parrot_Interp *,
                                     struct PackFile_FixupTable *);
static void PackFile_ConstTable_dump(struct Parrot_Interp *,
                                     struct PackFile_ConstTable *);
static void PackFile_Constant_dump(struct Parrot_Interp *,
                                   struct PackFile_Constant *);

void
PackFile_dump(struct Parrot_Interp *interpreter, struct PackFile *self)
{
    size_t i;

    PIO_printf(interpreter, "FIXUP => {\n");

    PackFile_FixupTable_dump(interpreter, self->fixup_table);

    PIO_printf(interpreter, "},\n");

    PIO_printf(interpreter, "CONST => [\n");

    PackFile_ConstTable_dump(interpreter, self->const_table);

    PIO_printf(interpreter, "],\n");

    PIO_printf(interpreter, "BCODE => [ # %ld bytes",
               (long)self->byte_code_size);

    for (i = 0; i < self->byte_code_size / sizeof(opcode_t); i++) {
        if (i % 8 == 0) {
            PIO_printf(interpreter, "\n    %08lx:  ",
                       (unsigned long)i * sizeof(opcode_t));
        }
        PIO_printf(interpreter, "%08lx ", (unsigned long)self->byte_code[i]);
    }

    PIO_printf(interpreter, "\n]\n");

    return;
}

void
PackFile_FixupTable_dump(struct Parrot_Interp *interpreter,
                         struct PackFile_FixupTable *self)
{
    UNUSED(self);
    return;
}

void
PackFile_ConstTable_dump(struct Parrot_Interp *interpreter,
                         struct PackFile_ConstTable *self)
{
    opcode_t i;

    if (!self) {
        PIO_eprintf(interpreter, "PackFile_ConstTable_dump: self == NULL!\n");
        return;
    }

    for (i = 0; i < self->const_count; i++) {
        PIO_printf(interpreter, "    # %ld:\n", (long)i);
        PackFile_Constant_dump(interpreter, self->constants[i]);
    }

    return;
}

void
PackFile_Constant_dump(struct Parrot_Interp *interpreter,
                       struct PackFile_Constant *self)
{
    if (!self) {
        /* TODO: OK to be silent here? */
        return;
    }

    switch (self->type) {
    case PFC_NONE:
        /* TODO: OK to be silent here? */
        PIO_printf(interpreter, "    [ 'PFC_NONE', undef ],\n");
        break;

    case PFC_NUMBER:
        PIO_printf(interpreter, "    [ 'PFC_NUMBER', %g ],\n", self->number);
        break;

    case PFC_STRING:
        PIO_printf(interpreter, "    [ 'PFC_STRING', {\n");
        PIO_printf(interpreter, "        FLAGS    => 0x%04lx,\n",
                   (long)self->string->flags);
        PIO_printf(interpreter, "        ENCODING => %s,\n",
                   self->string->encoding->name);
        PIO_printf(interpreter, "        TYPE     => %s,\n",
                   self->string->type->name);
        PIO_printf(interpreter, "        SIZE     => %ld,\n",
                   (long)self->string->bufused);
        /* TODO: Won't do anything reasonable for most encodings */
        PIO_printf(interpreter, "        DATA     => '%.*s'\n",
                   (int)self->string->bufused, (char *)self->string->strstart);
        PIO_printf(interpreter, "    } ],\n");
        break;

    case PFC_KEY:
        PIO_printf(interpreter, "    [ 'PFC_KEY', {\n");
        PIO_printf(interpreter, "    ??? TODO \n");
        PIO_printf(interpreter, "    } ],\n");
        break;
    default:
        /* TODO: OK to be silent here? no -lt */
        break;
    }

    return;
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
