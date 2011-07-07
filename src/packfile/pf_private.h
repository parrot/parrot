/*
Copyright (C) 2011, Parrot Foundation.
This program is free software. It is subject to the same license as
Parrot itself.
*/

#ifndef PARROT_PR_PRIVATE_H_GUARD
#define PARROT_PR_PRIVATE_H_GUARD

#include "parrot/parrot.h"
#include "parrot/packfile.h"
#include "parrot/embed.h"
#include "parrot/extend.h"
#include "parrot/dynext.h"
#include "parrot/runcore_api.h"
#include "parrot/oplib/core_ops.h"

/* Segment header:
  1 op - Segment size
  1 op - Internal type
  1 op - Internal id
  1 op - Size of theop array
  See pdd13_bytecode: Packfile Segment Header
*/
#define SEGMENT_HEADER_SIZE 4

/* offset not in ptr diff, but in byte */
#define OFFS(pf, cursor) ((pf) ? ((const char *)(cursor) - (const char *)((pf)->src)) : 0)
/**
 * Possible values for ALIGN_16
 *   4 (32bit): 0 1 2 3
 *   8 (64bit): 0 1
 * e.g. reading 4 byte wordsize on 8 byte wordsize: possible ptrs end in 0 4 8 c.
 *   offs(c)/8 => 4/8 = 0 => impossible to align with 8 byte ptr.
 * Limitation TT #254: ALIGN_16  may only be used native, e.g. in the writer,
 * but not with 64bit reading 32bit!
 */
#define ROUND_16(val) (((val) & 0xf) ? 16 - ((val) & 0xf) : 0)
#define ALIGN_16(pf, cursor)                                    \
    (cursor) += ROUND_16(OFFS(pf, cursor))/sizeof (opcode_t)
/* pad to 16 in bytes */
#define PAD_16_B(size) ((size) % 16 ? 16 - (size) % 16 : 0)

/* HEADERIZER BEGIN: src/packfile/output.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t * PackFile_ConstTable_pack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*seg)
        FUNC_MODIFIES(*cursor);

PARROT_EXPORT
size_t PackFile_ConstTable_pack_size(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*seg);

PARROT_EXPORT
int PackFile_ConstTable_rlookup_num(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *ct),
    FLOATVAL n)
        __attribute__nonnull__(2);

PARROT_EXPORT
int PackFile_ConstTable_rlookup_pmc(PARROT_INTERP,
    ARGIN(PackFile_ConstTable *ct),
    ARGIN(PMC *v),
    ARGOUT(INTVAL *constno),
    ARGOUT(INTVAL *idx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*constno)
        FUNC_MODIFIES(*idx);

PARROT_EXPORT
int PackFile_ConstTable_rlookup_str(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *ct),
    ARGIN(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void PackFile_pack(PARROT_INTERP,
    ARGMOD(PackFile *self),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self)
        FUNC_MODIFIES(*cursor);

PARROT_EXPORT
opcode_t PackFile_pack_size(PARROT_INTERP, ARGMOD(PackFile *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

#define ASSERT_ARGS_PackFile_ConstTable_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PackFile_ConstTable_pack_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg))
#define ASSERT_ARGS_PackFile_ConstTable_rlookup_num \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ct))
#define ASSERT_ARGS_PackFile_ConstTable_rlookup_pmc \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ct) \
    , PARROT_ASSERT_ARG(v) \
    , PARROT_ASSERT_ARG(constno) \
    , PARROT_ASSERT_ARG(idx))
#define ASSERT_ARGS_PackFile_ConstTable_rlookup_str \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ct) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_PackFile_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PackFile_pack_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packfile/output.c */

/* HEADERIZER BEGIN: src/packfile/segments.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment * PackFile_Annotations_new(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void PackFile_ConstTable_clear(PARROT_INTERP,
    ARGMOD(PackFile_ConstTable *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const opcode_t * PackFile_ConstTable_unpack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*seg);

PARROT_EXPORT
void PackFile_funcs_register(PARROT_INTERP,
    ARGMOD(PackFile *pf),
    UINTVAL type,
    const PackFile_funcs funcs)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pf);

PARROT_EXPORT
void PackFile_Segment_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
void PackFile_Segment_dump(PARROT_INTERP, ARGIN(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment * PackFile_Segment_new(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment * PackFile_Segment_new_seg(PARROT_INTERP,
    ARGMOD(PackFile_Directory *dir),
    UINTVAL type,
    ARGIN(STRING *name),
    int add)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*dir);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t * PackFile_Segment_pack(PARROT_INTERP,
    ARGIN(PackFile_Segment *self),
    ARGIN(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
size_t PackFile_Segment_packed_size(PARROT_INTERP,
    ARGIN(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const opcode_t * PackFile_Segment_unpack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

void default_dump_header(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PackFile_Annotations_destroy(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*seg);

void PackFile_Annotations_dump(PARROT_INTERP,
    ARGIN(const PackFile_Segment *seg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t * PackFile_Annotations_pack(PARROT_INTERP,
    ARGIN(PackFile_Segment *seg),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*cursor);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
size_t PackFile_Annotations_packed_size(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*seg);

PARROT_CANNOT_RETURN_NULL
const opcode_t * PackFile_Annotations_unpack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*seg);

void pf_register_standard_funcs(PARROT_INTERP, ARGMOD(PackFile *pf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pf);

#define ASSERT_ARGS_PackFile_Annotations_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PackFile_ConstTable_clear __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_ConstTable_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PackFile_funcs_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pf))
#define ASSERT_ARGS_PackFile_Segment_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_Segment_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_Segment_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PackFile_Segment_new_seg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(dir) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_PackFile_Segment_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PackFile_Segment_packed_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_Segment_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_default_dump_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_Annotations_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg))
#define ASSERT_ARGS_PackFile_Annotations_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg))
#define ASSERT_ARGS_PackFile_Annotations_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(seg) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PackFile_Annotations_packed_size \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(seg))
#define ASSERT_ARGS_PackFile_Annotations_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_pf_register_standard_funcs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pf))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packfile/segments.c */

#endif /* PARROT_PR_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
