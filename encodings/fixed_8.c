/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

encodings/fixed_8.c

=head1 DESCRIPTION

This file implements the encoding functions for fixed-width 8-bit codepoints

=cut

*/

#include "parrot/parrot.h"
#include "fixed_8.h"

/* This function needs to go through and get all the code points one
   by one and turn them into a byte */
static void
to_encoding(Interp *interpreter, STRING *source_string)
{
}

static STRING *
copy_to_encoding(Interp *interpreter, STRING *source_string)
{
    STRING *return_string = NULL;

    return return_string;
}

/* codepoints are bytes, so delegate */
static UINTVAL
get_codepoint(Interp *interpreter, const STRING *source_string,
	UINTVAL offset)
{
    return get_byte(interpreter, source_string, offset);
}

/* This is the same as set byte */
static void
set_codepoint(Interp *interpreter, STRING *source_string,
	UINTVAL offset, UINTVAL codepoint)
{
    set_byte(interpreter, source_string, offset, codepoint);
}

static UINTVAL
get_byte(Interp *interpreter, const STRING *source_string, UINTVAL offset)
{
    unsigned char *contents = source_string->strstart;
    if (offset >= source_string->bufused) {
	internal_exception(0,
		"get_byte past the end of the buffer (%i of %i)",
		offset, source_string->bufused);
    }
    return contents[offset];
}

static void
set_byte(Interp *interpreter, const STRING *source_string,
	UINTVAL offset, UINTVAL byte)
{
    unsigned char *contents;
    if (offset >= source_string->bufused) {
	internal_exception(0, "set_byte past the end of the buffer");
    }
    contents = source_string->strstart;
    contents[offset] = byte;
}

/* Delegate to get_bytes */
static STRING *
get_codepoints(Interp *interpreter, STRING *source_string,
	UINTVAL offset, UINTVAL count)
{
    STRING *return_string = get_bytes(interpreter, source_string,
	    offset, count);
    return_string->charset = source_string->charset;
    return return_string;
}

static STRING *
get_bytes(Interp *interpreter, STRING *source_string,
	UINTVAL offset, UINTVAL count)
{
    STRING *return_string = Parrot_make_COW_reference(interpreter,
	    source_string);
    return_string->encoding = source_string->encoding;
    return_string->charset = source_string->charset;

    return_string->strstart = (char *)return_string->strstart + offset ;
    return_string->bufused = count;

    return_string->strlen = count;
    return_string->hashval = 0;

    return return_string;
}


/* Delegate to get_bytes */
static STRING *
get_codepoints_inplace(Interp *interpreter, STRING *source_string,
	UINTVAL offset, UINTVAL count, STRING *dest_string)
{

    return get_bytes_inplace(interpreter, source_string, offset,
	    count, dest_string);
}

static STRING *
get_bytes_inplace(Interp *interpreter, STRING *source_string,
	UINTVAL offset, UINTVAL count, STRING *return_string)
{
    Parrot_reuse_COW_reference(interpreter, source_string, return_string);
    return_string->encoding = source_string->encoding;
    return_string->charset = source_string->charset;

    return_string->strstart = (char *)return_string->strstart + offset ;
    return_string->bufused = count;

    return_string->strlen = count;
    return_string->hashval = 0;

    return return_string;
}

/* Delegate to set_bytes */
static void
set_codepoints(Interp *interpreter, STRING *source_string,
	UINTVAL offset, UINTVAL count, STRING *new_codepoints)
{
    set_bytes(interpreter, source_string, offset, count, new_codepoints);
}

static void
set_bytes(Interp *interpreter, STRING *source_string,
	UINTVAL offset, UINTVAL count, STRING *new_bytes)
{
    string_replace(interpreter, source_string, offset, count, new_bytes, NULL);
}

/* Unconditionally makes the string be in this encoding, if that's
   valid */
static void
become_encoding(Interp *interpreter, STRING *source_string)
{
}


static UINTVAL
codepoints(Interp *interpreter, STRING *source_string)
{
    return bytes(interpreter, source_string);
}

static UINTVAL
bytes(Interp *interpreter, STRING *source_string)
{
    return source_string->bufused;
}

/*
 * iterator functions
 */

static UINTVAL
fixed8_get_next(Interp *interpreter, String_iter *iter)
{
    UINTVAL c = get_byte(interpreter, iter->str, iter->charpos++);
    iter->bytepos++;
    return c;
}

static void
fixed8_set_next(Interp *interpreter, String_iter *iter, UINTVAL c)
{
    set_byte(interpreter, iter->str, iter->charpos++, c);
    iter->bytepos++;
}

static void
fixed8_set_position(Interp *interpreter, String_iter *iter, UINTVAL pos)
{
    iter->bytepos = iter->charpos = pos;
    assert(pos < PObj_buflen(iter->str));
}


static void
iter_init(Interp *interpreter, String *src, String_iter *iter)
{
    iter->str = src;
    iter->bytepos = iter->charpos = 0;
    iter->get_and_advance = fixed8_get_next;
    iter->set_and_advance = fixed8_set_next;
    iter->set_position =    fixed8_set_position;
}

ENCODING *
Parrot_encoding_fixed_8_init(Interp *interpreter)
{
    ENCODING *return_encoding = Parrot_new_encoding(interpreter);

    ENCODING base_encoding = {
	"fixed_8",
	1, /* Max bytes per codepoint */
	to_encoding,
	copy_to_encoding,
	get_codepoint,
	set_codepoint,
	get_byte,
	set_byte,
	get_codepoints,
	get_codepoints_inplace,
	get_bytes,
	get_bytes_inplace,
	set_codepoints,
	set_bytes,
	become_encoding,
	codepoints,
	bytes,
	iter_init

    };
    memcpy(return_encoding, &base_encoding, sizeof(ENCODING));
    Parrot_register_encoding(interpreter, "fixed_8", return_encoding);
    return return_encoding;
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




