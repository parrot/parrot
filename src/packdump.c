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

    printf("FIXUP => {\n");

    PackFile_FixupTable_dump(self->fixup_table);

    printf("},\n");

    printf("CONST => [\n");

    PackFile_ConstTable_dump(self->const_table);

    printf("],\n");

    printf("BCODE => [ # %ld bytes", (long)self->byte_code_size);

    for (i = 0; i < self->byte_code_size / sizeof(opcode_t); i++) {
        if (i % 8 == 0) {
            printf("\n    %08lx:  ", (unsigned long)i * sizeof(opcode_t));
        }
        printf("%08lx ", (unsigned long)self->byte_code[i]);
    }

    printf("\n]\n");

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
        fprintf(stderr, "PackFile_ConstTable_dump: self == NULL!\n");
        return;
    }

    for (i = 0; i < self->const_count; i++) {
        printf("    # %ld:\n", (long)i);
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
        printf("    [ 'PFC_NONE', undef ],\n");
        break;

    case PFC_NUMBER:
        printf("    [ 'PFC_NUMBER', %g ],\n", self->number);
        break;

    case PFC_STRING:
        printf("    [ 'PFC_STRING', {\n");
        printf("        FLAGS    => 0x%04lx,\n", (long)self->string->flags);
        printf("        ENCODING => %s,\n", self->string->encoding->name);
        printf("        TYPE     => %s,\n", self->string->type->name);
        printf("        SIZE     => %ld,\n", (long)self->string->bufused);
        /* TODO: Won't do anything reasonable for most encodings */
        printf("        DATA     => '%.*s'\n",
               (int)self->string->bufused, (char *)self->string->bufstart);
        printf("    } ],\n");
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
