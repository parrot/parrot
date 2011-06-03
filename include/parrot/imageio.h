/* Copyright (C) 2001-2009, Parrot Foundation.
 */
#ifndef PARROT_IMAGEIO_H_GUARD
#define PARROT_IMAGEIO_H_GUARD

#define GROW_TO_16_BYTE_BOUNDARY(size) ((size) + ((size) % 16 ? 16 - (size) % 16 : 0))

/* macros/constants to handle packing/unpacking of PMC IDs and flags
 * the 2 LSBs are used for flags, all other bits are used for PMC ID
 */
#define PackID_new(id, flags)       (((UINTVAL)(id) * 4) | ((UINTVAL)(flags) & 3))
#define PackID_get_PMCID(id)        ((UINTVAL)(id) / 4)
#define PackID_set_PMCID(lv, id)    (lv) = PackID_new((id), PackID_get_FLAGS(lv))
#define PackID_get_FLAGS(id)        ((UINTVAL)(id) & 3)
#define PackID_set_FLAGS(lv, flags) (lv) = PackID_new(PackID_get_PMCID(lv), (flags))

/* preallocate freeze image for aggregates with this estimation */
#define FREEZE_BYTES_PER_ITEM 9

enum {
    enum_PackID_normal      = 0,
    enum_PackID_seen        = 1,
    enum_PackID_pbc_backref = 2
};

#endif /* PARROT_IMAGEIO_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
