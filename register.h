/* register.h 
 *
 * Define the register structures 
 *
 */

#if !defined(__PARROT_REGISTER_H_GUARD)
#define __PARROT_REGISTER_H_GUARD

#include "parrot/parrot.h"

struct IReg {
  IV registers[NUM_REGISTERS];
};

struct NReg {
  NV registers[NUM_REGISTERS];
};

struct SReg {
  STRING *registers[NUM_REGISTERS];
};

struct PReg {
  PMC *registers[NUM_REGISTERS];
};

struct IRegChunk {
  IV used;
  IV free;
  struct IRegChunk *next;
  struct IRegChunk *prev;
  struct IReg IReg[FRAMES_PER_CHUNK];
};

struct NRegChunk {
  IV used;
  IV free;
  struct NRegChunk *next;
  struct NRegChunk *prev;
  struct NReg NReg[FRAMES_PER_CHUNK];
};

struct SRegChunk {
  IV used;
  IV free;
  struct SRegChunk *next;
  struct SRegChunk *prev;
  struct SReg SReg[FRAMES_PER_CHUNK];
};

struct PRegChunk {
  IV used;
  IV free;
  struct PRegChunk *next;
  struct PRegChunk *prev;
  struct PReg PReg[FRAMES_PER_CHUNK];
};

/* Accessor macros */
#define INT_REG(x) interpreter->int_reg->registers[x]
#define STR_REG(x) interpreter->string_reg->registers[x]
#define PMC_REG(x) interpreter->pmc_reg->registers[x]
#define NUM_REG(x) interpreter->num_reg->registers[x]

/* This macro masks off the low bits of a register chunk address,
   since we're guaranteed to be aligned */
#define CHUNK_BASE(x) (void *)(MASK_CHUNK_LOW_BITS & (IV)x)

void Parrot_clear_i(struct Perl_Interp *);
void Parrot_clear_s(struct Perl_Interp *);
void Parrot_clear_p(struct Perl_Interp *);
void Parrot_clear_n(struct Perl_Interp *);

void Parrot_push_i(struct Perl_Interp *);
void Parrot_push_n(struct Perl_Interp *);
void Parrot_push_s(struct Perl_Interp *);
void Parrot_push_p(struct Perl_Interp *);

void Parrot_pop_i(struct Perl_Interp *);
void Parrot_pop_n(struct Perl_Interp *);
void Parrot_pop_s(struct Perl_Interp *);
void Parrot_pop_p(struct Perl_Interp *);


#endif /* __PARROT_REGISTER_H */
