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

//#include "parrot/parrot.h"
#include "parrot/string.h"

struct IReg {
    INTVAL registers[NUM_REGISTERS];
};

struct NReg {
    FLOATVAL registers[NUM_REGISTERS];
};

struct SReg {
    STRING *registers[NUM_REGISTERS]; /* Yes, this lame, but a STRING *
                                       here throws undeclared struct
                                       errors or something. That needs
                                       fixing */
};

struct PReg {
    PMC *registers[NUM_REGISTERS];
};

struct IRegChunk {
    INTVAL used;
    INTVAL free;
    struct IRegChunk *next;
    struct IRegChunk *prev;
    struct IReg IReg[FRAMES_PER_CHUNK];
};

struct NRegChunk {
    INTVAL used;
    INTVAL free;
    struct NRegChunk *next;
    struct NRegChunk *prev;
    struct NReg NReg[FRAMES_PER_CHUNK];
};

struct SRegChunk {
    INTVAL used;
    INTVAL free;
    struct SRegChunk *next;
    struct SRegChunk *prev;
    struct SReg SReg[FRAMES_PER_CHUNK];
};

struct PRegChunk {
    INTVAL used;
    INTVAL free;
    struct PRegChunk *next;
    struct PRegChunk *prev;
    struct PReg PReg[FRAMES_PER_CHUNK];
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
