/*
 * jit_emit.h
 *
 * i386
 *
 * $Id$
 */

#include <assert.h>

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

#if JIT_EMIT

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

#define emit_r_m(pc, reg1, b, i, s, d) \
  emit_r_X((pc), emit_reg((reg1)-1), (b), (i), (s), (d))

/* ESIB byte */
#define emit_Scale(scale) ((scale) << 6)
#define emit_reg_Index(x) (((x)-1) << 3)
#define emit_reg_Base(x) ((x)-1)

/* Scale factor values */
#define emit_Scale_1 emit_Scale(0)
#define emit_Scale_2 emit_Scale(1)
#define emit_Scale_4 emit_Scale(2)
#define emit_Scale_8 emit_Scale(3)

#define emit_Index_None ((emit_b100) << 3)

#define emit_alu_X_r(X, reg) ((emit_b11 << 6) | ((X) << 3) | ((reg) - 1))

#define emit_alu_r_r(reg1,reg2) emit_alu_X_r((reg1 - 1), (reg2))

static int
emit_is8bit(long disp)
{
    return disp >= -128 && disp <= 127;
}

static char *
emit_disp8_32(char *pc, int disp)
{
    if(emit_is8bit(disp)) {
        *(pc++) = (char)disp;
        return pc;
    }
    else {
        *(long *)pc = disp;
        return pc + 4;
    }
}

static void
emit_sib(char *pc, int scale, int i, int base)
{
    int scale_byte;

    switch (scale) {
        case 1:
            scale_byte = emit_Scale_1;
            break;
        case 2:
            scale_byte = emit_Scale_2;
            break;
        case 4:
            scale_byte = emit_Scale_4;
            break;
        case 8:
            scale_byte = emit_Scale_8;
            break;
        default :
            internal_exception(JIT_ERROR, "Invalid scale factor %d\n", scale);
            return;
    }

    *pc = scale_byte | (i == emit_None ? emit_Index_None : emit_reg_Index(i)) |
        emit_reg_Base(base);
}

static char *
emit_r_X(char *pc, int reg_opcode, int base, int i, int scale, long disp)
{
    if (i && !scale) {
        internal_exception(JIT_ERROR,
                            "emit_r_X passed invalid scale+index combo\n");
    }

    if (base == emit_EBP) {
    /* modrm disp */
        if (i == emit_None) {
            *(pc++) = (emit_is8bit(disp) ? emit_Mod_b01 : emit_Mod_b10 )
                | reg_opcode | emit_reg_rm(emit_EBP);
            return emit_disp8_32(pc, disp);
        }
        /* modrm sib disp */
        else {
            *(pc++) = (emit_is8bit(disp) ? emit_Mod_b01 : emit_Mod_b10 )
                | reg_opcode | emit_b100;
            emit_sib(pc++, scale, i, base);
            return emit_disp8_32(pc, disp);
        }
    }

    /* modrm sib disp */
    if (base == emit_ESP) {
        *(pc++) = (emit_is8bit(disp) ? emit_Mod_b01 : emit_Mod_b10 )
                | reg_opcode | emit_rm_b100;
        emit_sib(pc++, scale, i, emit_ESP);
        return emit_disp8_32(pc, disp);
    }

    /* modrm disp32 */
    if (!base && !(i && scale) && !emit_is8bit(disp)) {
        *(pc++) = emit_Mod_b00 | reg_opcode | emit_rm_b101;
        *(long *)pc = disp;
        return pc + 4;
    }

    /* Ok, everything should be more regular here */
    *(pc++) = (disp == 0 ? emit_Mod_b00 :
              (emit_is8bit(disp) ?
               emit_Mod_b01 : emit_Mod_b10) ) |
               reg_opcode |
               (!base || (scale && i) ? emit_rm_b100 : emit_reg_rm(base));

    if (!base || (scale && i)) {
        emit_sib(pc++, scale, i, base);
    }
    if (disp)
        pc = emit_disp8_32(pc, disp);

    return pc;
}

static char *
emit_shift_i_r(char *pc, int opcode, int imm, int reg)
{
    if(imm == 0)
    {
        /* noop */
    }
    else if(imm == 1)
    {
        *(pc++) = 0xd1;
        *(pc++) = emit_alu_X_r(opcode,  reg);
    }
    else if(imm > 1 && imm < 33)
    {
        *(pc++) = 0xc1;
        *(pc++) = emit_alu_X_r(opcode,  reg);
        *(pc++) = imm;
    }
    else
    {
    internal_exception(JIT_ERROR,
                            "emit_shift_i_r passed invalid shift\n");
    }

    return pc;
}

static char *
emit_shift_i_m(char *pc, int opcode, int imm,
               int base, int i, int scale, long disp)
{
    if (imm == 0) {
        /* noop */
    }
    else if (imm == 1) {
        *(pc++) = 0xd1;
        pc = emit_r_X(pc, opcode,  base, i, scale, disp);
    }
    else if (imm > 1 && imm < 33) {
        *(pc++) = 0xc1;
        pc = emit_r_X(pc, opcode,  base, i, scale, disp);
        *(pc++) = imm;
    }
    else {
        internal_exception(JIT_ERROR,
            "emit_shift_i_m passed invalid shift\n");
    }

    return pc;
}

static char *
emit_shift_r_r(char *pc, int opcode, int reg1, int reg2)
{
    if (reg1 != emit_ECX) {
        internal_exception(JIT_ERROR,
            "emit_shift_r_r passed invalid register\n");
    }

    *(pc++) = 0xd3;
    *(pc++) = emit_alu_X_r(opcode,  reg2);

    return pc;
}

static char *
emit_shift_r_m(char *pc, int opcode, int reg,
               int base, int i, int scale, long disp)
{
    if (reg != emit_ECX) {
        internal_exception(JIT_ERROR,
            "emit_shift_r_m passed invalid register\n");
    }

    *(pc++) = 0xd3;
    pc = emit_r_X(pc, opcode,  base, i, scale, disp);

    return pc;
}


/* CDQ - need this to do multiply */
#define emitm_cdq(pc) *((pc)++) = 0x99

/* RET */
#define emitm_ret(pc) *((pc)++) = 0xc3

/* NOP */
#define emit_nop(pc) *((pc)++) = 0x90

/* PUSHes */

#define emitm_pushl_r(pc, reg) \
  *(pc++) = 0x50 | (reg - 1)

#define emitm_pushl_i(pc, imm) { \
  *(pc++) = 0x68; \
  *(long *)pc = (long)imm; \
  (pc) += 4; }

static char *
emit_pushl_m(char *pc, int base, int i, int scale, long disp)
{
    *(pc++) = 0xff;
    return emit_r_X(pc, emit_reg(emit_b110), base, i, scale, disp);
}

/* POPs */

static char *
emit_popl_r(char *pc, int reg)
{
    *(pc++) = 0x8f;
    *(pc++) = emit_alu_X_r(emit_b000, reg);
    return pc;
}

static char *
emit_popl_m(char *pc, int base, int i, int scale, long disp)
{
    *(pc++) = 0x8f;
    return emit_r_X(pc, emit_reg(emit_b000), base, i, scale, disp);
}

/* MOVes */

static char *
emit_movb_r_r(char *pc, int reg1, int reg2)
{
    *(pc++) = 0x88;
    *(pc++) = emit_alu_r_r(reg1, reg2);
    return pc;
}
#define jit_emit_mov_rr_i(pc, reg2, reg1) if (reg1 != reg2) { \
  *(pc++) = 0x89; \
  *(pc++) = emit_alu_r_r(reg1, reg2); }

static char *
emit_movb_i_r(char *pc, char imm, int reg)
{
    *(pc++) = 0xb0 | (reg - 1);
    *(pc++) = imm;
    return pc;
}

#define jit_emit_mov_ri_i(pc, reg, imm) { \
  *(pc++) = 0xb8 | (reg - 1); \
  *(long *)pc = (long)imm; (pc) += 4; }

#define emitm_movX_Y_Z(op, pc, reg1, b, i, s, d) { \
  *(pc++) = op; \
  (pc) = emit_r_m(pc, reg1, b, i, s, (long)d); }

#define emitm_movb_r_m(pc, reg1, b, i, s, d) \
  emitm_movX_Y_Z(0x88, pc, reg1, b, i, s, d)

#define emitm_movl_r_m(pc, reg1, b, i, s, d) \
  emitm_movX_Y_Z(0x89, pc, reg1, b, i, s, d)

#define emitm_movb_m_r(pc, reg1, b, i, s, d) \
  emitm_movX_Y_Z(0x8a, pc, reg1, b, i, s, d)

#define emitm_movl_m_r(pc, reg1, b, i, s, d) \
  emitm_movX_Y_Z(0x8b, pc, reg1, b, i, s, d)

#define emitm_lea_m_r(pc, reg1, b, i, s, d) \
  emitm_movX_Y_Z(0x8d, pc, reg1, b, i, s, d)

static char *
emit_movb_i_m(char *pc, char imm, int base, int i, int scale, long disp)
{
    *(pc++) = 0xc6;
    pc = emit_r_X(pc, emit_reg(emit_b000), base, i, scale, disp);
    *(pc++) = imm;
    return pc;
}

#define emitm_movl_i_m(pc, imm, b, i, s, d) { \
  *(pc++) = 0xc7; \
  (pc) = emit_r_X(pc, emit_reg(emit_b000), b, i, s, (long)d); \
  *(long *)(pc) = (long)imm; (pc) += 4; }

/* Various ALU formats */

#define emitm_alul_r_r(pc, op, reg1, reg2) { \
  *(pc++) = op; *(pc++) = emit_alu_r_r(reg1, reg2); }

#define emitm_alub_i_r(pc, op1, op2, imm, reg) { \
  *(pc++) = op1; *(pc++) = emit_alu_X_r(op2, reg); *(pc++) = (char)(imm); }

#define emitm_alul_i_r(pc, op1, op2, imm, reg) { \
  *(pc++) = op1; \
  *(pc++) = emit_alu_X_r(op2, reg); \
  *(long *)((pc)) = (long)(imm); (pc) += 4; }

#define emitm_alul_i_m(pc, op1, op2, imm, b, i, s, d) { \
  *(pc++) = op1; \
  (pc) = emit_r_X(pc, emit_reg(op2), b, i, s, d); \
  *(long *)(pc) = (long)imm; (pc) += 4; }

#define emitm_alul_r_m(pc, op, reg, b, i, s, d) { \
  *(pc++) = op; \
  pc = emit_r_X(pc, emit_reg(reg-1), b, i, s, (long)d); }


/* ADDs */

#define emitm_addb_r_r(pc, reg1, reg2) \
  emitm_alul_r_r(pc, 0x00, reg1, reg2)

#define emitm_addb_i_r(pc, imm, reg) \
  emitm_alub_i_r(pc, 0x83, emit_b000, imm, reg)

#define jit_emit_add_rr_i(pc, reg1, reg2) \
  emitm_alul_r_r(pc, 0x01, reg2, reg1)

#define jit_emit_add_ri_i(pc, reg, imm)   \
  emitm_alul_i_r(pc, 0x81, emit_b000, imm, reg)

#define emitm_addl_i_m(pc, imm, b, i, s, d) \
  emitm_alul_i_m(pc, 0x81, emit_b000, imm, b, i, s, d)

#define emitm_addl_r_m(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x01, reg, b, i, s, d)

#define emitm_addl_m_r(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x03, reg, b, i, s, d)

/* SUBs */

#define jit_emit_sub_rr_i(pc, reg1, reg2) \
  emitm_alul_r_r(pc, 0x29, reg2, reg1)

#define emitm_subl_i_r(pc, imm, reg) \
  emitm_alul_i_r(pc, 0x81, emit_b101, imm, reg)
#define jit_emit_sub_ri_i(pc, r, i) emitm_subl_i_r(pc, i, r)

#define emitm_subl_r_m(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x29, reg, b, i, s, d)

#define emitm_subl_m_r(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x2b, reg, b, i, s, d)

#define emitm_subl_i_m(pc, imm, b, i, s, d) \
  emitm_alul_i_m(pc, 0x81, emit_b101, imm, b, i, s, d)

/* These are used by both signed and unsigned EDIV, but only unsigned MUL */
#define emitm_alu_imp_r(pc, op, reg) { \
  *((pc)++) = 0xf7; \
  *((pc)++) = emit_alu_X_r(op, reg); }

#define emitm_alu_imp_m(pc, op, b, i, s, d) { \
  *((pc)++) = 0xf7; \
  (pc) = emit_r_X(pc, emit_reg(op), b, i, s, d); }

/* Unsigned MUL and EDIV */
/* EAX implicit destination in multiply and divide */

#define emitm_umull_r(pc, reg2) emitm_alu_imp_r((pc), emit_b100, (reg2))

#define emitm_udivl_r(pc, reg2) emitm_alu_imp_r((pc), emit_b110, (reg2))

#define emitm_umull_m(pc, b, i, s, d) \
  emitm_alu_imp_m(pc, emit_b100, b, i, s, d)

#define emitm_udivl_m(pc, b, i, s, d) \
  emitm_alu_imp_m(pc, emit_b110, b, i, s, d)

/* Signed MUL and EDIV */

#define emitm_sdivl_r(pc, reg2) emitm_alu_imp_r((pc), emit_b111, (reg2))

#define emitm_sdivl_m(pc, b, i, s, d) \
  emitm_alu_imp_m((pc), emit_b111, b, i, s, d)

#define jit_emit_cdq(pc) *(pc)++ = 0x99

#define jit_emit_div_rr_i(pc, r1, r2) { \
    if (r1 == r2) { \
        jit_emit_mov_ri_i(pc, r1, 1); \
    } \
    else { \
        if (r1 != emit_EAX) { \
            jit_emit_mov_rr_i(pc, emit_EAX, r1); \
        } \
        jit_emit_mov_rr_i(pc, emit_ECX, emit_EDX); \
        jit_emit_cdq(pc); \
        if (r2 == emit_EDX) { \
            emitm_sdivl_r(pc, emit_ECX); \
        } \
        else { \
            emitm_sdivl_r(pc, r2); \
        } \
        jit_emit_mov_rr_i(pc, emit_EDX, emit_ECX); \
        if (r1 != emit_EAX) { \
            jit_emit_mov_rr_i(pc, r1, emit_EAX); \
        } \
    } \
}

#define jit_emit_cmod_rr_i(pc, r1, r2) { \
    if (r1 == r2) { \
        jit_emit_mov_ri_i(pc, r1, 0); \
    } \
    else { \
        if (r1 != emit_EAX) { \
            jit_emit_mov_rr_i(pc, emit_EAX, r1); \
        } \
        jit_emit_mov_rr_i(pc, emit_ECX, emit_EDX); \
        jit_emit_cdq(pc); \
        if (r2 == emit_EDX) { \
            emitm_sdivl_r(pc, emit_ECX); \
        } \
        else { \
            emitm_sdivl_r(pc, r2); \
        } \
        if (r1 != emit_EDX) { \
            jit_emit_mov_rr_i(pc, r1, emit_EDX); \
            jit_emit_mov_rr_i(pc, emit_EDX, emit_ECX); \
        } \
    } \
}

#define jit_emit_div_ri_i(pc, r1, imm) { \
    if (r1 != emit_EAX) { \
        jit_emit_mov_rr_i(pc, emit_EAX, r1); \
    } \
    jit_emit_mov_rr_i(pc, emit_ECX, emit_EDX); \
    jit_emit_cdq(pc); \
    if (r1 != emit_EBX) { \
        emitm_pushl_r(pc, emit_EBX); \
        jit_emit_mov_ri_i(pc, emit_EBX, imm); \
        emitm_sdivl_r(pc, emit_EBX); \
        emitm_popl_r(pc, emit_EBX); \
    } \
    else { \
        emitm_pushl_r(pc, emit_EDI); \
        jit_emit_mov_ri_i(pc, emit_EDI, imm); \
        emitm_sdivl_r(pc, emit_EDI); \
        emitm_popl_r(pc, emit_EDI); \
    } \
    jit_emit_mov_rr_i(pc, emit_EDX, emit_ECX); \
    if (r1 != emit_EAX) { \
        jit_emit_mov_rr_i(pc, r1, emit_EAX); \
    } \
}

#define jit_emit_cmod_ri_i(pc, r1, imm) { \
    if (r1 != emit_EAX) { \
        jit_emit_mov_rr_i(pc, emit_EAX, r1); \
    } \
    jit_emit_mov_rr_i(pc, emit_ECX, emit_EDX); \
    jit_emit_cdq(pc); \
    if (r1 != emit_EBX) { \
        emitm_pushl_r(pc, emit_EBX); \
        jit_emit_mov_ri_i(pc, emit_EBX, imm); \
        emitm_sdivl_r(pc, emit_EBX); \
        emitm_popl_r(pc, emit_EBX); \
    } \
    else { \
        emitm_pushl_r(pc, emit_EDI); \
        jit_emit_mov_ri_i(pc, emit_EDI, imm); \
        emitm_sdivl_r(pc, emit_EDI); \
        emitm_popl_r(pc, emit_EDI); \
    } \
    if (r1 != emit_EDX) { \
        jit_emit_mov_rr_i(pc, r1, emit_EDX); \
        jit_emit_mov_rr_i(pc, emit_EDX, emit_ECX); \
    } \
}

#define jit_emit_div_rm_i(pc, r1, mem) { \
    if (r1 != emit_EAX) { \
        jit_emit_mov_rr_i(pc, emit_EAX, r1); \
    } \
    jit_emit_mov_rr_i(pc, emit_ECX, emit_EDX); \
    jit_emit_cdq(pc); \
    emitm_sdivl_m(pc, 0,0,0, (long)(mem)); \
    jit_emit_mov_rr_i(pc, emit_EDX, emit_ECX); \
    if (r1 != emit_EAX) { \
        jit_emit_mov_rr_i(pc, r1, emit_EAX); \
    } \
}

#define jit_emit_cmod_rm_i(pc, r1, mem) { \
    if (r1 != emit_EAX) { \
        jit_emit_mov_rr_i(pc, emit_EAX, r1); \
    } \
    jit_emit_mov_rr_i(pc, emit_ECX, emit_EDX); \
    jit_emit_cdq(pc); \
    emitm_sdivl_m(pc, 0,0,0, (long)(mem)); \
    if (r1 != emit_EDX) { \
        jit_emit_mov_rr_i(pc, r1, emit_EDX); \
        jit_emit_mov_rr_i(pc, emit_EDX, emit_ECX); \
    } \
}

#define emitm_smull_op(pc) { *((pc)++) = 0x0f; *((pc)++) = 0xaf; }

#define emitm_smull_r(pc, reg2) emitm_alu_imp_r((pc), emit_b101, (reg2))

#define jit_emit_mul_rr_i(pc, reg1, reg2) { \
  emitm_smull_op(pc); \
  *((pc)++) = emit_alu_r_r(reg1, reg2); }

#define emitm_smull_r_m(pc, reg1, b, i, s, d) { \
  emitm_smull_op(pc); \
  (pc) = emit_r_X((pc), emit_reg(reg1 - 1), b, i, s, (long)d); }

#define jit_emit_mul_rir_i(pc, reg2, imm, reg1) \
  *(pc++) = 0x69; \
  *(pc++) = 0xc0 | (reg1 - 1) | (reg2 - 1) << 3; \
  *(long *)(pc) = (long)imm; \
  pc += 4

#define jit_emit_mul_ri_i(pc, r, imm) jit_emit_mul_rir_i(pc, r, imm, r)

#define jit_emit_mul_rim_ii(pc, dst, imm, add) \
  *(pc++) = 0x69; \
  *(pc++) = 0x05 | (dst - 1) << 3; \
  *(long *)(pc) = (long)add; \
  pc += 4; \
  *(long *)(pc) = imm; \
  pc += 4


/* NEG */

#define jit_emit_neg_r_i(pc, reg) emitm_alu_imp_r(pc, emit_b011, reg)

#define emitm_negl_m(pc, b, i, s, d) emitm_alu_imp_m(pc, emit_b011, b, i, s, d)

/* AND */

#define emit_andl_r_r(pc, reg1, reg2) emitm_alul_r_r(pc, 0x21, reg1, reg2)
#define jit_emit_band_rr_i(pc, r1, r2) emit_andl_r_r(pc, r2, r1)

#define jit_emit_band_ri_i(pc, reg, imm)  \
  emitm_alul_i_r(pc, 0x81, emit_b100, imm, reg)

#define emitm_andl_r_m(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x21, reg, b, i, s, d)

#define emitm_andl_m_r(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x23, reg, b, i, s, d)

#define emitm_andl_i_m(pc, imm, b, i, s, d) \
  emitm_alul_i_m(pc, 0x81, emit_b100, imm, b, i, s, d)

/* TEST for zero */
#define jit_emit_test_r_i(pc, reg1) emitm_alul_r_r(pc, 0x85, reg1, reg1)

/* OR */

#define jit_emit_bor_rr_i(pc, reg1, reg2) emitm_alul_r_r(pc, 0x9, reg2, reg1)

#define jit_emit_bor_ri_i(pc, reg, imm) \
  emitm_alul_i_r(pc, 0x81, emit_b001, imm, reg)

#define emitm_orl_r_m(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x09, reg, b, i, s, d)

#define emitm_orl_m_r(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x0b, reg, b, i, s, d)

#define emitm_orl_i_m(pc, imm, b, i, s, d) \
  emitm_alul_i_m(pc, 0x81, emit_b001, imm, b, i, s, d)

/* XOR */

#define jit_emit_bxor_rr_i(pc, reg1, reg2) emitm_alul_r_r(pc, 0x31, reg2, reg1)

#define jit_emit_bxor_ri_i(pc, reg, imm) \
  emitm_alul_i_r(pc, 0x81, emit_b110, imm, reg)

#define emitm_xorl_r_m(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x31, reg, b, i, s, d)

#define emitm_xorl_m_r(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x33, reg, b, i, s, d)

#define emitm_xorl_i_m(pc, imm, b, i, s, d) \
  emitm_alul_i_m(pc, 0x81, emit_b110, imm, b, i, s, d)

/* NOT */

#define jit_emit_not_r_i(pc, reg) emitm_alu_imp_r(pc, emit_b010, reg)
#define emitm_notl_m(pc, b, i, s, d) emitm_alu_imp_m(pc, emit_b010, b, i, s, d)

/* SHL */

#define jit_emit_shl_ri_i(pc, reg, imm) \
  { pc = emit_shift_i_r(pc, emit_b100, imm, reg); }

#define emitm_shll_i_m(pc, imm, b, i, s, d) \
  { pc = emit_shift_i_m(pc, emit_b100, imm, b, i, s, d); }

#define emitm_shll_r_r(pc, reg1, reg2) \
  { pc = emit_shift_r_r(pc, emit_b100, reg1, reg2); }

#define emitm_shll_r_m(pc, reg, b, i, s, d) \
  { pc = emit_shift_r_m(pc, emit_b100, reg, b, i, s, d); }

/* SHR */

#define jit_emit_shr_ri_i(pc, reg, imm) \
  { pc = emit_shift_i_r(pc, emit_b101, imm, reg); }

#define emitm_shrl_i_m(pc, imm, b, i, s, d) \
  { pc = emit_shift_i_m(pc, emit_b101, imm, b, i, s, d); }

#define emitm_shrl_r_r(pc, reg1, reg2) \
  { pc = emit_shift_r_r(pc, emit_b101, reg1, reg2); }

#define emitm_shrl_r_m(pc, reg, b, i, s, d) \
  { pc = emit_shift_r_m(pc, emit_b101, reg, b, i, s, d); }

/* SAL */

#define emitm_sall_i_r(pc, imm, reg) \
  { pc = emit_shift_i_r(pc, emit_b100, imm, reg); }

#define emitm_sall_i_m(pc, imm, b, i, s, d) \
  { pc = emit_shift_i_m(pc, emit_b100, imm, b, i, s, d); }

#define emitm_sall_r_r(pc, reg1, reg2) \
  { pc = emit_shift_r_r(pc, emit_b100, reg1, reg2); }

#define emitm_sall_r_m(pc, reg, b, i, s, d) \
 { pc = emit_shift_r_m(pc, emit_b100, reg, b, i, s, d); }

/* SAR */

#define jit_emit_lsr_ri_i(pc, reg, imm) \
  { pc = emit_shift_i_r(pc, emit_b111, imm, reg); }

#define emitm_sarl_i_m(pc, imm, b, i, s, d) \
  { pc = emit_shift_i_m(pc, emit_b111, imm, b, i, s, d); }

#define emitm_sarl_r_r(pc, reg1, reg2) \
  { pc = emit_shift_r_r(pc, emit_b111, reg1, reg2); }

#define emitm_sarl_r_m(pc, reg, b, i, s, d) \
  { pc = emit_shift_r_m(pc, emit_b111, reg, b, i, s, d); }

/* interface, shift r1 by r2 bits */

#define jit_emit_shl_rr_i(pc, r1, r2) { \
    jit_emit_mov_rr_i(pc, emit_ECX, r2); \
    emitm_shll_r_r(pc, emit_ECX, r1); \
}

#define jit_emit_shl_rm_i(pc, r1, m) { \
    jit_emit_mov_rm_i(pc, emit_ECX, m); \
    emitm_shll_r_r(pc, emit_ECX, r1); \
}

/* shr seems to be the arithmetic shift */
#define jit_emit_shr_rr_i(pc, r1, r2) { \
    jit_emit_mov_rr_i(pc, emit_ECX, r2); \
    emitm_sarl_r_r(pc, emit_ECX, r1); \
}

#define jit_emit_shr_rm_i(pc, r1, m) { \
    jit_emit_mov_rm_i(pc, emit_ECX, m); \
    emitm_sarl_r_r(pc, emit_ECX, r1); \
}

#define jit_emit_lsr_rr_i(pc, r1, r2) { \
    jit_emit_mov_rr_i(pc, emit_ECX, r2); \
    emitm_shrl_r_r(pc, emit_ECX, r1); \
}

#define jit_emit_lsr_rm_i(pc, r1, m) { \
    jit_emit_mov_rm_i(pc, emit_ECX, m); \
    emitm_shrl_r_r(pc, emit_ECX, r1); \
}
/* MOV (reg),reg */
#define emit_movm_r_r(pc, src, dest) \
  *(pc++) = 0x8b; \
  *(pc++) = src | dest << 3

/* MOV X(reg),reg */
#define emit_movb_i_r_r(pc, imm, src, dest) \
  *(pc++) = 0x8b; \
  *(pc++) = 0x40 | (src - 1) | (dest - 1) << 3; \
  *(pc++) = imm

/* INC / DEC */
#define jit_emit_inc_r_i(pc, reg) *(pc++) = 0x40 | (reg - 1)
#define jit_emit_dec_r_i(pc, reg) *(pc++) = 0x48 | (reg - 1)

/* Floating point ops */

#define emitm_floatop 0xd8  /* 11011000 */
#define jit_emit_dec_fsp(pc) { *((pc)++) = 0xD9; *((pc)++) = 0xF6; }
#define jit_emit_inc_fsp(pc) { *((pc)++) = 0xD9; *((pc)++) = 0xF7; }

#define emitm_fl_2(pc, mf, opa, opb, b, i, s, d) { \
  *((pc)++) = emitm_floatop | (mf << 1) | opa; \
  (pc) = emit_r_X(pc, emit_reg(opb), b, i, s, (long)d); }

#define emitm_fl_3(pc, d_p_opa, opb_r, sti) { \
  *((pc)++) = emitm_floatop | d_p_opa; \
  *((pc)++) = 0xc0 | (opb_r << 3) | sti; }

#define emitm_fl_4(pc, op) { \
  *((pc)++) = emitm_floatop | emit_b001; \
  *((pc)++) = 0xe0 | op; }

/* Integer loads and stores */
#define emitm_fildl(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b01, 1, emit_b000, b, i, s, d)

#define emitm_fistpl(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b01, 1, emit_b011, b, i, s, d)

#define emitm_fistl(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b01, 1, emit_b010, b, i, s, d)

/* long long integer load/store */
#define emitm_fildll(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b11, 1, emit_b101, b, i, s, d)

#define emitm_fistpll(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b11, 1, emit_b111, b, i, s, d)

/* Double loads and stores */
#define emitm_fldl(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b10, 1, emit_b000, b, i, s, d)

#define emitm_fstpl(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b10, 1, emit_b011, b, i, s, d)

#define emitm_fstl(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b10, 1, emit_b010, b, i, s, d)

/* long double load / store */
#define emitm_fldt(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b01, 1, emit_b101, b, i, s, d)

#define emitm_fstpt(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b01, 1, emit_b111, b, i, s, d)

#if NUMVAL_SIZE == 8

#define jit_emit_fload_m_n(pc, address) \
  emitm_fldl(pc, emit_None, emit_None, emit_None, address)

#define jit_emit_fstore_m_n(pc, address) \
  emitm_fstpl(pc, emit_None, emit_None, emit_None, address)

#else

#define jit_emit_fload_m_n(pc, address) \
  emitm_fldt(pc, emit_None, emit_None, emit_None, address)

#define jit_emit_fstore_m_n(pc, address) \
  emitm_fstpt(pc, emit_None, emit_None, emit_None, address)

#endif
#if INTVAL_SIZE == 4
#define jit_emit_fload_m_i(pc, address) \
  emitm_fildl(pc, emit_None, emit_None, emit_None, address)
#define jit_emit_fstore_m_i(pc, m) \
  emitm_fistpl(pc, emit_None, emit_None, emit_None, m)
#else
#define jit_emit_fload_m_i(pc, address) \
  emitm_fildll(pc, emit_None, emit_None, emit_None, address)
#define jit_emit_fstore_m_i(pc, m) \
  emitm_fistpll(pc, emit_None, emit_None, emit_None, m)
#endif
/* 0xD8 ops */
#define emitm_fadd(pc, sti) emitm_fl_3(pc, emit_b000, emit_b000, sti)
#define emitm_fmul(pc, sti) emitm_fl_3(pc, emit_b000, emit_b001, sti)
#define emitm_fsub(pc, sti) emitm_fl_3(pc, emit_b000, emit_b100, sti)
#define emitm_fdiv(pc, sti) emitm_fl_3(pc, emit_b000, emit_b110, sti)

/* 0xD9 ops */
#define emitm_fldz(pc) { *((pc)++) = 0xd9; *((pc)++) = 0xee; }
#define emitm_fld1(pc) { *((pc)++) = 0xd9; *((pc)++) = 0xe8; }

/* FXCH ST,ST(i) , optimize 2 consecutive fxch with same reg */
#define emitm_fxch(pc, sti) { \
        emitm_fl_3(pc, emit_b001, emit_b001, sti); \
}

/* FLD ST,ST(i), optimized FSTP(N+1);FLD(N) => FST(N+1)  */
static unsigned char *lastpc;
#define emitm_fld(pc, sti) do { \
    if ((unsigned char *)(pc) == (lastpc + 2) && \
            (int)(*lastpc) == (int)0xDD && \
            (int)lastpc[1] == (int)(0xD8+sti+1)) \
        lastpc[1] = 0xD0+sti+1; \
    else \
        emitm_fl_3(pc, emit_b001, emit_b000, sti); \
} while(0)

/* 0xDA, 0xDB ops */
/* FCMOV*, FCOMI PPRO */

/* 0xDC like 0xD8 with reversed operands */

/* 0xDD ops */
/* FFree ST(i) */
#define emitm_ffree(pc, sti) emitm_fl_3(pc, emit_b101, emit_b000, sti)

/* FST ST(i) = ST */
#define emitm_fst(pc, sti) emitm_fl_3(pc, emit_b101, emit_b010, sti)

/* FSTP ST(i) = ST, POP */
#define emitm_fstp(pc, sti) { \
    lastpc = (unsigned char*) pc; \
    emitm_fl_3(pc, emit_b101, emit_b011, sti); \
}

/* FUCOM ST(i) <=> ST  unordered compares */
#define emitm_fucom(pc, sti) emitm_fl_3(pc, emit_b101, emit_b100, sti)

/* FUCOMP ST(i) <=> ST, POP */
#define emitm_fucomp(pc, sti) emitm_fl_3(pc, emit_b101, emit_b101, sti)

/* 0xDE ops */
/* Add ST(i) = ST + ST(i); POP  */
#define emitm_faddp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b000, sti)

/* Mul ST(i) = ST * ST(i); POP  */
#define emitm_fmulp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b001, sti)

/* SubR ST(i) = ST(i) / ST; POP  */
#define emitm_fsubrp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b100, sti)

/* Sub ST(i) = ST - ST(i); POP  */
#define emitm_fsubp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b101, sti)

/* DivR ST(i) = ST(i) / ST(0); POP  */
#define emitm_fdivrp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b110, sti)

/* Add ST(i) = ST(0) / ST(i); POP ST(0) */
#define emitm_fdivp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b111, sti)

/* 0xDF OPS: FCOMIP, FUCOMIP PPRO */

/* Negate - called change sign */
#define emitm_fchs(pc) emitm_fl_4(pc, 0)

/* ABS - ST(0) = ABS(ST(0)) */
#define emitm_fabs(pc) emitm_fl_4(pc, 1)

/* Comparisions */

#define emitm_fcom(pc, sti) emitm_fl_3(pc, emit_b000, emit_b010, sti)
#define emitm_fcomi(pc, sti) emitm_fl_3(pc, emit_b011, emit_b110, sti)
#define emitm_fcomip(pc, sti) emitm_fl_3(pc, emit_b111, emit_b110, sti)

#define emitm_fcomp(pc, sti) emitm_fl_3(pc, emit_b000, emit_b011, sti)

#define emitm_fcompp(pc) { *((pc)++) = 0xde; *((pc)++) = 0xd9; }

#define emitm_fcom_m(pc,b,i,s,d) \
  emitm_fl_2(pc, emit_b10, 0, emit_b010, b, i, s, d)

#define emitm_fcomp_m(pc,b,i,s,d) \
  emitm_fl_2(pc, emit_b10, 0, emit_b011, b, i, s, d)

/* ST -= real64 */
#define emitm_fsub_m(pc,b,i,s,d) \
  emitm_fl_2(pc, emit_b10, 0, emit_b100, b, i, s, d)
#define emitm_fadd_m(pc,b,i,s,d) \
  emitm_fl_2(pc, emit_b10, 0, emit_b000, b, i, s, d)

/* ST *= real64 */
#define emitm_fmul_m(pc,b,i,s,d) \
  emitm_fl_2(pc, emit_b10, 0, emit_b001, b, i, s, d)
/* ST /= real64 */
#define emitm_fdiv_m(pc,b,i,s,d) \
  emitm_fl_2(pc, emit_b10, 0, emit_b110, b, i, s, d)

/* Ops Needed to support loading EFLAGs for conditional branches */
#define emitm_fstw(pc) emitm_fl_3(pc, emit_b111, emit_b100, emit_b000)

#define emitm_sahf(pc) *((pc)++) = 0x9e

/* misc float */
#define emitm_ftst(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xE4; }
#define emitm_fprem(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xF8; }
#define emitm_fprem1(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xF5; }

#define jit_emit_neg_r_n(pc, r) { \
    if (r) { \
        emitm_fld(pc, r); \
    } \
    emitm_fchs(pc); \
    if (r) { \
        emitm_fstp(pc, (r+1)); \
    } \
}

#define jit_emit_neg_m_n(pc, mem) { \
    jit_emit_fload_m_n(pc, mem); \
    emitm_fchs(pc); \
    jit_emit_fstore_m_n(pc, mem); \
}

#define jit_emit_abs_r_n(pc, r) { \
    if (r) { \
        emitm_fld(pc, r); \
    } \
    emitm_fabs(pc); \
    if (r) { \
        emitm_fstp(pc, (r+1)); \
    } \
}

#define jit_emit_abs_r_i(pc, r) { \
    jit_emit_test_r_i(pc, r); \
    emitm_jxs(pc, emitm_jns, 3); \
    jit_emit_not_r_i(pc, r); \
    jit_emit_inc_r_i(pc, r); \
}


#define jit_emit_abs_m_n(pc, mem) { \
    jit_emit_fload_m_n(pc, mem); \
    emitm_fabs(pc); \
    jit_emit_fstore_m_n(pc, mem); \
}

/* Integer comparisions */
#define jit_emit_cmp_rr(pc, reg1, reg2) \
  emitm_alul_r_r(pc, 0x39, reg2, reg1)
#define jit_emit_cmp_rr_i(pc, r1, r2) jit_emit_cmp_rr(pc, r1, r2)

#define emitm_cmpl_r_m(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x3b, reg, b, i, s, d)

#define emitm_cmpl_m_r(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x39, reg, b, i, s, d)

#define jit_emit_cmp_ri_i(pc, reg, imm) \
  emitm_alul_i_r(pc, 0x81, emit_b111, imm, reg)

/* Unconditional Jump/Call */

#define emitm_calll(pc, disp) { \
  *((pc)++) = 0xe8; \
  *(long *)(pc) = disp; (pc) += 4; }

#define emitm_callr(pc, reg) { \
  *((pc)++) = 0xff; \
  *((pc)++) = 0xd0 | (reg - 1); }

#define emitm_callm(pc, b, i, s, d) { \
 *((pc)++) = 0xff; \
 (pc) = emit_r_X(pc, emit_reg(emit_b010), b, i, s, d); }

#define emitm_jumps(pc, disp) { \
  *((pc)++) = 0xeb; \
  *((pc)++) = disp; }

#define emitm_jumpl(pc, disp) { \
  *((pc)++) = 0xe9; \
  *(long *)(pc) = disp; (pc) += 4; }

#define emitm_jumpr(pc, reg) { \
  *((pc)++) = 0xff; \
  *((pc)++) = 0xe0 | (reg - 1); }

#define emitm_jumpm(pc, b, i, s, d) { \
  *((pc)++) = 0xff; \
  (pc) = emit_r_X(pc, emit_reg(emit_b100), b, i, s, d); }

/* Conditional jumps */

/* Short jump - 8 bit disp */
#define emitm_jxs(pc, code, disp) { \
  *((pc)++) = 0x70 | (code); \
  *((pc)++) = (char)disp; }

/* Long jump - 32 bit disp */
#define emitm_jxl(pc, code, disp) { \
  *((pc)++) = 0x0f; \
  *((pc)++) = 0x80 | code;  \
  *(long *)(pc) = disp; (pc) += 4; }

#define emitm_jo   0
#define emitm_jno  1
#define emitm_jb   2
#define emitm_jnb  3
#define emitm_jz   4
#define emitm_je emitm_jz
#define emitm_jnz  5
#define emitm_jne emitm_jnz
#define emitm_jbe  6
#define emitm_ja   7
#define emitm_js   8
#define emitm_jns  9
#define emitm_jp  10
#define emitm_jnp 11
#define emitm_jl  12
#define emitm_jnl 13
#define emitm_jle 14
#define emitm_jg  15

/* Shortcuts */
#define jit_emit_mov_mi_i(pc, dest, immediate) \
  emitm_movl_i_m(pc, immediate, emit_None, emit_None, emit_None, dest)

#define jit_emit_mov_rm_i(pc, reg, address) \
  emitm_movl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#define jit_emit_mov_mr_i(pc, address, reg) \
  emitm_movl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#define jit_emit_mul_rm_i(pc, reg, address) \
  emitm_smull_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#define jit_emit_sub_rm_i(pc, reg, address) \
  emitm_subl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#define emit_subl_m_r(pc, reg, address) \
  emitm_subl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#define jit_emit_add_rm_i(pc, reg, address) \
  emitm_addl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#define jit_emit_cmp_rm_i(pc, reg, address) \
  emitm_cmpl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#define jit_emit_cmpr_mr_i(pc, address, reg) \
  emitm_cmpl_m_r(pc, reg, emit_None, emit_None, emit_None, address)


/* high level routines, behave like real 2 register FP */

/* mapped float registers numbers are ST(1)-ST(4).
 * scratch register is ST(0)
 */

/* ST(i) <- numvar */
#define jit_emit_mov_rm_n(pc, r, d) { \
    jit_emit_fload_m_n((pc), d); \
    emitm_fstp((pc), (r+1)); \
}

/* ST(i) <= NUM_CONST */
#define jit_emit_mov_ri_n(pc, r, i) { \
    jit_emit_fload_m_n(pc, i); \
    emitm_fstp((pc), (r+1)); \
}

/* ST(i) <= &INT_CONST */
#define jit_emit_mov_ri_ni(pc, r, i) { \
    jit_emit_fload_m_i(pc, i); \
    emitm_fstp((pc), (r+1)); \
}
/* NUM_REG(i) <= INT_CONST */
#define jit_emit_mov_mi_ni(pc, mem, i) { \
    jit_emit_fload_m_i(pc, i); \
    jit_emit_fstore_m_n(pc, mem); \
}
/* INT_REG <= ST(i) */
#define jit_emit_mov_mr_in(pc, mem, r) { \
    emitm_fld(pc, r); \
    jit_emit_fstore_m_i(pc, mem); \
}

/* numvar <- ST(i) */
#define jit_emit_mov_mr_n(pc, d, r) { \
    emitm_fld((pc), r); \
    jit_emit_fstore_m_n((pc), d); \
}

/* ST(r1) <= ST(r2) */
#define jit_emit_mov_rr_n(pc, r1, r2) { \
    if (r1 != r2) { \
        if (r2) { \
            emitm_fld((pc), r2); \
            emitm_fstp((pc), (r1+1)); \
        } \
        else { \
            emitm_fst((pc),r1); \
        } \
    } \
}

/* ST(r1) xchg ST(r2) */
#define jit_emit_xchg_rr_n(pc, r1, r2) { \
    if (r1 != r2) { \
        emitm_fld((pc), r1); \
        emitm_fld((pc), (r2+1)); \
        emitm_fstp((pc), (r1+2)); \
        emitm_fstp((pc), (r2+1)); \
    } \
}

#define jit_emit_xchg_rm_n(pc, r, mem) { \
    emitm_fld((pc), r); \
    jit_emit_fload_m_n(pc, mem); \
    emitm_fstp((pc), (r+2)); \
    jit_emit_fstore_m_n(pc, mem); \
}

#define jit_emit_xchg_rr_i(pc, r1, r2) { \
    if (r1 != r2) { \
        jit_emit_mov_rr_i(pc, emit_ECX, r1); \
        jit_emit_mov_rr_i(pc, r1, r2); \
        jit_emit_mov_rr_i(pc, r2, emit_ECX); \
    } \
}

#define jit_emit_xchg_rm_i(pc, r, m) { \
    jit_emit_mov_rr_i(pc, emit_ECX, r); \
    jit_emit_mov_rm_i(pc, r, m); \
    jit_emit_mov_mr_i(pc, m, emit_ECX); \
}

#define jit_emit_finit(pc) { *((pc)++) = 0xdb; *((pc)++) = 0xe3; }

/* ST(i) op= MEM */

#define jit_emit_xxx_rm_n(op, pc, r, m) { \
    jit_emit_fload_m_n(pc, m); \
    emitm_f ## op ## p(pc, (r+1)); \
}

#define jit_emit_add_rm_n(pc, r, m) jit_emit_xxx_rm_n(add, pc, r, m)
#define jit_emit_sub_rm_n(pc, r, m) jit_emit_xxx_rm_n(sub, pc, r, m)
#define jit_emit_mul_rm_n(pc, r, m) jit_emit_xxx_rm_n(mul, pc, r, m)
#define jit_emit_div_rm_n(pc, r, m) jit_emit_xxx_rm_n(div, pc, r, m)

#define jit_emit_add_ri_n(pc, r, nc) jit_emit_add_rm_n(pc, r, nc)

/* ST(r1) += ST(r2) */
#define jit_emit_add_rr_n(pc, r1, r2) { \
    emitm_fld(pc, r2); \
    emitm_faddp(pc, (r1+1)); \
}


#define jit_emit_sub_ri_n(pc, r, nc) jit_emit_sub_rm_n(pc, r, nc)

/* ST(r1) -= ST(r2) */
#define jit_emit_sub_rr_n(pc, r1, r2) { \
    emitm_fld(pc, r2); \
    emitm_fsubp(pc, (r1+1)); \
}

#define jit_emit_inc_r_n(pc, r) { \
    emitm_fld(pc, r); \
    emitm_fld1(pc); \
    emitm_faddp(pc, 1); \
    emitm_fstp(pc, (r+1)); \
}

#define jit_emit_dec_r_n(pc, r) { \
    emitm_fld(pc, r); \
    emitm_fld1(pc); \
    emitm_fsubp(pc, 1); \
    emitm_fstp(pc, (r+1)); \
}

#define jit_emit_mul_ri_n(pc, r, nc) jit_emit_mul_rm_n(pc, r, nc)

/* ST(r1) *= ST(r2) */
#define jit_emit_mul_rr_n(pc, r1, r2) { \
    emitm_fld(pc, r2); \
    emitm_fmulp(pc, (r1+1)); \
}

#define jit_emit_div_ri_n(pc, r, nc) jit_emit_div_rm_n(pc, r, nc)

/* ST(r1) /= ST(r2) */
#define jit_emit_div_rr_n(pc, r1, r2) { \
    emitm_fld(pc, r2); \
    emitm_fdivp(pc, (r1+1)); \
}

/* ST(i) %= MEM
 * please note the hardccded jumps */
#define jit_emit_cmod_rm_n(pc, r, mem) { \
    if (r)  \
        emitm_fxch(pc, r); \
    jit_emit_fload_m_n(pc, mem); \
    emitm_fxch(pc, 1); \
    emitm_fprem(pc); \
    emitm_fstw(pc); \
    emitm_sahf(pc); \
    emitm_jxs(pc, emitm_jp, -7); \
    emitm_fstp(pc, (r+1)); \
}

#define jit_emit_cmod_ri_n(pc, r, nc) jit_emit_cmod_rm_n(pc, r, nc)

/* ST(r1) %= ST(r2) */
#define jit_emit_cmod_rr_n(pc, r1, r2) { \
    if (r1)  \
        emitm_fxch(pc, r1); \
    emitm_fld(pc, r2); \
    emitm_fxch(pc, 1); \
    emitm_fprem(pc); \
    emitm_fstw(pc); \
    emitm_sahf(pc); \
    emitm_jxs(pc, emitm_jp, -7); \
    emitm_fstp(pc, (r1+1)); \
}

/* TODO config option, if fcomi* is available */
/* compare ST(r) <-> mem */
#define jit_emit_cmp_rm_n(pc, r, mem) { \
    jit_emit_fload_m_n(pc, mem); \
    emitm_fld(pc, (r+1)); \
    emitm_fcompp(pc); \
    emitm_fstw(pc); \
    emitm_sahf(pc); \
}

#define jit_emit_cmp_ri_n(pc, r, nc) jit_emit_cmp_rm_n(pc, r, nc)

/* compare mem <-> ST(r) */
#define jit_emit_cmpr_mr_n(pc, mem, r) { \
    jit_emit_fload_m_n(pc, mem); \
    emitm_fcomip(pc, (r+1)); \
}

/* compare ST(r1) <-> ST(r2) test FCOMI (=fcom,fstw,sahf) */
#define jit_emit_cmp_rr_n(pc, r1, r2) { \
    if (!r2 || (r1==r2)) { \
        emitm_fld(pc, r1); \
        emitm_fcomip(pc, (r2+1)); \
    } \
    else { \
        if (r1) { \
            emitm_fxch(pc, r1); \
            emitm_fcomi(pc, r2); \
            emitm_fxch(pc, r1); \
        } \
        else { \
            emitm_fcomi(pc, r2); \
        } \
    } \
}

/* test r for zero */
#define jit_emit_test_r_n(pc, r) { \
    if (r) { \
        emitm_fxch(pc, r); \
    } \
    emitm_ftst(pc); \
    emitm_fstw(pc); \
    emitm_sahf(pc); \
    if (r) { \
        emitm_fxch(pc, r); \
    } \
}


#define jit_emit_neg_m_i(pc, address) \
  emitm_negl_m(pc, emit_None, emit_None, emit_None, (long)address)

#define emit_shrl_r_m(pc, reg, d) \
  emitm_shrl_r_m(pc, reg, emit_None, emit_None, emit_None, d)

#define emit_shrl_i_m(pc, imm, d) \
  emitm_shrl_i_m(pc, imm, emit_None, emit_None, emit_None, d)

#define emit_andl_r_m(pc, reg, d) \
  emitm_andl_r_m(pc, reg, emit_None, emit_None, emit_None, d)

#define jit_emit_band_rm_i(pc, reg, d) \
  emitm_andl_m_r(pc, reg, emit_None, emit_None, emit_None, d)

#define emit_andl_i_m(pc, imm, d) \
  emitm_andl_i_m(pc, imm, emit_None, emit_None, emit_None, d)

#define emit_orl_r_m(pc, reg, d) \
  emitm_orl_r_m(pc, reg, emit_None, emit_None, emit_None, d)

#define jit_emit_bor_rm_i(pc, reg, d) \
  emitm_orl_m_r(pc, reg, emit_None, emit_None, emit_None, d)

#define emit_orl_i_m(pc, imm, d) \
  emitm_orl_i_m(pc, imm, emit_None, emit_None, emit_None, d)

#define emit_xorl_r_m(pc, reg, d) \
  emitm_xorl_r_m(pc, reg, emit_None, emit_None, emit_None, d)

#define jit_emit_bxor_rm_i(pc, reg, d) \
  emitm_xorl_m_r(pc, reg, emit_None, emit_None, emit_None, d)

#define emit_xorl_i_m(pc, imm, d) \
  emitm_xorl_i_m(pc, imm, emit_None, emit_None, emit_None, d)

#define emitm_popl_r(pc, reg) \
  pc = emit_popl_r(pc, reg)

enum { JIT_X86BRANCH, JIT_X86JUMP, JIT_X86CALL };

static void
jit_emit_jcc(Parrot_jit_info_t *jit_info, int code, opcode_t disp)
{
    long offset;
    opcode_t opcode;

    opcode = jit_info->op_i + disp;

    if (opcode <= jit_info->op_i) {
        offset = jit_info->arena.op_map[opcode].offset -
                (jit_info->native_ptr - jit_info->arena.start);

        /* If we are here, the current section must have a branch_target
           section, I think. */
        if (jit_info->optimizer->cur_section->branch_target ==
            jit_info->optimizer->cur_section)
                offset +=
                    jit_info->optimizer->cur_section->branch_target->load_size;

        if (emit_is8bit(offset - 2)) {
            emitm_jxs(jit_info->native_ptr, code, offset - 2);
        }
        else {
            emitm_jxl(jit_info->native_ptr, code, offset - 6);
        }

        return;
    }

    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_X86BRANCH;
    jit_info->arena.fixups->param.opcode = opcode;
    /* If the branch is to the current section, skip the load instructions. */
    if (jit_info->optimizer->cur_section->branch_target ==
        jit_info->optimizer->cur_section)
            jit_info->arena.fixups->skip =
                jit_info->optimizer->cur_section->branch_target->load_size;

    emitm_jxl(jit_info->native_ptr, code, 0xc0def00d);
}

static void
emit_jump(Parrot_jit_info_t *jit_info, opcode_t disp)
{
    long offset;
    opcode_t opcode;

    opcode = jit_info->op_i + disp;

    if (opcode <= jit_info->op_i) {
        offset = jit_info->arena.op_map[opcode].offset -
                                (jit_info->native_ptr - jit_info->arena.start);
        if (emit_is8bit(offset - 2)) {
            emitm_jumps(jit_info->native_ptr, offset - 2);
        }
        else {
            emitm_jumpl(jit_info->native_ptr, offset - 5);
        }
        return;
    }

    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_X86JUMP;
    jit_info->arena.fixups->param.opcode = opcode;
    /* If the branch is to the current section, skip the load instructions. */
    if (jit_info->optimizer->cur_section->branch_target ==
        jit_info->optimizer->cur_section)
            jit_info->arena.fixups->skip =
                jit_info->optimizer->cur_section->branch_target->load_size;
    emitm_jumpl(jit_info->native_ptr, 0xc0def00d);
}

void
Parrot_jit_dofixup(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{
    Parrot_jit_fixup_t *fixup, *next;
    char *fixup_ptr;

    fixup = jit_info->arena.fixups;

    while (fixup) {
        switch (fixup->type) {
        /* This fixes-up a branch to a known opcode offset -
           32-bit displacement only */
            case JIT_X86BRANCH:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup) + 2;
                *(long *)(fixup_ptr) =
                    jit_info->arena.op_map[fixup->param.opcode].offset
                        - (fixup->native_offset + 6) + fixup->skip;
                break;
            case JIT_X86JUMP:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup) + 1;
                *(long *)(fixup_ptr) =
                    jit_info->arena.op_map[fixup->param.opcode].offset
                        - (fixup->native_offset + 5) + fixup->skip;
                break;
            case JIT_X86CALL:
                fixup_ptr = jit_info->arena.start + fixup->native_offset + 1;
                *(long *)(fixup_ptr) = (long)fixup->param.fptr -
                    (long)fixup_ptr - 4;
                break;
            default:
                internal_exception(JIT_ERROR, "Unknown fixup type:%d\n",
                    fixup->type);
            break;
        }
        next = fixup->next;
        free(fixup);
        fixup = next;
    }
    jit_info->arena.fixups = NULL;
}

static void
Parrot_emit_jump_to_eax(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{

    /* This calculates (INDEX into op_map * 4) */
    emitm_subl_i_r(jit_info->native_ptr, interpreter->code->byte_code,emit_EAX);

    /* This jumps to the address in op_map[EBP + sizeof(void *) * INDEX] */
    *jit_info->native_ptr++ = 0x3e;     /* DS:0(EBP, EAX, 1) */
    emitm_jumpm(jit_info->native_ptr, emit_EBP, emit_EAX,
                        sizeof(*jit_info->arena.op_map) / 4, 0);
}

#define jit_emit_stack_frame_enter(pc) do { \
    emitm_pushl_r(pc, emit_EBP); \
    jit_emit_mov_rr_i(pc, emit_EBP, emit_ESP); \
} while(0)

#define jit_emit_stack_frame_leave(pc) do { \
    jit_emit_mov_rr_i(pc, emit_ESP, emit_EBP); \
    emitm_popl_r(pc, emit_EBP); \
} while(0)

void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 struct Parrot_Interp * interpreter)
{
    /* the generated code gets called as:
     * (jit_code)(interpreter, pc)
     * jumping to pc is the same code as used in Parrot_jit_cpcf_op()
     */

    /* Maintain the stack frame pointer for the sake of gdb */
    jit_emit_stack_frame_enter(jit_info->native_ptr);
    /* stack:
     * 12   pc
     *  8   interpreter
     *  4   retaddr
     *  0   ebp <----- ebp
     */

    /* Save all callee-saved registers (cdecl)
     */
    emitm_pushl_r(jit_info->native_ptr, emit_EBX);
    emitm_pushl_r(jit_info->native_ptr, emit_ESI);
    emitm_pushl_r(jit_info->native_ptr, emit_EDI);

    /* Cheat on op function calls by writing the interpreter arg on the stack
     * just once. If an op function ever modifies the interpreter argument on
     * the stack this will stop working !!! */
    emitm_pushl_i(jit_info->native_ptr, interpreter);

    /* get the pc from stack:  mov 12(%ebp), %eax */
    emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EBP, emit_None, 1, 12);

    /* Point EBP to the opcode-native code map array - this destroy above
     * stack frame. If we have debugging, we should change this */
    jit_emit_mov_ri_i(jit_info->native_ptr, emit_EBP, jit_info->arena.op_map);

    /* jump to restart pos or first op */
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}

#define jit_emit_end(pc) { \
    jit_emit_add_ri_i(pc, emit_ESP, 4); \
    emitm_popl_r(pc, emit_EDI); \
    emitm_popl_r(pc, emit_EBX); \
    emitm_popl_r(pc, emit_ESI); \
    emitm_popl_r(pc, emit_EBP); \
    emitm_ret(pc); \
}


void
Parrot_jit_emit_mov_mr_n(struct Parrot_Interp * interpreter, char *mem, int reg)
{
    jit_emit_mov_mr_n(
        ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr, mem, reg);
}

void
Parrot_jit_emit_mov_mr(struct Parrot_Interp * interpreter, char *mem, int reg)
{
    jit_emit_mov_mr_i(
        ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr, mem, reg);
}

void
Parrot_jit_emit_mov_rm_n(struct Parrot_Interp * interpreter, int reg, char *mem)
{
    jit_emit_mov_rm_n(
        ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr, reg, mem);
}

void
Parrot_jit_emit_mov_rm(struct Parrot_Interp * interpreter, int reg, char *mem)
{
    jit_emit_mov_rm_i(
        ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr, reg, mem);
}

static void
Parrot_jit_emit_finit(Parrot_jit_info_t *jit_info)
{
    jit_emit_finit(jit_info->native_ptr);
}

#if !defined(INT_REG)
#define INT_REG(x) interpreter->ctx.int_reg.registers[x]
#endif
#if !defined(NUM_REG)
#define NUM_REG(x) interpreter->ctx.num_reg.registers[x]
#endif
#if !defined(STR_REG)
#define STR_REG(x) interpreter->ctx.string_reg.registers[x]
#endif
#if !defined(PMC_REG)
#define PMC_REG(x) interpreter->ctx.pmc_reg.registers[x]
#endif

#ifndef NO_JIT_VTABLE_OPS

#undef Parrot_jit_vtable1_op
#undef Parrot_jit_vtable1r_op
#undef Parrot_jit_vtable2_op
#undef Parrot_jit_vtable2rk_op
#undef Parrot_jit_vtable3_op
#undef Parrot_jit_vtable31_op
#undef Parrot_jit_vtable3k_op
#undef Parrot_jit_vtable_ifp_op
#undef Parrot_jit_vtable_unlessp_op
#undef Parrot_jit_vtable_newp_ic_op

/* emit a call to a vtable func
 * $1->vtable(interp, $1, ...) (ret == 0)
 * $2->vtable(interp, $2, $3, $1)
 * $1 = $2->vtable(interp, $2, ...) (ret == 1)
 */
static void
Parrot_jit_vtable_n_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter, int n, int typ)
{
    int nvtable = op_jit[*jit_info->cur_op].extcall;
    size_t offset;
    op_info_t *op_info = &interpreter->op_info_table[*jit_info->cur_op];
    int p[PARROT_MAX_ARGS];
    int idx, i;
    int st = 0;         /* stack pop correction */
    int bp = 0;         /* need base pointer */
    int ret = 0;        /* function returns value */
    if (typ & 0x80)
        ret = 1;
    typ &= 0x7f;
    /* check, if %ebp is neede, i.e. we have a _kic argrument */
    if (typ == 3)
        bp = 1;
    if (bp) {
        jit_emit_stack_frame_enter(jit_info->native_ptr);
        jit_emit_sub_ri_i(jit_info->native_ptr, emit_ESP, sizeof(INTVAL));
    }

    /* get the offset of the first vtable func */
    offset = offsetof(struct _vtable, init);
    offset += nvtable * sizeof(void *);
    /* get params $i, 0 is opcode */
    for (idx = n; idx > ret; idx--) {
        i = idx;
        if (typ == 1 && i == 3) /* e.g. ->vtable($1, $2, $1) */
            i = 1;
        else if (typ == 2) { /* $2->vtable($2, $3, $1) */
            if (idx == 3)
                i = 1;
            else
                i = idx + 1;
        }
        p[i] = *(jit_info->cur_op + i);
        switch (op_info->types[i]) {
            case PARROT_ARG_I:
            case PARROT_ARG_S:
            case PARROT_ARG_P:
                assert(p[i] >= 0 && p[i] < NUM_REGISTERS);
                /* get $i to EAX */
                switch (op_info->types[i]) {
                    case PARROT_ARG_I:
                        jit_emit_mov_rm_i(jit_info->native_ptr, emit_EAX,
                                &INT_REG(p[i]));
                        break;
                    case PARROT_ARG_S:
                        jit_emit_mov_rm_i(jit_info->native_ptr, emit_EAX,
                                &STR_REG(p[i]));
                        break;
                    case PARROT_ARG_P:
                        jit_emit_mov_rm_i(jit_info->native_ptr, emit_EAX,
                                &PMC_REG(p[i]));
                        break;
                    default:
                        break;
                }
                /* push $i, the left most Pi stays in eax, which is used
                 * below, to call the vtable method
                 */
                emitm_pushl_r(jit_info->native_ptr, emit_EAX);
                break;
            case PARROT_ARG_KI:
                emitm_pushl_i(jit_info->native_ptr, &INT_REG(p[i]));
                break;
            case PARROT_ARG_KIC:
                /* XXX INTVAL_SIZE, make automatic var, push address */
                /* mov key, -4(%ebp) */
                emitm_movl_i_m(jit_info->native_ptr, p[i], emit_EBP, 0, 1, -4);
                /* lea -4(%bp), eax */
                emitm_lea_m_r(jit_info->native_ptr, emit_EAX,
                        emit_EBP, 0, 1, -4);
                emitm_pushl_r(jit_info->native_ptr, emit_EAX);
                break;
            case PARROT_ARG_IC:
            /* XXX INTVAL_SIZE */
                /* push value */
                emitm_pushl_i(jit_info->native_ptr, p[i]);
                break;
            case PARROT_ARG_N:
                /* push num on st(0) */
                jit_emit_fload_m_n(jit_info->native_ptr, &NUM_REG(p[i]));
                goto store;
            case PARROT_ARG_NC:
                jit_emit_fload_m_n(jit_info->native_ptr,
                        &interpreter->code->const_table->
                        constants[p[i]]->number);
store:
#if NUMVAL_SIZE == 8
                /* make room for double */
                emitm_addb_i_r(jit_info->native_ptr, -8, emit_ESP);
                emitm_fstpl(jit_info->native_ptr, emit_ESP, emit_None, 1, 0);
                /* additional stack adjustment */
                st += 4;
#else
                emitm_addb_i_r(jit_info->native_ptr, -12, emit_ESP);
                emitm_fstpt(jit_info->native_ptr, emit_ESP, emit_None, 1, 0);
                st += 8;
#endif
                break;
            case PARROT_ARG_SC:
                emitm_pushl_i(jit_info->native_ptr,
                        interpreter->code->const_table->
                        constants[p[i]]->string);
                break;
            case PARROT_ARG_KC:
                emitm_pushl_i(jit_info->native_ptr,
                        &interpreter->code->const_table->
                        constants[p[i]]->key);
                break;

            default:
                internal_exception(1,
                        "jit_vtable_n_op: unimp type %d, arg %d vtable %d",
                        op_info->types[i], i, nvtable);
                break;
        }
    }
    /* push interpreter */
    emitm_pushl_i(jit_info->native_ptr, interpreter);
    /* mov (eax), eax i.e. $1->vtable */
    emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EAX, emit_None, 1, 0);
    /* call *(offset)eax */
    emitm_callm(jit_info->native_ptr, emit_EAX, emit_None, emit_None, offset);
    if (bp)
        jit_emit_stack_frame_leave(jit_info->native_ptr);
    else
        emitm_addb_i_r(jit_info->native_ptr,
                st+sizeof(void*)*(n+1-ret), emit_ESP);
}

/* emit a call to a vtable func
 * $1->vtable(interp, $1)
 */
static void
Parrot_jit_vtable1_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    Parrot_jit_vtable_n_op(jit_info, interpreter, 1, 0);
}

static void
Parrot_jit_store_retval(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    op_info_t *op_info = &interpreter->op_info_table[*jit_info->cur_op];
    int p1 = *(jit_info->cur_op + 1);

    /* return result is in EAX or ST(0) */
    switch (op_info->types[1]) {
        case PARROT_ARG_I:
            /* XXX INTVAL_SIZE */
            jit_emit_mov_mr_i(jit_info->native_ptr, &INT_REG(p1), emit_EAX);
            break;
        case PARROT_ARG_S:
            jit_emit_mov_mr_i(jit_info->native_ptr, &STR_REG(p1), emit_EAX);
            break;
        case PARROT_ARG_P:
            jit_emit_mov_mr_i(jit_info->native_ptr, &PMC_REG(p1), emit_EAX);
            break;
        case PARROT_ARG_N:
            /* pop num from st(0) and mov to reg */
            jit_emit_fstore_m_n(jit_info->native_ptr, &NUM_REG(p1));
            break;
        default:
            internal_exception(1, "jit_vtable1r: ill LHS");
            break;
    }
}

/* emit a call to a vtable func
 * $1 = $2->vtable(interp, $2)
 */
static void
Parrot_jit_vtable1r_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{

    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, 0x80);
    Parrot_jit_store_retval(jit_info, interpreter);
}

/* emit a call to a vtable func
 * $1 = $2->vtable(interp, $2, &key)
 */
static void
Parrot_jit_vtable2rk_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{

    Parrot_jit_vtable_n_op(jit_info, interpreter, 3, 0x83);
    Parrot_jit_store_retval(jit_info, interpreter);
}

/* emit a call to a vtable func
 * $1->vtable(interp, $1, $2)
 */
static void
Parrot_jit_vtable2_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, 0);
}

/* emit a call to a vtable func
 * $2->vtable(interp, $2, $3, $1)
 */
static void
Parrot_jit_vtable3_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    Parrot_jit_vtable_n_op(jit_info, interpreter, 3, 2);
}

/* emit a call to a vtable func
 * $1->vtable(interp, $1, $2, $1)
 */
static void
Parrot_jit_vtable31_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    Parrot_jit_vtable_n_op(jit_info, interpreter, 3, 1);
}

/* emit a call to a vtable func
 * $1->vtable(interp, $1, &key, $3)
 */
static void
Parrot_jit_vtable3k_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    Parrot_jit_vtable_n_op(jit_info, interpreter, 3, 3);
}

/* if_p_ic, unless_p_ic */
static void
Parrot_jit_vtable_if_unless_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter, int unless)
{
    int ic = *(jit_info->cur_op + 2);   /* branch offset */
    char *jmp_ptr, *sav_ptr;

    /* emit call  vtable function i.e. get_bool, result eax */
    Parrot_jit_vtable1_op(jit_info, interpreter);
    /* test result */
    jit_emit_test_r_i(jit_info->native_ptr, emit_EAX);
    jit_emit_jcc(jit_info, unless ? emitm_jz : emitm_jnz, ic);
}

/* unless_p_ic */
static void
Parrot_jit_vtable_unlessp_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    Parrot_jit_vtable_if_unless_op(jit_info, interpreter, 1);
}

/* if_p_ic */
static void
Parrot_jit_vtable_ifp_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    Parrot_jit_vtable_if_unless_op(jit_info, interpreter, 0);
}

/* new_p_ic */
static void
Parrot_jit_vtable_newp_ic_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int p1, i2;
    op_info_t *op_info = &interpreter->op_info_table[*jit_info->cur_op];
    size_t offset = offsetof(struct _vtable, init);
    int nvtable = op_jit[*jit_info->cur_op].extcall;

    assert(nvtable == 0);       /* vtable->init */
    assert(op_info->types[1] == PARROT_ARG_P);
    p1 = *(jit_info->cur_op + 1);
    assert(p1 >= 0 && p1 < NUM_REGISTERS);
    i2 = *(jit_info->cur_op + 2);
    if (i2 <= 0 || i2 >= enum_class_max)
        internal_exception(1, "Illegal PMC enum (%d) in new\n", i2);
    /* push pmc enum and interpreter */
    emitm_pushl_i(jit_info->native_ptr, i2);
    emitm_pushl_i(jit_info->native_ptr, interpreter);
    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_X86CALL;
    jit_info->arena.fixups->param.fptr = (void (*)(void))pmc_new_noinit;
    emitm_calll(jit_info->native_ptr, 0xdeafc0de);
    /* result = eax = PMC */
    jit_emit_mov_mr_i(jit_info->native_ptr,
            &interpreter->ctx.pmc_reg.registers[p1], emit_EAX);
    emitm_pushl_r(jit_info->native_ptr, emit_EAX);
    /* push interpreter */
    emitm_pushl_i(jit_info->native_ptr, interpreter);
    /* mov (eax), eax i.e. $1->vtable */
    emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EAX, emit_None, 1, 0);
    /* call *(offset)eax */
    emitm_callm(jit_info->native_ptr, emit_EAX, emit_None, emit_None, offset);
    /* adjust 4 args pushed */
    emitm_addb_i_r(jit_info->native_ptr, 16, emit_ESP);
}

#endif

void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    emitm_pushl_i(jit_info->native_ptr, jit_info->cur_op);

    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_X86CALL;
    jit_info->arena.fixups->param.fptr =
        (void (*)(void))interpreter->op_func_table[*(jit_info->cur_op)];

    emitm_calll(jit_info->native_ptr, 0xdeafc0de);
    emitm_addb_i_r(jit_info->native_ptr, 4, emit_ESP);
}

static void Parrot_end_jit(Parrot_jit_info_t *, struct Parrot_Interp * );

void
Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info, interpreter);
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}


#undef Parrot_jit_restart_op
void
Parrot_jit_restart_op(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{
    char *jmp_ptr, *sav_ptr;

    Parrot_jit_normal_op(jit_info, interpreter);
    /* test eax, if zero (e.g after trace), return from JIT */
    jit_emit_test_r_i(jit_info->native_ptr, emit_EAX);
    /* remember PC */
    jmp_ptr = jit_info->native_ptr;
    /* emit jump past exit code, dummy offset
     * this assumes exit code is not longer then a short jump (126 bytes) */
    emitm_jxs(jit_info->native_ptr, emitm_jnz, 0);
    Parrot_end_jit(jit_info, interpreter);
    /* fixup above jump */
    sav_ptr = jit_info->native_ptr;
    jit_info->native_ptr = jmp_ptr;
    emitm_jxs(jit_info->native_ptr, emitm_jnz, (long)(sav_ptr - jmp_ptr) - 2);
    /* restore PC */
    jit_info->native_ptr = sav_ptr;
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}

void * Parrot_jit_build_call_func(struct Parrot_Interp *, String *);

void *
Parrot_jit_build_call_func(struct Parrot_Interp *interpreter,
        String *signature)
{

    Parrot_jit_info_t jit_info;
    char *sig, *pc;
    int next_n = 5;
    int next_i = 5;
    int st = 0;

    /* this ought to be enough - the caller of this function
     * should free the function pointer returned here
     */
    jit_info.native_ptr = jit_info.arena.start =
        mem_sys_allocate_zeroed((size_t)1024);
    pc = jit_info.native_ptr;

    /* make stack frame */
    jit_emit_stack_frame_enter(pc);
    /* get rightmost param, assume ascii chars */
    sig = (char *)signature->strstart + signature->bufused - 1;
    /* as long as there are params */
    while (sig > (char *)signature->strstart) {
        switch (*sig) {
            case 'd':
                /* get a double from next num reg and push it on stack */
                jit_emit_fload_m_n(pc, &NUM_REG(next_n++));
                /* make room for double */
                emitm_addb_i_r(pc, -8, emit_ESP);
                emitm_fstpl(pc, emit_ESP, emit_None, 1, 0);
                st += 4;        /* extra stack for double */
                break;
            case 'i':
                jit_emit_mov_rm_i(pc, emit_EAX, &NUM_REG(next_i++));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'v':
                st -= 4;        /* undo default stack usage */
                break;
            default:
                internal_exception(1,
                        "Parrot_jit_build_call_func: unimp argument\n");
                break;
        }
        /* default stack usage */
        st += 4;
        --sig;
    }
    /* get the pmc from stack - movl 12(%ebp), %eax */
    emitm_movl_m_r(pc, emit_EAX, emit_EBP, 0, 1, 12);
    /* call the thing in struct_val, i.e. offset 12 - call *(12)%eax */
    emitm_callm(pc, emit_EAX, emit_None, emit_None, 12);
    /* adjust stack */
    if (st)
        emitm_addb_i_r(pc, st, emit_ESP);

    /* now place return value in registers */
    next_i = next_n = 5;
    /* first in signature is the return value */
    switch (*sig) {
        case 'd':
            /* pop num from st(0) and mov to reg */
            jit_emit_fstore_m_n(pc, &NUM_REG(next_n++));
            break;
        case 'i':
            jit_emit_mov_mr_i(pc, &INT_REG(next_i++), emit_EAX);
            /* fall through */
        case 'v': /* void - do nothing */
            break;
        default:
            internal_exception(1,
                    "Parrot_jit_build_call_func: unimp return value\n");
            break;
    }
    /* set return values passed on stack */
    jit_emit_mov_mi_i(pc, &INT_REG(0), 0);
    /* set return values in I,S,P,N regs */
    jit_emit_mov_mi_i(pc, &INT_REG(1), next_i-5);
    jit_emit_mov_mi_i(pc, &INT_REG(2), 0);
    jit_emit_mov_mi_i(pc, &INT_REG(3), 0);
    jit_emit_mov_mi_i(pc, &INT_REG(4), next_n-5);

    jit_emit_stack_frame_leave(pc);
    emitm_ret(pc);

    return (jit_f)D2FPTR(jit_info.arena.start);
}

#else /* JIT_EMIT */

#  define REQUIRES_CONSTANT_POOL 0
#  define INT_REGISTERS_TO_MAP 4
#  define FLOAT_REGISTERS_TO_MAP 4

char intval_map[] =
/* we can't use ECX, shift ops need it, push ECX before shift doesn't
 * because, when ECX is mapped you get shrl %cl, %ecx */
    { emit_EBX, emit_EDI, emit_ESI, emit_EDX };

/* of these registers that much (from 0 < n) are callee saved, i.e. are
 * not changed around external calls
 */

#define PRESERVED_INT_REGS 3

/* ST(0) is used as a scratch register,
 * using more then 4 registers breaks C<time N0>
 */
char floatval_map[] = { 1,2,3,4 };

/* my i386/athlon has a drastic speed penalty for what?
 * not for unaligned odd jump targets
 *
 * But:
 * mops.pbc 790 => 300-530  if code gets just 4 bytes bigger
 * (loop is at 200 instead of 196 ???)
 *
 * FAST:
 * 0x818100a <jit_func+194>:	sub    %edi,%ebx
 * 0x818100c <jit_func+196>:	jne    0x818100a <jit_func+194)
 *
 * Same fast speed w/o 2nd register
 * 0x8181102 <jit_func+186>:	sub    0x8164c2c,%ebx
 * 0x8181108 <jit_func+192>:	jne    0x8181102 <jit_func+186>
 *
 * SLOW (same slow with register or odd aligned)
 * 0x818118a <jit_func+194>:	sub    0x8164cac,%ebx
 * 0x8181190 <jit_func+200>:	jne    0x818118a <jit_func+194>
 *
 */

/*
 * if jit_emit_noop is defined, it does align a jump target
 * (it is called, when pc is odd)
 */

/* #define jit_emit_noop(pc) *pc++ = 0x90; */

/* for a reg_count of 1 and the register is used RHS only,
 * we don't allocate a register - it's not worth the effort
 *
 * if the following is true, registers are always used
 */

#define ALLOCATE_REGISTERS_ALWAYS 0

/* registers are either allocate per section or per basic block
 * set this to 1 or 0 to change allocation scheme
 */
#define ALLOCATE_REGISTERS_PER_SECTION 1

#endif /* JIT_EMIT */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
