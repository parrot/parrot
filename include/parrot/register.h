/* register.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Defines the register api
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_REGISTER_H_GUARD)
#define PARROT_REGISTER_H_GUARD

#include "parrot/string.h"
#include "parrot/enums.h"

struct IReg {
    INTVAL registers[NUM_REGISTERS];
};

struct IRegFrame {
    INTVAL registers[NUM_REGISTERS/2];
};

struct NReg {
    FLOATVAL registers[NUM_REGISTERS];
};

struct NRegFrame {
    FLOATVAL registers[NUM_REGISTERS/2];
};

struct SReg {
    STRING *registers[NUM_REGISTERS];
};

struct SRegFrame {
    STRING *registers[NUM_REGISTERS/2];
};

struct PReg {
    PMC *registers[NUM_REGISTERS];
};

struct PRegFrame {
    PMC *registers[NUM_REGISTERS/2];
};

struct IRegChunk {
    size_t used;
    Stack_chunk_flags flags;
    struct IRegChunk *next;
    struct IRegChunk *prev;
    struct IRegFrame IRegFrame[FRAMES_PER_CHUNK];
};

struct NRegChunk {
    size_t used;
    Stack_chunk_flags flags;
    struct NRegChunk *next;
    struct NRegChunk *prev;
    struct NRegFrame NRegFrame[FRAMES_PER_CHUNK];
};

struct SRegChunk {
    size_t used;
    Stack_chunk_flags flags;
    struct SRegChunk *next;
    struct SRegChunk *prev;
    struct SRegFrame SRegFrame[FRAMES_PER_CHUNK];
};

struct PRegChunk {
    size_t used;
    Stack_chunk_flags flags;
    struct PRegChunk *next;
    struct PRegChunk *prev;
    struct PRegFrame PRegFrame[FRAMES_PER_CHUNK];
};


#endif /* PARROT_REGISTER_H */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
