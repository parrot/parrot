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

void
PackFile_dump(struct PackFile *self)
{
    size_t i;

    PIO_printf(NULL, "FIXUP => {\n");

    PackFile_FixupTable_dump(self->fixup_table);

    PIO_printf(NULL, "},\n");

    PIO_printf(NULL, "CONST => [\n");

    PackFile_ConstTable_dump(self->const_table);

    PIO_printf(NULL, "],\n");

    PIO_printf(NULL, "BCODE => [ # %ld bytes", (long)self->byte_code_size);

    for (i = 0; i < self->byte_code_size / sizeof(opcode_t); i++) {
        if (i % 8 == 0) {
            PIO_printf(NULL, "\n    %08lx:  ", (unsigned long)i * sizeof(opcode_t));
        }
        PIO_printf(NULL, "%08lx ", (unsigned long)self->byte_code[i]);
    }

    PIO_printf(NULL, "\n]\n");

    return;
}

void
PackFile_FixupTable_dump(struct PackFile_FixupTable *self)
{
    UNUSED(self);
    return;
}

void
PackFile_ConstTable_dump(struct PackFile_ConstTable *self)
{
    opcode_t i;

    if (!self) {
        PIO_eprintf(NULL, "PackFile_ConstTable_dump: self == NULL!\n");
        return;
    }

    for (i = 0; i < self->const_count; i++) {
        PIO_printf(NULL, "    # %ld:\n", (long)i);
        PackFile_Constant_dump(self->constants[i]);
    }

    return;
}

void
PackFile_Constant_dump(struct PackFile_Constant *self)
{
    if (!self) {
        /* TODO: OK to be silent here? */
        return;
    }

    switch (self->type) {
    case PFC_NONE:
        /* TODO: OK to be silent here? */
        PIO_printf(NULL,"    [ 'PFC_NONE', undef ],\n");
        break;

    case PFC_NUMBER:
        PIO_printf(NULL, "    [ 'PFC_NUMBER', %g ],\n", self->number);
        break;

    case PFC_STRING:
        PIO_printf(NULL, "    [ 'PFC_STRING', {\n");
        PIO_printf(NULL, "        FLAGS    => 0x%04lx,\n", (long)self->string->flags);
        PIO_printf(NULL, "        ENCODING => %s,\n", self->string->encoding->name);
        PIO_printf(NULL, "        TYPE     => %s,\n", self->string->type->name);
        PIO_printf(NULL, "        SIZE     => %ld,\n", (long)self->string->bufused);
        /* TODO: Won't do anything reasonable for most encodings */
        PIO_printf(NULL, "        DATA     => '%.*s'\n",
               (int)self->string->bufused, (char *)self->string->strstart);
        PIO_printf(NULL, "    } ],\n");
        break;

    default:
        /* TODO: OK to be silent here? */
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
