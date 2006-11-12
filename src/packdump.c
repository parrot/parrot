/*
Copyright (C) 2001-2005, The Perl Foundation.
This program is free software. It is subject to the same license as
Parrot itself.
$Id$

=head1 NAME

src/packdump.c - Functions for dumping packfile structures

=head1 DESCRIPTION

This is only used by the PBC dumper C<pdump>.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/packfile.h"

/*
** FIXME: this should also be segmentized.
** For now just remove some warnings
*/

void PackFile_ConstTable_dump(Interp *,
                                     struct PackFile_ConstTable *);
static void PackFile_Constant_dump(Interp *,
                                   struct PackFile_Constant *);
void PackFile_Fixup_dump(Interp *,
                         struct PackFile_FixupTable *ft);

/*

=item C<void
PackFile_ConstTable_dump(Interp *interp,
                         struct PackFile_ConstTable *self)>

Dumps the constant table C<self>.

=cut

*/

void
PackFile_ConstTable_dump(Interp *interp,
                         struct PackFile_ConstTable *self)
{
    opcode_t i;

    for (i = 0; i < self->const_count; i++) {
        PIO_printf(interp, "    # %ld:\n", (long)i);
        PackFile_Constant_dump(interp, self->constants[i]);
    }
}

/*

=item C<void
PackFile_Constant_dump(Interp *interp,
                       struct PackFile_Constant *self)>

Dumps the constant C<self>.

=cut

*/

void
PackFile_Constant_dump(Interp *interp,
                       struct PackFile_Constant *self)
{
    switch (self->type) {

    case PFC_NUMBER:
        PIO_printf(interp, "    [ 'PFC_NUMBER', %g ],\n", self->u.number);
        break;

    case PFC_STRING:
        PIO_printf(interp, "    [ 'PFC_STRING', {\n");
        PIO_printf(interp, "        FLAGS    => 0x%04lx,\n",
                   (long)PObj_get_FLAGS(self->u.string));
        PIO_printf(interp, "        CHARSET  => %ld,\n",
                   self->u.string->charset);
        PIO_printf(interp, "        SIZE     => %ld,\n",
                   (long)self->u.string->bufused);
        /* TODO: Won't do anything reasonable for most encodings */
        PIO_printf(interp, "        DATA     => '%.*s'\n",
                   (int)self->u.string->bufused,
                   (char *)self->u.string->strstart);
        PIO_printf(interp, "    } ],\n");
        break;

    case PFC_KEY:
        PIO_printf(interp, "    [ 'PFC_KEY', {\n");
        PIO_printf(interp, "    ??? TODO \n");
        PIO_printf(interp, "    } ],\n");
        break;
    case PFC_PMC:
        PIO_printf(interp, "    [ 'PFC_PMC', {\n");
        {
            PMC *pmc = self->u.key;
            parrot_sub_t sub;
            STRING *a_key = const_string(interp, "(keyed)");
            STRING *null = const_string(interp, "(null)");
            opcode_t *code_start =
                interp->code->base.data;
            switch (pmc->vtable->base_type) {
                case enum_class_Sub:
                case enum_class_Coroutine:
                    sub = PMC_sub(pmc);
                    PIO_printf(interp,
                            "\tclass => %Ss,\n"
                            "\tstart_offs => %d,\n"
                            "\tend_offs => %d,\n"
                            "\tname => '%Ss',\n"
                            "\tnamespace => '%Ss'\n",
                            pmc->vtable->whoami,
                            sub->start_offs,
                            sub->end_offs,
                            sub->name,
                            sub->namespace ?
                                (sub->namespace->vtable->base_type ==
                                    enum_class_String ?
                                PMC_str_val(sub->namespace) : a_key) :
                                null
                            );
                    break;
                default:
                    PIO_printf(interp, "\tunknown PMC\n");
            }
        }
        PIO_printf(interp, "    } ],\n");
        break;
    default:
        PIO_printf(interp, "    [ 'PFC_\?\?\?', type '0x%x' ],\n",
                self->type);
        break;
    }
}

/*

=item C<void
PackFile_Fixup_dump(Interp *interp,
                    struct PackFile_FixupTable *ft)>

Dumps the fix-up table C<ft>.

=cut

*/

void
PackFile_Fixup_dump(Interp *interp,
                    struct PackFile_FixupTable *ft)
{
    opcode_t i;

    for (i = 0; i < ft->fixup_count; i++) {
        PIO_printf(interp,"\t#%d\n", (int) i);
        switch (ft->fixups[i]->type) {
            case enum_fixup_label:
            case enum_fixup_sub:
                PIO_printf(interp,
                        "\ttype => %d offs => %8d name => '%s',\n",
                        (int)ft->fixups[i]->type,
                        (int)ft->fixups[i]->offset,
                        ft->fixups[i]->name);
                    break;
            default:
                PIO_printf(interp,"\ttype => %d ???,\n",
                        (int) ft->fixups[i]->type);
                break;
        }
    }
}

/*

=back

=head1 SEE ALSO

F<src/pdump.c>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
