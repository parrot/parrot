/*
Copyright (C) 2011-2012, Parrot Foundation.
This program is free software. It is subject to the same license as
Parrot itself.
*/

#ifndef PARROT_PR_PRIVATE_H_GUARD
#define PARROT_PR_PRIVATE_H_GUARD

#include "parrot/parrot.h"
#include "parrot/packfile.h"
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

#endif /* PARROT_PR_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
