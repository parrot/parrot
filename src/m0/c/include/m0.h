#include "m0_constants.h"

typedef struct M0_Chunk {
    unsigned int     id;
    unsigned long    name_length;
    const char      *name;
    struct M0_Chunk *next;
} M0_Chunk;

typedef struct {
    unsigned short  mob_version;
    unsigned short  ireg_size;
    unsigned short  nreg_size;
    unsigned short  opcode_t_size;
    unsigned short  pointer_size;
    unsigned short  endianness;
    M0_Chunk       *first_chunk;
    M0_Chunk       *last_chunk;
} M0_Interp;

typedef struct {

} M0_CallFrame;
