/*
 * jit_emit.h
 *
 * i386
 *
 * $Id$
 */

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

#define emit_pushl_r(pc, reg) \
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
#define emitm_movl_r_r(pc, reg1, reg2) if (reg1 != reg2) { \
  *(pc++) = 0x89; \
  *(pc++) = emit_alu_r_r(reg1, reg2); }

static char *
emit_movb_i_r(char *pc, char imm, int reg)
{
    *(pc++) = 0xb0 | (reg - 1);
    *(pc++) = imm;
    return pc;
}

#define emitm_movl_i_r(pc, imm, reg) { \
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

#define emitm_addl_r_r(pc, reg1, reg2) \
  emitm_alul_r_r(pc, 0x01, reg1, reg2)

#define emitm_addl_i_r(pc, imm, reg)   \
  emitm_alul_i_r(pc, 0x81, emit_b000, imm, reg)

#define emitm_addl_i_m(pc, imm, b, i, s, d) \
  emitm_alul_i_m(pc, 0x81, emit_b000, imm, b, i, s, d)

#define emitm_addl_r_m(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x01, reg, b, i, s, d)

#define emitm_addl_m_r(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x03, reg, b, i, s, d)

/* SUBs */

#define emitm_subl_r_r(pc, reg1, reg2) \
  emitm_alul_r_r(pc, 0x29, reg1, reg2)

#define emitm_subl_i_r(pc, imm, reg) \
  emitm_alul_i_r(pc, 0x81, emit_b101, imm, reg)

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
  emitm_alu_imp_m((pc), emit_b111, b, i, s, d,)

#define emitm_smull_op(pc) { *((pc)++) = 0x0f; *((pc)++) = 0xaf; }

#define emitm_smull_r(pc, reg2) emitm_alu_imp_r((pc), emit_b101, (reg2))

/* The arguments are swapped here so that the destination is put second */
#define emitm_smull_r_r(pc, reg2, reg1) { \
  emitm_smull_op(pc); \
  *((pc)++) = emit_alu_r_r(reg1, reg2); }

#define emitm_smull_r_m(pc, reg1, b, i, s, d) { \
  emitm_smull_op(pc); \
  (pc) = emit_r_X((pc), emit_reg(reg1 - 1), b, i, s, (long)d); }

#define emit_smull_i_r_r(pc, imm, reg1, reg2) \
  *(pc++) = 0x69; \
  *(pc++) = 0xc0 | (reg1 - 1) | (reg2 - 1) << 3; \
  *(long *)(pc) = (long)imm; \
  pc += 4

#define emit_smull_i_m_r(pc, imm, add, dst) \
  *(pc++) = 0x69; \
  *(pc++) = 0x05 | (dst - 1) << 3; \
  *(long *)(pc) = (long)add; \
  pc += 4; \
  *(long *)(pc) = imm; \
  pc += 4

/* NEG */

#define emit_negl_r(pc, reg) emitm_alu_imp_r(pc, emit_b011, reg)

#define emitm_negl_m(pc, b, i, s, d) emitm_alu_imp_m(pc, emit_b011, b, i, s, d)

/* AND */

#define emit_andl_r_r(pc, reg1, reg2) emitm_alul_r_r(pc, 0x21, reg1, reg2)
#define emit_test_r_r(pc, reg1, reg2) emitm_alul_r_r(pc, 0x85, reg1, reg2)

#define emitm_andl_i_r(pc, imm, reg) \
  emitm_alul_i_r(pc, 0x81, emit_b100, imm, reg)

#define emitm_andl_r_m(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x21, reg, b, i, s, d)

#define emitm_andl_m_r(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x23, reg, b, i, s, d)

#define emitm_andl_i_m(pc, imm, b, i, s, d) \
  emitm_alul_i_m(pc, 0x81, emit_b100, imm, b, i, s, d)

/* OR */

#define emit_orl_r_r(pc, reg1, reg2) emitm_alul_r_r(pc, 0x9, reg1, reg2)

#define emitm_orl_i_r(pc, imm, reg) \
  emitm_alul_i_r(pc, 0x81, emit_b001, imm, reg)

#define emitm_orl_r_m(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x09, reg, b, i, s, d)

#define emitm_orl_m_r(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x0b, reg, b, i, s, d)

#define emitm_orl_i_m(pc, imm, b, i, s, d) \
  emitm_alul_i_m(pc, 0x81, emit_b001, imm, b, i, s, d)

/* XOR */

#define emit_xorl_r_r(pc, reg1, reg2) emitm_alul_r_r(pc, 0x31, reg1, reg2)

#define emitm_xorl_i_r(pc, imm, reg) \
  emitm_alul_i_r(pc, 0x81, emit_b110, imm, reg)

#define emitm_xorl_r_m(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x31, reg, b, i, s, d)

#define emitm_xorl_m_r(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x33, reg, b, i, s, d)

#define emitm_xorl_i_m(pc, imm, b, i, s, d) \
  emitm_alul_i_m(pc, 0x81, emit_b110, imm, b, i, s, d)

/* NOT */

#define emitm_notl_r(pc, reg) emitm_alu_imp_r(pc, emit_b010, reg)
#define emitm_notl_m(pc, b, i, s, d) emitm_alu_imp_m(pc, emit_b010, b, i, s, d)

/* SHL */

#define emitm_shll_i_r(pc, imm, reg) \
  { pc = emit_shift_i_r(pc, emit_b100, imm, reg); }

#define emitm_shll_i_m(pc, imm, b, i, s, d) \
  { pc = emit_shift_i_m(pc, emit_b100, imm, b, i, s, d); }

#define emitm_shll_r_r(pc, reg1, reg2) \
  { pc = emit_shift_r_r(pc, emit_b100, reg1, reg2); }

#define emitm_shll_r_m(pc, reg, b, i, s, d) \
  { pc = emit_shift_r_m(pc, emit_b100, reg, b, i, s, d); }

/* SHR */

#define emitm_shrl_i_r(pc, imm, reg) \
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

#define emitm_sarl_i_r(pc, imm, reg) \
  { pc = emit_shift_i_r(pc, emit_b111, imm, reg); }

#define emitm_sarl_i_m(pc, imm, b, i, s, d) \
  { pc = emit_shift_i_m(pc, emit_b111, imm, b, i, s, d); }

#define emitm_sarl_r_r(pc, reg1, reg2) \
  { pc = emit_shift_r_r(pc, emit_b111, reg1, reg2); }

#define emitm_sarl_r_m(pc, reg, b, i, s, d) \
  { pc = emit_shift_r_m(pc, emit_b111, reg, b, i, s, d); }

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
#define emit_inc_r(pc, reg) *(pc++) = 0x40 | (reg - 1)
#define emit_dec_r(pc, reg) *(pc++) = 0x48 | (reg - 1)

/* Floating point ops */

#define emitm_floatop 0xd8  /* 11011000 */

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

/* Double loads and stores */
#define emitm_fldl(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b10, 1, emit_b000, b, i, s, d)

#define emitm_fstpl(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b10, 1, emit_b011, b, i, s, d)

#define emitm_fstl(pc, b, i, s, d) \
  emitm_fl_2(pc, emit_b10, 1, emit_b010, b, i, s, d)

/* Add ST(1) = ST(0) + ST(i); POP ST(0) */
#define emitm_faddp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b000, sti)

/* Add ST(1) = ST(0) - ST(i); POP ST(0) */
#define emitm_fsubp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b101, sti)

/* Add ST(1) = ST(0) * ST(i); POP ST(0) */
#define emitm_fmulp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b001, sti)

/* Add ST(1) = ST(0) / ST(i); POP ST(0) */
#define emitm_fdivp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b111, sti)

/* Negate - called change sign */
#define emitm_chs(pc) emitm_fl_4(pc, 0)

/* ABS - ST(0) = ABS(ST(0)) */
#define emitm_fabs(pc) emitm_fl_4(pc, 1)

/* Comparisions */

#define emitm_fcom(pc, sti) emitm_fl_3(pc, emit_b000, emit_b010, sti)

#define emitm_fcomp(pc, sti) emitm_fl_3(pc, emit_b000, emit_b011, sti)

#define emitm_fcom_m(pc,b,i,s,d) \
  emitm_fl_2(pc, emit_b10, 0, emit_b010, b, i, s, d)

#define emitm_fcomp_m(pc,b,i,s,d) \
  emitm_fl_2(pc, emit_b10, 0, emit_b011, b, i, s, d)

/* Ops Needed to support loading EFLAGs for conditional branches */
#define emitm_fstw(pc) emitm_fl_3(pc, emit_b111, emit_b100, emit_b000)

#define emitm_sahf(pc) *((pc)++) = 0x9e

/* Integer comparisions */
#define emitm_cmpl_r_r(pc, reg1, reg2) \
  emitm_alul_r_r(pc, 0x39, reg1, reg2)

#define emitm_cmpl_r_m(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x3b, reg, b, i, s, d)

#define emitm_cmpl_m_r(pc, reg, b, i, s, d) \
  emitm_alul_r_m(pc, 0x39, reg, b, i, s, d)

#define emitm_cmpl_i_r(pc, imm, reg) \
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
  *((pc)++) = 0x70 | code; \
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
#define emitm_jl  12
#define emitm_jnl 13
#define emitm_jle 14
#define emitm_jg  15

/* Shortcuts */
#define emit_movl_i_m(pc, immediate, dest) \
  emitm_movl_i_m(pc, immediate, emit_None, emit_None, emit_None, dest)

#define emit_movl_m_r(pc, reg, address) \
  emitm_movl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#define emit_movl_r_m(pc, reg, address) \
  emitm_movl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#define emit_smull_r_m(pc, reg, address) \
  emitm_smull_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#define emit_subl_r_m(pc, reg, address) \
  emitm_subl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#define emit_subl_m_r(pc, reg, address) \
  emitm_subl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#define emit_addl_r_m(pc, reg, address) \
  emitm_addl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#define emit_addl_m_r(pc, reg, address) \
  emitm_addl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#define emit_cmpl_r_m(pc, reg, address) \
  emitm_cmpl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#define emit_cmpl_m_r(pc, reg, address) \
  emitm_cmpl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#define emit_fldl(pc, address) \
  emitm_fldl(pc, emit_None, emit_None, emit_None, address)

#define emit_fildl(pc, address) \
  emitm_fildl(pc, emit_None, emit_None, emit_None, address)

#define emit_fstpl(pc, address) \
  emitm_fstpl(pc, emit_None, emit_None, emit_None, address)

#define emit_negl_m(pc, address) \
  emitm_negl_m(pc, emit_None, emit_None, emit_None, (long)address)

#define emit_shrl_r_m(pc, reg, d) \
  emitm_shrl_r_m(pc, reg, emit_None, emit_None, emit_None, d)

#define emit_shrl_i_m(pc, imm, d) \
  emitm_shrl_i_m(pc, imm, emit_None, emit_None, emit_None, d)

#define emit_andl_r_m(pc, reg, d) \
  emitm_andl_r_m(pc, reg, emit_None, emit_None, emit_None, d)

#define emit_andl_m_r(pc, reg, d) \
  emitm_andl_m_r(pc, reg, emit_None, emit_None, emit_None, d)

#define emit_andl_i_m(pc, imm, d) \
  emitm_andl_i_m(pc, imm, emit_None, emit_None, emit_None, d)

#define emit_orl_r_m(pc, reg, d) \
  emitm_orl_r_m(pc, reg, emit_None, emit_None, emit_None, d)

#define emit_orl_m_r(pc, reg, d) \
  emitm_orl_m_r(pc, reg, emit_None, emit_None, emit_None, d)

#define emit_orl_i_m(pc, imm, d) \
  emitm_orl_i_m(pc, imm, emit_None, emit_None, emit_None, d)

#define emit_xorl_r_m(pc, reg, d) \
  emitm_xorl_r_m(pc, reg, emit_None, emit_None, emit_None, d)

#define emit_xorl_m_r(pc, reg, d) \
  emitm_xorl_m_r(pc, reg, emit_None, emit_None, emit_None, d)

#define emit_xorl_i_m(pc, imm, d) \
  emitm_xorl_i_m(pc, imm, emit_None, emit_None, emit_None, d)

#define emitm_popl_r(pc, reg) \
  pc = emit_popl_r(pc, reg)

enum { JIT_X86BRANCH, JIT_X86JUMP, JIT_X86CALL };

static void
emit_jcc(Parrot_jit_info_t *jit_info, int code, opcode_t disp)
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
void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 struct Parrot_Interp * interpreter)
{
    /* the generated code gets called as:
     * (jit_code)(interpreter, pc)
     * jumping to pc is the same code as used in Parrot_jit_cpcf_op()
     */

    /* Maintain the stack frame pointer for the sake of gdb */
    emit_pushl_r(jit_info->native_ptr, emit_EBP);
    emitm_movl_r_r(jit_info->native_ptr, emit_ESP, emit_EBP);
    /* stack:
     * 12   pc
     *  8   interpreter
     *  4   retaddr
     *  0   ebp <----- ebp
     */

    /* Save all callee-saved registers (cdecl)
     */
    emit_pushl_r(jit_info->native_ptr, emit_EBX);
    emit_pushl_r(jit_info->native_ptr, emit_ESI);
    emit_pushl_r(jit_info->native_ptr, emit_EDI);

    /* Cheat on op function calls by writing the interpreter arg on the stack
     * just once. If an op function ever modifies the interpreter argument on
     * the stack this will stop working !!! */
    emitm_pushl_i(jit_info->native_ptr, interpreter);

    /* get the pc from stack:  mov 12(%ebx), %eax */
    emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EBP, emit_None, 1, 12);

    /* Point EBP to the opcode-native code map array - this destroy above
     * stack frame. If we have debugging, we should change this */
    emitm_movl_i_r(jit_info->native_ptr, jit_info->arena.op_map, emit_EBP);

    /* jump to restart pos or first op */
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}


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
    char *jmp_ptr, *sav_ptr;

    Parrot_jit_normal_op(jit_info, interpreter);
    /* test eax, if zero (e.g after restart), return from JIT */
    emit_test_r_r(jit_info->native_ptr, emit_EAX, emit_EAX);
    /* remember PC */
    jmp_ptr = jit_info->native_ptr;
    /* emit jump past exit code, dummy offset
     * this assumes exit code is in reach of a short jump (126 bytes) */
    emitm_jxs(jit_info->native_ptr, emitm_jnz, 0);
    /* emit exit code XXX: it would be better, to emit the exit code
     * only once and emit a jump to this code here */
    Parrot_end_jit(jit_info, interpreter);
    /* fixup above jump */
    sav_ptr = jit_info->native_ptr;
    jit_info->native_ptr = jmp_ptr;
    emitm_jxs(jit_info->native_ptr, emitm_jnz, (long)(sav_ptr - jmp_ptr) - 2);
    /* restore PC */
    jit_info->native_ptr = sav_ptr;
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}


/* Load registers for the current section */
void
Parrot_jit_load_registers(Parrot_jit_info_t *jit_info,
                          struct Parrot_Interp * interpreter)
{
    Parrot_jit_optimizer_section_t *sect = jit_info->optimizer->cur_section;
    int i;

    for (i = sect->int_registers_used-1; i >= 0; --i)
        if (sect->int_reg_dir[sect->int_reg_usage[i]] & PARROT_ARGDIR_IN)
            emit_movl_m_r(jit_info->native_ptr, jit_info->intval_map[i],
               &interpreter->ctx.int_reg.registers[sect->int_reg_usage[i]]);

    /* The total size of the loads */
    if (!sect->load_size)
        sect->load_size =
            jit_info->native_ptr -
                (jit_info->arena.start +
                    jit_info->arena.op_map[jit_info->op_i].offset);
}

/* Save registers for the current section */
void
Parrot_jit_save_registers(Parrot_jit_info_t *jit_info,
                          struct Parrot_Interp * interpreter)
{
    Parrot_jit_optimizer_section_t *sect = jit_info->optimizer->cur_section;
    int i;

    for (i = sect->int_registers_used-1; i >= 0; --i)
        if (sect->int_reg_dir[sect->int_reg_usage[i]] & PARROT_ARGDIR_OUT)
            emit_movl_r_m(jit_info->native_ptr, jit_info->intval_map[i],
                &interpreter->ctx.int_reg.registers[sect->int_reg_usage[i]]);
}

#else /* JIT_EMIT */

#  define REQUIRES_CONSTANT_POOL 0
#  define INT_REGISTERS_TO_MAP 4
#  define FLOAT_REGISTERS_TO_MAP 0

char intval_map[INT_REGISTERS_TO_MAP] =
/* we can't use ECX, shift ops need it, push ECX before shift doesn't
 * because, when ECX is mapped you get shrl %cl, %ecx */
    { emit_EDI, emit_EBX, emit_ESI, emit_EDX };

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
