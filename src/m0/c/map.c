#define M0_SOURCE
#include "m0.h"

#include <limits.h>
#include <stdlib.h>
#include <string.h>

enum {
    EMPTY,
    FULL,
    OVERFLOW
};

enum {
    BITS_PER_BUCKET = 2,
    BITS_PER_BLOCK = CHAR_BIT * sizeof (unsigned)
};

struct m0_bucket_ {
    union {
        M0_String *as_string;
        size_t as_size;
        M0_Value dummy_; // padding
    } header;
    M0_Value value;
};

static inline bool is_pow2(size_t size)
{
    return size && (size & (size - 1)) == 0;
}

static inline size_t index_size(size_t map_size)
{
    return (map_size * BITS_PER_BUCKET + BITS_PER_BLOCK - 1) / BITS_PER_BLOCK;
}

M0_Map *m0_map_create(size_t size, uint32_t seed)
{
    assert(is_pow2(size));

    uint32_t mask = (uint32_t)(size - 1);
    assert(mask == size - 1);

    M0_Map *map = NULL;
    unsigned *index = NULL;
    struct m0_bucket_ *buckets = NULL;

    buckets = malloc(size * sizeof *buckets);
    if(!buckets) goto FAIL;

    index = calloc(index_size(size), sizeof *index);
    if(!index) goto FAIL;

    map = malloc(sizeof *map);
    if(!map) goto FAIL;

    map->buckets = buckets;
    map->index = index;
    map->load = 0;
    map->mask = mask;
    map->seed = seed;

    return map;

FAIL:
    free(map);
    free(index);
    free(buckets);
    return NULL;
}

static inline unsigned bucket_state(M0_Map *map, uint32_t slot)
{
    unsigned block_index = (slot * BITS_PER_BUCKET) / BITS_PER_BLOCK;
    unsigned offset = (slot * BITS_PER_BUCKET) % BITS_PER_BLOCK;
    return (map->index[block_index] >> offset) & (BITS_PER_BUCKET - 1);
}

bool m0_map_contains(M0_Map *map, const M0_String *string)
{
    uint32_t slot = string->hash & map->mask;

    unsigned state = bucket_state(map, slot);
    if(state == EMPTY) return 0;

    if(state == FULL)
        return m0_string_eq(string, map->buckets[slot].header.as_string);

    if(state == OVERFLOW) {
        size_t size = map->buckets[slot].header.as_size;
        struct m0_bucket_ *buckets = map->buckets[slot].value.as_ptr;
        for(size_t i = 0; i < size; ++i) {
            if(m0_string_eq(string, buckets[i].header.as_string))
                return 1;
        }

        return 0;
    }

    assert(!"PANIC: illegal map state");
    return 0;
}
