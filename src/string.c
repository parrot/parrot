/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/string.c - Parrot Strings

=head1 DESCRIPTION

This is the API definitions for the string subsystem

Note:

C<bufstart> and C<buflen> are used by the memory subsystem The string
functions may only use C<buflen> to determine, if there is some space
left beyond C<bufused>. This is the I<only> valid usage of these two
data members, beside setting C<bufstart>/C<buflen> for external strings.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

/*
 * this extra size is in the hope, that some concat ops might
 * follow in a sequence.
 *
 * compiling 3180 chars of a bf programs with bfc gives:
 *
 *             extra = 4          512          1024
 * GC runs          2376           74            36
 * mem copied      210 MB        6 MB          3 MB
 * time -C          5.2 s       0.3 s         0.2 s
 */

#define EXTRA_SIZE 256

/* work around warning:
 * cast discards qualifiers from pointer target type
 * s. usage below
 */

#define const_cast(b) (__ptr_u.__c_ptr = (b), __ptr_u.__ptr)

/* statics */
static void _string_upscale(struct Parrot_Interp *interpreter, STRING *s,
				parrot_string_representation_t representation, UINTVAL capacity);
static void _string_downscale(struct Parrot_Interp *interpreter, STRING *s,
				parrot_string_representation_t representation);
static parrot_string_representation_t
_string_smallest_representation(struct Parrot_Interp *interpreter, STRING *s);

/*

=back

=head2 String COW support

=over 4

=item C<static void
unmake_COW(struct Parrot_Interp *interpreter, STRING *s)>

If C<*s> is COW then the memory is copied over and the COW flag is
cleared.

=cut

*/

static void
unmake_COW(struct Parrot_Interp *interpreter, STRING *s)
{
    /* COW_FLAG | constant_FLAG | external_FLAG) */
    if (PObj_is_cowed_TESTALL(s)) {
        STRING for_alloc;

        /* Create new pool data for this header to use,
         * independant of the original COW data */
        PObj_constant_CLEAR(s);
        /*
         * allocate a dummy strings memory
         * buflen might be bigger and used, so pass this length
         * also be sure not to allocate from the constant pool
         */
        PObj_flags_CLEARALL(&for_alloc);
        Parrot_allocate_string(interpreter, &for_alloc, PObj_buflen(s));
        /*
         * now copy memory over
         */
        mem_sys_memcopy(for_alloc.strstart, s->strstart, s->bufused);
        /*
         * and finally use that string memory
         */
        PObj_bufstart(s) = PObj_bufstart(&for_alloc);
        s->strstart      = for_alloc.strstart;
        PObj_buflen(s)   = PObj_buflen(&for_alloc);
        /* COW_FLAG | external_FLAG | bufstart_external_FLAG immobile_FLAG */
        PObj_is_external_CLEARALL(s);
    }
}

/*

=item C<static void copy_string_header(struct Parrot_Interp *interpreter,
                               String *dest, String *src)>

Copies the string header from C<*src> to C<*dest>.

=cut

*/

static void copy_string_header(struct Parrot_Interp *interpreter,
                               String *dest, String *src)
{
#if ! DISABLE_GC_DEBUG
    UINTVAL vers;
    vers= PObj_version(dest);
#endif
    memcpy(dest, src, sizeof(String));
#if ! DISABLE_GC_DEBUG
    PObj_version(dest) = vers;
#endif
}

/*

=item C<static STRING *
make_COW_reference(struct Parrot_Interp *interpreter, STRING *s)>

Creates a COW string by cloning a string header without allocating a new
buffer.

=cut

*/

static STRING *
make_COW_reference(struct Parrot_Interp *interpreter, STRING *s)
{
    STRING *d;
    if (PObj_constant_TEST(s)) {
        PObj_constant_CLEAR(s);
        d = new_string_header(interpreter, PObj_get_FLAGS(s));
        PObj_is_cowed_SETALL(s);
        copy_string_header(interpreter, d, s);
        PObj_constant_CLEAR(d);
    }
    else {
        d = new_string_header(interpreter, PObj_get_FLAGS(s));
        PObj_COW_SET(s);
        copy_string_header(interpreter, d, s);
    }
    return d;
}

/*

=item C<static void
make_COW_reference_from_header(struct Parrot_Interp *interpreter,
        STRING *s, STRING *d)>

Makes C<*d> a COW reference to C<*s>.

=cut

*/

static void
make_COW_reference_from_header(struct Parrot_Interp *interpreter,
        STRING *s, STRING *d) {
    if (PObj_constant_TEST(s)) {
        PObj_is_cowed_SETALL(s);
        copy_string_header(interpreter, d, s);
        PObj_constant_CLEAR(d);
    }
    else {
        PObj_COW_SET(s);
        copy_string_header(interpreter, d, s);
    }
}

/*

=item C<STRING *
string_set(struct Parrot_Interp *interpreter, STRING *dest, STRING *src)>

Set the contents of C<*dest> to the contents of C<*src>.

=cut

*/

STRING *
string_set(struct Parrot_Interp *interpreter, STRING *dest, STRING *src)
{
    if (!src)
        return NULL;
    if( dest == src )
    	return dest;
    if (dest) { /* && dest != src */
        /* they are different, dest is not an external string */
#ifdef GC_IS_MALLOC
        if (!PObj_is_external_TESTALL(dest) && PObj_bufstart(dest)) {
            mem_sys_free((int*)PObj_bufstart(dest) - 1);
        }
#endif
        make_COW_reference_from_header(interpreter, src, dest);
    }
    else
        dest = make_COW_reference(interpreter, src);
    return dest;
}

/*

=back

=head2 Basic String Functions

Creation, enlargement, etc.

=over 4

=item C<void
string_init(void)>

Initializes the Parrot string subsystem.

=cut

*/

void
string_init(void)
{
/* XXXX: pull out into a config */
	string_set_data_directory("blib/lib/icu/2.6.1");
/*
    encoding_init();
    chartype_init();
    string_native_type = chartype_lookup("usascii");
    string_unicode_type = chartype_lookup("unicode");
*/
}

UINTVAL
string_capacity(struct Parrot_Interp *interpreter, STRING *s)
{
	return ((ptrcast_t)PObj_bufstart(s) + PObj_buflen(s) - (ptrcast_t)s->strstart)
				/ (s->representation);
}

STRING *
string_make_empty(struct Parrot_Interp *interpreter,
					parrot_string_representation_t representation,
					UINTVAL capacity)
{
    STRING *s;

	s = new_string_header(interpreter, 0);
	
	s->representation = representation;

	Parrot_allocate_string(interpreter, s, string_max_bytes(interpreter, s, capacity));

	s->strlen = s->bufused = 0;

    return s;
}

/* downscale would need checks? */
static void
_string_upscale(struct Parrot_Interp *interpreter, STRING *s,
				parrot_string_representation_t representation, UINTVAL capacity)
{
	if( s->representation >= representation )
	{
		if( capacity > s->strlen )
		{ 
			string_grow(interpreter, s, capacity - s->strlen);
		}
	}
	else /* s->representation < representation */
	{
		STRING *temp;

		UINTVAL needed_length = s->strlen;
		
		if( capacity > needed_length ) { needed_length = capacity; }
		
		temp = string_make_empty(interpreter, representation, needed_length);

		string_append(interpreter, temp, s, s->obj.flags);
		
		string_set(interpreter, s, temp);
		
		/*
		s->representation = temp->representation;
		s->bufstart = temp->bufstart;
        s->buflen   = temp->buflen;
        s->strstart = temp->strstart;
        s->bufused = temp->bufused;
        s->obj.flags    = temp->obj.flags;
        */
	}
}

/* currently, doesn't do any checks to see if the downscale should be allowed.
   thus, assumes caller has already checked. */
static void
_string_downscale(struct Parrot_Interp *interpreter, STRING *s,
				parrot_string_representation_t representation)
{
	if( s->representation <= representation )
	{
		return; /* do nothing */
	}
	else /* s->representation > representation */
	{
		UINTVAL count = s->strlen;
		
		if( s->representation == enum_stringrep_four )
		{
			uint32_t *oldCursor = (uint32_t*)s->strstart;
			
			if( representation == enum_stringrep_two )
			{
				uint16_t *newCursor = (uint16_t*)s->strstart;
				
				while( count-- )
				{
					*(newCursor++) = *(oldCursor++);
				}
			}
			else /* representation == enum_stringrep_one */
			{
				uint8_t *newCursor = (uint8_t*)s->strstart;
				
				while( count-- )
				{
					*(newCursor++) = *(oldCursor++);
				}
			}
		}
		else /* s-> representation == enum_stringrep_two, representation == enum_stringrep_one */
		{
			uint16_t *oldCursor = (uint16_t*)s->strstart;
			uint8_t *newCursor = (uint8_t*)s->strstart;
			
			while( count-- )
			{
				assert(*oldCursor <= 0xFF);
				*(newCursor++) = *(oldCursor++);
			}
		}
		
		s->representation = representation;
		s->bufused = string_max_bytes(interpreter, s, s->strlen);
	}
}

/* temporary */
void Parrot_string_downscale(struct Parrot_Interp *interpreter, STRING *s,
				parrot_string_representation_t representation);
void
Parrot_string_downscale(struct Parrot_Interp *interpreter, STRING *s,
				parrot_string_representation_t representation)
{
	_string_downscale(interpreter, s, representation);
}

static parrot_string_representation_t
_string_smallest_representation(struct Parrot_Interp *interpreter, STRING *s)
{
	if( s->representation == enum_stringrep_one )
	{
		return enum_stringrep_one;
	}
	else if( s->representation == enum_stringrep_two )
	{
		uint16_t *cur = (uint16_t *)s->strstart;
		uint16_t *end = cur + s->strlen;
		
		while( cur < end )
		{
			if( *cur > 255 )
			{
				return enum_stringrep_two;
			}
			cur++;
		}
		
		return enum_stringrep_one;
	}
	else if( s->representation == enum_stringrep_four )
	{
		uint32_t *cur = (uint32_t *)s->strstart;
		uint32_t *end = cur + s->strlen;
		int saw_two = 0;
		
		while( cur < end )
		{
			if( *cur > 0xFFFF )
			{
				return enum_stringrep_four;
			}
			else if( *cur > 255 )
			{
				saw_two = 1;
			}
			cur++;
		}
		
		if( saw_two )
		{
			return enum_stringrep_two;
		}
		else
		{
			return enum_stringrep_one;
		}
	}
	else /* trouble */
	{
		return enum_stringrep_unknown;
	}
}

/*

=item C<STRING *
string_append(struct Parrot_Interp *interpreter, STRING *a,
              STRING *b, UINTVAL Uflags)>

Take in two strings and append the second string to the first.

=cut

*/

STRING *
string_append(struct Parrot_Interp *interpreter, STRING *a,
              STRING *b, UINTVAL Uflags)
{
    UNUSED(Uflags);

    /* If B isn't real, we just bail */
    if (b == NULL || b->strlen == 0) {
        return a;
    }

    /* Is A real? */
    if (a != NULL)
    {
        /* If the destination's constant, then just fall back to
           string_concat */
        if (PObj_constant_TEST(a))
        {
            return string_concat(interpreter, a, b, Uflags);
        }
        
		UINTVAL a_capacity = string_capacity(interpreter, a);
		UINTVAL total_length = string_length(interpreter, a) 
										+ string_length(interpreter, b);

		if( a->representation < b->representation ) /* need to "upscale" */
        {
			_string_upscale(interpreter, a, b->representation, total_length);        
        }

        if( a->representation >= b->representation )
        {
        /* make sure A's big enough for both */
			if (a_capacity < total_length)
			{
				a = string_grow(interpreter, a, 
									(total_length - a_capacity) + EXTRA_SIZE);
        }
        else
			{
            unmake_COW(interpreter, a);
			}
			
			/* A is now ready to receive the contents of B */

			/* if same rep, can memcopy */
			if( a->representation == b->representation )
			{
        /* Tack B on the end of A */
        mem_sys_memcopy((void *)((ptrcast_t)a->strstart + a->bufused),
                        b->strstart, b->bufused);
							
        a->bufused += b->bufused;
        a->strlen += b->strlen;
        return a;
    }
			else /* if not, need to loop */ /* fast_byte_append v. safe_byte_append */
			{
				/* remember, this is the case of rep A > rep B */
				if( a->representation == enum_stringrep_two ) /* B must have rep one */
				{
					uint16_t *a_cursor = (uint16_t *)((ptrcast_t)a->strstart + a->bufused);

					uint8_t *b_cursor = (uint8_t *)((ptrcast_t)b->strstart);
					uint8_t *b_end = (uint8_t *)((ptrcast_t)b->strstart + b->bufused);
					
					while(b_cursor < b_end)
					{
						*(a_cursor++) = *(b_cursor++);
					}
					
					a->bufused = (ptrcast_t)a_cursor - (ptrcast_t)a->strstart;
					string_compute_strlen(interpreter, a);
				}
				else if( a->representation == enum_stringrep_four )
				{
					uint32_t *a_cursor = (uint32_t *)((ptrcast_t)a->strstart + a->bufused);

					switch( b->representation )
					{
						case enum_stringrep_one:
						{
							uint8_t *b_cursor = (uint8_t *)((ptrcast_t)b->strstart);
							uint8_t *b_end = (uint8_t *)((ptrcast_t)b->strstart + b->bufused);

							while(b_cursor < b_end)
							{
								*(a_cursor++) = *(b_cursor++);
							}
					
							a->bufused = (ptrcast_t)a_cursor - (ptrcast_t)a->strstart;
							string_compute_strlen(interpreter, a);

							break;
						}
						case enum_stringrep_two:
						{
							uint16_t *b_cursor = (uint16_t *)((ptrcast_t)b->strstart);
							uint16_t *b_end = (uint16_t *)((ptrcast_t)b->strstart + b->bufused);
							
							while(b_cursor < b_end)
							{
								*(a_cursor++) = *(b_cursor++);
							}

							a->bufused = (ptrcast_t)a_cursor - (ptrcast_t)a->strstart;
							string_compute_strlen(interpreter, a);
							
							break;
						}
						default:
							/* trouble */
							break;
					}
				}
				else
				{
					/* problem */
				}
			}
        }
        
        return a;     
    }
    
    /* If we got here, A was NULL. So clone B. */
    return string_copy(interpreter, b);
}

/*

=item C<
STRING *
string_from_cstring(struct Parrot_Interp *interpreter, const void *buffer,
                     UINTVAL len)>

Make a C<STRING *> from a passed in C string.

=item C<
STRING *
const_string(struct Parrot_Interp *interpreter, const char *buffer)>

Make a constant STRING from a const C string.

=cut

*/

STRING *
string_from_cstring(struct Parrot_Interp *interpreter, const void *buffer,
                     UINTVAL len)
{
    return string_make(interpreter, buffer, len ? len :
            buffer ? strlen(buffer) : 0,
                       "iso-8859-1", NULL); /* make this utf-8 eventually? */
}

/* needed for packfile unpacking, unless we just always use utf-8, or BOCU */
const char*
string_primary_encoding_for_representation(struct Parrot_Interp *interpreter,
					parrot_string_representation_t representation)
{
	switch( representation )
	{
		case enum_stringrep_one:
			return "iso-8859-1";
			break;
		case enum_stringrep_two:
			return "ucs-2";
			break;
		case enum_stringrep_four:
			return "utf-32";
			break;
		default:
			internal_exception(INVALID_STRING_REPRESENTATION,
				"string_primary_encoding_for_representation: invalid string representation");
			return NULL;
			break;			
	}
}

STRING *
const_string(struct Parrot_Interp *interpreter, const char *buffer)
{
    /* TODO cache the strings */
    return string_make(interpreter, buffer, strlen(buffer),
                   "iso-8859-1", PObj_external_FLAG|PObj_constant_FLAG);
}

/*

=item C<STRING *
string_make(struct Parrot_Interp *interpreter, const void *buffer,
            UINTVAL len, const ENCODING *encoding, UINTVAL flags,
            const CHARTYPE *type)>

Allocate memory for the string, copy information into it and compute its
string length.

=cut

*/

STRING *
string_make(struct Parrot_Interp *interpreter, const void *buffer,
            UINTVAL len, const char *encoding_name, UINTVAL flags)
{
    STRING *s = NULL;
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;

/*    PIO_eprintf(NULL, "string_make(): length = %ld, encoding name = %s, buffer = %s\n",
            len, encoding_name, (const char *)buffer); */

	if( len && !buffer )
	{
		internal_exception(BAD_BUFFER_SIZE,
				"string_make: buffer pointer NULL, but length nonzero");
    }

    if (!encoding_name)
    {
		internal_exception(MISSING_ENCODING_NAME,
				"string_make: no encoding name specified");
    }
    else
    {    
		s = new_string_header(interpreter, flags); /* FIXME: ignorning flags below */

		s->representation = enum_stringrep_unknown;
		
    	if (strcmp(encoding_name, "iso-8859-1") == 0 )
    	{
			s->representation = enum_stringrep_one;
    }
    	else if (strcmp(encoding_name, "ucs-2") == 0 ) /* worry about endian-ness */
    	{
			s->representation = enum_stringrep_two;
    }
    	else if (strcmp(encoding_name, "utf-32") == 0 )
    	{
			s->representation = enum_stringrep_four;
        }

		if( s->representation != enum_stringrep_unknown ) /* fast encodings */
		{
			/* decide in here on the size to use, and transcode.... */
			Parrot_allocate_string(interpreter, s, len);
			
			if (buffer)
			{
            mem_sys_memcopy(s->strstart, buffer, len);
        s->bufused = len;
				string_compute_strlen(interpreter, s);
    }
			else
			{
        s->strlen = s->bufused = 0;
    }
    	}
    	else /* even if buffer is "external", we won't use it directly */
    	{
			string_fill_from_buffer(interpreter, buffer, len, encoding_name, s);
    	}
    }

    return s;
}

/*

=item C<STRING *
string_grow(struct Parrot_Interp * interpreter, STRING * s, INTVAL addlen)>

Grow the string buffer by C<addlen> characters.

=cut

*/

STRING *
string_grow(struct Parrot_Interp * interpreter, STRING * s, INTVAL addlen) {
    unmake_COW(interpreter,s);

    /* Don't check buflen, if we are here, we already checked. */
    Parrot_reallocate_string(interpreter, s,
                             PObj_buflen(s) + string_max_bytes(interpreter, s, addlen));
    return s;
}

/*

=back

=head2 Ordinary user-visible string operations

=over 4

=item C<UINTVAL
string_length(const STRING *s)>

Return the length of the string (in characters).

=cut

*/

UINTVAL
string_length(struct Parrot_Interp * interpreter, const STRING *s)
{
    return s ? s->strlen : 0;
}

void *
string_pointer_to_index(struct Parrot_Interp * interpreter, const STRING *s, UINTVAL idx)
{
	switch( s->representation )
	{
		case enum_stringrep_one:
			return ((uint8_t*)s->strstart + idx);
			break;
		case enum_stringrep_two:
			return ((uint16_t*)s->strstart + idx);
			break;
		case enum_stringrep_four:
			return ((uint32_t*)s->strstart + idx);
			break;
		default:
		    internal_exception(INVALID_STRING_REPRESENTATION,
                    "string_pointer_to_index: invalid string representation");
            return NULL; /* make compiler happy */
			break;
	}
}

/*

=item C<INTVAL
string_index(const STRING *s, UINTVAL idx)>

Return the character (or glyph, depending upon the string's encoding)
This is to abstract the process of finding the Nth character in a
(possibly unicode or JIS-encoded) string, the idea being that once the
encoding functions are fleshed out, this function can do the right
thing.

Note that this is not range-checked.

=cut

*/

INTVAL
string_index(struct Parrot_Interp * interpreter, const STRING *s, UINTVAL idx)
{
	switch( s->representation )
	{
		case enum_stringrep_one:
			return *((uint8_t*)s->strstart + idx);
			break;
		case enum_stringrep_two:
			return *((uint16_t*)s->strstart + idx);
			break;
		case enum_stringrep_four:
			return *((uint32_t*)s->strstart + idx);
			break;
		default:
		    internal_exception(INVALID_STRING_REPRESENTATION,
                    "string_index: invalid string representation");
            return -1; /* make compiler happy */
			break;
    }
}

static INTVAL
string_str_index_twobyte(struct Parrot_Interp *interpreter,
        const STRING *str, const STRING *find, UINTVAL start)
{
    const uint16_t* const find_strstart = find->strstart;
    const uint16_t* const str_strstart  = str->strstart;
    const UINTVAL         find_strlen   = find->strlen;
    const UINTVAL         str_strlen    = str->strlen;
    const uint16_t* const lastmatch     =
                                   str_strstart + str_strlen;
    UINTVAL* p;
    const uint16_t* cp;
    UINTVAL endct, pos;
    UINTVAL badshift[256];

    /* Prepare the bad shift buffer */

    for (p = &badshift[0] ; p < &badshift[256] ; p++) {
        *p = find_strlen;
    }

    endct = 1;
    cp = find_strstart + find_strlen - 2; /* why "- 2" ? */
    for (; cp >= find_strstart ; cp--, endct++) {
    	UINTVAL offset = (256 & *cp);

        if (endct < badshift[offset]) { /* or find_strlen != badshift[offset] */
            badshift[offset] = endct;
        }
    }

    /* Perform the match */

    pos = start;
    cp = str_strstart + start + find_strlen;
    while (cp <= lastmatch) {
        register const uint16_t* sp = cp;
        register const uint16_t* fp = find_strstart + find_strlen;

        while (fp > find_strstart) {
            if (*--fp != *--sp)
                break;
            }
        if (*fp == *sp) {
            return pos;
        }
        else {
            register UINTVAL bsi = badshift[256 & *(cp-1)];
            cp  += bsi;
            pos += bsi;
        }
    }

    return -1;
}

/*

=item C<static INTVAL
string_str_index_singlebyte(struct Parrot_Interp *interpreter,
        const STRING *str, const STRING *find, UINTVAL start)>

Helper function for C<string_str_index()>. This is optimized for the
simple case where both strings are in C<encoding_singlebyte>.  It
implements the Boyer-Moore string search algorithm.

=cut

*/

static INTVAL
string_str_index_singlebyte(struct Parrot_Interp *interpreter,
        const STRING *str, const STRING *find, UINTVAL start)
{
    const unsigned char* const find_strstart = find->strstart;
    const unsigned char* const str_strstart  = str->strstart;
    const UINTVAL              find_strlen   = find->strlen;
    const UINTVAL              str_strlen    = str->strlen;
    const unsigned char* const lastmatch     =
                                   str_strstart + str_strlen;
    UINTVAL* p;
    const unsigned char* cp;
    UINTVAL endct, pos;
    UINTVAL badshift[256];

    /* Prepare the bad shift buffer */

    for (p = &badshift[0] ; p < &badshift[256] ; p++) {
        *p = find_strlen;
    }

    endct = 1;
    cp = find_strstart + find_strlen - 2;
    for (; cp >= find_strstart ; cp--, endct++) {
        if (endct < badshift[*cp]) {
            badshift[*cp] = endct;
        }
    }

    /* Perform the match */

    pos = start;
    cp = str_strstart + start + find_strlen;
    while (cp <= lastmatch) {
        register const unsigned char* sp = cp;
        register const unsigned char* fp = find_strstart + find_strlen;

        while (fp > find_strstart) {
            if (*--fp != *--sp)
                break;
        }
        if (*fp == *sp) {
            return pos;
        }
        else {
            register UINTVAL bsi = badshift[*(cp-1)];
            cp  += bsi;
            pos += bsi;
        }
    }

    return -1;
}

/*

=item C<INTVAL
string_str_index(struct Parrot_Interp *interpreter, const STRING *s,
        const STRING *s2, UINTVAL start)>

Return the character position of C<*s2> in C<*s> at or after C<start>.
The return value is a (0 based) offset in characters, not bytes. If
C<*s2> is not found, then return -1.

=cut

*/

INTVAL
string_str_index(struct Parrot_Interp *interpreter, const STRING *s,
        const STRING *s2, UINTVAL start)
{
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;

    if (!s || !string_length(interpreter, s))
        return -1;
    if (!s2 || !string_length(interpreter, s2))
        return -1;

/* here, check of the search string has a different rep than the target
   string. if so, up- or down-size the search string. upsizing is easy.
   for downsizing, need to check if there are any characters which won't
   fit in the downsized range--if so, to search would fail, so bail. should
   do the up- or down-sizing inside of the search helper methods, above, so
   that we can traverse for prep work just once--building the index and 
   scaling the rep. at the same time. that gives us a bunch of different 
   variants (both size 1, both size 2 or both size 4, and size mismatched
   with search string smaller rep, and size mismatched with search string
   larger rep. */

    if (s->representation == s2->representation) 
    {
    	switch (s->representation)
    	{
    		case enum_stringrep_one:
        return string_str_index_singlebyte(interpreter, s, s2, start);
    			break;
    		case enum_stringrep_two:
    			return string_str_index_twobyte(interpreter, s, s2, start);
    			break;
    		default:
				internal_exception(UNIMPLEMENTED,
						"string_str_index: case not implemented yet");
				return -1;
			break;
    			break;    			
    }
    }
    else
    {
		internal_exception(UNIMPLEMENTED,
				"string_str_index: case not implemented yet");
		return -1;
    }
}

/*

=item C<INTVAL
string_ord(const STRING *s, INTVAL idx)>

Return the codepoint at a given index into a string. Negative indexes
are treated as counting from the end of the string.

=cut

*/

INTVAL
string_ord(struct Parrot_Interp *interpreter, const STRING *s, INTVAL idx)
{
    UINTVAL len = 0;

    if (s != NULL) {
        len = string_length(interpreter, s);
    }

    if ((s == NULL) || (len == 0)) {
        internal_exception(ORD_OUT_OF_STRING,
                           "Cannot get character of empty string");
    }
    else {
        UINTVAL true_index;
        true_index = (UINTVAL)idx;

        if (idx < 0) {
            if ((INTVAL)(idx + len) < 0) {
                internal_exception(ORD_OUT_OF_STRING,
                                   "Cannot get character before beginning of string");
            }
            else {
                true_index = (UINTVAL)(len + idx);
            }
        }

        if (true_index > (len - 1)) {
            internal_exception(ORD_OUT_OF_STRING,
                               "Cannot get character past end of string");
        }

        return string_index(interpreter, s, true_index);
    }
    return -1;
}

/* allow this to take an array of ints? */
STRING *
string_chr(struct Parrot_Interp *interpreter, UINTVAL character)
{	
	if( character <= 0xFF )
	{
		uint8_t c = (uint8_t)character;
		return string_make(interpreter, &c, (UINTVAL)sizeof(uint8_t), "iso-8859-1", 0);
	}
	else if( character <= 0xFFFF )
	{
		uint16_t c = (uint16_t)character;
		return string_make(interpreter, &c, (UINTVAL)sizeof(uint16_t), "ucs-2", 0);
	}
	else
	{
		uint32_t c = (uint32_t)character;
		return string_make(interpreter, &c, (UINTVAL)sizeof(uint32_t), "utf-32", 0);
	}
}


/*

=item C<STRING *
string_copy(struct Parrot_Interp *interpreter, STRING *s)>

create a copy of the argument passed in.

=cut

*/

STRING *
string_copy(struct Parrot_Interp *interpreter, STRING *s)
{
    return make_COW_reference(interpreter, s);
}


/*

=back

=head2 Vtable Dispatch Functions

=over 4

=item C<INTVAL
string_compute_strlen(STRING *s)>

Calculate the length (in characters) of the string.

=cut

*/

INTVAL
string_compute_strlen(struct Parrot_Interp *interpreter, STRING *s)
{
	/* taking advantage of int value of the enum */
	s->strlen = ((ptrcast_t)PObj_bufstart(s) + s->bufused - (ptrcast_t)s->strstart)
					/ (s->representation);

    return s->strlen;
}

/*

=item C<INTVAL
string_max_bytes(STRING *s, INTVAL nchars)>

Returns the number of bytes required to safely contain C<nchars>
characters in the string's encoding.

=cut

*/

INTVAL
string_max_bytes(struct Parrot_Interp *interpreter, STRING *s, INTVAL nchars)
{
/* XXXX: here (and a couple of other places) we are taking advantage the numerical
         value of s->representation being equal to sizeof(relevant type), and we
         probably shouldn't */
    return (nchars * (s->representation));
}

/*

=item C<STRING *
string_concat(struct Parrot_Interp *interpreter, STRING *a,
              STRING *b, UINTVAL Uflags)>

Concatenate two strings. If necessary, convert the second string's
encoding and/or type to match those of the first string. If either
string is C<NULL>, return a copy of the non-C<NULL> string. If both
strings are C<NULL>, create and return a new zero-length string.

=cut

*/

STRING *
string_concat(struct Parrot_Interp *interpreter, STRING *a,
              STRING *b, UINTVAL Uflags)
{
    if (a != NULL && a->strlen != 0)
    {
        if (b != NULL && b->strlen != 0)
        {
			STRING *result = 
				string_make_empty(interpreter,
						(a->representation >= b->representation) ? 
								a->representation : b->representation,
						a->strlen + b->strlen);

			string_append(interpreter, result, a, Uflags);
			string_append(interpreter, result, b, Uflags);

			return result;
        }
        else
        {
            return string_copy(interpreter, a);
        }
    }
    else
    {
		if (b != NULL)
		{
                return string_copy(interpreter, b);
            }
		else
		{
			return string_make(interpreter, NULL, 0, NULL, Uflags);
        }
    }
}

/*

=item C<STRING *
string_repeat(struct Parrot_Interp *interpreter, const STRING *s, UINTVAL num,
              STRING **d)>

Repeat the string C<*s> I<num> times, storing result in C<**d>. Allocates
I<**d> if needed, also returns C<*d>.

=cut

*/

STRING *
string_repeat(struct Parrot_Interp *interpreter, const STRING *s, UINTVAL num,
              STRING **d)
{
    STRING *dest;
    UINTVAL i;

	dest = string_make_empty(interpreter, s->representation, s->strlen * num);

    /* dest = string_make(interpreter, NULL, s->bufused * num, s->encoding, 0,
                       s->type); */
    if (num == 0) {
        return dest;
    }

    /* copy s into dest num times */
    for (i = 0; i < num; i++) {
        mem_sys_memcopy((void *)((ptrcast_t)dest->strstart + s->bufused * i),
                        s->strstart, s->bufused);
    }

    dest->bufused = s->bufused * num;
    dest->strlen = s->strlen * num;

    if (d != NULL) {
        *d = dest;
    }
    return dest;
}

/*

=item C<STRING *
string_substr(struct Parrot_Interp *interpreter, STRING *src,
              INTVAL offset, INTVAL length, STRING **d, int replace_dest)>

Take the substring of length C<length> from C<offset> of C<*src> and
store it in C<**d>.  Also return C<*d>. Allocate memory for C<**d> if
necessary.

=cut

*/

STRING *
string_substr(struct Parrot_Interp *interpreter, STRING *src,
              INTVAL offset, INTVAL length, STRING **d, int replace_dest)
{
    STRING *dest;
    UINTVAL substart_off;       /* Offset from start of string to our
                                 * piece */
    UINTVAL subend_off;         /* Offset from start of string to the
                                 * end of our piece */
    UINTVAL true_offset;
    UINTVAL true_length;

    true_offset = (UINTVAL)offset;

    /* Allow regexes to return $' easily for "aaa" =~ /aaa/ */
    if (offset == (INTVAL)string_length(interpreter, src) || length < 1) {
        return string_make_empty(interpreter, enum_stringrep_one, 0);
    }

    if (offset < 0) {
        true_offset = (UINTVAL)(src->strlen + offset);
    }

    if (true_offset > src->strlen - 1) {        /* 0 based... */
        internal_exception(SUBSTR_OUT_OF_STRING,
                "Cannot take substr outside string");
    }

    true_length = (UINTVAL)length;
    if (true_length > (src->strlen - true_offset)) {
        true_length = (UINTVAL)(src->strlen - true_offset);
    }

    /* do in-place i.e. reuse existing header if one */
    if (replace_dest)
        dest = string_set(interpreter, *d, src);
    else
        dest = make_COW_reference(interpreter, src);

	dest->strstart = (char *)dest->strstart 
						+ string_max_bytes(interpreter, dest, true_offset);
	dest->bufused = string_max_bytes(interpreter, dest, true_length);

    dest->strlen = true_length;

    if (d != NULL) {
        *d = dest;
    }
    return dest;
}

/*

=item C<STRING *
string_replace(struct Parrot_Interp *interpreter, STRING *src,
              INTVAL offset, INTVAL length, STRING *rep, STRING **d)>

This should follow the Perl semantics for:

    substr EXPR, OFFSET, LENGTH, REPLACEMENT

Replace substring of C<*src> with C*rep>, returning what was there
before.

Replacing a slice with a longer string grows the string; a shorter
string shrinks it.

Replacing 2 past the end of the string is undefined. However replacing 1
past does a concat.

A negative offset is allowed to replace from the end.

=cut

*/

STRING *
string_replace(struct Parrot_Interp *interpreter, STRING *src,
              INTVAL offset, INTVAL length, STRING *rep, STRING **d)
{
    STRING *dest = NULL;
    UINTVAL substart_off;       /* Offset from start of string to our
                                 * piece */
    UINTVAL subend_off;         /* Offset from start of string to the
                                 * end of our piece */
    UINTVAL true_offset;
    UINTVAL true_length;
    INTVAL diff;

    true_offset = (UINTVAL)offset;
    true_length = (UINTVAL)length;

	/* may have different reps..... */
	if( rep->representation < src->representation )
	{
		_string_upscale(interpreter, rep, src->representation, 0);
    }

    /* abs(-offset) may not be > strlen-1 */
    if (offset < 0) {
        true_offset = (UINTVAL)(src->strlen + offset);
    }

    /* Can replace 1 past end of string which is technically outside the string
     * but is same as a concat().
     * Only give exception if caller trys to replace end of string + 2
     */
    if (true_offset > src->strlen) {
        internal_exception(SUBSTR_OUT_OF_STRING,
               "Can only replace inside string or index after end of string");
    }
    if (true_length > (src->strlen - true_offset)) {
        true_length = (UINTVAL)(src->strlen - true_offset);
    }


    /* Save the substring that is replaced for the return value */

	if (d != NULL)
	{
		UINTVAL length_bytes = string_max_bytes(interpreter, src, true_length);
		
		dest = string_make_empty(interpreter, src->representation, true_length);
	
		mem_sys_memcopy(dest->strstart, 
						(char *)src->strstart 
							+ string_max_bytes(interpreter, src, true_offset),
						length_bytes);
						
		dest->bufused = length_bytes;
		dest->strlen = true_length;

        *d = dest;
    }

    /* Now do the replacement */

	/* this section could be more efficient, if we don't prescale the whole string(s) */
	if( rep->representation > src->representation )
	{
		if( _string_smallest_representation(interpreter, rep) <= src->representation )
		{
			/* downsize replacement string */
			_string_downscale(interpreter, rep, src->representation);
		}
		else
		{
			/* must upsize target string; would be more efficient to do such that the 
			   replacement is done at the same time */
			_string_upscale(interpreter, src, rep->representation, 0);
    }
	}
	/* either way, they now have the same rep */

/* XXXX: make sure the rest of this method is correct, vis-a-vis byte v. character */
    substart_off = string_max_bytes(interpreter, src, true_offset);

    subend_off = substart_off + string_max_bytes(interpreter, src, true_length);
    
	/* not possible.... */
    if (subend_off < substart_off) {
        internal_exception(SUBSTR_OUT_OF_STRING,
                           "replace: subend somehow is less than substart");
    }

    /*
     * If the replacement string fits inside the original substring
     * don't create a new string, just pack it.
     */
    diff = (subend_off - substart_off) - rep->bufused;

    if(diff >= 0
        || ((INTVAL)src->bufused - (INTVAL)PObj_buflen(src)) <= diff) {
        unmake_COW(interpreter, src);

        if(diff != 0) {
            mem_sys_memmove((char*)src->strstart + substart_off + rep->bufused,
                                (char*)src->strstart + subend_off,
                                src->bufused - subend_off);
            src->bufused -= diff;
        }

        mem_sys_memcopy((char*)src->strstart + substart_off,
                                rep->strstart, rep->bufused);
        if(diff != 0)
            (void)string_compute_strlen(interpreter, src);
    }
    /*
     * Replacement is larger than avail buffer, grow the string
     */
    else {
        /* diff is negative here, make it positive */
        diff = -(diff);
        string_grow(interpreter, src, diff);

        /* Move the end of old string that isn't replaced to new offset
         * first */
        mem_sys_memmove((char*)src->strstart + subend_off + diff,
                                (char*)src->strstart + subend_off,
                                src->bufused - subend_off);
        /* Copy the replacement in */
        mem_sys_memcopy((char *)src->strstart + substart_off, rep->strstart,
                                rep->bufused);
        src->bufused += diff;
        (void)string_compute_strlen(interpreter, src);
    }

    /* src is modified, now return the original substring */
    return dest;
}

/*

=item C<STRING *
string_chopn(STRING *s, INTVAL n)>

Chops off the last C<n> characters of C<*s>. If C<n> is negative, cut
the string after C<+n> characters.

=cut

*/

STRING *
string_chopn(struct Parrot_Interp *interpreter, STRING *s, INTVAL n)
{
    UINTVAL new_length;
    struct string_iterator_t it;

    if (n < 0) {
        new_length = -n;
        if (new_length > s->strlen)
            return s;
    }
    else {
        if (s->strlen > (UINTVAL)n)
            new_length = s->strlen - n;
        else
            new_length = 0;
    }

    s->strlen = new_length;
    s->bufused = string_max_bytes(interpreter, s, new_length);

    return s;
}


#define COMPARE_STRINGS(type1, type2, s1, s2, result) \
do { \
	size_t minlen = s1->strlen > s2->strlen ? s2->strlen : s1->strlen; \
	size_t index = 0; \
	type1 *curr1 = (type1 *)s1->strstart; \
	type2 *curr2 = (type2 *)s2->strstart; \
	 \
	while( (index++ < minlen) && (*curr1 == *curr2) ) \
	{ \
		++curr1; \
		++curr2; \
	} \
	 \
	*result = *curr1 - *curr2; \
	 \
	if( !*result ) \
	{ \
		if( s1->strlen != s2->strlen ) \
		{ \
			*result = s1->strlen > s2->strlen ? 1 : -1; \
		} \
	} \
	else \
	{ \
		*result = *result > 0 ? 1 : -1; \
	} \
} while(0)

/*

=item C<INTVAL
string_compare(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2)>

Compare two strings, performing type and encoding conversions if
necessary.

Returns the standard -1, 0, 1 comparison result, indicating whether
C<*s1> was C<< < >>, C<==>, C<< > >> C<*s2>.

=cut

*/

INTVAL
string_compare(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2)
{
    INTVAL cmp;

    if (!s1 && !s2) {
        return 0;
    }
    if (!s2) {
        return s1->strlen != 0;
    }
    if (!s1) {
        return -(s2->strlen != 0);
    }

#  if ! DISABLE_GC_DEBUG
    /* It's easy to forget that string comparison can trigger GC */
    if (GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#  endif

	if( s1->representation == s2->representation )
	{
		switch( s1->representation )
		{
		
			case enum_stringrep_one:
				/* could use memcmp in this one case; faster?? */
				COMPARE_STRINGS(uint8_t, uint8_t, s1, s2, &cmp);
				break;
			case enum_stringrep_two:
				COMPARE_STRINGS(uint16_t, uint16_t, s1, s2, &cmp);
				break;
			case enum_stringrep_four:
				COMPARE_STRINGS(uint32_t, uint32_t, s1, s2, &cmp);
				break;
			default:
				/* trouble! */
				break;
    }

		return cmp;
        }
        else
	{
		/* make this 3 more cases, rather than 6 */
		INTVAL multiplier;
		STRING *larger;
		STRING *smaller;

		if( s1->representation > s2->representation )
		{
			larger = s1;
			smaller = s2;
			multiplier = 1;
    }
		else
		{
			larger = s2;
			smaller = s1;
			multiplier = -1;
        }

		if( larger->representation == enum_stringrep_four )
		{
			if( smaller->representation == enum_stringrep_two )
			{
				COMPARE_STRINGS(uint32_t, uint16_t, larger, smaller, &cmp);
        }
			else /* smaller->representation == enum_stringrep_one */
			{
				COMPARE_STRINGS(uint32_t, uint8_t, larger, smaller, &cmp);
        }
    }
		else /* larger->representation == enum_stringrep_two, smaller->representation == enum_stringrep_one */
		{
			COMPARE_STRINGS(uint16_t, uint8_t, larger, smaller, &cmp);
    }

		return cmp * multiplier;
    }
}

/*

=item C<INTVAL
string_equal(struct Parrot_Interp *interpreter, STRING *s1, STRING *s2)>

Compare two strings, performing type and encoding conversions if
necessary.

Note that this function returns 0 if the strings are equal and 1
otherwise.

=cut

*/

INTVAL
string_equal(struct Parrot_Interp *interpreter, STRING *s1, STRING *s2)
{
    if ( (s1 == s2) || (!s1 && !s2) ) {
        return 0;
    }
    else if (!s2) {
        return s1->strlen != 0;
    }
    else if (!s1) {
        return s2->strlen != 0;
    }
    else if (s1->strlen != s2->strlen) {
        return 1;       /* we don't care which is bigger */
	}
	else if (!s1->strlen && !s2->strlen) {
		return 0;
	}

#  if ! DISABLE_GC_DEBUG
    /* It's easy to forget that string comparison can trigger GC */
    if (GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#  endif

    /*
     * now,
     * both strings are non-null
     * both strings have same length
     */

    if (s1->representation == s2->representation)
    {
        return memcmp(s1->strstart, s2->strstart, s1->bufused);
    }
    else /* all the fast shortcuts have been taken--now just left with compare */
    {
		return string_compare(interpreter, s1, s2);
    }
}

/*

=item C<static void
make_writable(struct Parrot_Interp *interpreter, STRING **s,
              const size_t len, parrot_string_representation_t representation)>

Make string writable with specified minimum length. Representation
is required in case a new string has to be created.

=cut

*/

static void
make_writable(struct Parrot_Interp *interpreter, STRING **s,
			  const size_t len, parrot_string_representation_t representation)
{
    if (!*s)
        *s = string_make_empty(interpreter, representation, len);
    else if ((*s)->strlen < len)
        string_grow(interpreter, *s, len - (*s)->strlen);
    else if (PObj_is_cowed_TESTALL(*s))
        unmake_COW(interpreter, *s);
}

#define BITWISE_AND_STRINGS(type1, type2, restype, s1, s2, res, minlen) \
do { \
	const type1 *curr1 = (type1 *)s1->strstart; \
	const type2 *curr2 = (type2 *)s2->strstart; \
    restype *dp = (restype *)res->strstart; \
    size_t len = minlen; \
 \
    for ( ; len ; ++curr1, ++curr2, ++dp, --len) \
        *dp = *curr1 & *curr2; \
} while(0)

/*

=item C<STRING *
string_bitwise_and(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest)>

Perform a bitwise C<and> on two strings, performing type and encoding
conversions if necessary. If C<*dest != NULL> then C<**dest> is reused,
otherwise a new string is created.

=cut

*/

STRING *
string_bitwise_and(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest)
{
    STRING *res = NULL;
	size_t minlen = 0;
	parrot_string_representation_t maxrep = enum_stringrep_one;

/* think about case of dest string is one of the operands */
    if (s1 && s2)
    {
		minlen = s1->strlen > s2->strlen ? s2->strlen : s1->strlen;
		maxrep = s1->representation >= s2->representation ? 
						s1->representation : s2->representation;
	}

    if (dest && *dest)
    {
        res = *dest;
    }
    else if (!s1 || !s2)
    {
        res = string_make_empty(interpreter, enum_stringrep_one, 0);
    }
    else
    {
        res = string_make_empty(interpreter, maxrep, minlen);
    }

    if (!s1 || !s2)
    {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }
    else
    {
		_string_upscale(interpreter, res, maxrep, 0);
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#endif

    make_writable(interpreter, &res, minlen, res->representation);

	if( s1->representation == s2->representation )
	{
		switch( s1->representation )
		{
		
			case enum_stringrep_one:
				BITWISE_AND_STRINGS(uint8_t, uint8_t, uint8_t, s1, s2, res, minlen);
				break;
			case enum_stringrep_two:
				BITWISE_AND_STRINGS(uint16_t, uint16_t, uint16_t, s1, s2, res, minlen);
				break;
			case enum_stringrep_four:
				BITWISE_AND_STRINGS(uint32_t, uint32_t, uint32_t, s1, s2, res, minlen);
				break;
			default:
				/* trouble! */
				break;
		}
	}
	else
	{
		/* make this 3 more cases, rather than 6 */
		STRING *larger;
		STRING *smaller;

		if( s1->representation > s2->representation )
		{
			larger = s1;
			smaller = s2;
		}
		else
		{
			larger = s2;
			smaller = s1;
		}

		if( larger->representation == enum_stringrep_four )
		{
			if( smaller->representation == enum_stringrep_two )
			{
				BITWISE_AND_STRINGS(uint32_t, uint16_t, uint32_t, larger, smaller, res, minlen);
			}
			else /* smaller->representation == enum_stringrep_one */
			{
				BITWISE_AND_STRINGS(uint32_t, uint8_t, uint32_t, larger, smaller, res, minlen);
			}
		}
		else /* larger->representation == enum_stringrep_two, smaller->representation == enum_stringrep_one */
		{
			BITWISE_AND_STRINGS(uint16_t, uint8_t, uint16_t, larger, smaller, res, minlen);
		}
	}

	res->strlen = minlen;
	res->bufused = string_max_bytes(interpreter, res, res->strlen);

    if (dest)
        *dest = res;
        
    return res;
}

#define BITWISE_OR_STRINGS(type1, type2, restype, s1, s2, res, maxlen, op) \
do { \
	const type1 *curr1 = NULL; \
	const type2 *curr2 = NULL; \
	size_t length1 = 0; \
	size_t length2 = 0; \
	 \
	if( s1 ) \
	{ \
		curr1 = (type1 *)s1->strstart; \
		length1 = s1->strlen; \
	} \
	 \
	if( s2 ) \
	{ \
		curr2 = (type2 *)s2->strstart; \
		length2 = s2->strlen; \
	} \
 \
    restype *dp = (restype *)res->strstart; \
    size_t index = 0; \
 \
    for ( ; index < maxlen ; ++curr1, ++curr2, ++dp, ++index) \
    { \
        if (index < length1) \
        { \
        	if (index < length2) \
				*dp = *curr1 op *curr2; \
			else \
				*dp = *curr1; \
		} \
        else if (index < length2) \
        { \
            *dp = *curr2; \
        } \
	} \
} while(0)

/*

=item C<STRING *
string_bitwise_or(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest)>

Perform a bitwise C<or> on two strings, performing type and encoding
conversions if necessary. If C<*dest != NULL> then C<**dest> is reused,
otherwise a new string is created.

=cut

*/

STRING *
string_bitwise_or(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest)
{
    STRING *res = NULL;
    size_t maxlen = 0;
	parrot_string_representation_t maxrep = enum_stringrep_one;

    maxlen = s1 ? s1->bufused: 0;
    if (s2 && s2->bufused > maxlen)
        maxlen = s2->bufused;

    maxrep = s1 ? s1->representation: enum_stringrep_one;
    if (s2 && s2->representation > maxrep)
        maxrep = s2->representation;

    if (dest && *dest)
        res = *dest;
    else if (!s1 && !s2)
        res = string_make_empty(interpreter, enum_stringrep_one, 0);
    else
		res = string_make_empty(interpreter, maxrep, maxlen);

    if (!s1 && !s2) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#endif

    make_writable(interpreter, &res, maxlen, res->representation);


	if( !s1 || !s2 || (s1->representation == s2->representation) )
	{
		switch( maxrep )
		{
			case enum_stringrep_one:
				BITWISE_OR_STRINGS(uint8_t, uint8_t, uint8_t, s1, s2, res, maxlen, |);
				break;
			case enum_stringrep_two:
				BITWISE_OR_STRINGS(uint16_t, uint16_t, uint16_t, s1, s2, res, maxlen, |);
				break;
			case enum_stringrep_four:
				BITWISE_OR_STRINGS(uint32_t, uint32_t, uint32_t, s1, s2, res, maxlen, |);
				break;
			default:
				/* trouble! */
				break;
        }
    }
        else
	{
		/* make this 3 more cases, rather than 6 */
		STRING *larger;
		STRING *smaller;

		if( s1->representation > s2->representation )
		{
			larger = s1;
			smaller = s2;
		}
		else
		{
			larger = s2;
			smaller = s1;
		}

		if( larger->representation == enum_stringrep_four )
		{
			if( smaller->representation == enum_stringrep_two )
			{
				BITWISE_OR_STRINGS(uint32_t, uint16_t, uint32_t, larger, smaller, res, maxlen, |);
			}
			else /* smaller->representation == enum_stringrep_one */
			{
				BITWISE_OR_STRINGS(uint32_t, uint8_t, uint32_t, larger, smaller, res, maxlen, |);
			}
		}
		else /* larger->representation == enum_stringrep_two, smaller->representation == enum_stringrep_one */
		{
			BITWISE_OR_STRINGS(uint16_t, uint8_t, uint16_t, larger, smaller, res, maxlen, |);
		}
    }

	res->strlen = maxlen;
	res->bufused = string_max_bytes(interpreter, res, res->strlen);
	
    if (dest)
        *dest = res;

    return res;
}

/*

=item C<STRING *
string_bitwise_xor(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest)>

Perform a bitwise C<xor> on two strings, performing type and encoding
conversions if necessary. If C<*dest != NULL> then C<**dest> is reused,
otherwise a new string is created.

=cut

*/

STRING *
string_bitwise_xor(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest)
{
    STRING *res = NULL;
    size_t maxlen = 0;
	parrot_string_representation_t maxrep = enum_stringrep_one;

    maxlen = s1 ? s1->bufused: 0;
    if (s2 && s2->bufused > maxlen)
        maxlen = s2->bufused;

    maxrep = s1 ? s1->representation: enum_stringrep_one;
    if (s2 && s2->representation > maxrep)
        maxrep = s2->representation;

    if (dest && *dest)
        res = *dest;
    else if (!s1 && !s2)
        res = string_make_empty(interpreter, enum_stringrep_one, 0);
    else
		res = string_make_empty(interpreter, maxrep, maxlen);

    if (!s1 && !s2) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#endif

    make_writable(interpreter, &res, maxlen, res->representation);


	if( !s1 || !s2 || (s1->representation == s2->representation) )
	{
		switch( maxrep )
		{
			case enum_stringrep_one:
				BITWISE_OR_STRINGS(uint8_t, uint8_t, uint8_t, s1, s2, res, maxlen, ^);
				break;
			case enum_stringrep_two:
				BITWISE_OR_STRINGS(uint16_t, uint16_t, uint16_t, s1, s2, res, maxlen, ^);
				break;
			case enum_stringrep_four:
				BITWISE_OR_STRINGS(uint32_t, uint32_t, uint32_t, s1, s2, res, maxlen, ^);
				break;
			default:
				/* trouble! */
				break;
        }
    }
        else
	{
		/* make this 3 more cases, rather than 6 */
		STRING *larger;
		STRING *smaller;

		if( s1->representation > s2->representation )
		{
			larger = s1;
			smaller = s2;
		}
		else
		{
			larger = s2;
			smaller = s1;
    }

		if( larger->representation == enum_stringrep_four )
		{
			if( smaller->representation == enum_stringrep_two )
			{
				BITWISE_OR_STRINGS(uint32_t, uint16_t, uint32_t, larger, smaller, res, maxlen, ^);
			}
			else /* smaller->representation == enum_stringrep_one */
			{
				BITWISE_OR_STRINGS(uint32_t, uint8_t, uint32_t, larger, smaller, res, maxlen, ^);
			}
		}
		else /* larger->representation == enum_stringrep_two, smaller->representation == enum_stringrep_one */
		{
			BITWISE_OR_STRINGS(uint16_t, uint8_t, uint16_t, larger, smaller, res, maxlen, ^);
		}
	}

	res->strlen = maxlen;
	res->bufused = string_max_bytes(interpreter, res, res->strlen);
	
    if (dest)
        *dest = res;

    return res;
}

/*
#define BITWISE_NOT_STRING(type, s, res) \
do { \
	if( s && res ) \
	{ \
		const type *curr = (type *)s->strstart; \
		size_t length = s->strlen; \
		uint32_t *dp = (uint32_t *)res->strstart; \
 \
		for ( ; length ; --length) \
		{ \
			*dp++ = ~ *curr++; \
		} \
	} \
} while(0)
*/

#define BITWISE_NOT_STRING(type, s, res) \
do { \
	if( s && res ) \
	{ \
		const type *curr = (type *)s->strstart; \
		size_t length = s->strlen; \
		uint32_t *dp = (uint32_t *)res->strstart; \
 \
		for ( ; length ; --length, ++dp, ++curr) \
		{ \
			uint32_t temp = *curr; \
			if( temp <= (uint32_t)0xFF ) *dp = 0xFF & ~ *curr; \
			else if( temp <= (uint32_t)0xFFFF ) *dp = 0xFFFF & ~ *curr; \
			else *dp = 0xFFFFF & ~ *curr; \
		} \
	} \
} while(0)

/*

=item C<STRING *
string_bitwise_not(struct Parrot_Interp *interpreter, STRING *s,
               STRING **dest)>

Perform a bitwise C<not> on a string. If C<*dest != NULL> then C<**dest>
is reused, otherwise a new string is created.

=cut

*/

STRING *
string_bitwise_not(struct Parrot_Interp *interpreter, STRING *s,
               STRING **dest)
{
    STRING *res = NULL;
    size_t len = s ? s->strlen : 0;

    if (dest && *dest)
        res = *dest;
    else
		res = string_make_empty(interpreter, enum_stringrep_four, len);

    if (!s) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }
    else {
		_string_upscale(interpreter, res, enum_stringrep_four, 0);
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#endif

    make_writable(interpreter, &res, len, enum_stringrep_four);

    res->strlen = len;
    res->bufused = string_max_bytes(interpreter, res, len);

	switch( s->representation )
	{
		case enum_stringrep_one:
			BITWISE_NOT_STRING(uint8_t, s, res);
			break;
		case enum_stringrep_two:
			BITWISE_NOT_STRING(uint16_t, s, res);
			break;
		case enum_stringrep_four:
			BITWISE_NOT_STRING(uint32_t, s, res);
			break;
		default:
			/* trouble */
			break;
	}

    if (dest)
        *dest = res;

    return res;
}

/*

=item C<INTVAL
string_bool(const STRING *s)>

A string is "true" if it is equal to anything other than "" or "0".

=cut

*/

INTVAL
string_bool(struct Parrot_Interp *interpreter, const STRING *s)
{
    INTVAL len;
    if (s == NULL) {
        return 0;
    }

    len = string_length(interpreter, s);

    if (len == 0) {
        return 0;
    }

    if (len == 1) {

        UINTVAL c = string_index(interpreter, s, 0);

		/* relying on character literals being interpreted as ascii--may not be correct
		   on ebdic systems. use numeric value instead? */
        if (c == '0') { /* later, accept other chars with digit value 0? or, no */
            return 0;
        }
    }

    return 1;                   /* it must be true */
}

/*

=item C<STRING*
string_nprintf(struct Parrot_Interp *interpreter,
               STRING *dest, INTVAL bytelen, const char *format, ...)>

This is like C<Parrot_snprintf()> except that it writes to and returns a
C<STRING *>.

Note that C<bytelen> does I<not> include space for a (non-existent)
trailing C<'\0'>. C<dest> may be a C<NULL> pointer, in which case a new
native string will be created. If C<bytelen> is 0, the behaviour becomes
more C<sprintf>-ish than C<snprintf>-like. C<bytelen> is measured in the
encoding of C<*dest>.

=cut

*/

STRING*
string_nprintf(struct Parrot_Interp *interpreter,
               STRING *dest, INTVAL bytelen, const char *format, ...)
{
    STRING *output;
    va_list args;

    va_start(args, format);
    output = Parrot_vsprintf_c(interpreter, format, args);
    va_end(args);

    if(bytelen > 0 && bytelen < (INTVAL)string_length(interpreter, output)) {
        string_substr(interpreter, output, 0, bytelen, &output, 1);
    }

    if(dest == NULL) {
        return output;
    }
    else {
        string_set(interpreter, dest, output);
        return dest;
    }
}


STRING*
string_printf(struct Parrot_Interp *interpreter, const char *format, ...)
{
    STRING *output;
    va_list args;

    va_start(args, format);
    output = Parrot_vsprintf_c(interpreter, format, args);
    va_end(args);

	return output;
}


/*

=item C<INTVAL
string_to_int(const STRING *s)>

A number is such that:

=over 4

=item C<sign>

'+' | '-'

=item C<digit>

"Any code point considered a digit by the chartype."

=item C<indicator>

'e' | 'E'

=item C<digits>

digit [digit]...

=item C<decimal-part>

digits '.' [digits] | ['.'] digits

=item C<exponent-part>

indicator [sign] digits

=item C<numeric-string>

[sign] decimal-part [exponent-part]

=back

An integer is the appropriate integer representation of such a number,
rounding towards zero.

=cut

*/

/* A number is such that:
  sign           =  '+' | '-'
  digit          =  "Any code point considered a digit by the chartype"
  indicator      =  'e' | 'E'
  digits         =  digit [digit]...
  decimal-part   =  digits '.' [digits] | ['.'] digits
  exponent-part  =  indicator [sign] digits
  numeric-string =  [sign] decimal-part [exponent-part]
*/


INTVAL
string_to_int(struct Parrot_Interp *interpreter, const STRING *s)
{
#if 0
    INTVAL i = 0;

    if (s) {
        const char *start = s->strstart;
        const char *end = start + s->bufused;
        int sign = 1;
        INTVAL in_number = 0;

        while (start < end) {
            UINTVAL c = s->encoding->decode(start);

            if (Parrot_char_is_digit(s->type,c)) {
                in_number = 1;
                i = i * 10 + (c - '0');
            }
            else if (!in_number) {
                /* we've not yet seen any digits */
                if (c == '-') {
                    sign = -1;
                }
                else {
                    sign = 1;
                }
            }
            else {
                break;
            }

            start = s->encoding->skip_forward(start, 1);
        }

        i = i * sign;
    }

    return i;
#else
    return (INTVAL) string_to_num(interpreter, s);
#endif
}

/*

=item C<FLOATVAL
string_to_num(const STRING *s)>

Same as C<string_to_int()> except that a C<FLOATVAL> is returned.

=cut

*/

FLOATVAL
string_to_num(struct Parrot_Interp *interpreter, const STRING *s)
{
    FLOATVAL f = 0.0;

    if (s) {
        UINTVAL index = 0;
        UINTVAL length = s->strlen;
        int sign = 1;
        INTVAL seen_dot = 0;
        INTVAL seen_e = 0;
        int exp_sign = 0;
        INTVAL in_exp = 0;
        INTVAL in_number = 0;
        INTVAL exponent = 0;
        INTVAL fake_exponent = 0;
        INTVAL digit_family = 0;
        FLOATVAL exp_log=10.0, exp_val=1.0;

        while (index < length) {
			UINTVAL c = string_index(interpreter, s, index);
            INTVAL df = Parrot_char_is_digit(interpreter, c);

            if (df && !digit_family)
                digit_family = df;

            if (df && df == digit_family) {
                if (in_exp) {
                    exponent = exponent*10 + Parrot_char_digit_value(interpreter, c);
                    if (!exp_sign) {
                        exp_sign = 1;
                    }
                }
                else {
                    /* We're somewhere in the main string of numbers */
                    in_number = 1;
                    f = f * 10 + Parrot_char_digit_value(interpreter, c);
                    if (seen_dot) {
                        fake_exponent--;
                    }
                }
            }
            else if (!in_number) {
                /* we've not yet seen any digits */
                if (c == '-') { /* XXX: ascii */
                    sign = -1;
                }
                else if (c == '.') {    /* XXX: ascii */
                    seen_dot = 1;
                }
                else {
                    seen_dot = 0;
                    sign = 1;
                }
            }
            else {
                /* we've seen some digits, are we done yet? */
                if (!seen_dot && c == '.' && !in_exp) { /* XXX: ascii */
                    seen_dot = 1;
                }
                else if (!seen_e && (c == 'e' || c == 'E')) { /* XXX: ascii */
                    seen_e = 1;
                    in_exp = 1;
                }
                else if (seen_e && !exp_sign) {
                    if (c == '+') {     /* XXX: ascii */
                        exp_sign = 1;
                    }
                    else if (c == '-') {        /* XXX: ascii */
                        exp_sign = -1;
                    }
                    else {
                        break;  /* e-- is silly */
                    }
                }
                else {
                    break;      /* run out of number, all done */
                }
            }

            ++index;
        }

        exponent = fake_exponent + exponent * exp_sign;

        if(exponent < 0) {
            exponent = -exponent;
            exp_sign=-1;
        }

        for (;;) {
            if (exponent & 1) {
                exp_val *= exp_log;
                exponent--;
            }
            if (!exponent)
                break;
            exp_log *= exp_log;
            exponent >>= 1;
        }

        if(exp_sign < 0)
            f /= exp_val;
        else
            f *= exp_val;


        if(sign < 0)
            f = -f;
    }

    return f;
}

/*

=item C<STRING *
string_from_int(struct Parrot_Interp * interpreter, INTVAL i)>

Returns a string representation of C<i>.

=cut

*/

STRING *
string_from_int(struct Parrot_Interp * interpreter, INTVAL i) {
    char buf[128];
    return int_to_str(interpreter, buf, i, 10);
}

/*

=item C<STRING *
string_from_num(struct Parrot_Interp * interpreter, FLOATVAL f)>

Calls C<Parrot_sprintf_c()> to return a string representation of C<f>.

=cut

*/

STRING *
string_from_num(struct Parrot_Interp * interpreter, FLOATVAL f)
{
    /* Too damn hard--hand it off to Parrot_sprintf, which'll probably
       use the system sprintf anyway, but has gigantic buffers that are
       awfully hard to overflow. */
    return Parrot_sprintf_c(interpreter, "%vg", f);
}

/*

=item C<char *
string_to_cstring(struct Parrot_Interp * interpreter, STRING * s)>

Returns a C string for C<*s>.

=cut

*/

char *
string_to_cstring(struct Parrot_Interp * interpreter, STRING * s)
{
#if 0
    if (PObj_buflen(s) == s->bufused) {
        string_grow(interpreter, s, 1);
    }
    else
        unmake_COW(interpreter, s);

    /* PObj_immobile_SET(s);
     *
     * XXX we don't know, how this cstring gets used by external code
     * so setting the string to immobile would be the best thing, but
     * immobile strings don't get moved - yes - but they get freed in
     * compact_pool :-(
     * The correct way to handle this is probably to malloc the memory
     * and set the PObj_sysmem_FLAG
     * -leo
     */

    ((char *)s->strstart)[s->bufused] = 0;
    /* don't return local vars, return the right thing */
    return (char*)s->strstart;
#else
    /* TODO XXX FIXME ;-) non ascii & memory leak  -leo
     * the real solution WRT leak is this:
     * the caller of this function has to free this cstring that's all
     */
     /*
     or better, don't have this, but have method to return a buffer PMC with the right bytes
     */
    char *p;
    if (s == NULL) {
        return NULL;
    }
    p = mem_sys_allocate(s->bufused + 1);
    memcpy(p, s->strstart, s->bufused);
    p[s->bufused] = 0;
    return p;
#endif
}

/*

=item C<void
string_cstring_free(void *ptr)>

Free a string created by C<string_to_cstring()>.

Hopefully this can be a go away at some point, as it's got all sorts of
leak potential otherwise.

=cut

*/

void
string_cstring_free(void *ptr) {
    free(ptr);
}

/*

=item C<void
string_pin(struct Parrot_Interp * interpreter, STRING * s)>

Replace the managed buffer memory by system memory.

=cut

*/

void
string_pin(struct Parrot_Interp * interpreter, STRING * s) {
    void *memory;
    INTVAL size;

    /* If this string is marked as immobile, external memory, starts
    in external memory, is already from system memory, or is a
    constant, we just don't do this */
    if (PObj_get_FLAGS(s) & (PObj_immobile_FLAG | PObj_external_FLAG |
                        PObj_bufstart_external_FLAG | PObj_sysmem_FLAG |
                        PObj_constant_FLAG)) {
        return;
    }

    /* XXX -lt: COW strings have the external_FLAG set, so this will
     *          not work for these
     *          so probably only sysmem should be tested
     */
    unmake_COW(interpreter, s);
    size = PObj_buflen(s);
    memory = mem_sys_allocate(size);
    mem_sys_memcopy(memory, PObj_bufstart(s), size);
    PObj_bufstart(s) = memory;
    /* Mark the memory as both from the system and immobile */
    PObj_flags_SETTO(s, PObj_get_FLAGS(s) |
        (PObj_immobile_FLAG | PObj_sysmem_FLAG));
}

/*

=item C<void
string_unpin(struct Parrot_Interp * interpreter, STRING * s)>

Undo a C<string_pin()> so that the string once again uses managed
memory.

=cut

*/

void
string_unpin(struct Parrot_Interp * interpreter, STRING * s) {
    void *memory;
    INTVAL size;

    /* If this string is not marked using system memory,
     * we just don't do this
     */
    if (!(PObj_sysmem_TEST(s))) {
        return;
    }

    /* unmake_COW(interpreter, s); XXX -lt: can not be cowed ??? */
    size = PObj_buflen(s);
    /* We need a handle on the fixed memory so we can get rid of it
       later */
    memory = PObj_bufstart(s);
    /* Reallocate it the same size
     * NOTE can't use Parrot_reallocate_string because of the LEA
     * allocator, where this is a noop for the same size
     *
     * We have to block GC here, as we have a pointer to bufstart
     */
    Parrot_block_GC(interpreter);
    Parrot_allocate_string(interpreter, s, size);
    Parrot_unblock_GC(interpreter);
    mem_sys_memcopy(PObj_bufstart(s), memory, size);
    /* Mark the memory as neither immobile nor system allocated */
    PObj_immobile_CLEAR(s);
    PObj_sysmem_CLEAR(s);
    /* Free up the memory */
    mem_sys_free(memory);
}

#define HASH_STRING(TYPE, s, h) \
do { \
    TYPE *buffptr = (TYPE *)s->strstart; \
    UINTVAL len = s->strlen; \
 \
    while (len--) { \
        h += h << 5; \
        h += *buffptr++; \
    } \
} while(0)

/* cache this value in an ivar? make the seed global, but random at start time? */
size_t
string_hash(struct Parrot_Interp * interpreter, Hash *hash, STRING *s)
{
    register size_t h = hash->seed;

    UNUSED(interpreter);

	if( !s ) { return 0; }
	
	switch( s->representation )
	{
		case enum_stringrep_one:
			HASH_STRING(uint8_t, s, h);
			break;
		case enum_stringrep_two:
			HASH_STRING(uint16_t, s, h);
			break;
		case enum_stringrep_four:
			HASH_STRING(uint32_t, s, h);
			break;
		default:
			/* trouble */
			break;
	}

    return h;
}

static void
string_append_chr(struct Parrot_Interp * interpreter, 
				  STRING *s, UINTVAL character)
{
	/* easy way for now; could make it more efficient */
	string_append(interpreter, s,
				  string_chr(interpreter, character),
				  0);
}

static UINTVAL
_parse_hex_digits(char **cstring, int incount)
{
    char hexdigits[] = "0123456789abcdef";

	UINTVAL cval = 0;
	int count = incount;

	while (count-- && (*cstring)[1])
	{
		int c1 = tolower((*cstring)[1]);
		char *p1 = strchr(hexdigits, c1);

		if (p1) {
			cval = (cval << 4) | (p1-hexdigits);
			++(*cstring);
		}
		else {
			/* XXX warning? */
			break;
		}
	}

	return cval;	
}

static STRING *
string_constant_copy(struct Parrot_Interp *interpreter, STRING* s)
{
	return string_make(interpreter, s->strstart, s->bufused, 
			string_primary_encoding_for_representation(interpreter, 
												s->representation),
			(PObj_get_FLAGS(s) | PObj_constant_FLAG) );
}
            
static void
_string_unescape_cstring_large(struct Parrot_Interp * interpreter, 
								char *cstring, STRING *outstring, UINTVAL firstchar,
								char delimiter)
{
    char hexdigits[] = "0123456789abcdef";
    STRING *result = outstring;
    char *string;
    
	if( outstring ) string_append_chr(interpreter, result, firstchar);

    if( !cstring ) return;
    
    for (string = cstring ; *string; ++string)
    {
        if (*string == '\\' && string[1]) {
            switch (*++string) {
                case 'n':
                    string_append_chr(interpreter, result, '\n');
                    break;
                case 'r':
                    string_append_chr(interpreter, result, '\r');
                    break;
                case 't':
                    string_append_chr(interpreter, result, '\t');
                    break;
                case 'a':
                    string_append_chr(interpreter, result, '\a');
                    break;
                case 'f':
                    string_append_chr(interpreter, result, '\f');
                    break;
                case 'e':
                    string_append_chr(interpreter, result, '\033');
                    break;
                case '\\':
                    string_append_chr(interpreter, result, '\\');
                    break;
                case 'x':       /* XXX encoding??? */
                    string_append_chr(interpreter, result, _parse_hex_digits(&string, 2));
                    break;
                case 'u':       /* XXX encoding??? */
					string_append_chr(interpreter, result, _parse_hex_digits(&string, 4));
                    break;
                default:
					string_append_chr(interpreter, result, *string);
                    break;
            }
        }
        else if (*string == delimiter)
        	break;
        else
			string_append_chr(interpreter, result, *string);
    }
}

STRING *
string_unescape_cstring(struct Parrot_Interp * interpreter, char *cstring, char delimiter)
{
    char *p, *string;
    char hexdigits[] = "0123456789abcdef";
    STRING *result;
    size_t clength = strlen(cstring);
    
    if( !cstring || !clength ) return NULL;
    
	result = string_make(interpreter, cstring, clength, "iso-8859-1", 0);

    for (p = (char *)result->strstart, string = cstring ; *string; ++string)
    {
        if (*string == '\\' && string[1]) {
            switch (*++string) {
                case 'n':
                    *p++ = '\n';
                    break;
                case 'r':
                    *p++ = '\r';
                    break;
                case 't':
                    *p++ = '\t';
                    break;
                case 'a':
                    *p++ = '\a';
                    break;
                case 'f':
                    *p++ = '\f';
                    break;
                case 'e':
                    *p++ = '\033';
                    break;
                case '\\':
                    *p++ = '\\';
                    break;
                case 'x':       /* XXX encoding??? */
                    {
                        int c1 = tolower(*++string);
                        char *p1 = strchr(hexdigits, c1);
                        char *p2;
                        if (p1) {
                            int c2 = tolower(*++string);
                            p2 = strchr(hexdigits, c2);
                            if (p2)
                                *p++ = ((p1-hexdigits) << 4) | (p2-hexdigits);
                            else {
                                --string;
                                *p++ = (p1-hexdigits);
                            }
                        }
                        else {
                            /* XXX warning? */
                            *p++ = *--string;
                        }
                    }
                    break;
                case 'u':       /* XXX encoding??? */
                    {
                    	UINTVAL cval = 0;
                    	int count = 4;
                    	
                    	while (count-- && string[1])
                    	{
							int c1 = tolower(*++string);
							char *p1 = strchr(hexdigits, c1);

							if (p1) {
								cval = (cval << 4) | (p1-hexdigits);
							}
							else {
								/* XXX warning? */
								--string;
								break;
							}

                    	}
                    	
                    	if( cval <= 0xFF )
                    	{
							*p++ = cval;
                    	}
                    	else
                    	{
                    		/* fall back to a method which handles non-rep-1 strings */
                    		++string;
                    		
                    		/* finish up the string so far */
							result->bufused = p - (char *)result->strstart;
							string_compute_strlen(interpreter, result);

							_string_unescape_cstring_large(interpreter, string, 
														result, cval, delimiter);
							return string_constant_copy(interpreter, result);
                    	}
                    }
                    break;
                default:
                    *p++ = *string;
                    break;
            }
        }
        else if (*string == delimiter)
        	break;
        else
            *p++ = *string;
    }
    
    result->bufused = p - (char *)result->strstart;
    string_compute_strlen(interpreter, result);

	return string_constant_copy(interpreter, result);
}

/* for api string_upcase
   Return an upper-case version of the string s. Non-caseable
   characters are left unchanged
 */
STRING *
string_upcase(struct Parrot_Interp *interpreter, const STRING *s)
{
    internal_exception(INTERNAL_NOT_IMPLEMENTED,
            "Case mangling not yet implemented");
    return NULL;
}

/* for api string_upcase_inplace
   upcase the passed-in string in place.
*/
void
string_upcase_inplace(struct Parrot_Interp *interpreter, STRING *s)
{
    internal_exception(INTERNAL_NOT_IMPLEMENTED,
            "Case mangling not yet implemented");
}

/* for api string_downcase
   Return an downc-case version of the string s. Non-caseable
   characters are left unchanged
 */
STRING *
string_downcase(struct Parrot_Interp *interpreter, const STRING *s)
{
    internal_exception(INTERNAL_NOT_IMPLEMENTED,
            "Case mangling not yet implemented");
    return NULL;
}

/* for api string_downcase_inplace
   downcase the passed-in string in place.
*/
void
string_downcase_inplace(struct Parrot_Interp *interpreter, STRING *s)
{
    internal_exception(INTERNAL_NOT_IMPLEMENTED,
            "Case mangling not yet implemented");
}

/* for api string_titlecase
   Return an title-case version of the string s. Non-caseable
   characters are left unchanged
 */
STRING *
string_titlecase(struct Parrot_Interp *interpreter, const STRING *s)
{
    internal_exception(INTERNAL_NOT_IMPLEMENTED,
            "Case mangling not yet implemented");
    return NULL;
}

/* for api string_titlecase_inplace
  titlecase the passed-in string in place.
*/
void
string_titlecase_inplace(struct Parrot_Interp *interpreter, STRING *s)
{
    internal_exception(INTERNAL_NOT_IMPLEMENTED,
            "Case mangling not yet implemented");
}

/*

=back

=head1 SEE ALSO

F<include/parrot/string.h>, F<include/parrot/string_funcs.h>,
F<docs/strings.pod>.

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
