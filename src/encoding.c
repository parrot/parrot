/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/encoding.c - String encoding

=head1 DESCRIPTION

Parrot's string encoding subsystem.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

extern const ENCODING singlebyte_encoding;
extern const ENCODING utf8_encoding;
extern const ENCODING utf16_encoding;
extern const ENCODING utf32_encoding;
extern const ENCODING dbcs_encoding;

static const ENCODING **encoding_array = NULL;
static int encoding_count = 0;

/*

=item C<void encoding_init()>

Called by the Parrot string subsystem.

Adds the byte, UTF-8, UTF-16, UTF-32 and DBCS encodings to the known
encodings array.

=cut

*/

void
encoding_init()
{
    encoding_count = enum_encoding_MAX;
    encoding_array = mem_sys_allocate(sizeof(ENCODING*) * encoding_count);
    encoding_array[enum_encoding_singlebyte] = &singlebyte_encoding;
    encoding_array[enum_encoding_utf8] = &utf8_encoding;
    encoding_array[enum_encoding_utf16] = &utf16_encoding;
    encoding_array[enum_encoding_utf32] = &utf32_encoding;
    encoding_array[enum_encoding_dbcs] = &dbcs_encoding;
}

/*

=item C<void encoding_destroy()>

Destroys the known encodings array.

=cut

*/

void
encoding_destroy()
{
    mem_sys_free(encoding_array);
}

/*

=item C<const ENCODING *encoding_lookup(const char *name)>

Returns the encoding for C<name> if it is known, otherwise an exception
is raised.

=cut

*/

const ENCODING *
encoding_lookup(const char *name)
{
    int i;

    for (i=0; i<encoding_count; i++) {
        if (encoding_array[i] && !strcmp(name, encoding_array[i]->name)) {
            return encoding_array[i];
        }
    }
    internal_exception(INVALID_ENCODING, "Invalid encoding '%s'\n", name);
    return NULL;
}

/*

=item C<const ENCODING *encoding_lookup_index(INTVAL n)>

Returns the known encoding at index C<n> in the known encoding array.

=cut

*/

const ENCODING *
encoding_lookup_index(INTVAL n)
{
    return encoding_array[n];
}

/*

=item C<INTVAL encoding_find_encoding(const char *name)>

Returns the index of the encoding with name C<name> if it is known,
otherwise -1 is returned.

=cut

*/

INTVAL
encoding_find_encoding(const char *name)
{
    const ENCODING *enc = encoding_lookup(name);
    if (enc)
        return enc->index;
    else
        return -1;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/encoding.h>, F<encodings/singlebyte.c>,
F<encodings/dbcs.c>, F<encodings/utf8.c>, F<encodings/utf16.c>,
F<encodings/utf32.c> and F<docs/strings.pod>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
