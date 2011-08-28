/*
Copyright (C) 2001-2009, Parrot Foundation.
This program is free software. It is subject to the same license as
Parrot itself.

=head1 NAME

src/packdump.c - Functions for dumping packfile structures

=head1 DESCRIPTION

This is only used by the PBC dumper C<pbc_dump>.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_key.h"

/* HEADERIZER HFILE: include/parrot/packfile.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void PackFile_Constant_dump_pmc(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *ct),
    ARGIN(PMC *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void PackFile_Constant_dump_str(PARROT_INTERP,
    ARGIN(const STRING *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void pobj_flag_dump(PARROT_INTERP, long flags)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_PackFile_Constant_dump_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ct) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_Constant_dump_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_pobj_flag_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<void PackFile_ConstTable_dump(PARROT_INTERP, const PackFile_ConstTable
*self)>

Dumps the constant table C<self>.

=cut

*/

PARROT_EXPORT
void
PackFile_ConstTable_dump(PARROT_INTERP, ARGIN(const PackFile_ConstTable *self))
{
    ASSERT_ARGS(PackFile_ConstTable_dump)
    opcode_t i;

    for (i = 0; i < self->num.const_count; i++) {
        Parrot_io_printf(interp, "    # %x:\n", (long)i);
        Parrot_io_printf(interp, "    [ 'PFC_NUMBER', %g ],\n", self->num.constants[i]);
    }

    for (i = 0; i < self->str.const_count; i++) {
        Parrot_io_printf(interp, "    # %x:\n", (long)i);
        PackFile_Constant_dump_str(interp, self->str.constants[i]);
    }

    for (i = 0; i < self->pmc.const_count; i++) {
        Parrot_io_printf(interp, "    # %x:\n", (long)i);
        PackFile_Constant_dump_pmc(interp, self, self->pmc.constants[i]);
    }
}

/*

=item C<static void PackFile_Constant_dump(PARROT_INTERP, const
PackFile_ConstTable *ct, const PackFile_Constant *self)>

Dumps the constant C<self>.

=cut

*/

/* [this desperately needs better abstraction, so we're not duplicating the enum
 * PObj_enum definition in the include/parrot/pobj.h file.  -- rgr, 1-Mar-08.]
 */
PARROT_OBSERVER static const char * const flag_bit_names[] =
{
    "private0",
    "private1",
    "private2",
    "private3",
    "private4",
    "private5",
    "private6",
    "private7",
    "is_string",
    "is_PMC",
    "is_shared",
    "constant",
    "external",
    "aligned",
    "sysmem",
    "COW",
    "is_COWable",
    "live",
    "on_free_list",
    "custom_mark",
    "custom_GC",
    "custom_destroy",
    "report",
    "data_is_PMC_array",
    "need_finalize",
    "high_priority_gc",
    "needs_early_gc",
    "is_class",
    "is_object"
};

/*

=item C<static void pobj_flag_dump(PARROT_INTERP, long flags)>

Given a word of flags, generate a dump line of the whole word in hex,
followed by individual bits.

=cut

*/

static void
pobj_flag_dump(PARROT_INTERP, long flags)
{
    ASSERT_ARGS(pobj_flag_dump)
    INTVAL idx = 0;
    int printed_flag_p = 0;

    Parrot_io_printf(interp, "\t\tFLAGS    => 0x%04lx (", flags);
    while (flags) {
        if (flags & 1) {
            if (printed_flag_p)
                Parrot_io_printf(interp, ",");
            Parrot_io_printf(interp, "%s", flag_bit_names[idx]);
            ++printed_flag_p;
        }
        ++idx;
        flags >>= 1;
    }
    Parrot_io_printf(interp, ")\n");
}


/*

=item C<static void PackFile_Constant_dump_str(PARROT_INTERP, const STRING
*self)>

Print the representation of a string constant.

=cut

*/

static void
PackFile_Constant_dump_str(PARROT_INTERP, ARGIN(const STRING *self))
{
    ASSERT_ARGS(PackFile_Constant_dump_str)

    Parrot_io_printf(interp, "    [ 'PFC_STRING', {\n");
    pobj_flag_dump(interp, (long)PObj_get_FLAGS(self));
    Parrot_io_printf(interp, "        ENCODING => %s,\n", self->encoding->name);
    Parrot_io_printf(interp, "        SIZE     => %ld,\n", self->bufused);
    Parrot_io_printf(interp, "        DATA     => \"%Ss\"\n",
            Parrot_str_escape(interp, self));
    Parrot_io_printf(interp, "    } ],\n");
}


/*

=item C<static void PackFile_Constant_dump_pmc(PARROT_INTERP, const
PackFile_ConstTable *ct, PMC *self)>

Print the representation of a PMC constant.

=cut

*/

static void
PackFile_Constant_dump_pmc(PARROT_INTERP, ARGIN(const PackFile_ConstTable *ct),
                            ARGIN(PMC *self))
{
    ASSERT_ARGS(PackFile_Constant_dump_pmc)

    if (self->vtable->base_type == enum_class_Key) {
        size_t  i;
        PMC    *key;
        for (i = 0, key = self; key; i++) {
            GETATTR_Key_next_key(interp, key, key);
        }
        /* number of key components */
        Parrot_io_printf(interp, "    [ 'PFC_KEY' (%ld items)\n", i);
        /* and now type / value per component */
        for (key = self; key;) {
            opcode_t type = PObj_get_FLAGS(key);

            Parrot_io_printf(interp, "       {\n");

            type &= KEY_type_FLAGS;
            pobj_flag_dump(interp, (long)PObj_get_FLAGS(key));
            switch (type) {
              case KEY_integer_FLAG:
                Parrot_io_printf(interp, "        TYPE        => INTEGER\n");
                Parrot_io_printf(interp, "        DATA        => %ld\n",
                            Parrot_key_integer(interp, key));
                Parrot_io_printf(interp, "       },\n");
                break;

              case KEY_string_FLAG:
                {
                    size_t ct_index;
                    STRING *s = Parrot_key_string(interp, key);

                    Parrot_io_printf(interp, "        TYPE        => STRING\n");
                    ct_index = PackFile_ConstTable_rlookup_str(interp, ct, s);
                    Parrot_io_printf(interp, "        PFC_OFFSET  => %ld\n", ct_index);
                    Parrot_io_printf(interp, "        DATA        => '%Ss'\n",
                                        ct->str.constants[ct_index]);
                    Parrot_io_printf(interp, "       },\n");
                }
                break;

              case KEY_integer_FLAG | KEY_register_FLAG:
                Parrot_io_printf(interp, "        TYPE        => I REGISTER\n");
                Parrot_io_printf(interp, "        DATA        => %ld\n",
                            VTABLE_get_integer(interp, key));
                Parrot_io_printf(interp, "       },\n");
                break;
              case KEY_string_FLAG | KEY_register_FLAG:
                Parrot_io_printf(interp, "        TYPE        => S REGISTER\n");
                Parrot_io_printf(interp, "        DATA        => %ld\n",
                            VTABLE_get_integer(interp, key));
                Parrot_io_printf(interp, "       },\n");
                break;
              case KEY_pmc_FLAG | KEY_register_FLAG:
                Parrot_io_printf(interp, "        TYPE        => P REGISTER\n");
                Parrot_io_printf(interp, "        DATA        => %ld\n",
                            VTABLE_get_integer(interp, key));
                Parrot_io_printf(interp, "       },\n");
                break;
              default:
                Parrot_io_eprintf(NULL, "PackFile_Constant_pack: "
                            "unsupported constant type\n");
                Parrot_x_exit(interp, 1);
            }
            GETATTR_Key_next_key(interp, key, key);
        }
        Parrot_io_printf(interp, "    ],\n");
    }
    else {
        Parrot_Sub_attributes *sub;
        STRING * const null = Parrot_str_new_constant(interp, "(null)");
        STRING *namespace_description;

        Parrot_io_printf(interp, "    [ 'PFC_PMC', {\n");
        pobj_flag_dump(interp, (long)PObj_get_FLAGS(self));
        switch (self->vtable->base_type) {
            case enum_class_FixedBooleanArray:
            case enum_class_FixedFloatArray:
            case enum_class_FixedPMCArray:
            case enum_class_FixedStringArray:
            case enum_class_ResizableBooleanArray:
            case enum_class_ResizableIntegerArray:
            case enum_class_ResizableFloatArray:
            case enum_class_ResizablePMCArray:
            case enum_class_ResizableStringArray:
                {
                    const int n = VTABLE_get_integer(interp, self);
                    STRING* const out_buffer = VTABLE_get_repr(interp, self);
                    Parrot_io_printf(interp,
                            "\t\tclass => %Ss,\n"
                            "\t\telement count => %d,\n"
                            "\t\telements => %Ss,\n",
                            self->vtable->whoami,
                            n,
                            out_buffer);
                }
                break;
            case enum_class_Sub:
            case enum_class_Coroutine:
                PMC_get_sub(interp, self, sub);
                if (sub->namespace_name) {
                    switch (sub->namespace_name->vtable->base_type) {
                        case enum_class_String:
                            namespace_description = Parrot_str_new(interp, "'", 1);
                            namespace_description = Parrot_str_concat(interp,
                                    namespace_description,
                                    VTABLE_get_string(interp, sub->namespace_name));
                            namespace_description = Parrot_str_concat(interp,
                                    namespace_description,
                                    Parrot_str_new(interp, "'", 1));
                            break;
                        case enum_class_Key:
                            namespace_description =
                                Parrot_key_set_to_string(interp, sub->namespace_name);
                            break;
                        default:
                            namespace_description = sub->namespace_name->vtable->whoami;
                    }
                }
                else {
                    namespace_description = null;
                }
                Parrot_io_printf(interp,
                        "\t\tclass       => %Ss,\n"
                        "\t\tstart_offs  => %d,\n"
                        "\t\tend_offs    => %d,\n"
                        "\t\tname        => '%Ss',\n"
                        "\t\tsubid       => '%Ss',\n"
                        "\t\tmethod      => '%Ss',\n"
                        "\t\tnsentry     => '%Ss',\n"
                        "\t\tnamespace   => %Ss,\n"
                        "\t\tHLL_id      => %d,\n"
                        "\t\tn_regs_used => [ %d, %d, %d, %d ],\n",
                        self->vtable->whoami,
                        sub->start_offs,
                        sub->end_offs,
                        sub->name,
                        sub->subid,
                        sub->method_name,
                        sub->ns_entry_name,
                        namespace_description,
                        sub->HLL_id,
                        sub->n_regs_used[0],
                        sub->n_regs_used[1],
                        sub->n_regs_used[2],
                        sub->n_regs_used[3]);
                break;
            case enum_class_FixedIntegerArray:
                Parrot_io_printf(interp,
                        "\t\tclass => %Ss,\n"
                        "\t\trepr => '%Ss'\n",
                        self->vtable->whoami,
                        VTABLE_get_repr(interp, self));
                break;
            default:
                Parrot_io_printf(interp, "\t\tno dump info for PMC %ld %Ss\n",
                        self->vtable->base_type, self->vtable->whoami);
                Parrot_io_printf(interp, "\t\tclass => %Ss,\n", self->vtable->whoami);
        }
        Parrot_io_printf(interp, "    } ],\n");
    }
}


/*

=back

=head1 SEE ALSO

F<src/pbc_dump.c>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
