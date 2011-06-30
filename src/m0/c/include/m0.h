#include "m0_constants.h"

typedef struct {
    unsigned short mob_version;
    unsigned short ireg_size;
    unsigned short nreg_size;
    unsigned short opcode_t_size;
    unsigned short pointer_size;
    unsigned short endianness;
} M0_Interp;

typedef struct {

} M0_CallFrame;
