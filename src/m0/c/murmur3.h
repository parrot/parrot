#ifndef MURMUR3_H_
#define MURMUR3_H_

#include <stddef.h>
#include <stdint.h>

static inline bool is_aligned32(const void *ptr)
{
    return (uintptr_t)ptr % 4 == 0;
}

static inline uint32_t rotl32(uint32_t x, int r)
{
    return (x << r) | (x >> (32 - r));
}

static inline uint32_t get32(const uint8_t *bytes, size_t count)
{
    static const union { uint32_t value; uint8_t offsets[4]; }
        MAP = { 0x18100800 };

    uint32_t block = 0;

    switch(count)
    {
        case 4: block |= (uint32_t)bytes[3] << MAP.offsets[3];
        case 3: block |= (uint32_t)bytes[2] << MAP.offsets[2];
        case 2: block |= (uint32_t)bytes[1] << MAP.offsets[1];
        case 1: block |= (uint32_t)bytes[0] << MAP.offsets[0];
    }

    return block;
}

static inline uint32_t mixin(uint32_t hash, uint32_t block)
{
    block *= 0xCC9E2D51;
    block = rotl32(block, 15);
    block *= 0x1B873593;
    return hash ^ block;
}

static inline uint32_t remix(uint32_t hash)
{
    hash = rotl32(hash, 13);
    hash = hash * 5 + 0xE6546B64;
    return hash;
}

static inline uint32_t burn(uint32_t hash)
{
    hash ^= hash >> 16;
    hash *= 0x85EBCA6B;
    hash ^= hash >> 13;
    hash *= 0xC2B2AE35;
    hash ^= hash >> 16;
    return hash;
}

static inline uint32_t murmur3_32(const void *key, size_t size, uint32_t seed)
{
    assert(is_aligned32(key));

    const uint8_t *tail = (const uint8_t *)key + (size / 4) * 4;
    const uint8_t *cursor = key;

    uint32_t hash = seed;

    for(; cursor < tail; cursor += 4)
    {
        hash = mixin(hash, *(uint32_t *)cursor);
        hash = remix(hash);
    }

    hash = mixin(hash, get32(tail, size % 4));
    hash ^= (uint32_t)size;
    hash = burn(hash);

    return hash;
}

#endif
