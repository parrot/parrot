/* chartype.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the string character type subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

/* 
 * Unicode mapping table
 * Type 1 = simple array of unicode code points (always 256 for now)
 * Type 2 = array of ranges (not yet implemented)
 */
struct chartype_unicode_map_t {
    int type;
    union {
        INTVAL *cparray;
    } u;
};


extern CHARTYPE usascii_chartype;
extern CHARTYPE unicode_chartype;

/* Registered character types */
static CHARTYPE **chartype_array = NULL;
static int chartype_count = 0;

/* Registered transcoders */
static struct chartype_transcoder_entry_t **transcoder_array = NULL;
static int transcoder_count = 0;

struct chartype_digit_map_t default_digit_map = { 0x30, 0x39, 0 };

/*
 * Register a chartype entry and its transcoders
 */
static void
chartype_register(CHARTYPE *type)
{
    if (type->index == -1)
        type->index = chartype_count;
    if (type->index >= chartype_count) {
        size_t old_size = chartype_count * sizeof(CHARTYPE *);
        size_t new_size = (type->index + 1) * sizeof(CHARTYPE *);
        chartype_array = mem_sys_realloc(chartype_array, new_size);
        memset((char *)chartype_array + old_size, 0, new_size - old_size);
        chartype_count = type->index + 1;
    }
    chartype_array[type->index] = type;
}

void
chartype_init()
{
    chartype_count = enum_chartype_MAX;
    chartype_array = mem_sys_allocate(sizeof(CHARTYPE*) * chartype_count);
    chartype_register(&unicode_chartype);
    chartype_register(&usascii_chartype);
}

static char *
malloc_and_strcpy(const char *in)
{
    size_t len = strlen(in);
    char *out = mem_sys_allocate(len+1);
    strcpy(out, in);
    return out;
}

/* TODO Currently handles type 1 maps only */
static UINTVAL
chartype_to_unicode_cparray(const CHARTYPE *from, const CHARTYPE *to, UINTVAL c)
{
    return from->unicode_map->u.cparray[c];
}

/* TODO 
 *    Currently handles type 1 maps only (with 256 entry fixed size)
 *    SLOW! - Need a reverse mapping (hash or sparse array)
 */
static UINTVAL
chartype_from_unicode_cparray(const CHARTYPE *from, const CHARTYPE *to, 
                              UINTVAL c)
{
    int i;
    for (i=0; i<256; i++) {
        if (to->unicode_map->u.cparray[i] == (INTVAL)c)
            return i;
    }
    internal_exception(INVALID_CHARACTER, "Invalid character for chartype\n");
    return 0;
}

/*
 * Create chartype from mapping file
 * Still TODO:
 *   Handle encodings other than singlebyte
 *   Create proper digit mapping table (currently always ascii)
 *   Create other variants of unicode mapping table
 *   Path is hardcoded to "runtime/parrot/chartypes/<name>.TXT"
 *   Does direct file system IO - should probably use Parrot IO
 *   Better parsing code - e.g. handle erroneous input!
 */
static const CHARTYPE *
chartype_create_from_mapping(const char *name)
{
    char *path;
    FILE *f;
    CHARTYPE *type;
    char line[80];
    INTVAL typecode;
    INTVAL unicode;
    INTVAL *cparray;
    struct chartype_unicode_map_t *map;

    path = mem_sys_allocate(strlen(name) + 32);
    sprintf(path, "runtime/parrot/chartypes/%s.TXT", name);
    f = fopen(path, "r");
    if (!f) {
        internal_exception(INVALID_CHARTYPE, "Invalid chartype '%s'\n", name);
        return NULL;
    }

    cparray = mem_sys_allocate(256 * sizeof(INTVAL));
    memset(cparray, 0, 256 * sizeof(INTVAL));
    
    while (!feof(f)) {
        char *p = fgets(line, 80, f);
        if (line[0] != '#') {
            int n = sscanf(line, "%li\t%li", &typecode, &unicode);
            if (n == 2 && typecode >= 0 && typecode < 256) {
                cparray[typecode] = unicode;
            }
        }
    }
    fclose(f);
    
    type = mem_sys_allocate(sizeof(CHARTYPE));
    type->index = -1;    /* will be allocated during registration */
    type->name = malloc_and_strcpy(name);
    type->default_encoding = malloc_and_strcpy("singlebyte");
    type->is_digit = chartype_is_digit_map1;
    type->get_digit = chartype_get_digit_map1;
    type->digit_map = &default_digit_map;
    map = mem_sys_allocate(sizeof(struct chartype_unicode_map_t));
    map->type = 1;
    map->u.cparray = cparray;
    type->unicode_map = map;
    type->from_unicode = chartype_from_unicode_cparray;
    type->to_unicode = chartype_to_unicode_cparray;
    type->transcoders = NULL;
    chartype_register(type);
    return type;
}

const CHARTYPE *
chartype_lookup(const char *name)
{
    int i;

    for (i=0; i<chartype_count; i++) {
        if (chartype_array[i] && !strcmp(name, chartype_array[i]->name)) {
            return chartype_array[i];
        }
    }

    return chartype_create_from_mapping(name);
}

const CHARTYPE *
chartype_lookup_index(INTVAL n)
{
    return chartype_array[n];
}

INTVAL
chartype_find_chartype(const char *name) 
{
    const CHARTYPE *type = chartype_lookup(name);
    if (type)
        return type->index;
    else
        return -1;
}

CHARTYPE_TRANSCODER
chartype_lookup_transcoder(const CHARTYPE *from, const CHARTYPE *to)
{
    CHARTYPE_TRANSCODER transcoder;
    int i;

    for (i=0; i<transcoder_count; i++) {
        if (transcoder_array[i]) {
            if (!strcmp(from->name, transcoder_array[i]->from)
             && !strcmp(to->name, transcoder_array[i]->to))
                return transcoder_array[i]->transcoder;
        }
    }
    return NULL;
}

/*
 * Generic versions of the digit handling functions
 */
Parrot_Int
chartype_is_digit_map1(const CHARTYPE* type, const UINTVAL c)
{
    return c >= type->digit_map->first_code 
        && c <= type->digit_map->last_code;
}

Parrot_Int
chartype_get_digit_map1(const CHARTYPE* type, const UINTVAL c)
{
    return c - type->digit_map->first_code + type->digit_map->first_value;
}

Parrot_Int
chartype_is_digit_mapn(const CHARTYPE* type, const UINTVAL c)
{
    const struct chartype_digit_map_t *map = type->digit_map;
    while (map->first_value >= 0) {
        if (c >= map->first_code && c <= map->last_code)
            return 1;
        map++;
    }
    return 0;
}

Parrot_Int
chartype_get_digit_mapn(const CHARTYPE* type, const UINTVAL c)
{
    const struct chartype_digit_map_t *map = type->digit_map;
    while (map->first_value >= 0) {
        if (c >= map->first_code && c <= map->last_code)
            return c - map->first_code + map->first_value;
        map++;
    }
    /* TODO should we throw an exception? */
    return -1;
}

/*
 * Generic Unicode mapping functions
 */
UINTVAL
chartype_transcode_nop(const CHARTYPE *from, const CHARTYPE *to, UINTVAL c)
{
    return c;
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
