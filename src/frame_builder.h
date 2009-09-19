/*
 * Copyright (C) 2002-2009, Parrot Foundation.
 */

/*
 * frame_builder.h
 *
 * i386
 *
 * $Id$
 */

#ifndef PARROT_I386_JIT_EMIT_H_GUARD
#define PARROT_I386_JIT_EMIT_H_GUARD

#if defined(__cplusplus)
#  define EXTERN extern "C"
#else
#  define EXTERN
#endif

#include <assert.h>
#include "parrot/parrot.h"
#include "parrot/hash.h"
#include "parrot/oplib/ops.h"

/*  Parrot_jit_arena_t
 *      Holds pointers to the native code of one or more sections.
 *
 *  start:          Start of current native code segment.
 *  size:           The size of the arena in bytes
 *  map_size:       The size of the map in bytes.
 */

typedef struct Parrot_jit_arena_t {
    char                            *start;
    ptrdiff_t                        size;
    unsigned long                    map_size;
} Parrot_jit_arena_t;

typedef enum {
    JIT_CODE_FILE,
    JIT_CODE_SUB,
    JIT_CODE_SUB_REGS_ONLY,

    /* size */
    JIT_CODE_TYPES,
    /* special cases */
    JIT_CODE_RECURSIVE     = 0x10,
    JIT_CODE_SUB_REGS_ONLY_REC = JIT_CODE_SUB_REGS_ONLY|JIT_CODE_RECURSIVE
} enum_jit_code_type;

/*  Parrot_jit_info_t
 *      All the information needed to jit the bytecode will be here.
 *
 *  native_ptr:     Current pointer to native code.
 *  arena:          The arena inlined, this will be the only one used in cases
 *                  where there is a way to load an immediate.
 */

typedef struct Parrot_jit_info_t {
    char                         *native_ptr;
    Parrot_jit_arena_t            arena;
    INTVAL                        code_type;
    const struct jit_arch_info_t *arch_info;
} Parrot_jit_info_t;

typedef struct jit_arch_regs {
    /*
     * begin function - emit ABI call prologue
     */

    int n_mapped_I;
    int n_preserved_I;
    const char *map_I;
    int n_mapped_F;
    int n_preserved_F;
    const char *map_F;
} jit_arch_regs;

typedef void (*mov_RM_f)(PARROT_INTERP, Parrot_jit_info_t *,
        int cpu_reg, int base_reg, INTVAL offs);
typedef void (*mov_MR_f)(PARROT_INTERP, Parrot_jit_info_t *,
        int base_reg, INTVAL offs, int cpu_reg);

typedef struct jit_arch_info_t {
    /* CPU <- Parrot reg move functions */
    mov_RM_f mov_RM_i;
    mov_RM_f mov_RM_n;
    /* Parrot <- CPU reg move functions */
    mov_MR_f mov_MR_i;
    mov_MR_f mov_MR_n;

    /* register mapping info */
    const jit_arch_regs regs[JIT_CODE_TYPES];
} jit_arch_info;

/*
 * NCI interface
 */
void *Parrot_jit_build_call_func(Interp *, PMC *, STRING *, int *);
/* custom pmc callback functions */
void Parrot_jit_free_buffer(PARROT_INTERP, void *ptr, void *priv);
PMC* Parrot_jit_clone_buffer(PARROT_INTERP, PMC *pmc, void *priv);
struct jit_buffer_private_data {
    int size;
};

/* Scale factor values */
#define emit_Scale(scale) ((scale) << 6)
#define emit_Scale_1 emit_Scale(0)
#define emit_Scale_2 emit_Scale(1)
#define emit_Scale_4 emit_Scale(2)
#define emit_Scale_8 emit_Scale(3)

/* Scale factor values */
#define emit_Scale(scale) ((scale) << 6)
#define emit_Scale_1 emit_Scale(0)
#define emit_Scale_2 emit_Scale(1)
#define emit_Scale_4 emit_Scale(2)
#define emit_Scale_8 emit_Scale(3)

/* ESIB byte */
#define emit_reg_Index(x) (((x)-1) << 3)
#define emit_reg_Base(x) ((x)-1)
#define emit_Index_None ((emit_b100) << 3)

/*
 * helper funcs - get argument n
 */
INTVAL get_nci_I(PARROT_INTERP, ARGMOD(call_state *st), int n);

FLOATVAL get_nci_N(PARROT_INTERP, ARGMOD(call_state *st), int n);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING*
get_nci_S(PARROT_INTERP, ARGMOD(call_state *st), int n);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
get_nci_P(PARROT_INTERP, ARGMOD(call_state *st), int n);

#define GET_NCI_I(n) get_nci_I(interp, &st, (n))
#define GET_NCI_S(n) get_nci_S(interp, &st, (n))
#define GET_NCI_N(n) get_nci_N(interp, &st, (n))
#define GET_NCI_P(n) get_nci_P(interp, &st, (n))

/*
 * set return value
 */
void set_nci_I(PARROT_INTERP, ARGOUT(call_state *st), INTVAL val);

void set_nci_N(PARROT_INTERP, ARGOUT(call_state *st), FLOATVAL val);

void set_nci_S(PARROT_INTERP, ARGOUT(call_state *st), STRING *val);

void set_nci_P(PARROT_INTERP, ARGOUT(call_state *st), PMC* val);

/*
 * if we have a delegated method like typeof_i_p, that returns an INTVAL
 * and that is all in a sequence of JITted opcodes, and when these INTVAL
 * is MAPped, we got a problem. So the EXT_CALL flag is disabled - mapped
 * registers are saved/restored around vtable calls.
 */
#define  JIT_VTABLE_OPS 1

/* EXEC_SHARED generates code to be used with libparrot.so
 * It grabs the real address of cgp_core from the gcc generated code
 * x/1i cgp_code
 *     jmp *0xXXXX
 * x/1wx 0xXXXX
 *     real address of cpg_core
 * s. exec_emit_end
 * XXX This should be a command line option.
 */
#undef EXEC_SHARED

extern UINTVAL ld(UINTVAL);

#define NEG_MINUS_ZERO
/* #define NEG_ZERO_SUB */

/* Register codes */
#define emit_None 0

/* These are + 1 the real values */
#define emit_EAX 1
#define emit_ECX 2
#define emit_EDX 3
#define emit_EBX 4
#define emit_ESP 5
#define emit_EBP 6
#define emit_ESI 7
#define emit_EDI 8

/* Scratch register. */

#define ISR1 emit_EAX
#define FSR1 0

#define emit_b00 0
#define emit_b01 1
#define emit_b10 2
#define emit_b11 3

#define emit_b000 0
#define emit_b001 1
#define emit_b010 2
#define emit_b011 3
#define emit_b100 4
#define emit_b101 5
#define emit_b110 6
#define emit_b111 7

/* Mod R/M byte */
#define emit_reg(x) ((x) << 3)
#define emit_Mod(Mod) ((Mod) << 6)
#define emit_reg_rm(x) ((x)-1)

/* Mod values for Mod R/M Byte */
#define emit_Mod_b00 emit_Mod(emit_b00)
#define emit_Mod_b01 emit_Mod(emit_b01)
#define emit_Mod_b10 emit_Mod(emit_b10)

/* special R/M values */
#define emit_rm_b101 emit_b101
#define emit_rm_b100 emit_b100

#define emit_r_m(interp, pc, reg1, b, i, s, d) \
    emit_r_X((interp), (pc), emit_reg((reg1)-1), (b), (i), (s), (d))

#define emit_alu_X_r(X, reg) ((emit_b11 << 6) | ((X) << 3) | ((reg) - 1))

#define emit_alu_r_r(reg1, reg2) emit_alu_X_r(((reg1) - 1), (reg2))

int emit_is8bit(long disp);

char * emit_disp8_32(char *pc, int disp);

void emit_sib(PARROT_INTERP, char *pc, int scale, int i, int base);

char * emit_r_X(PARROT_INTERP, char *pc, int reg_opcode, int base, int i,
    int scale, long disp);

char * emit_shift_i_r(PARROT_INTERP, char *pc, int opcode, int imm, int reg);

char * emit_shift_i_m(PARROT_INTERP, char *pc, int opcode, int imm,
               int base, int i, int scale, long disp);

char * emit_shift_r_r(PARROT_INTERP, char *pc, int opcode, int reg1, int reg2);

char * emit_shift_r_m(PARROT_INTERP, char *pc, int opcode, int reg,
               int base, int i, int scale, long disp);

/* CDQ - need this to do multiply */
#define emitm_cdq(pc) *((pc)++) = (char) 0x99

/* RET */
#define emitm_ret(pc) *((pc)++) = (char) 0xc3

/* NOP */
#define emit_nop(pc) *((pc)++) = (char) 0x90

/* PUSHes */

#define emitm_pushl_r(pc, reg) \
    *((pc)++) = (char) 0x50 | ((reg) - 1)

#define emitm_pushl_i(pc, imm) { \
    *((pc)++) = (char) 0x68; \
    *(long *)(pc) = (long)(imm); \
    (pc) += 4; }

#define emitm_pushl_m(pc, mem) { \
       *((pc)++) = (char) 0xff; \
       *((pc)++) = (char) 0x35; \
       *(long *)(pc) = (long)(mem); \
       (pc) += 4; }

char * emit_pushl_m(PARROT_INTERP, char *pc, int base, int i, int scale,
    long disp);

/* POPs */

char * emit_popl_r(char *pc, int reg);

#  define emitm_popl_r(pc, reg) \
    (pc) = emit_popl_r((pc), (reg))

char * emit_popl_m(PARROT_INTERP, char *pc, int base, int i, int scale,
    long disp);

/* MOVes */

char * emit_movb_r_r(char *pc, int reg1, int reg2);

#  define jit_emit_mov_rr_i(pc, reg2, reg1) if ((reg1) != (reg2)) { \
    *((pc)++) = (char) 0x89; \
    *((pc)++) = (char) emit_alu_r_r((reg1), (reg2)); }

char * emit_movb_i_r(char *pc, char imm, int reg);

#  define jit_emit_mov_ri_i(interp, pc, reg, imm) { \
    *((pc)++) = (char)(0xb8 | ((reg) - 1)); \
    *(long *)(pc) = (long)(imm); (pc) += 4; }

#  define emitm_movX_Y_Z(interp, op, pc, reg1, b, i, s, d) { \
    *((pc)++) = (char) (op); \
    (pc) = emit_r_m((interp), (pc), (reg1), (b), (i), (s), (long)(d)); }

#  define emitm_movb_r_m(interp, pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z((interp), 0x88, (pc), (reg1), (b), (i), (s), (d))

#  define emitm_movl_r_m(interp, pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z((interp), 0x89, (pc), (reg1), (b), (i), (s), (d))

/* move byte/word with sign extension */
#  define emitm_movsbl_r_m(interp, pc, reg1, b, i, s, d) { \
    *((pc)++) = (char) 0x0f; \
    emitm_movX_Y_Z((interp), 0xBE, (pc), (reg1), (b), (i), (s), (d)); \
}

#  define emitm_movswl_r_m(interp, pc, reg1, b, i, s, d) { \
    *((pc)++) = (char) 0x0f; \
    emitm_movX_Y_Z((interp), 0xBF, (pc), (reg1), (b), (i), (s), (d)); \
}

#  define emitm_movsbl_r_r(pc, reg1, reg2) { \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) 0xbe; \
    *((pc)++) = (char) emit_alu_r_r((reg1), (reg2)); \
}

#  define emitm_movswl_r_r(pc, reg1, reg2) { \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) 0xbf; \
    *((pc)++) = (char) emit_alu_r_r((reg1), (reg2)); \
}

#  define emitm_movb_m_r(interp, pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z((interp), 0x8a, (pc), (reg1), (b), (i), (s), (d))

#  define emitm_movl_m_r(interp, pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z((interp), 0x8b, (pc), (reg1), (b), (i), (s), (d))

#  define emitm_lea_m_r(interp, pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z((interp), 0x8d, (pc), (reg1), (b), (i), (s), (d))

char * emit_movb_i_m(PARROT_INTERP, char *pc, char imm, int base, int i,
    int scale, long disp);

#  define emitm_movl_i_m(pc, imm, b, i, s, d) { \
    *((pc)++) = (char) 0xc7; \
    (pc) = emit_r_X((interp), (pc), emit_reg(emit_b000), (b), (i), (s), (long)(d)); \
    *(long *)(pc) = (long)(imm); (pc) += 4; }

/* Various ALU formats */

#  define emitm_alul_r_r(pc, op, reg1, reg2) { \
    *((pc)++) = (char) (op); *((pc)++) = (char) emit_alu_r_r((reg1), (reg2)); }

#  define emitm_alub_i_r(pc, op1, op2, imm, reg) { \
    *((pc)++) = (char) (op1); *((pc)++) = (char) emit_alu_X_r((op2), (reg)); *((pc)++) = (char)(imm); }

#  define emitm_alul_i_r(pc, op1, op2, imm, reg) { \
    *((pc)++) = (char) (op1); \
    *((pc)++) = (char) emit_alu_X_r((op2), (reg)); \
    *(long *)((pc)) = (long)(imm); (pc) += 4; }

#  define emitm_alul_i_m(pc, op1, op2, imm, b, i, s, d) { \
    *((pc)++) = (char) (op1); \
    (pc) = emit_r_X((interp), (pc), emit_reg(op2), (b), (i), (s), (d)); \
    *(long *)(pc) = (long)(imm); (pc) += 4; }

#  define emitm_alul_r_m(pc, op, reg, b, i, s, d) { \
    *((pc)++) = (char) (op); \
    (pc) = emit_r_X((interp), (pc), emit_reg((reg)-1), (b), (i), (s), (long)(d)); }

/* ADDs */

#  define emitm_addb_r_r(pc, reg1, reg2) \
    emitm_alul_r_r((pc), 0x00, (reg1), (reg2))

#  define emitm_addb_i_r(pc, imm, reg) \
    emitm_alub_i_r((pc), 0x83, emit_b000, (imm), (reg))

#  define jit_emit_add_rr_i(interp, pc, reg1, reg2) \
    emitm_alul_r_r((pc), 0x01, (reg2), (reg1))

#  define jit_emit_add_ri_i(interp, pc, reg, imm)   \
    emitm_alul_i_r((pc), 0x81, emit_b000, (imm), (reg))

#  define emitm_addl_i_r(pc, imm, reg)   \
    emitm_alul_i_r((pc), 0x81, emit_b000, (imm), (reg))

#  define emitm_addl_i_m(pc, imm, b, i, s, d) \
    emitm_alul_i_m((pc), 0x81, emit_b000, (imm), (b), (i), (s), (d))

#  define emitm_addl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x01, (reg), (b), (i), (s), (d))

#  define emitm_addl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x03, (reg), (b), (i), (s), (d))

/* SUBs */

#  define jit_emit_sub_rr_i(interp, pc, reg1, reg2) \
    emitm_alul_r_r((pc), 0x29, (reg2), (reg1))

#  define emitm_subl_i_r(pc, imm, reg) \
    emitm_alul_i_r((pc), 0x81, emit_b101, (imm), (reg))

#  define jit_emit_sub_ri_i(interp, pc, r, i) emitm_subl_i_r((pc), (i), (r))

#  define emitm_subl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x29, (reg), (b), (i), (s), (d))

#  define emitm_subl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x2b, (reg), (b), (i), (s), (d))

#  define emitm_subl_i_m(pc, imm, b, i, s, d) \
    emitm_alul_i_m((pc), 0x81, emit_b101, (imm), (b), (i), (s), (d))

/* These are used by both signed and unsigned EDIV, but only unsigned MUL */
#  define emitm_alu_imp_r(pc, op, reg) { \
    *((pc)++) = (char) 0xf7; \
    *((pc)++) = (char) emit_alu_X_r((op), (reg)); }

#  define emitm_alu_imp_m(pc, op, b, i, s, d) { \
    *((pc)++) = (char) 0xf7; \
    (pc) = emit_r_X((interp), (pc), emit_reg(op), (b), (i), (s), (d)); }

/* Unsigned MUL and EDIV */
/* EAX implicit destination in multiply and divide */

#  define emitm_umull_r(pc, reg2) emitm_alu_imp_r((pc), emit_b100, (reg2))

#  define emitm_udivl_r(pc, reg2) emitm_alu_imp_r((pc), emit_b110, (reg2))

#  define emitm_umull_m(pc, b, i, s, d) \
    emitm_alu_imp_m((pc), emit_b100, (b), (i), (s), (d))

#  define emitm_udivl_m(pc, b, i, s, d) \
    emitm_alu_imp_m((pc), emit_b110, (b), (i), (s), (d))

/* Signed MUL and EDIV */

#  define emitm_sdivl_r(pc, reg2) emitm_alu_imp_r((pc), emit_b111, (reg2))

#  define emitm_sdivl_m(pc, b, i, s, d) \
    emitm_alu_imp_m((pc), emit_b111, (b), (i), (s), (d))

#  define jit_emit_cdq(pc) *(pc)++ = 0x99

/* TEST for zero */
#  define jit_emit_test_r_i(pc, reg1) emitm_alul_r_r((pc), 0x85, (reg1), (reg1))

#  define emitm_smull_r(pc, reg2) emitm_alu_imp_r((pc), emit_b101, (reg2))

#  define jit_emit_mul_rr_i(interp, pc, reg1, reg2) { \
    *(pc)++ = 0xf; \
    emitm_alul_r_r((pc), 0xaf, (reg1), (reg2)); }

#  define emitm_smull_r_m(pc, reg1, b, i, s, d) { \
    *(pc)++ = 0xf; \
    emitm_alul_r_m((pc), 0xaf, (reg1), (b), (i), (s), (d)); }

char * opt_mul(PARROT_INTERP, char *pc, int dest, INTVAL imm, int src);

#  define jit_emit_mul_rir_i(pc, dest, imm, src) \
       (pc) = opt_mul(interp, (pc), (dest), (imm), (src))


#  define jit_emit_mul_ri_i(pc, r, imm) jit_emit_mul_rir_i((pc), (r), (imm), (r))

#  define jit_emit_mul_RIM_ii(pc, reg, imm, ofs) \
    emitm_alul_r_m((pc), 0x69, (reg), emit_EBX, emit_None, 1, (ofs)); \
    *(long *)(pc) = (long)(imm); \
    (pc) += 4;

/* NEG */

#  define jit_emit_neg_r_i(pc, reg) emitm_alu_imp_r((pc), emit_b011, (reg))

#  define emitm_negl_m(pc, b, i, s, d) \
    emitm_alu_imp_m((pc), emit_b011, (b), (i), (s), (d))

/* AND */

#  define emit_andl_r_r(pc, reg1, reg2) emitm_alul_r_r((pc), 0x21, (reg1), (reg2))
#  define jit_emit_band_rr_i(interp, pc, r1, r2) emit_andl_r_r((pc), (r2), (r1))

#  define jit_emit_band_ri_i(interp, pc, reg, imm)  \
    emitm_alul_i_r((pc), 0x81, emit_b100, (imm), (reg))

#  define emitm_andl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x21, (reg), (b), (i), (s), (d))

#  define emitm_andl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x23, (reg), (b), (i), (s), (d))

#  define emitm_andl_i_m(pc, imm, b, i, s, d) \
    emitm_alul_i_m((pc), 0x81, emit_b100, (imm), (b), (i), (s), (d))

/* TEST op */
#  define jit_emit_test_rr_i(pc, r1, r2) emitm_alul_r_r((pc), 0x85, (r1), (r2))

#  define jit_emit_test_ri_i(pc, r, im)  \
           emitm_alul_i_r((pc), 0xF7, emit_b000, (im), (r))

#  define jit_emit_test_RM_i(pc, r, offs)  \
           emitm_alul_r_m((pc), 0x85, (r), emit_EBX, 0, 1, (offs))

/* OR */

#  define jit_emit_bor_rr_i(interp, pc, reg1, reg2) emitm_alul_r_r((pc), 0x9, (reg2), (reg1))

#  define jit_emit_bor_ri_i(interp, pc, reg, imm) \
    emitm_alul_i_r((pc), 0x81, emit_b001, (imm), (reg))

#  define emitm_orl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x09, (reg), (b), (i), (s), (d))

#  define emitm_orl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x0b, (reg), (b), (i), (s), (d))

#  define emitm_orl_i_m(pc, imm, b, i, s, d) \
    emitm_alul_i_m((pc), 0x81, emit_b001, (imm), (b), (i), (s), (d))

/* XOR */

#  define jit_emit_bxor_rr_i(interp, pc, reg1, reg2) \
    emitm_alul_r_r((pc), 0x31, (reg2), (reg1))

#  define jit_emit_bxor_ri_i(intepr, pc, reg, imm) \
    emitm_alul_i_r((pc), 0x81, emit_b110, (imm), (reg))

#  define emitm_xorl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x31, (reg), (b), (i), (s), (d))

#  define emitm_xorl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x33, (reg), (b), (i), (s), (d))

#  define emitm_xorl_i_m(pc, imm, b, i, s, d) \
    emitm_alul_i_m((pc), 0x81, emit_b110, (imm), (b), (i), (s), (d))

/* NOT */

#  define jit_emit_not_r_i(pc, reg) emitm_alu_imp_r((pc), emit_b010, (reg))
#  define emitm_notl_m(pc, b, i, s, d) \
    emitm_alu_imp_m((pc), emit_b010, (b), (i), (s), (d))

#  define jit_emit_not_M_i(interp, pc, offs) emitm_notl_m((pc), emit_EBX, 0, 1, (offs))

/* XCHG */
#  define jit_emit_xchg_rr_i(interp, pc, r1, r2) { \
    if ((r1) != (r2)) { \
    *((pc)++) = (char) 0x87; \
    *((pc)++) = (char) emit_alu_r_r((r1), (r2)); \
    } \
}

#  define jit_emit_xchg_rm_i(pc, r, m) { \
    emitm_alul_r_m((pc), 0x87, (r), emit_None, emit_None, emit_None, (m)) \
}
#  define jit_emit_xchg_RM_i(interp, pc, r, offs) { \
    emitm_alul_r_m((pc), 0x87, (r), emit_EBX, emit_None, 1, (offs)) \
}
#  define jit_emit_xchg_MR_i(interp, pc, offs, r) jit_emit_xchg_RM_i((interp), (pc), (r), (offs))

/* SHL */

#  define jit_emit_shl_ri_i(interp, pc, reg, imm) \
    { (pc) = emit_shift_i_r((interp), (pc), emit_b100, (imm), (reg)); }

#  define emitm_shll_i_m(pc, imm, b, i, s, d) \
    { (pc) = emit_shift_i_m((pc), emit_b100, (imm), (b), (i), (s), (d)); }

#  define emitm_shll_r_r(interp, pc, reg1, reg2) \
    { (pc) = emit_shift_r_r((interp), (pc), emit_b100, (reg1), (reg2)); }

#  define emitm_shll_r_m(pc, reg, b, i, s, d) \
    { (pc) = emit_shift_r_m((pc), emit_b100, (reg), (b), (i), (s), (d)); }

/* SHR */

#  define jit_emit_lsr_ri_i(interp, pc, reg, imm) \
    { (pc) = emit_shift_i_r((interp), (pc), emit_b101, (imm), (reg)); }

#  define emitm_shrl_i_m(pc, imm, b, i, s, d) \
    { (pc) = emit_shift_i_m((pc), emit_b101, (imm), (b), (i), (s), (d)); }

#  define emitm_shrl_r_r(interp, pc, reg1, reg2) \
    { (pc) = emit_shift_r_r((interp), (pc), emit_b101, (reg1), (reg2)); }

#  define emitm_shrl_r_m(pc, reg, b, i, s, d) \
    { (pc) = emit_shift_r_m((pc), emit_b101, (reg), (b), (i), (s), (d)); }

/* SAL */

#  define emitm_sall_i_r(interp, pc, imm, reg) \
    { (pc) = emit_shift_i_r((interp), (pc), emit_b100, (imm), (reg)); }

#  define emitm_sall_i_m(pc, imm, b, i, s, d) \
    { (pc) = emit_shift_i_m((pc), emit_b100, (imm), (b), (i), (s), (d)); }

#  define emitm_sall_r_r(interp, pc, reg1, reg2) \
    { (pc) = emit_shift_r_r((interp), (pc), emit_b100, (reg1), (reg2)); }

#  define emitm_sall_r_m(pc, reg, b, i, s, d) \
    { (pc) = emit_shift_r_m((pc), emit_b100, (reg), (b), (i), (s), (d)); }

/* SAR */

#  define jit_emit_shr_ri_i(interp, pc, reg, imm) \
    { (pc) = emit_shift_i_r((interp), (pc), emit_b111, (imm), (reg)); }


#  define emitm_sarl_i_m(pc, imm, b, i, s, d) \
    { (pc) = emit_shift_i_m((pc), emit_b111, (imm), (b), (i), (s), (d)); }

#  define emitm_sarl_r_r(interp, pc, reg1, reg2) \
    { (pc) = emit_shift_r_r((interp), (pc), emit_b111, (reg1), (reg2)); }

#  define emitm_sarl_r_m(pc, reg, b, i, s, d) \
    { (pc) = emit_shift_r_m((pc), emit_b111, (reg), (b), (i), (s), (d)); }

/* rotate */

#  define jit_emit_rol_ri_i(interp, pc, reg, imm) \
    { (pc) = emit_shift_i_r((interp), (pc), emit_b000, (imm), (reg)); }

#  define jit_emit_ror_ri_i(interp, pc, reg, imm) \
    { (pc) = emit_shift_i_r((interp), (pc), emit_b001, (imm), (reg)); }

int intreg_is_used(Parrot_jit_info_t *jit_info, char reg);

char * opt_shift_rr(PARROT_INTERP, Parrot_jit_info_t *jit_info, int dest,
    int count, int op);

char * opt_shift_rm(PARROT_INTERP, Parrot_jit_info_t *jit_info, int dest,
    int offs, int op);

/* interface, shift r1 by r2 bits */

#  define jit_emit_shl_rr_i(interp, pc, r1, r2) \
    (pc) = opt_shift_rr((interp), jit_info, (r1), (r2), emit_b100)

#  define jit_emit_shl_RM_i(interp, pc, r1, offs)  \
    (pc) = opt_shift_rm((interp), jit_info, (r1), (offs), emit_b100)

/* shr seems to be the arithmetic shift */
#  define jit_emit_shr_rr_i(interp, pc, r1, r2)  \
    (pc) = opt_shift_rr((interp), jit_info, (r1), (r2), emit_b111)

#  define jit_emit_shr_RM_i(interp, pc, r1, offs)  \
    (pc) = opt_shift_rm((interp), jit_info, (r1), (offs), emit_b111)

#  define jit_emit_lsr_rr_i(interp, pc, r1, r2)  \
    (pc) = opt_shift_rr((interp), jit_info, (r1), (r2), emit_b101)

#  define jit_emit_lsr_RM_i(interp, pc, r1, offs)  \
    (pc) = opt_shift_rm((interp), jit_info, (r1), (offs), emit_b101)

/* MOV (reg), reg */
#  define emit_movm_r_r(pc, src, dest) \
    *((pc)++) = (char) 0x8b; \
    *((pc)++) = (char) (src) | (dest) << 3

/* MOV X(reg), reg */
#  define emit_movb_i_r_r(pc, imm, src, dest) \
    *((pc)++) = (char)(0x8b); \
    *((p)c++) = (char)(0x40 | ((src) - 1) | ((dest) - 1) << 3); \
    *((pc)++) = (imm)

/* INC / DEC */
#  define jit_emit_inc_r_i(pc, reg) *((pc)++) = (char)(0x40 | ((reg) - 1))
#  define jit_emit_dec_r_i(pc, reg) *((pc)++) = (char)(0x48 | ((reg) - 1))

/* Floating point ops */

#  define emitm_floatop 0xd8  /* 11011000 */
#  define jit_emit_dec_fsp(pc) { *((pc)++) = (char) 0xD9; *((pc)++) = (char) 0xF6; }
#  define jit_emit_inc_fsp(pc) { *((pc)++) = (char) 0xD9; *((pc)++) = (char) 0xF7; }

#  define emitm_fl_2(interp, pc, mf, opa, opb, b, i, s, d) { \
    *((pc)++) = (char)(emitm_floatop | ((mf) << 1) | (opa)); \
    (pc) = emit_r_X((interp), (pc), emit_reg(opb), (b), (i), (s), (long)(d)); }

#  define emitm_fl_3(pc, d_p_opa, opb_r, sti) { \
    *((pc)++) = (char)(emitm_floatop | (d_p_opa)); \
    *((pc)++) = (char)(0xc0 | ((opb_r) << 3) | (sti)); }

#  define emitm_fl_4(pc, op) { \
    *((pc)++) = (char)(emitm_floatop | emit_b001); \
    *((pc)++) = (char)(0xe0 | (op)); }

/* Integer loads and stores */
#  define emitm_fildl(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b01, 1, emit_b000, (b), (i), (s), (d))

#  define emitm_fistpl(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b01, 1, emit_b011, (b), (i), (s), (d))

#  define emitm_fistl(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b01, 1, emit_b010, (b), (i), (s), (d))

/* long long integer load/store */
#  define emitm_fildll(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b11, 1, emit_b101, (b), (i), (s), (d))

#  define emitm_fistpll(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b11, 1, emit_b111, (b), (i), (s), (d))

/* Double loads and stores */
#  define emitm_fldl(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b10, 1, emit_b000, (b), (i), (s), (d))

#  define emitm_fstpl(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b10, 1, emit_b011, (b), (i), (s), (d))

#  define emitm_fstl(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b10, 1, emit_b010, (b), (i), (s), (d))

/* long double load / store */
#  define emitm_fldt(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b01, 1, emit_b101, (b), (i), (s), (d))

#  define emitm_fstpt(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b01, 1, emit_b111, (b), (i), (s), (d))

/* short float load / store */
#  define emitm_flds(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b00, 1, emit_b000, (b), (i), (s), (d))

#  define emitm_fstps(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b00, 1, emit_b010, (b), (i), (s), (d))

#if NUMVAL_SIZE == 8

#  define jit_emit_fload_m_n(interp, pc, address) \
      emitm_fldl((interp), (pc), emit_None, emit_None, emit_None, (address))

#  define jit_emit_fload_mb_n(interp, pc, base, offs) \
      emitm_fldl((interp), (pc), (base), emit_None, 1, (offs))

#  define jit_emit_fstore_m_n(interp, pc, address) \
      emitm_fstpl((interp), (pc), emit_None, emit_None, emit_None, (address))

#  define jit_emit_fstore_mb_n(interp, pc, base, offs) \
      emitm_fstpl((interp), (pc), (base), emit_None, 1, (offs))

#  define jit_emit_fst_mb_n(interp, pc, base, offs) \
      emitm_fstl((interp), (pc), (base), emit_None, 1, (offs))

#else /* NUMVAL_SIZE */

#  define jit_emit_fload_m_n(interp, pc, address) \
      emitm_fldt((pc), emit_None, emit_None, emit_None, (address))

#  define jit_emit_fload_mb_n(interp, pc, base, offs) \
      emitm_fldt((pc), (base), emit_None, 1, (offs))

#  define jit_emit_fstore_m_n(pc, address) \
      emitm_fstpt((pc), emit_None, emit_None, emit_None, (address))

#  define jit_emit_fstore_mb_n(interp, pc, base, offs) \
      emitm_fstpt((pc), (base), emit_None, 1, (offs))

#  define jit_emit_fst_mb_n(interp, pc, base, offs) \
      emitm_fstt((pc), (base), emit_None, 1, (offs))

#endif /* NUMVAL_SIZE */

#if INTVAL_SIZE == 4

#  define jit_emit_fload_m_i(interp, pc, address) \
      emitm_fildl((interp), (pc), emit_None, emit_None, emit_None, (address))
#  define jit_emit_fload_mb_i(interp, pc, offs) \
      emitm_fildl((interp), (pc), emit_EBX, emit_None, 1, (offs))
#  define jit_emit_fstore_m_i(pc, m) \
      emitm_fistpl((pc), emit_None, emit_None, emit_None, (m))

#else /* INTVAL_SIZE */

#  define jit_emit_fload_m_i(interp, pc, address) \
      emitm_fildll((interp), (pc), emit_None, emit_None, emit_None, (address))
#  define jit_emit_fload_mb_i(interp, pc, offs) \
      emitm_fildll((interp), (pc), emit_EBX, emit_None, 1, (offs))
#  define jit_emit_fstore_m_i(pc, m) \
      emitm_fistpll((pc), emit_None, emit_None, emit_None, (m))

#endif /* INTVAL_SIZE */

/* 0xD8 ops */
#  define emitm_fadd(pc, sti) emitm_fl_3((pc), emit_b000, emit_b000, (sti))
#  define emitm_fmul(pc, sti) emitm_fl_3((pc), emit_b000, emit_b001, (sti))
#  define emitm_fsub(pc, sti) emitm_fl_3((pc), emit_b000, emit_b100, (sti))
#  define emitm_fdiv(pc, sti) emitm_fl_3((pc), emit_b000, emit_b110, (sti))

/* 0xD9 ops */
#  define emitm_fldz(pc)  { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xee; }
#  define emitm_fld1(pc)  { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xe8; }
#  define emitm_fsqrt(pc) { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xfa; }
#  define emitm_fsin(pc)  { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xfe; }
#  define emitm_fcos(pc)  { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xff; }
#  define emitm_fxam(pc)  { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xe5; }

/* FXCH ST, ST(i) , optimize 2 consecutive fxch with same reg */
#  define emitm_fxch(pc, sti) { \
    emitm_fl_3((pc), emit_b001, emit_b001, (sti)); \
}

/* FLD ST, ST(i), optimized FSTP(N+1);FLD(N) => FST(N+1)  */
extern unsigned char *lastpc;
#  define emitm_fld(pc, sti) do { \
     if ((unsigned char *)(pc) == (lastpc + 2) && \
       (int)(*lastpc) == (int)0xDD && \
       (int)lastpc[1] == (int)(0xD8+(sti)+1)) \
       lastpc[1] = 0xD0+(sti)+1; \
     else \
       emitm_fl_3((pc), emit_b001, emit_b000, (sti)); \
  } while (0)

/* 0xDA, 0xDB ops */
/* FCMOV*, FCOMI PPRO */

/* 0xDC like 0xD8 with reversed operands */
#  define emitm_faddr(pc, sti) emitm_fl_3((pc), emit_b100, emit_b000, (sti))
#  define emitm_fmulr(pc, sti) emitm_fl_3((pc), emit_b100, emit_b001, (sti))
#  define emitm_fsubr(pc, sti) emitm_fl_3((pc), emit_b100, emit_b100, (sti))

/* 0xDD ops */
/* FFree ST(i) */
#  define emitm_ffree(pc, sti) emitm_fl_3((pc), emit_b101, emit_b000, (sti))

/* FST ST(i) = ST */
#  define emitm_fst(pc, sti) emitm_fl_3((pc), emit_b101, emit_b010, (sti))

/* FSTP ST(i) = ST, POP */
#  define emitm_fstp(pc, sti) { \
    lastpc = (unsigned char*) (pc); \
    emitm_fl_3((pc), emit_b101, emit_b011, (sti)); \
}

/* FUCOM ST(i) <=> ST  unordered compares */
#  define emitm_fucom(pc, sti) emitm_fl_3((pc), emit_b101, emit_b100, (sti))

/* FUCOMP ST(i) <=> ST, POP */
#  define emitm_fucomp(pc, sti) emitm_fl_3((pc), emit_b101, emit_b101, (sti))

/* 0xDE ops */
/* FADDP Add ST(i) = ST + ST(i); POP  */
#  define emitm_faddp(pc, sti) emitm_fl_3((pc), emit_b110, emit_b000, (sti))

/* FMULP Mul ST(i) = ST * ST(i); POP  */
#  define emitm_fmulp(pc, sti) emitm_fl_3((pc), emit_b110, emit_b001, (sti))

/* FSUB ST = ST - ST(i) */

/* FSUBRP SubR ST(i) = ST - ST(i); POP  */
#  define emitm_fsubrp(pc, sti) emitm_fl_3((pc), emit_b110, emit_b100, (sti))

/* FSUBP Sub ST(i) = ST(i) - ST; POP  */
#  define emitm_fsubp(pc, sti) emitm_fl_3((pc), emit_b110, emit_b101, (sti))

/* FDIVRP DivR ST(i) = ST(i) / ST(0); POP  */
#  define emitm_fdivrp(pc, sti) emitm_fl_3((pc), emit_b110, emit_b110, (sti))

/* FDIVP Div ST(i) = ST(0) / ST(i); POP ST(0) */
#  define emitm_fdivp(pc, sti) emitm_fl_3((pc), emit_b110, emit_b111, (sti))

/* 0xDF OPS: FCOMIP, FUCOMIP PPRO */

/* Negate - called change sign */
#  define emitm_fchs(pc) emitm_fl_4((pc), 0)

/* ABS - ST(0) = ABS(ST(0)) */
#  define emitm_fabs(pc) emitm_fl_4((pc), 1)

/* Comparisons */

#  define emitm_fcom(pc, sti) emitm_fl_3((pc), emit_b000, emit_b010, (sti))

#  define emitm_fcomp(pc, sti) emitm_fl_3((pc), emit_b000, emit_b011, (sti))

#ifdef PARROT_HAS_JIT_FCOMIP
#  define emitm_fcomip(pc, sti) emitm_fl_3((pc), emit_b111, emit_b110, (sti))
#  define emitm_fcomi(pc, sti) emitm_fl_3((pc), emit_b011, emit_b110, (sti))
#else
#  define emitm_fcomip(pc, sti) do { \
      emitm_fcomp((pc), (sti)); \
      emitm_fstw(pc); \
      emitm_sahf(pc); \
    } while (0)
#  define emitm_fcomi(pc, sti) do { \
      emitm_fcom((pc), (sti)); \
      emitm_fstw(pc); \
      emitm_sahf(pc); \
    } while (0)
#endif

#  define emitm_fcompp(pc) { *((pc)++) = (char) 0xde; *((pc)++) = (char) 0xd9; }

#  define emitm_fcom_m(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b10, 0, emit_b010, (b), (i), (s), (d))

#  define emitm_fcomp_m(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b10, 0, emit_b011, (b), (i), (s), (d))

/* ST -= real64 */
#  define emitm_fsub_m(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b10, 0, emit_b100, (b), (i), (s), (d))

/* ST -= int32_mem */
#  define emitm_fisub_m(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b01, 0, emit_b100, (b), (i), (s), (d))

#  define emitm_fadd_m(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b10, 0, emit_b000, (b), (i), (s), (d))

/* ST += int32_mem */
#  define emitm_fiadd_m(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b01, 0, emit_b000, (b), (i), (s), (d))

/* ST *= real64 */
#  define emitm_fmul_m(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b10, 0, emit_b001, (b), (i), (s), (d))

/* ST *= int32_mem */
#  define emitm_fimul_m(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b01, 0, emit_b001, (b), (i), (s), (d))

/* ST /= real64 */
#  define emitm_fdiv_m(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b10, 0, emit_b110, (b), (i), (s), (d))

/* ST /= int32_mem */
#  define emitm_fidiv_m(interp, pc, b, i, s, d) \
    emitm_fl_2((interp), (pc), emit_b01, 0, emit_b110, (b), (i), (s), (d))

/* Ops Needed to support loading EFLAGs for conditional branches */
#  define emitm_fstw(pc) emitm_fl_3((pc), emit_b111, emit_b100, emit_b000)

#  define emitm_sahf(pc) *((pc)++) = (char) 0x9e

/* misc float */
#  define emitm_ftst(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xE4; }
#  define emitm_fprem(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xF8; }
#  define emitm_fprem1(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xF5; }

#  define emitm_fldcw(interp, pc, mem) \
    emitm_fl_2((interp), (pc), emit_b00, 1, emit_b101, 0, 0, 0, (mem))

#if defined(NEG_MINUS_ZERO)
#  define jit_emit_neg_r_n(pc, r) { \
       if (r) { \
         emitm_fld((pc), (r)); \
       } \
       emitm_fchs(pc); \
       if (r) { \
         emitm_fstp((pc), ((r)+1)); \
       } \
     }

#  define jit_emit_neg_M_n(interp, pc, mem) { \
       jit_emit_fload_mb_n((interp), (pc), emit_EBX, (mem)); \
       emitm_fchs(pc); \
       jit_emit_fstore_mb_n((interp), (pc), emit_EBX, (mem)); \
     }

#elif defined(NEG_ZERO_SUB)

#  define jit_emit_neg_r_n(pc, r) { \
       emitm_fldz(pc); \
       emitm_fsubrp((pc), ((r)+1)); \
     }

#  define jit_emit_neg_M_n(interp, pc, mem) { \
       jit_emit_fload_mb_n((interp), (pc), emit_EBX, (mem)); \
       emitm_fldz(pc); \
       emitm_fsubrp((pc), 1); \
       jit_emit_fstore_mb_n((interp), (pc), emit_EBX, (mem)); \
     }
#else

#  define jit_emit_neg_r_n(pc, r) { \
       if (r) { \
         emitm_fld((pc), (r)); \
       } \
       emitm_ftst(pc); \
       emitm_fstw(pc); \
       emitm_sahf(pc); \
       emitm_jxs((pc), emitm_jz, 2); \
       emitm_fchs(pc); \
       if (r) { \
         emitm_fstp((pc), ((r)+1)); \
       } \
     }

#  define jit_emit_neg_M_n(interp, pc, mem) { \
       jit_emit_fload_mb_n((interp), (pc), emit_EBX, (mem)); \
       emitm_ftst(pc); \
       emitm_fstw(pc); \
       emitm_sahf(pc); \
       emitm_jxs((pc), emitm_jz, 2); \
       emitm_fchs(pc); \
       jit_emit_fstore_mb_n((interp), (pc), emit_EBX, (mem)); \
     }
#endif

#  define jit_emit_sin_r_n(pc, r) \
     if (r) { \
       emitm_fld((pc), (r)); \
     } \
     emitm_fsin(pc); \
     if (r) { \
       emitm_fstp((pc), ((r)+1)); \
     }

#  define jit_emit_cos_r_n(pc, r) \
     if (r) { \
       emitm_fld((pc), (r)); \
     } \
     emitm_fcos(pc); \
     if (r) { \
       emitm_fstp((pc), ((r)+1)); \
     }

#  define jit_emit_sqrt_r_n(pc, r) \
     if (r) { \
       emitm_fld((pc), (r)); \
     } \
     emitm_fsqrt(pc); \
     if (r) { \
       emitm_fstp((pc), ((r)+1)); \
     }

#  define jit_emit_abs_r_n(pc, r) { \
     if (r) { \
       emitm_fld((pc), (r)); \
     } \
     emitm_fabs(pc); \
     if (r) { \
       emitm_fstp((pc), ((r)+1)); \
     } \
   }

#  define jit_emit_abs_r_i(pc, r) { \
     jit_emit_test_r_i((pc), (r)); \
     emitm_jxs((pc), emitm_jns, 3); \
     jit_emit_not_r_i((pc), (r)); \
     jit_emit_inc_r_i((pc), (r)); \
   }

#  define jit_emit_abs_m_n(interp, pc, mem) { \
     jit_emit_fload_m_n((interp), (pc), (mem)); \
     emitm_fabs(pc); \
     jit_emit_fstore_m_n((pc), (mem)); \
   }

/* Integer comparisons */
#  define jit_emit_cmp_rr(pc, reg1, reg2) \
    emitm_alul_r_r((pc), 0x39, (reg2), (reg1))
#  define jit_emit_cmp_rr_i(pc, r1, r2) jit_emit_cmp_rr((pc), (r1), (r2))

#  define emitm_cmpl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x3b, (reg), (b), (i), (s), (d))

#  define emitm_cmpl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m((pc), 0x39, (reg), (b), (i), (s), (d))

#  define jit_emit_cmp_ri_i(interp, pc, reg, imm) \
    emitm_alul_i_r((pc), 0x81, emit_b111, (imm), (reg))

/* Unconditional Jump/Call */

#  define emitm_call_cfunc(pc, func) emitm_calll((pc), (char *)(func) - (pc) - 4)

#  define emitm_calll(pc, disp) { \
    *((pc)++) = (char) 0xe8; \
    *(long *)(pc) = (disp); (pc) += 4; }

#  define emitm_callr(pc, reg) { \
    *((pc)++) = (char) 0xff; \
    *((pc)++) = (char) 0xd0 | ((reg) - 1); }

#  define emitm_callm(pc, b, i, s, d) { \
       *((pc)++) = (char) 0xff; \
       (pc) = emit_r_X((interp), (pc), emit_reg(emit_b010), (b), (i), (s), (d)); }

#  define emitm_jumps(pc, disp) { \
    *((pc)++) = (char) 0xeb; \
    *((pc)++) = (disp); }

#  define emitm_jumpl(pc, disp) { \
    *((pc)++) = (char) 0xe9; \
    *(long *)(pc) = (disp); (pc) += 4; }

#  define emitm_jumpr(pc, reg) { \
    *((pc)++) = (char) 0xff; \
    *((pc)++) = (char)(0xe0 | ((reg) - 1)); }

#  define emitm_jumpm(pc, b, i, s, d) { \
       *((pc)++) = (char) 0xff; \
       (pc) = emit_r_X((interp), (pc), emit_reg(emit_b100), (b), (i), (s), (d)); }

/* Conditional jumps */

/* Short jump - 8 bit disp */
#  define emitm_jxs(pc, code, disp) { \
    *((pc)++) = (char)(0x70 | (code)); \
    *((pc)++) = (char)(disp); }

/* Long jump - 32 bit disp */
#  define emitm_jxl(pc, code, disp) { \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char)(0x80 | (code));  \
    *(long *)(pc) = (disp); (pc) += 4; }

#  define emitm_jo   0
#  define emitm_jno  1
#  define emitm_jb   2
#  define emitm_jnb  3
#  define emitm_jz   4
#  define emitm_je emitm_jz
#  define emitm_jnz  5
#  define emitm_jne emitm_jnz
#  define emitm_jbe  6
#  define emitm_ja   7
#  define emitm_js   8
#  define emitm_jns  9
#  define emitm_jp  10
#  define emitm_jnp 11
#  define emitm_jl  12
#  define emitm_jnl 13
#  define emitm_jle 14
#  define emitm_jg  15

/* set byte conditional */
#  define jit_emit_setcc_r(pc, cc, r) \
    *(pc)++ = 0x0f; \
    *(pc)++ = 0x90 + (cc); \
    *(pc)++ = (char) emit_alu_X_r(0, (r))

/*
 * core.jit interface
 *
 * The new offset based versions have uppercase RM or MR inside
 * That's probably only during transition time
 */

#  define jit_emit_mov_mi_i(pc, dest, immediate) \
    emitm_movl_i_m((pc), (immediate), emit_None, emit_None, emit_None, (dest))

#  define jit_emit_mov_MI_i(interp, pc, offs, immediate) \
    emitm_movl_i_m((pc), (immediate), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_mov_rm_i(interp, pc, reg, address) \
    emitm_movl_m_r((interp), (pc), (reg), emit_None, emit_None, emit_None, (address))

#  define jit_emit_mov_RM_i(interp, pc, reg, offs) \
    emitm_movl_m_r((interp), (pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_mov_mr_i(interp, pc, address, reg) \
    emitm_movl_r_m((interp), (pc), (reg), emit_None, emit_None, emit_None, (address))

#  define jit_emit_mov_MR_i(interp, pc, offs, reg) \
    emitm_movl_r_m((interp), (pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_mul_RM_i(interp, pc, reg, offs) \
    emitm_smull_r_m((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_sub_RM_i(interp, pc, reg, offs) \
    emitm_subl_m_r((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_sub_MR_i(interp, pc, offs, reg) \
    emitm_subl_r_m((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_sub_MI_i(pc, offs, imm) \
    emitm_subl_i_m((pc), (imm), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_add_RM_i(interp, pc, reg, offs) \
    emitm_addl_m_r((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_add_MR_i(interp, pc, offs, reg) \
    emitm_addl_r_m((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_add_MI_i(pc, offs, imm) \
    emitm_addl_i_m((pc), (imm), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_cmp_rm_i(pc, reg, address) \
    emitm_cmpl_r_m((pc), (reg), emit_None, emit_None, emit_None, (address))

#  define jit_emit_cmp_RM_i(interp, pc, reg, offs) \
    emitm_cmpl_r_m((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_cmp_MR_i(interp, pc, offs, reg) \
    emitm_cmpl_m_r((pc), (reg), emit_EBX, emit_None, 1, (offs))

/* high level routines, behave like real 2 register FP */

/* mapped float registers numbers are ST(1)-ST(4).
 * scratch register is ST(0)
 */

/* ST(i) <- numvar */
#  define jit_emit_mov_RM_n(interp, pc, r, d) { \
    jit_emit_fload_mb_n((interp), (pc), emit_EBX, (d)); \
    emitm_fstp((pc), ((r)+1)); \
}

/* ST(i) <= NUM_CONST */
#  define jit_emit_mov_ri_n(interp, pc, r, i) { \
    jit_emit_fload_m_n((interp), (pc), (i)); \
    emitm_fstp((pc), ((r)+1)); \
}

/* ST(i) <= &INT_CONST */
#  define jit_emit_mov_ri_ni(interp, pc, r, i) { \
    jit_emit_fload_m_i((interp), (pc), (i)); \
    emitm_fstp((pc), ((r)+1)); \
}

/* ST(i) <= INT_REG */
#  define jit_emit_mov_RM_ni(interp, pc, r, i) { \
    jit_emit_fload_mb_i((interp), (pc), (i)); \
    emitm_fstp((pc), ((r)+1)); \
}

/* NUM_REG(i) <= &INT_CONST
 * the int const i is loaded from the code memory
 */
#  define jit_emit_mov_MI_ni(interp, pc, offs, i) { \
    jit_emit_fload_m_i((interp), (pc), (i)); \
    jit_emit_fstore_mb_n((interp), (pc), emit_EBX, (offs)); \
}

/* INT_REG <= ST(i) */
#  define jit_emit_mov_mr_in(pc, mem, r) { \
    emitm_fld((pc), (r)); \
    jit_emit_fstore_m_i((pc), (mem)); \
}

/* numvar <- ST(i) */
#  define jit_emit_mov_mr_n(pc, d, r) { \
    emitm_fld((pc), (r)); \
    jit_emit_fstore_m_n((pc), (d)); \
}

#  define jit_emit_mov_MR_n(interp, pc, d, r) { \
    if (r) { \
        emitm_fld((pc), (r)); \
        jit_emit_fstore_mb_n((interp), (pc), emit_EBX, (d)); \
    } \
    else { \
        jit_emit_fst_mb_n((interp), (pc), emit_EBX, (d)); \
    } \
}

/* ST(r1) <= ST(r2) */
#  define jit_emit_mov_rr_n(pc, r1, r2) { \
    if ((r1) != (r2)) { \
      if (r2) { \
        emitm_fld((pc), (r2)); \
        emitm_fstp((pc), ((r1)+1)); \
      } \
      else { \
        emitm_fst((pc), (r1)); \
      } \
    } \
}

/* ST(r1) xchg ST(r2) */
#  define jit_emit_xchg_rr_n(interp, pc, r1, r2) { \
    if ((r1) != (r2)) { \
      emitm_fld((pc), (r1)); \
      emitm_fld((pc), ((r2)+1)); \
      emitm_fstp((pc), ((r1)+2)); \
      emitm_fstp((pc), ((r2)+1)); \
    } \
}

#  define jit_emit_xchg_RM_n(interp, pc, r, offs) { \
    emitm_fld((pc), (r)); \
    jit_emit_fload_mb_n((interp), (pc), emit_EBX, (offs)); \
    emitm_fstp((pc), ((r)+2)); \
    jit_emit_fstore_mb_n((interp), (pc), emit_EBX, (offs)); \
}

#  define jit_emit_xchg_MR_n(interp, pc, offs, r) { \
    emitm_fld((pc), (r)); \
    jit_emit_fload_mb_n((interp), (pc), emit_EBX, (offs)); \
    emitm_fstp((pc), ((r)+2)); \
    jit_emit_fstore_mb_n((interp), (pc), emit_EBX, (offs)); \
}

#  define jit_emit_finit(pc) { *((pc)++) = (char) 0xdb; *((pc)++) = (char) 0xe3; }

/* ST(i) op= MEM */

#  define jit_emit_xxx_rm_n(interp, op, pc, r, m) { \
    jit_emit_fload_m_n((interp), (pc), (m)); \
    emitm_f ## op ## p((pc), ((r)+1)); \
}

#  define jit_emit_xxx_RM_n(interp, op, pc, r, offs) { \
    jit_emit_fload_mb_n((interp), (pc), emit_EBX, (offs)); \
    emitm_f ## op ## p((pc), ((r)+1)); \
}

/*
 * float ops in two flavors: abs memory for constants, offsets for regs
 */

#  define jit_emit_add_ri_n(interp, pc, r, m) jit_emit_xxx_rm_n((interp), add, (pc), (r), (m))
#  define jit_emit_sub_ri_n(interp, pc, r, m) jit_emit_xxx_rm_n((interp), sub, (pc), (r), (m))
#  define jit_emit_mul_ri_n(interp, pc, r, m) jit_emit_xxx_rm_n((interp), mul, (pc), (r), (m))

#  define jit_emit_add_RM_n(interp, pc, r, o) jit_emit_xxx_RM_n((interp), add, (pc), (r), (o))
#  define jit_emit_sub_RM_n(interp, pc, r, o) jit_emit_xxx_RM_n((interp), sub, (pc), (r), (o))
#  define jit_emit_mul_RM_n(interp, pc, r, o) jit_emit_xxx_RM_n((interp), mul, (pc), (r), (o))

/* ST(r1) += ST(r2) */
/* r1 == 0:  ST(0) <- ST(0) + ST(i)
 * r2 == 0:  ST(i) <- ST(0) + ST(i)
 */
#  define jit_emit_add_rr_n(interp, pc, r1, r2) do { \
        if (!(r1)) { \
          emitm_fadd((pc), (r2)); \
        }  \
        else if (!(r2)) { \
          emitm_faddr((pc), (r1)); \
        }  \
        else { \
            emitm_fld((pc), (r2)); \
            emitm_faddp((pc), ((r1)+1)); \
        } \
    } \
    while (0)
/*
 * ST(r) += INT_REG
 */
#  define jit_emit_add_RM_ni(pc, r, offs) { \
    emitm_fld((pc), (r)); \
    emitm_fiadd_m((pc), emit_EBX, 0, 1, (offs)); \
    emitm_fstp((pc), ((r)+1)); \
}

/* ST(r1) -= ST(r2) */
/* r1 == 0:  ST(0) <- ST(0) - ST(i)
 * r2 == 0:  ST(i) <- ST(i) - ST(0)
 */
#  define jit_emit_sub_rr_n(interp, pc, r1, r2) do { \
        if (!(r1)) { \
          emitm_fsub((pc), (r2)); \
        }  \
        else if (!(r2)) { \
          emitm_fsubr((pc), (r1)); \
        }  \
        else { \
            emitm_fld((pc), (r2)); \
            emitm_fsubp((pc), ((r1)+1)); \
        } \
    } \
    while (0)

/*
 * ST(r) -= INT_REG
 */
#  define jit_emit_sub_RM_ni(pc, r, offs) { \
    emitm_fld((pc), (r)); \
    emitm_fisub_m((pc), emit_EBX, 0, 1, (offs)); \
    emitm_fstp((pc), ((r)+1)); \
}

#  define jit_emit_inc_r_n(pc, r) { \
    emitm_fld1(pc); \
    emitm_faddp((pc), ((r)+1)); \
}

#  define jit_emit_dec_r_n(pc, r) { \
    emitm_fld1(pc); \
    emitm_fsubp((pc), ((r)+1)); \
}

/* ST(r1) *= ST(r2) */
/* r1 == 0:  ST(0) <- ST(0) * ST(i)
 * r2 == 0:  ST(i) <- ST(0) * ST(i)
 */
#  define jit_emit_mul_rr_n(interp, pc, r1, r2) do { \
        if (!(r1)) { \
          emitm_fmul((pc), (r2)); \
        }  \
        else if (!(r2)) { \
          emitm_fmulr((pc), (r1)); \
        }  \
        else { \
            emitm_fld((pc), (r2)); \
            emitm_fmulp((pc), ((r1)+1)); \
        } \
    } \
    while (0)

/*
 * ST(r) *= INT_REG
 */
#  define jit_emit_mul_RM_ni(pc, r, offs) { \
    emitm_fld((pc), (r)); \
    emitm_fimul_m((pc), emit_EBX, 0, 1, (offs)); \
    emitm_fstp((pc), ((r)+1)); \
}

/*
 * ST(r) /= INT_REG
 */
#  define jit_emit_div_RM_ni(pc, r, offs) { \
    emitm_fld((pc), (r)); \
    emitm_fidiv_m((pc), emit_EBX, 0, 1, (offs)); \
    emitm_fstp((pc), ((r)+1)); \
}

/* test r for zero */
#  define jit_emit_test_r_n(pc, r) { \
    if (r) { \
      emitm_fxch((pc), (r)); \
    } \
    emitm_fxam(pc); \
    emitm_fstw(pc); \
    emitm_sahf(pc); \
    if (r) { \
      emitm_fxch((pc), (r)); \
    } \
}

/* ST(r1) /= ST(r2) */
char * div_rr_n(PARROT_INTERP, Parrot_jit_info_t *jit_info, int r1);

#  define jit_emit_div_rr_n(interp, pc, r1, r2) \
    emitm_fld((pc), (r2)); \
    jit_info->native_ptr = (pc); \
    (pc) = div_rr_n((interp), jit_info, (r1))

#  define jit_emit_div_ri_n(interp, pc, r, m) \
    jit_emit_fload_m_n((interp), (pc), (m)); \
    jit_info->native_ptr = (pc); \
    (pc) = div_rr_n((interp), jit_info, (r))

#  define jit_emit_div_RM_n(interp, pc, r, o) \
    jit_emit_fload_mb_n((interp), (pc), emit_EBX, (o)); \
    jit_info->native_ptr = (pc); \
    (pc) = div_rr_n((interp), jit_info, (r))

char * mod_rr_n(PARROT_INTERP, Parrot_jit_info_t *jit_info, int r);

/* ST(i) %= MEM
 * please note the hardcoded jumps */
#  define jit_emit_cmod_RM_n(interp, pc, r, offs)  \
    if (r)  \
      emitm_fxch((pc), (r)); \
    jit_emit_fload_mb_n((interp), (pc), emit_EBX, (offs)); \
    (pc) = mod_rr_n((interp), jit_info, (r))

#  define jit_emit_cmod_ri_n(interp, pc, r, mem)  \
    if (r)  \
      emitm_fxch((pc), (r)); \
    jit_emit_fload_m_n((interp), (pc), (mem)); \
    (pc) = mod_rr_n((interp), jit_info, (r))

/* ST(r1) %= ST(r2) */
#  define jit_emit_cmod_rr_n(interp, pc, r1, r2)  \
    if (r1)  \
      emitm_fxch((pc), (r1)); \
    emitm_fld((pc), (r2)); \
    (pc) = mod_rr_n((interp), jit_info, (r1))

/* compare ST(r) <-> mem i.e. constant */
#  define jit_emit_cmp_ri_n(interp, pc, r, mem) { \
    jit_emit_fload_m_n((interp), (pc), (mem)); \
    emitm_fld((pc), ((r)+1)); \
    emitm_fcompp(pc); \
    emitm_fstw(pc); \
    emitm_sahf(pc); \
}

#  define jit_emit_cmp_RM_n(interp, pc, r, offs) { \
    jit_emit_fload_mb_n((interp), (pc), emit_EBX, (offs)); \
    emitm_fld((pc), ((r)+1)); \
    emitm_fcompp(pc); \
    emitm_fstw(pc); \
    emitm_sahf(pc); \
}

/* compare mem <-> ST(r) */
#  define jit_emit_cmp_mi_n(interp, pc, mem, r) { \
    jit_emit_fload_m_n((interp), (pc), (mem)); \
    emitm_fcomip((pc), ((r)+1)); \
}

#  define jit_emit_cmp_MR_n(interp, pc, offs, r) { \
    jit_emit_fload_mb_n((interp), (pc), emit_EBX, (offs)); \
    emitm_fcomip((pc), ((r)+1)); \
}

/* compare ST(r1) <-> ST(r2) test FCOMI (=fcom, fstw, sahf) */
#  define jit_emit_cmp_rr_n(pc, r1, r2) { \
    if (!(r2) || ((r1)==(r2))) { \
      emitm_fld((pc), (r1)); \
      emitm_fcomip((pc), ((r2)+1)); \
    } \
    else { \
      if (r1) { \
        emitm_fxch((pc), (r1)); \
        emitm_fcomi((pc), (r2)); \
        emitm_fxch((pc), (r1)); \
      } \
      else { \
        emitm_fcomi((pc), (r2)); \
      } \
    } \
}

#  define jit_emit_neg_M_i(interp, pc, offs) \
    emitm_negl_m((pc), emit_EBX, emit_None, 1, (long)(offs))

#  define jit_emit_band_MR_i(interp, pc, offs, reg) \
    emitm_andl_r_m((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_band_RM_i(interp, pc, reg, offs) \
    emitm_andl_m_r((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_band_MI_i(pc, offs, imm) \
    emitm_andl_i_m((pc), (imm), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_bor_MR_i(interp, pc, offs, reg) \
    emitm_orl_r_m((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_bor_RM_i(interp, pc, reg, offs) \
    emitm_orl_m_r((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_bor_MI_i(pc, offs, imm) \
    emitm_orl_i_m((pc), (imm), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_bxor_MR_i(interp, pc, offs, reg) \
    emitm_xorl_r_m((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_bxor_RM_i(interp, pc, reg, offs) \
    emitm_xorl_m_r((pc), (reg), emit_EBX, emit_None, 1, (offs))

#  define jit_emit_bxor_MI_i(pc, offs, imm) \
    emitm_xorl_i_m((pc), (imm), emit_EBX, emit_None, 1, (offs))

/* dest /= src
 * edx:eax /= src, quotient => eax, rem => edx
 */
char * opt_div_rr(PARROT_INTERP, Parrot_jit_info_t *jit_info, int dest,
    int src, int is_div);

#  define jit_emit_div_rr_i(interp, pc, r1, r2) (pc) = opt_div_rr((interp), jit_info, (r1), (r2), 1)
#  define jit_emit_cmod_rr_i(interp, pc, r1, r2) (pc) = opt_div_rr((interp), jit_info, (r1), (r2), 0)

char * opt_div_ri(PARROT_INTERP, Parrot_jit_info_t *jit_info, int dest,
    INTVAL imm, int is_div);

#  define jit_emit_div_ri_i(pc, r1, imm) (pc) = opt_div_ri(interp, jit_info, (r1), (imm), 1)
#  define jit_emit_cmod_ri_i(pc, r1, imm) (pc) = opt_div_ri(interp, jit_info, (r1), (imm), 0)

char * opt_div_RM(PARROT_INTERP, Parrot_jit_info_t *jit_info, int dest,
    int offs, int is_div);

#  define jit_emit_div_RM_i(interp, pc, r, m)  (pc) = opt_div_RM((interp), jit_info, (r), (m), 1)
#  define jit_emit_cmod_RM_i(interp, pc, r, m) (pc) = opt_div_RM((interp), jit_info, (r), (m), 0)

enum { JIT_X86BRANCH, JIT_X86JUMP, JIT_X86CALL };

#  define jit_emit_stack_frame_enter(pc) do { \
    emitm_pushl_r((pc), emit_EBP); \
    jit_emit_mov_rr_i((pc), emit_EBP, emit_ESP); \
} while (0)

#  define jit_emit_stack_frame_leave(pc) do { \
    jit_emit_mov_rr_i((pc), emit_ESP, emit_EBP); \
    emitm_popl_r((pc), emit_EBP); \
} while (0)

#  define jit_emit_end(pc) { \
       jit_emit_add_ri_i((interp), (pc), emit_ESP, 4); \
       emitm_popl_r((pc), emit_EDI); \
       emitm_popl_r((pc), emit_ESI); \
       emitm_popl_r((pc), emit_EBX); \
       emitm_popl_r((pc), emit_EBP); \
       emitm_ret(pc); \
     }

void jit_get_params_pc(Parrot_jit_info_t *jit_info, PARROT_INTERP);

size_t calc_signature_needs(const char *sig, int *strings);

void * Parrot_jit_build_call_func(PARROT_INTERP, PMC *pmc_nci,
    STRING *signature, int *sizeptr);

/*
 * register usage
 * %edi, %esi ... mapped, preserved
 * %edx, %ecx ... mapped, not preserved
 * %ebx       ... base pointer for register access, preserved
 * %eax       ... scratch, return value register
 */

#endif /* PARROT_I386_JIT_EMIT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
