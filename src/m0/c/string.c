#define M0_SOURCE
#include "m0.h"
#include "murmur3.h"

#include <stdlib.h>
#include <string.h>

static uint32_t hash_string(const M0_String *string, uint32_t seed)
{
    return murmur3_32(string->bytes, string->size, seed);
}

M0_String *m0_string_from_cstring(
    M0_Interp *interp, const char *cstring, int32_t encoding)
{
    size_t size = strlen(cstring) + 1;
    if(size > (uint32_t)-1)
        return NULL;

    M0_String *string = malloc(sizeof *string + size);
    if(!string) return NULL;

    // CRAZINESS, I tell you!
    uint32_t seed = (uint32_t)((uint64_t*)(uintptr_t)(*interp)[CONFIG])[CFG_SEED];

    string->size = (uint32_t)size;
    string->encoding = encoding;
    string->hash = hash_string(string, seed);
    memcpy(string->bytes, cstring, size);

    return string;
}

bool m0_string_eq(const M0_String *a, const M0_String *b)
{
	if(a == b) return 1;

	size_t size = a->size;
	if(b->size != size) return 0;

	return a->hash == b->hash && memcmp(a->bytes, b->bytes, size) == 0;
}
