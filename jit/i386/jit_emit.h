/*
 * jit_emit.h
 *
 * i386
 *
 * $Id$
 */

#include <assert.h>

#if defined HAVE_COMPUTED_GOTO && defined __GNUC__ && defined USE_CGP
#  define JIT_CGP
#endif

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

/* #define NEG_MINUS_ZERO */
#define NEG_ZERO_SUB

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

#  define ISR1 emit_EAX
#  define FSR1 0

/* Register the address of a rellocation. */
#  if EXEC_CAPABLE
#    define EXEC_RA(addr) \
       if (Parrot_exec_rel_addr) \
         Parrot_exec_rel_addr[Parrot_exec_rel_count++] = addr;
#    define EXEC_RD \
       if (Parrot_exec_rel_addr && Parrot_exec_rel_count) \
         Parrot_exec_rel_count--;
#  endif

#  define emit_b00 0
#  define emit_b01 1
#  define emit_b10 2
#  define emit_b11 3

#  define emit_b000 0
#  define emit_b001 1
#  define emit_b010 2
#  define emit_b011 3
#  define emit_b100 4
#  define emit_b101 5
#  define emit_b110 6
#  define emit_b111 7

/* Mod R/M byte */
#  define emit_reg(x) ((x) << 3)
#  define emit_Mod(Mod) ((Mod) << 6)
#  define emit_reg_rm(x) ((x)-1)

/* Mod values for Mod R/M Byte */
#  define emit_Mod_b00 emit_Mod(emit_b00)
#  define emit_Mod_b01 emit_Mod(emit_b01)
#  define emit_Mod_b10 emit_Mod(emit_b10)

/* special R/M values */
#  define emit_rm_b101 emit_b101
#  define emit_rm_b100 emit_b100

#  define emit_r_m(pc, reg1, b, i, s, d) \
    emit_r_X((pc), emit_reg((reg1)-1), (b), (i), (s), (d))

/* ESIB byte */
#  define emit_Scale(scale) ((scale) << 6)
#  define emit_reg_Index(x) (((x)-1) << 3)
#  define emit_reg_Base(x) ((x)-1)

/* Scale factor values */
#  define emit_Scale_1 emit_Scale(0)
#  define emit_Scale_2 emit_Scale(1)
#  define emit_Scale_4 emit_Scale(2)
#  define emit_Scale_8 emit_Scale(3)

#  define emit_Index_None ((emit_b100) << 3)

#  define emit_alu_X_r(X, reg) ((emit_b11 << 6) | ((X) << 3) | ((reg) - 1))

#  define emit_alu_r_r(reg1,reg2) emit_alu_X_r((reg1 - 1), (reg2))

static int
emit_is8bit(long disp)
{
    return disp >= -128 && disp <= 127;
}

static char *
emit_disp8_32(char *pc, int disp)
{
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    if(emit_is8bit(disp)) {
        *(pc++) = (char)disp;
        return pc;
    }
    else {
        *(long *)pc = disp;
#  if EXEC_CAPABLE
        EXEC_RA(pc);
#  endif
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
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    if (i && !scale) {
        internal_exception(JIT_ERROR,
                            "emit_r_X passed invalid scale+index combo\n");
    }

    if (base == emit_EBP) {
    /* modrm disp */
        if (i == emit_None) {
            *(pc++) = (char) (emit_is8bit(disp) ? emit_Mod_b01 : emit_Mod_b10 )
                | reg_opcode | emit_reg_rm(emit_EBP);
            return emit_disp8_32(pc, disp);
        }
        /* modrm sib disp */
        else {
            *(pc++) = (char) (emit_is8bit(disp) ? emit_Mod_b01 : emit_Mod_b10 )
                | reg_opcode | emit_b100;
            emit_sib(pc++, scale, i, base);
            return emit_disp8_32(pc, disp);
        }
    }

    /* modrm sib disp */
    if (base == emit_ESP) {
        *(pc++) = (char) (emit_is8bit(disp) ? emit_Mod_b01 : emit_Mod_b10 )
                | reg_opcode | emit_rm_b100;
        emit_sib(pc++, scale, i, emit_ESP);
        return emit_disp8_32(pc, disp);
    }

    /* modrm disp32 */
    if (!base && !(i && scale) && (!emit_is8bit(disp) || 1)) {
        *(pc++) = (char) emit_Mod_b00 | reg_opcode | emit_rm_b101;
        *(long *)pc = disp;
#  if EXEC_CAPABLE
        EXEC_RA(pc);
#  endif
        return pc + 4;
    }

    /* Ok, everything should be more regular here */
    *(pc++) = (char) (disp == 0 ? emit_Mod_b00 :
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
        *(pc++) = (char) 0xd1;
        *(pc++) = (char) emit_alu_X_r(opcode,  reg);
    }
    else if(imm > 1 && imm < 33)
    {
        *(pc++) = (char) 0xc1;
        *(pc++) = (char) emit_alu_X_r(opcode,  reg);
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
        *(pc++) = (char) 0xd1;
        pc = emit_r_X(pc, opcode,  base, i, scale, disp);
    }
    else if (imm > 1 && imm < 33) {
        *(pc++) = (char) 0xc1;
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

    *(pc++) = (char) 0xd3;
    *(pc++) = (char) emit_alu_X_r(opcode,  reg2);

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

    *(pc++) = (char) 0xd3;
    pc = emit_r_X(pc, opcode,  base, i, scale, disp);

    return pc;
}


/* CDQ - need this to do multiply */
#  define emitm_cdq(pc) *((pc)++) = (char) 0x99

/* RET */
#  define emitm_ret(pc) *((pc)++) = (char) 0xc3

/* NOP */
#  define emit_nop(pc) *((pc)++) = (char) 0x90

/* PUSHes */

#  define emitm_pushl_r(pc, reg) \
    *(pc++) = (char) 0x50 | (reg - 1)

#  define emitm_pushl_i(pc, imm) { \
    *(pc++) = (char) 0x68; \
    *(long *)pc = (long)imm; \
    (pc) += 4; }

#  if EXEC_CAPABLE
#    define emitm_pushl_m(pc, mem) { \
       *(pc++) = (char) 0xff; \
       *(pc++) = (char) 0x35; \
       *(long *)pc = (long)mem; \
       EXEC_RA(pc); \
       (pc) += 4; }
#  else /* EXEC_CAPABLE */
#    define emitm_pushl_m(pc, mem) { \
       *(pc++) = (char) 0xff; \
       *(pc++) = (char) 0x35; \
       *(long *)pc = (long)mem; \
       (pc) += 4; }
#  endif /* EXEC_CAPABLE */


static char *
emit_pushl_m(char *pc, int base, int i, int scale, long disp)
{
    *(pc++) = (char) 0xff;
    return emit_r_X(pc, emit_reg(emit_b110), base, i, scale, disp);
}

/* POPs */

static char *
emit_popl_r(char *pc, int reg)
{
#if 0
    /* valgrind doesn't like this and the version below is smaller anyway */
    *(pc++) = (char) 0x8f;
    *(pc++) = (char) emit_alu_X_r(emit_b000, reg);
#else
    *(pc++) = (char) 0x58 | (reg - 1);
#endif
    return pc;
}

#  define emitm_popl_r(pc, reg) \
    pc = emit_popl_r(pc, reg)

static char *
emit_popl_m(char *pc, int base, int i, int scale, long disp)
{
    *(pc++) = (char) 0x8f;
    return emit_r_X(pc, emit_reg(emit_b000), base, i, scale, disp);
}

/* MOVes */

static char *
emit_movb_r_r(char *pc, int reg1, int reg2)
{
    *(pc++) = (char) 0x88;
    *(pc++) = (char) emit_alu_r_r(reg1, reg2);
    return pc;
}
#  define jit_emit_mov_rr_i(pc, reg2, reg1) if (reg1 != reg2) { \
    *(pc++) = (char) 0x89; \
    *(pc++) = (char) emit_alu_r_r(reg1, reg2); }

static char *
emit_movb_i_r(char *pc, char imm, int reg)
{
    *(pc++) = (char) 0xb0 | (reg - 1);
    *(pc++) = imm;
    return pc;
}

#  define jit_emit_mov_ri_i(pc, reg, imm) { \
    *(pc++) = (char) 0xb8 | (reg - 1); \
    *(long *)pc = (long)imm; (pc) += 4; }

#  define emitm_movX_Y_Z(op, pc, reg1, b, i, s, d) { \
    *(pc++) = (char) op; \
    (pc) = emit_r_m(pc, reg1, b, i, s, (long)d); }

#  define emitm_movb_r_m(pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z(0x88, pc, reg1, b, i, s, d)

#  define emitm_movl_r_m(pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z(0x89, pc, reg1, b, i, s, d)

/* move byte/word with sign extension */
#  define emitm_movsbl_r_m(pc, reg1, b, i, s, d) { \
    *(pc++) = (char) 0x0f; \
    emitm_movX_Y_Z(0xBE, pc, reg1, b, i, s, d); \
}

#  define emitm_movswl_r_m(pc, reg1, b, i, s, d) { \
    *(pc++) = (char) 0x0f; \
    emitm_movX_Y_Z(0xBF, pc, reg1, b, i, s, d); \
}

#  define emitm_movsbl_r_r(pc, reg1, reg2) { \
    *(pc++) = (char) 0x0f; \
    *(pc++) = (char) 0xbe; \
    *(pc++) = (char) emit_alu_r_r(reg1, reg2); \
}

#  define emitm_movswl_r_r(pc, reg1, reg2) { \
    *(pc++) = (char) 0x0f; \
    *(pc++) = (char) 0xbf; \
    *(pc++) = (char) emit_alu_r_r(reg1, reg2); \
}

#  define emitm_movb_m_r(pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z(0x8a, pc, reg1, b, i, s, d)

#  define emitm_movl_m_r(pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z(0x8b, pc, reg1, b, i, s, d)

#  define emitm_lea_m_r(pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z(0x8d, pc, reg1, b, i, s, d)

static char *
emit_movb_i_m(char *pc, char imm, int base, int i, int scale, long disp)
{
    *(pc++) = (char) 0xc6;
    pc = emit_r_X(pc, emit_reg(emit_b000), base, i, scale, disp);
    *(pc++) = imm;
    return pc;
}

#  define emitm_movl_i_m(pc, imm, b, i, s, d) { \
    *(pc++) = (char) 0xc7; \
    (pc) = emit_r_X(pc, emit_reg(emit_b000), b, i, s, (long)d); \
    *(long *)(pc) = (long)imm; (pc) += 4; }

/* Various ALU formats */

#  define emitm_alul_r_r(pc, op, reg1, reg2) { \
    *(pc++) = (char) op; *(pc++) = (char) emit_alu_r_r(reg1, reg2); }

#  define emitm_alub_i_r(pc, op1, op2, imm, reg) { \
    *(pc++) = (char) op1; *(pc++) = (char) emit_alu_X_r(op2, reg); *(pc++) = (char)(imm); }

#  define emitm_alul_i_r(pc, op1, op2, imm, reg) { \
    *(pc++) = (char) op1; \
    *(pc++) = (char) emit_alu_X_r(op2, reg); \
    *(long *)((pc)) = (long)(imm); (pc) += 4; }

#  define emitm_alul_i_m(pc, op1, op2, imm, b, i, s, d) { \
    *(pc++) = (char) op1; \
    (pc) = emit_r_X(pc, emit_reg(op2), b, i, s, d); \
    *(long *)(pc) = (long)imm; (pc) += 4; }

#  define emitm_alul_r_m(pc, op, reg, b, i, s, d) { \
    *(pc++) = (char) op; \
    pc = emit_r_X(pc, emit_reg(reg-1), b, i, s, (long)d); }


/* ADDs */

#  define emitm_addb_r_r(pc, reg1, reg2) \
    emitm_alul_r_r(pc, 0x00, reg1, reg2)

#  define emitm_addb_i_r(pc, imm, reg) \
    emitm_alub_i_r(pc, 0x83, emit_b000, imm, reg)

#  define jit_emit_add_rr_i(pc, reg1, reg2) \
    emitm_alul_r_r(pc, 0x01, reg2, reg1)

#  define jit_emit_add_ri_i(pc, reg, imm)   \
    emitm_alul_i_r(pc, 0x81, emit_b000, imm, reg)

#  define emitm_addl_i_m(pc, imm, b, i, s, d) \
    emitm_alul_i_m(pc, 0x81, emit_b000, imm, b, i, s, d)

#  define emitm_addl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x01, reg, b, i, s, d)

#  define emitm_addl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x03, reg, b, i, s, d)

/* SUBs */

#  define jit_emit_sub_rr_i(pc, reg1, reg2) \
    emitm_alul_r_r(pc, 0x29, reg2, reg1)

#  define emitm_subl_i_r(pc, imm, reg) \
    emitm_alul_i_r(pc, 0x81, emit_b101, imm, reg)
#  define jit_emit_sub_ri_i(pc, r, i) emitm_subl_i_r(pc, i, r)

#  define emitm_subl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x29, reg, b, i, s, d)

#  define emitm_subl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x2b, reg, b, i, s, d)

#  define emitm_subl_i_m(pc, imm, b, i, s, d) \
    emitm_alul_i_m(pc, 0x81, emit_b101, imm, b, i, s, d)

/* These are used by both signed and unsigned EDIV, but only unsigned MUL */
#  define emitm_alu_imp_r(pc, op, reg) { \
    *((pc)++) = (char) 0xf7; \
    *((pc)++) = (char) emit_alu_X_r(op, reg); }

#  define emitm_alu_imp_m(pc, op, b, i, s, d) { \
    *((pc)++) = (char) 0xf7; \
    (pc) = emit_r_X(pc, emit_reg(op), b, i, s, d); }

/* Unsigned MUL and EDIV */
/* EAX implicit destination in multiply and divide */

#  define emitm_umull_r(pc, reg2) emitm_alu_imp_r((pc), emit_b100, (reg2))

#  define emitm_udivl_r(pc, reg2) emitm_alu_imp_r((pc), emit_b110, (reg2))

#  define emitm_umull_m(pc, b, i, s, d) \
    emitm_alu_imp_m(pc, emit_b100, b, i, s, d)

#  define emitm_udivl_m(pc, b, i, s, d) \
    emitm_alu_imp_m(pc, emit_b110, b, i, s, d)

/* Signed MUL and EDIV */

#  define emitm_sdivl_r(pc, reg2) emitm_alu_imp_r((pc), emit_b111, (reg2))

#  define emitm_sdivl_m(pc, b, i, s, d) \
    emitm_alu_imp_m((pc), emit_b111, b, i, s, d)

#  define jit_emit_cdq(pc) *(pc)++ = 0x99

/* dest /= src
 * edx:eax /= src, quotient => eax, rem => edx
 */
static char *
opt_div_rr(Parrot_jit_info_t *jit_info, int dest, int src, int is_div)
{
    char *pc = jit_info->native_ptr;
    int saved = 0;
    if (dest != emit_EAX) {
        jit_emit_mov_rr_i(pc, emit_EAX, dest);
    }
    if (dest == emit_EDX) {
        /* all ok, we can globber it */
    }
    else {
        /* if ECX is mapped, push EDX on stack */
        if (jit_info->optimizer->cur_section->ru[0].registers_used == 5) {
            emitm_pushl_r(pc, emit_EDX);
            saved = 2;
        }
        /* if EDX is mapped, save it in ECX */
        else if (jit_info->optimizer->cur_section->ru[0].registers_used == 4) {
            saved = 1;
            jit_emit_mov_rr_i(pc, emit_ECX, emit_EDX);
        }
    }
#  if 0
    jit_emit_cdq(pc);
#  else
    /* this sequence allows 2 other instructions to run parallel */
    jit_emit_mov_rr_i(pc, emit_EDX, emit_EAX);
    pc = emit_shift_i_r(pc, emit_b111, 31, emit_EDX); /* SAR 31 */
#  endif
    if (src == emit_EDX) {
        assert(saved == 1);
        emitm_sdivl_r(pc, emit_ECX);
    }
    else {
        emitm_sdivl_r(pc, src);
    }
    if (is_div) {
        /* result = quotient in EAX */
        if (saved == 1) {
            jit_emit_mov_rr_i(pc, emit_EDX, emit_ECX);
        }
        if (dest != emit_EAX) {
            jit_emit_mov_rr_i(pc, dest, emit_EAX);
        }
        if (saved == 2) {
            emitm_popl_r(pc, emit_EDX);
        }
    }
    else {
        /* result = remainder in EDX */
        if (dest != emit_EDX) {
            jit_emit_mov_rr_i(pc, dest, emit_EDX);
            if (saved == 1) {
                jit_emit_mov_rr_i(pc, emit_EDX, emit_ECX);
            }
            else if (saved == 2)
                emitm_popl_r(pc, emit_EDX);
        }
    }
    return pc;
}

#  define jit_emit_div_rr_i(pc, r1, r2) pc = opt_div_rr(jit_info, r1, r2, 1)
#  define jit_emit_cmod_rr_i(pc, r1, r2) pc = opt_div_rr(jit_info, r1, r2, 0)


static char *
opt_div_ri(Parrot_jit_info_t *jit_info, int dest, INTVAL imm, int is_div)
{
    char *pc = jit_info->native_ptr;

    UINTVAL ld2 = ld((UINTVAL) imm);
    if (is_div && imm > 1 && !(imm & (imm - 1))) {
        /* positive power of 2 - do a shift */
        pc = emit_shift_i_r(pc, emit_b101, ld2, dest);
    }
    else {
        if (dest != emit_EBX) {
            emitm_pushl_r(pc, emit_EBX);
            jit_emit_mov_ri_i(pc, emit_EBX, imm);
            jit_info->native_ptr = pc;
            pc = opt_div_rr(jit_info, dest, emit_EBX, is_div);
            pc = emit_popl_r(pc, emit_EBX);
        }
        else {
            emitm_pushl_r(pc, emit_EDI);
            jit_emit_mov_ri_i(pc, emit_EDI, imm);
            jit_info->native_ptr = pc;
            pc = opt_div_rr(jit_info, dest, emit_EDI, is_div);
            pc = emit_popl_r(pc, emit_EDI);
        }
    }
    return pc;
}

#  define jit_emit_div_ri_i(pc, r1, imm) pc = opt_div_ri(jit_info, r1, imm, 1)
#  define jit_emit_cmod_ri_i(pc, r1, imm) pc = opt_div_ri(jit_info, r1, imm, 0)

static char *
opt_div_rm(Parrot_jit_info_t *jit_info, int dest, void * mem, int is_div)
{
    char *pc = jit_info->native_ptr;
    int saved = 0;
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    if (dest != emit_EAX) {
        jit_emit_mov_rr_i(pc, emit_EAX, dest);
    }
    if (dest == emit_EDX) {
        /* all ok, we can globber it */
    }
    else {
        /* if ECX is mapped, push EDX on stack */
        if (jit_info->optimizer->cur_section->ru[0].registers_used == 5) {
            emitm_pushl_r(pc, emit_EDX);
            saved = 2;
        }
        /* if EDX is mapped, save it in ECX */
        else if (jit_info->optimizer->cur_section->ru[0].registers_used == 4) {
            saved = 1;
            jit_emit_mov_rr_i(pc, emit_ECX, emit_EDX);
        }
    }
#  if 0
    jit_emit_cdq(pc);
#  else
    /* this sequence allows 2 other instructions to run parallel */
    jit_emit_mov_rr_i(pc, emit_EDX, emit_EAX);
    pc = emit_shift_i_r(pc, emit_b111, 31, emit_EDX); /* SAR 31 */
#  endif
    emitm_sdivl_m(pc, 0,0,0, (long)(mem));

    if (is_div) {
        /* result = quotient in EAX */
        if (saved == 1) {
            jit_emit_mov_rr_i(pc, emit_EDX, emit_ECX);
        }
        if (dest != emit_EAX) {
            jit_emit_mov_rr_i(pc, dest, emit_EAX);
        }
        if (saved == 2) {
            emitm_popl_r(pc, emit_EDX);
        }
    }
    else {
        /* result = remainder in EDX */
        if (dest != emit_EDX) {
            jit_emit_mov_rr_i(pc, dest, emit_EDX);
            if (saved == 1) {
                jit_emit_mov_rr_i(pc, emit_EDX, emit_ECX);
            }
            else if (saved == 2)
                emitm_popl_r(pc, emit_EDX);
        }
    }
    return pc;
}
#  define jit_emit_div_rm_i(pc, r, m)  pc = opt_div_rm(jit_info, r, m, 1)
#  define jit_emit_cmod_rm_i(pc, r, m) pc = opt_div_rm(jit_info, r, m, 0)

#  define emitm_smull_op(pc) { *((pc)++) = (char) 0x0f; *((pc)++) = (char) 0xaf; }

#  define emitm_smull_r(pc, reg2) emitm_alu_imp_r((pc), emit_b101, (reg2))

#  define jit_emit_mul_rr_i(pc, reg1, reg2) { \
    emitm_smull_op(pc); \
    *((pc)++) = (char) emit_alu_r_r(reg1, reg2); }

#  define emitm_smull_r_m(pc, reg1, b, i, s, d) { \
    emitm_smull_op(pc); \
    (pc) = emit_r_X((pc), emit_reg(reg1 - 1), b, i, s, (long)d); }

#  ifdef NO_MUL_OPT
#    if EXEC_CAPABLE
#      define jit_emit_mul_rir_i(pc, reg2, imm, reg1) \
         *(pc++) = (char) 0x69; \
         *(pc++) = (char) 0xc0 | (reg1 - 1) | (reg2 - 1) << 3; \
         EXEC_RA(pc); \
         *(long *)(pc) = (long)imm; \
         pc += 4
#    else /* EXEC_CAPABLE */
#      define jit_emit_mul_rir_i(pc, reg2, imm, reg1) \
         *(pc++) = (char) 0x69; \
         *(pc++) = (char) 0xc0 | (reg1 - 1) | (reg2 - 1) << 3; \
         *(long *)(pc) = (long)imm; \
         pc += 4
#    endif /* EXEC_CAPABLE */
#  else
static char *
opt_mul(char *pc, int dest, INTVAL imm, int src)
{
    UINTVAL ld2 = ld((UINTVAL) imm);
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    if (imm == 0) {
        jit_emit_mov_ri_i(pc, dest, 0);
    }
    else if (imm > 0 && !(imm & (imm - 1))) {
        /* positive power of 2 - do a shift */
        jit_emit_mov_rr_i(pc, dest, src);
        pc = emit_shift_i_r(pc, emit_b100, ld2, dest);
    }
    else {
        /* special small numbers */
        switch (imm) {
            case 3:
                /* LEA dest, base, index, scale, displace
                 * note: src may be dest, so can't be reused
                 *
                 * dest = src + src*2 */
                emitm_lea_m_r(pc, dest, src, src, 2, 0);
                break;
            case 5:      /* dest = src + src*4 */
                emitm_lea_m_r(pc, dest, src, src, 4, 0);
                break;
            case 6:     /* dest = src*3; dest += dest */
                emitm_lea_m_r(pc, dest, src, src, 2, 0);
                jit_emit_add_rr_i(pc, dest, dest);
                break;
            case 9:      /* dest = src + src*8 */
                emitm_lea_m_r(pc, dest, src, src, 8, 0);
                break;
            case 10:      /* dest = src + src*4 ; dest+= dest */
                emitm_lea_m_r(pc, dest, src, src, 4, 0);
                jit_emit_add_rr_i(pc, dest, dest);
                break;
            case 12:     /* dest= src*3; dest <<= 2 */
                emitm_lea_m_r(pc, dest, src, src, 2, 0);
                pc = emit_shift_i_r(pc, emit_b100, 2, dest);
                break;
            case 100:      /* dest = src + src*4 ; dest <<= 2; dest = 5*dest*/
                emitm_lea_m_r(pc, dest, src, src, 4, 0);
                pc = emit_shift_i_r(pc, emit_b100, 2, dest);
                emitm_lea_m_r(pc, dest, dest, dest, 4, 0);
                break;
            default:
                *(pc++) = (char) 0x69;
                *(pc++) = (char) 0xc0 | (src - 1) | (dest - 1) << 3;
                *(long *)(pc) = (long)imm;
                pc += 4;
        }
    }
    return pc;
}
#    define jit_emit_mul_rir_i(pc, dest, imm, src) \
       pc = opt_mul(pc, dest, imm, src)

#  endif

#  define jit_emit_mul_ri_i(pc, r, imm) jit_emit_mul_rir_i(pc, r, imm, r)

#  define jit_emit_mul_rim_ii(pc, dst, imm, add) \
    *(pc++) = (char) 0x69; \
    *(pc++) = (char) 0x05 | (dst - 1) << 3; \
    *(long *)(pc) = (long)add; \
    pc += 4; \
    *(long *)(pc) = imm; \
    pc += 4


/* NEG */

#  define jit_emit_neg_r_i(pc, reg) emitm_alu_imp_r(pc, emit_b011, reg)

#  define emitm_negl_m(pc, b, i, s, d) \
    emitm_alu_imp_m(pc, emit_b011, b, i, s, d)

/* AND */

#  define emit_andl_r_r(pc, reg1, reg2) emitm_alul_r_r(pc, 0x21, reg1, reg2)
#  define jit_emit_band_rr_i(pc, r1, r2) emit_andl_r_r(pc, r2, r1)

#  define jit_emit_band_ri_i(pc, reg, imm)  \
    emitm_alul_i_r(pc, 0x81, emit_b100, imm, reg)

#  define emitm_andl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x21, reg, b, i, s, d)

#  define emitm_andl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x23, reg, b, i, s, d)

#  define emitm_andl_i_m(pc, imm, b, i, s, d) \
    emitm_alul_i_m(pc, 0x81, emit_b100, imm, b, i, s, d)

/* TEST for zero */
#  define jit_emit_test_r_i(pc, reg1) emitm_alul_r_r(pc, 0x85, reg1, reg1)

/* TEST op */
#  define jit_emit_test_rr_i(pc, r1, r2) emitm_alul_r_r(pc, 0x85, r1, r2)
#  define jit_emit_test_ri_i(pc, r, im)  \
           emitm_alul_i_r(pc, 0xF7, emit_b000, im, r)
#  define jit_emit_test_rm_i(pc, r, m)  \
           emitm_alul_r_m(pc, 0x85, r, 0, 0, 0, (long)m)

/* OR */

#  define jit_emit_bor_rr_i(pc, reg1, reg2) emitm_alul_r_r(pc, 0x9, reg2, reg1)

#  define jit_emit_bor_ri_i(pc, reg, imm) \
    emitm_alul_i_r(pc, 0x81, emit_b001, imm, reg)

#  define emitm_orl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x09, reg, b, i, s, d)

#  define emitm_orl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x0b, reg, b, i, s, d)

#  define emitm_orl_i_m(pc, imm, b, i, s, d) \
    emitm_alul_i_m(pc, 0x81, emit_b001, imm, b, i, s, d)

/* XOR */

#  define jit_emit_bxor_rr_i(pc, reg1, reg2) \
    emitm_alul_r_r(pc, 0x31, reg2, reg1)

#  define jit_emit_bxor_ri_i(pc, reg, imm) \
    emitm_alul_i_r(pc, 0x81, emit_b110, imm, reg)

#  define emitm_xorl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x31, reg, b, i, s, d)

#  define emitm_xorl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x33, reg, b, i, s, d)

#  define emitm_xorl_i_m(pc, imm, b, i, s, d) \
    emitm_alul_i_m(pc, 0x81, emit_b110, imm, b, i, s, d)

/* NOT */

#  define jit_emit_not_r_i(pc, reg) emitm_alu_imp_r(pc, emit_b010, reg)
#  define emitm_notl_m(pc, b, i, s, d) \
    emitm_alu_imp_m(pc, emit_b010, b, i, s, d)

/* XCHG */
#  define jit_emit_xchg_rr_i(pc, r1, r2) { \
    if (r1 != r2) { \
    *(pc++) = (char) 0x87; \
    *(pc++) = (char) emit_alu_r_r(r1, r2); \
    } \
}

#  define jit_emit_xchg_rm_i(pc, r, m) { \
    emitm_alul_r_m((pc), 0x87, (r), emit_None, emit_None, emit_None, (m)) \
}
/* SHL */

#  define jit_emit_shl_ri_i(pc, reg, imm) \
    { pc = emit_shift_i_r(pc, emit_b100, imm, reg); }

#  define emitm_shll_i_m(pc, imm, b, i, s, d) \
    { pc = emit_shift_i_m(pc, emit_b100, imm, b, i, s, d); }

#  define emitm_shll_r_r(pc, reg1, reg2) \
    { pc = emit_shift_r_r(pc, emit_b100, reg1, reg2); }

#  define emitm_shll_r_m(pc, reg, b, i, s, d) \
    { pc = emit_shift_r_m(pc, emit_b100, reg, b, i, s, d); }

/* SHR */

#  define jit_emit_shr_ri_i(pc, reg, imm) \
    { pc = emit_shift_i_r(pc, emit_b101, imm, reg); }

#  define emitm_shrl_i_m(pc, imm, b, i, s, d) \
    { pc = emit_shift_i_m(pc, emit_b101, imm, b, i, s, d); }

#  define emitm_shrl_r_r(pc, reg1, reg2) \
    { pc = emit_shift_r_r(pc, emit_b101, reg1, reg2); }

#  define emitm_shrl_r_m(pc, reg, b, i, s, d) \
    { pc = emit_shift_r_m(pc, emit_b101, reg, b, i, s, d); }

/* SAL */

#  define emitm_sall_i_r(pc, imm, reg) \
    { pc = emit_shift_i_r(pc, emit_b100, imm, reg); }

#  define emitm_sall_i_m(pc, imm, b, i, s, d) \
    { pc = emit_shift_i_m(pc, emit_b100, imm, b, i, s, d); }

#  define emitm_sall_r_r(pc, reg1, reg2) \
    { pc = emit_shift_r_r(pc, emit_b100, reg1, reg2); }

#  define emitm_sall_r_m(pc, reg, b, i, s, d) \
    { pc = emit_shift_r_m(pc, emit_b100, reg, b, i, s, d); }

/* SAR */

#  define jit_emit_lsr_ri_i(pc, reg, imm) \
    { pc = emit_shift_i_r(pc, emit_b111, imm, reg); }

#  define emitm_sarl_i_m(pc, imm, b, i, s, d) \
    { pc = emit_shift_i_m(pc, emit_b111, imm, b, i, s, d); }

#  define emitm_sarl_r_r(pc, reg1, reg2) \
    { pc = emit_shift_r_r(pc, emit_b111, reg1, reg2); }

#  define emitm_sarl_r_m(pc, reg, b, i, s, d) \
    { pc = emit_shift_r_m(pc, emit_b111, reg, b, i, s, d); }

static char *
opt_shift_rr(Parrot_jit_info_t *jit_info, int dest, int count, int op)
{
    char *pc = jit_info->native_ptr;
    if (count == emit_ECX) {
        pc = emit_shift_r_r(pc, op, count, dest);
    }
    else {
        int saved = 0;
        assert(count != emit_EAX);
        if (dest == emit_EAX) {
            if (jit_info->optimizer->cur_section->ru[0].registers_used == 5) {
                emitm_pushl_r(pc, emit_ECX);
                saved = 1;
            }
            jit_emit_mov_rr_i(pc, emit_ECX, count);
            pc = emit_shift_r_r(pc, op, emit_ECX, dest);
            if (saved) {
                emitm_popl_r(pc, emit_ECX);
            }

        }
        else if (dest == emit_ECX) {
            jit_emit_xchg_rr_i(pc, dest, count);
            pc = emit_shift_r_r(pc, op, dest, count);
            jit_emit_xchg_rr_i(pc, dest, count);
        }
        else {
            jit_emit_mov_rr_i(pc, emit_EAX, emit_ECX);
            jit_emit_mov_rr_i(pc, emit_ECX, count);
            pc = emit_shift_r_r(pc, op, emit_ECX, dest);
            jit_emit_mov_rr_i(pc, emit_ECX, emit_EAX);
        }
    }
    return pc;
}
static char *
opt_shift_rm(Parrot_jit_info_t *jit_info, int dest, void * count, int op)
{
    char *pc = jit_info->native_ptr;
    int saved = 0;
    /* if ECX is mapped, save it */
    if (jit_info->optimizer->cur_section->ru[0].registers_used == 5) {
        emitm_pushl_r(pc, emit_ECX);
        saved = 1;
    }
    /* jit_emit_mov_rm_i(pc, emit_ECX, count); */
    emitm_movl_m_r(pc, emit_ECX, emit_None, emit_None, emit_None, count)
    pc = emit_shift_r_r(pc, op, emit_ECX, dest);
    if (saved) {
        emitm_popl_r(pc, emit_ECX);
    }
    return pc;
}

/* interface, shift r1 by r2 bits */

#  define jit_emit_shl_rr_i(pc, r1, r2) \
    pc = opt_shift_rr(jit_info, r1, r2, emit_b100)

#  define jit_emit_shl_rm_i(pc, r1, m)  \
    pc = opt_shift_rm(jit_info, r1, m, emit_b100)

/* shr seems to be the arithmetic shift */
#  define jit_emit_shr_rr_i(pc, r1, r2)  \
    pc = opt_shift_rr(jit_info, r1, r2, emit_b111)

#  define jit_emit_shr_rm_i(pc, r1, m)  \
    pc = opt_shift_rm(jit_info, r1, m, emit_b111)

#  define jit_emit_lsr_rr_i(pc, r1, r2)  \
    pc = opt_shift_rr(jit_info, r1, r2, emit_b101)

#  define jit_emit_lsr_rm_i(pc, r1, m)  \
    pc = opt_shift_rm(jit_info, r1, m, emit_b101)

/* MOV (reg),reg */
#  define emit_movm_r_r(pc, src, dest) \
    *(pc++) = (char) 0x8b; \
    *(pc++) = (char) src | dest << 3

/* MOV X(reg),reg */
#  define emit_movb_i_r_r(pc, imm, src, dest) \
    *(pc++) = (char) 0x8b; \
    *(pc++) = (char) 0x40 | (src - 1) | (dest - 1) << 3; \
    *(pc++) = imm

/* INC / DEC */
#  define jit_emit_inc_r_i(pc, reg) *(pc++) = (char) 0x40 | (reg - 1)
#  define jit_emit_dec_r_i(pc, reg) *(pc++) = (char) 0x48 | (reg - 1)

/* Floating point ops */

#  define emitm_floatop 0xd8  /* 11011000 */
#  define jit_emit_dec_fsp(pc) { *((pc)++) = (char) 0xD9; *((pc)++) = (char) 0xF6; }
#  define jit_emit_inc_fsp(pc) { *((pc)++) = (char) 0xD9; *((pc)++) = (char) 0xF7; }

#  define emitm_fl_2(pc, mf, opa, opb, b, i, s, d) { \
    *((pc)++) = (char) emitm_floatop | (mf << 1) | opa; \
    (pc) = emit_r_X(pc, emit_reg(opb), b, i, s, (long)d); }

#  define emitm_fl_3(pc, d_p_opa, opb_r, sti) { \
    *((pc)++) = (char) emitm_floatop | d_p_opa; \
    *((pc)++) = (char) 0xc0 | (opb_r << 3) | sti; }

#  define emitm_fl_4(pc, op) { \
    *((pc)++) = (char) emitm_floatop | emit_b001; \
    *((pc)++) = (char) 0xe0 | op; }

/* Integer loads and stores */
#  define emitm_fildl(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b01, 1, emit_b000, b, i, s, d)

#  define emitm_fistpl(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b01, 1, emit_b011, b, i, s, d)

#  define emitm_fistl(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b01, 1, emit_b010, b, i, s, d)

/* long long integer load/store */
#  define emitm_fildll(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b11, 1, emit_b101, b, i, s, d)

#  define emitm_fistpll(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b11, 1, emit_b111, b, i, s, d)

/* Double loads and stores */
#  define emitm_fldl(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b10, 1, emit_b000, b, i, s, d)

#  define emitm_fstpl(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b10, 1, emit_b011, b, i, s, d)

#  define emitm_fstl(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b10, 1, emit_b010, b, i, s, d)

/* long double load / store */
#  define emitm_fldt(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b01, 1, emit_b101, b, i, s, d)

#  define emitm_fstpt(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b01, 1, emit_b111, b, i, s, d)

/* short float load / store */
#  define emitm_flds(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b00, 1, emit_b000, b, i, s, d)

#  define emitm_fstps(pc, b, i, s, d) \
    emitm_fl_2(pc, emit_b00, 1, emit_b010, b, i, s, d)

#  if NUMVAL_SIZE == 8

#    define jit_emit_fload_m_n(pc, address) \
      emitm_fldl(pc, emit_None, emit_None, emit_None, address)

#    define jit_emit_fstore_m_n(pc, address) \
      emitm_fstpl(pc, emit_None, emit_None, emit_None, address)

#  else /* NUMVAL_SIZE */

#    define jit_emit_fload_m_n(pc, address) \
      emitm_fldt(pc, emit_None, emit_None, emit_None, address)

#    define jit_emit_fstore_m_n(pc, address) \
      emitm_fstpt(pc, emit_None, emit_None, emit_None, address)

#  endif /* NUMVAL_SIZE */

#  if INTVAL_SIZE == 4

#    define jit_emit_fload_m_i(pc, address) \
      emitm_fildl(pc, emit_None, emit_None, emit_None, address)
#    define jit_emit_fstore_m_i(pc, m) \
      emitm_fistpl(pc, emit_None, emit_None, emit_None, m)

#  else /* INTVAL_SIZE */

#    define jit_emit_fload_m_i(pc, address) \
      emitm_fildll(pc, emit_None, emit_None, emit_None, address)
#    define jit_emit_fstore_m_i(pc, m) \
      emitm_fistpll(pc, emit_None, emit_None, emit_None, m)

#  endif /* INTVAL_SIZE */

/* 0xD8 ops */
#  define emitm_fadd(pc, sti) emitm_fl_3(pc, emit_b000, emit_b000, sti)
#  define emitm_fmul(pc, sti) emitm_fl_3(pc, emit_b000, emit_b001, sti)
#  define emitm_fsub(pc, sti) emitm_fl_3(pc, emit_b000, emit_b100, sti)
#  define emitm_fdiv(pc, sti) emitm_fl_3(pc, emit_b000, emit_b110, sti)

/* 0xD9 ops */
#  define emitm_fldz(pc) { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xee; }
#  define emitm_fld1(pc) { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xe8; }

/* FXCH ST,ST(i) , optimize 2 consecutive fxch with same reg */
#  define emitm_fxch(pc, sti) { \
    emitm_fl_3(pc, emit_b001, emit_b001, sti); \
}

/* FLD ST,ST(i), optimized FSTP(N+1);FLD(N) => FST(N+1)  */
static unsigned char *lastpc;
#  define emitm_fld(pc, sti) do { \
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
#  define emitm_ffree(pc, sti) emitm_fl_3(pc, emit_b101, emit_b000, sti)

/* FST ST(i) = ST */
#  define emitm_fst(pc, sti) emitm_fl_3(pc, emit_b101, emit_b010, sti)

/* FSTP ST(i) = ST, POP */
#  define emitm_fstp(pc, sti) { \
    lastpc = (unsigned char*) pc; \
    emitm_fl_3(pc, emit_b101, emit_b011, sti); \
}

/* FUCOM ST(i) <=> ST  unordered compares */
#  define emitm_fucom(pc, sti) emitm_fl_3(pc, emit_b101, emit_b100, sti)

/* FUCOMP ST(i) <=> ST, POP */
#  define emitm_fucomp(pc, sti) emitm_fl_3(pc, emit_b101, emit_b101, sti)

/* 0xDE ops */
/* Add ST(i) = ST + ST(i); POP  */
#  define emitm_faddp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b000, sti)

/* Mul ST(i) = ST * ST(i); POP  */
#  define emitm_fmulp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b001, sti)

/* SubR ST(i) = ST - ST(i); POP  */
#  define emitm_fsubrp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b100, sti)

/* Sub ST(i) = ST(i) - ST; POP  */
#  define emitm_fsubp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b101, sti)

/* DivR ST(i) = ST(i) / ST(0); POP  */
#  define emitm_fdivrp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b110, sti)

/* Add ST(i) = ST(0) / ST(i); POP ST(0) */
#  define emitm_fdivp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b111, sti)

/* 0xDF OPS: FCOMIP, FUCOMIP PPRO */

/* Negate - called change sign */
#  define emitm_fchs(pc) emitm_fl_4(pc, 0)

/* ABS - ST(0) = ABS(ST(0)) */
#  define emitm_fabs(pc) emitm_fl_4(pc, 1)

/* Comparisions */

#  define emitm_fcom(pc, sti) emitm_fl_3(pc, emit_b000, emit_b010, sti)

#  define emitm_fcomp(pc, sti) emitm_fl_3(pc, emit_b000, emit_b011, sti)

#  ifdef PARROT_HAS_JIT_FCOMIP
#    define emitm_fcomip(pc, sti) emitm_fl_3(pc, emit_b111, emit_b110, sti)
#    define emitm_fcomi(pc, sti) emitm_fl_3(pc, emit_b011, emit_b110, sti)
#  else
#    define emitm_fcomip(pc, sti) do { \
      emitm_fcomp(pc, sti); \
      emitm_fstw(pc); \
      emitm_sahf(pc); \
    } while (0)
#    define emitm_fcomi(pc, sti) do { \
      emitm_fcom(pc, sti); \
      emitm_fstw(pc); \
      emitm_sahf(pc); \
    } while (0)
#  endif

#  define emitm_fcompp(pc) { *((pc)++) = (char) 0xde; *((pc)++) = (char) 0xd9; }

#  define emitm_fcom_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b10, 0, emit_b010, b, i, s, d)

#  define emitm_fcomp_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b10, 0, emit_b011, b, i, s, d)

/* ST -= real64 */
#  define emitm_fsub_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b10, 0, emit_b100, b, i, s, d)
#  define emitm_fadd_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b10, 0, emit_b000, b, i, s, d)

/* ST *= real64 */
#  define emitm_fmul_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b10, 0, emit_b001, b, i, s, d)
/* ST /= real64 */
#  define emitm_fdiv_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b10, 0, emit_b110, b, i, s, d)

/* Ops Needed to support loading EFLAGs for conditional branches */
#  define emitm_fstw(pc) emitm_fl_3(pc, emit_b111, emit_b100, emit_b000)

#  define emitm_sahf(pc) *((pc)++) = (char) 0x9e

/* misc float */
#  define emitm_ftst(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xE4; }
#  define emitm_fprem(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xF8; }
#  define emitm_fprem1(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xF5; }

#  if defined(NEG_MINUS_ZERO)
#    define jit_emit_neg_r_n(pc, r) { \
       if (r) { \
         emitm_fld(pc, r); \
       } \
       emitm_fchs(pc); \
       if (r) { \
         emitm_fstp(pc, (r+1)); \
       } \
     }

#    define jit_emit_neg_m_n(pc, mem) { \
       jit_emit_fload_m_n(pc, mem); \
       emitm_fchs(pc); \
       jit_emit_fstore_m_n(pc, mem); \
     }

#  elif defined(NEG_ZERO_SUB)

#    define jit_emit_neg_r_n(pc, r) { \
       emitm_fldz(pc); \
       emitm_fsubrp(pc, (r+1)); \
     }

#    define jit_emit_neg_m_n(pc, mem) { \
       jit_emit_fload_m_n(pc, mem); \
       emitm_fldz(pc); \
       emitm_fsubrp(pc, 1); \
       jit_emit_fstore_m_n(pc, mem); \
     }
#  else

#    define jit_emit_neg_r_n(pc, r) { \
       if (r) { \
         emitm_fld(pc, r); \
       } \
       emitm_ftst(pc); \
       emitm_fstw(pc); \
       emitm_sahf(pc); \
       emitm_jxs(pc, emitm_jz, 2); \
       emitm_fchs(pc); \
       if (r) { \
         emitm_fstp(pc, (r+1)); \
       } \
     }

#    define jit_emit_neg_m_n(pc, mem) { \
       jit_emit_fload_m_n(pc, mem); \
       emitm_ftst(pc); \
       emitm_fstw(pc); \
       emitm_sahf(pc); \
       emitm_jxs(pc, emitm_jz, 2); \
       emitm_fchs(pc); \
       jit_emit_fstore_m_n(pc, mem); \
     }
#  endif


#  define jit_emit_abs_r_n(pc, r) { \
     if (r) { \
       emitm_fld(pc, r); \
     } \
     emitm_fabs(pc); \
     if (r) { \
       emitm_fstp(pc, (r+1)); \
     } \
   }

#  define jit_emit_abs_r_i(pc, r) { \
     jit_emit_test_r_i(pc, r); \
     emitm_jxs(pc, emitm_jns, 3); \
     jit_emit_not_r_i(pc, r); \
     jit_emit_inc_r_i(pc, r); \
   }


#  define jit_emit_abs_m_n(pc, mem) { \
     jit_emit_fload_m_n(pc, mem); \
     emitm_fabs(pc); \
     jit_emit_fstore_m_n(pc, mem); \
   }

/* Integer comparisions */
#  define jit_emit_cmp_rr(pc, reg1, reg2) \
    emitm_alul_r_r(pc, 0x39, reg2, reg1)
#  define jit_emit_cmp_rr_i(pc, r1, r2) jit_emit_cmp_rr(pc, r1, r2)

#  define emitm_cmpl_r_m(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x3b, reg, b, i, s, d)

#  define emitm_cmpl_m_r(pc, reg, b, i, s, d) \
    emitm_alul_r_m(pc, 0x39, reg, b, i, s, d)

#  define jit_emit_cmp_ri_i(pc, reg, imm) \
    emitm_alul_i_r(pc, 0x81, emit_b111, imm, reg)

/* Unconditional Jump/Call */

#  define emitm_calll(pc, disp) { \
    *((pc)++) = (char) 0xe8; \
    *(long *)(pc) = disp; (pc) += 4; }

#  define emitm_callr(pc, reg) { \
    *((pc)++) = (char) 0xff; \
    *((pc)++) = (char) 0xd0 | (reg - 1); }

#  if EXEC_CAPABLE
#    define emitm_callm(pc, b, i, s, d) { \
       *((pc)++) = (char) 0xff; \
       (pc) = emit_r_X(pc, emit_reg(emit_b010), b, i, s, d);\
       EXEC_RD }
#  else /* EXEC_CAPABLE */
#    define emitm_callm(pc, b, i, s, d) { \
       *((pc)++) = (char) 0xff; \
       (pc) = emit_r_X(pc, emit_reg(emit_b010), b, i, s, d); }
#  endif /* EXEC_CAPABLE */

#  define emitm_jumps(pc, disp) { \
    *((pc)++) = (char) 0xeb; \
    *((pc)++) = disp; }

#  define emitm_jumpl(pc, disp) { \
    *((pc)++) = (char) 0xe9; \
    *(long *)(pc) = disp; (pc) += 4; }

#  define emitm_jumpr(pc, reg) { \
    *((pc)++) = (char) 0xff; \
    *((pc)++) = (char) 0xe0 | (reg - 1); }

#  if EXEC_CAPABLE
#    define emitm_jumpm(pc, b, i, s, d) { \
       *((pc)++) = (char) 0xff; \
       (pc) = emit_r_X(pc, emit_reg(emit_b100), b, i, s, d); \
       EXEC_RD }
#  else /* EXEC_CAPABLE */
#    define emitm_jumpm(pc, b, i, s, d) { \
       *((pc)++) = (char) 0xff; \
       (pc) = emit_r_X(pc, emit_reg(emit_b100), b, i, s, d); }
#  endif /* EXEC_CAPABLE */

/* Conditional jumps */

/* Short jump - 8 bit disp */
#  define emitm_jxs(pc, code, disp) { \
    *((pc)++) = (char) 0x70 | (code); \
    *((pc)++) = (char)disp; }

/* Long jump - 32 bit disp */
#  define emitm_jxl(pc, code, disp) { \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) 0x80 | code;  \
    *(long *)(pc) = disp; (pc) += 4; }

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

/* Shortcuts */
#  define jit_emit_mov_mi_i(pc, dest, immediate) \
    emitm_movl_i_m(pc, immediate, emit_None, emit_None, emit_None, dest)

#  define jit_emit_mov_rm_i(pc, reg, address) \
    emitm_movl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#  define jit_emit_mov_mr_i(pc, address, reg) \
    emitm_movl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#  define jit_emit_mul_rm_i(pc, reg, address) \
    emitm_smull_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#  define jit_emit_sub_rm_i(pc, reg, address) \
    emitm_subl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#  define jit_emit_sub_mr_i(pc, address, reg) \
    emitm_subl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#  define jit_emit_sub_mi_i(pc, address, imm) \
    emitm_subl_i_m(pc, imm, emit_None, emit_None, emit_None, address)

#  define jit_emit_add_rm_i(pc, reg, address) \
    emitm_addl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#  define jit_emit_add_mr_i(pc, address, reg) \
    emitm_addl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#  define jit_emit_add_mi_i(pc, address, imm) \
    emitm_addl_i_m(pc, imm, emit_None, emit_None, emit_None, address)

#  define jit_emit_cmp_rm_i(pc, reg, address) \
    emitm_cmpl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#  define jit_emit_cmp_mr_i(pc, address, reg) \
    emitm_cmpl_m_r(pc, reg, emit_None, emit_None, emit_None, address)


/* high level routines, behave like real 2 register FP */

/* mapped float registers numbers are ST(1)-ST(4).
 * scratch register is ST(0)
 */

/* ST(i) <- numvar */
#  define jit_emit_mov_rm_n(pc, r, d) { \
    jit_emit_fload_m_n((pc), d); \
    emitm_fstp((pc), (r+1)); \
}

/* ST(i) <= NUM_CONST */
#  define jit_emit_mov_ri_n(pc, r, i) { \
    jit_emit_fload_m_n(pc, i); \
    emitm_fstp((pc), (r+1)); \
}

/* ST(i) <= &INT_CONST */
#  define jit_emit_mov_ri_ni(pc, r, i) { \
    jit_emit_fload_m_i(pc, i); \
    emitm_fstp((pc), (r+1)); \
}
/* NUM_REG(i) <= INT_CONST */
#  define jit_emit_mov_mi_ni(pc, mem, i) { \
    jit_emit_fload_m_i(pc, i); \
    jit_emit_fstore_m_n(pc, mem); \
}
/* INT_REG <= ST(i) */
#  define jit_emit_mov_mr_in(pc, mem, r) { \
    emitm_fld(pc, r); \
    jit_emit_fstore_m_i(pc, mem); \
}

/* numvar <- ST(i) */
#  define jit_emit_mov_mr_n(pc, d, r) { \
    emitm_fld((pc), r); \
    jit_emit_fstore_m_n((pc), d); \
}

/* ST(r1) <= ST(r2) */
#  define jit_emit_mov_rr_n(pc, r1, r2) { \
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
#  define jit_emit_xchg_rr_n(pc, r1, r2) { \
    if (r1 != r2) { \
      emitm_fld((pc), r1); \
      emitm_fld((pc), (r2+1)); \
      emitm_fstp((pc), (r1+2)); \
      emitm_fstp((pc), (r2+1)); \
    } \
}

#  define jit_emit_xchg_rm_n(pc, r, mem) { \
    emitm_fld((pc), r); \
    jit_emit_fload_m_n(pc, mem); \
    emitm_fstp((pc), (r+2)); \
    jit_emit_fstore_m_n(pc, mem); \
}


#  define jit_emit_xchg_mr_i(pc, m, r) jit_emit_xchg_rm_i((pc), (r), (m))

#  define jit_emit_finit(pc) { *((pc)++) = (char) 0xdb; *((pc)++) = (char) 0xe3; }

/* ST(i) op= MEM */

#  define jit_emit_xxx_rm_n(op, pc, r, m) { \
    jit_emit_fload_m_n(pc, m); \
    emitm_f ## op ## p(pc, (r+1)); \
}

#  define jit_emit_add_rm_n(pc, r, m) jit_emit_xxx_rm_n(add, pc, r, m)
#  define jit_emit_sub_rm_n(pc, r, m) jit_emit_xxx_rm_n(sub, pc, r, m)
#  define jit_emit_mul_rm_n(pc, r, m) jit_emit_xxx_rm_n(mul, pc, r, m)
#  define jit_emit_div_rm_n(pc, r, m) jit_emit_xxx_rm_n(div, pc, r, m)

#  define jit_emit_add_ri_n(pc, r, nc) jit_emit_add_rm_n(pc, r, nc)

/* ST(r1) += ST(r2) */
#  define jit_emit_add_rr_n(pc, r1, r2) { \
    emitm_fld(pc, r2); \
    emitm_faddp(pc, (r1+1)); \
}


#  define jit_emit_sub_ri_n(pc, r, nc) jit_emit_sub_rm_n(pc, r, nc)

/* ST(r1) -= ST(r2) */
#  define jit_emit_sub_rr_n(pc, r1, r2) { \
    emitm_fld(pc, r2); \
    emitm_fsubp(pc, (r1+1)); \
}

#  define jit_emit_inc_r_n(pc, r) { \
    emitm_fld(pc, r); \
    emitm_fld1(pc); \
    emitm_faddp(pc, 1); \
    emitm_fstp(pc, (r+1)); \
}

#  define jit_emit_dec_r_n(pc, r) { \
    emitm_fld(pc, r); \
    emitm_fld1(pc); \
    emitm_fsubp(pc, 1); \
    emitm_fstp(pc, (r+1)); \
}

#  define jit_emit_mul_ri_n(pc, r, nc) jit_emit_mul_rm_n(pc, r, nc)

/* ST(r1) *= ST(r2) */
#  define jit_emit_mul_rr_n(pc, r1, r2) { \
    emitm_fld(pc, r2); \
    emitm_fmulp(pc, (r1+1)); \
}

#  define jit_emit_div_ri_n(pc, r, nc) jit_emit_div_rm_n(pc, r, nc)

/* ST(r1) /= ST(r2) */
#  define jit_emit_div_rr_n(pc, r1, r2) { \
    emitm_fld(pc, r2); \
    emitm_fdivp(pc, (r1+1)); \
}

/* ST(i) %= MEM
 * please note the hardccded jumps */
#  define jit_emit_cmod_rm_n(pc, r, mem) { \
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

#  define jit_emit_cmod_ri_n(pc, r, nc) jit_emit_cmod_rm_n(pc, r, nc)

/* ST(r1) %= ST(r2) */
#  define jit_emit_cmod_rr_n(pc, r1, r2) { \
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

/* compare ST(r) <-> mem */
#  define jit_emit_cmp_rm_n(pc, r, mem) { \
    jit_emit_fload_m_n(pc, mem); \
    emitm_fld(pc, (r+1)); \
    emitm_fcompp(pc); \
    emitm_fstw(pc); \
    emitm_sahf(pc); \
}

#  define jit_emit_cmp_ri_n(pc, r, nc) jit_emit_cmp_rm_n(pc, r, nc)

/* compare mem <-> ST(r) */
#  define jit_emit_cmp_mr_n(pc, mem, r) { \
    jit_emit_fload_m_n(pc, mem); \
    emitm_fcomip(pc, (r+1)); \
}

/* compare ST(r1) <-> ST(r2) test FCOMI (=fcom,fstw,sahf) */
#  define jit_emit_cmp_rr_n(pc, r1, r2) { \
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
#  define jit_emit_test_r_n(pc, r) { \
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


#  define jit_emit_neg_m_i(pc, address) \
    emitm_negl_m(pc, emit_None, emit_None, emit_None, (long)address)

#  define jit_emit_band_mr_i(pc, d, reg) \
    emitm_andl_r_m(pc, reg, emit_None, emit_None, emit_None, d)

#  define jit_emit_band_rm_i(pc, reg, d) \
    emitm_andl_m_r(pc, reg, emit_None, emit_None, emit_None, d)

#  define jit_emit_band_mi_i(pc, d, imm) \
    emitm_andl_i_m(pc, imm, emit_None, emit_None, emit_None, d)

#  define jit_emit_bor_mr_i(pc, d, reg) \
    emitm_orl_r_m(pc, reg, emit_None, emit_None, emit_None, d)

#  define jit_emit_bor_rm_i(pc, reg, d) \
    emitm_orl_m_r(pc, reg, emit_None, emit_None, emit_None, d)

#  define jit_emit_bor_mi_i(pc, d, imm) \
    emitm_orl_i_m(pc, imm, emit_None, emit_None, emit_None, d)

#  define jit_emit_bxor_mr_i(pc, d, reg) \
    emitm_xorl_r_m(pc, reg, emit_None, emit_None, emit_None, d)

#  define jit_emit_bxor_rm_i(pc, reg, d) \
    emitm_xorl_m_r(pc, reg, emit_None, emit_None, emit_None, d)

#  define jit_emit_bxor_mi_i(pc, d, imm) \
    emitm_xorl_i_m(pc, imm, emit_None, emit_None, emit_None, d)

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

static void
Parrot_emit_jump_to_eax(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    if (!jit_info->objfile) {
        /* This calculates (INDEX into op_map * 4) */

        /* we have to get the code pointer, which might change
         * due too intersegment branches
         */
        jit_emit_mov_ri_i(jit_info->native_ptr,emit_EDX, interpreter);
        emitm_movl_m_r(jit_info->native_ptr, emit_EDX, emit_EDX, 0, 1,
                offsetof(struct Parrot_Interp, code));
        emitm_movl_m_r(jit_info->native_ptr, emit_EDX, emit_EDX, 0, 1,
                offsetof(struct PackFile, byte_code));
        jit_emit_sub_rr_i(jit_info->native_ptr, emit_EAX, emit_EDX);
        /*
         * now we have the offset of the ins in EAX
         *
         * we have to get the op_map too at runtime
         */
        jit_emit_mov_ri_i(jit_info->native_ptr,emit_EDX, interpreter);
        emitm_movl_m_r(jit_info->native_ptr, emit_EDX, emit_EDX, 0, 1,
                offsetof(struct Parrot_Interp, jit_info));
        emitm_lea_m_r(jit_info->native_ptr, emit_EDX, emit_EDX, 0, 1,
                offsetof(Parrot_jit_info_t, arena));
        emitm_movl_m_r(jit_info->native_ptr, emit_EDX, emit_EDX, 0, 1,
                offsetof(Parrot_jit_arena_t, op_map));
    }
#  if EXEC_CAPABLE
    else {
        emitm_subl_i_r(jit_info->native_ptr,
            jit_info->objfile->bytecode_header_size, emit_EAX);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_DATA, "program_code", -4);
        jit_emit_mov_ri_i(jit_info->native_ptr,emit_EDX,
            Parrot_exec_add_text_rellocation_reg(jit_info->objfile,
                jit_info->native_ptr, "opcode_map", 0, 0));
    }
#  endif

    /* This jumps to the address in op_map[EDX + sizeof(void *) * INDEX] */
    emitm_jumpm(jit_info->native_ptr, emit_EDX, emit_EAX,
                        sizeof(*jit_info->arena.op_map) / 4, 0);
}

#  define jit_emit_stack_frame_enter(pc) do { \
    emitm_pushl_r(pc, emit_EBP); \
    jit_emit_mov_rr_i(pc, emit_EBP, emit_ESP); \
} while(0)

#  define jit_emit_stack_frame_leave(pc) do { \
    jit_emit_mov_rr_i(pc, emit_ESP, emit_EBP); \
    emitm_popl_r(pc, emit_EBP); \
} while(0)

static void call_func(Parrot_jit_info_t *jit_info, void *addr);

#  if !defined(INT_REG)
#    define INT_REG(x) interpreter->int_reg.registers[x]
#  endif
#  if !defined(NUM_REG)
#    define NUM_REG(x) interpreter->num_reg.registers[x]
#  endif
#  if !defined(STR_REG)
#    define STR_REG(x) interpreter->string_reg.registers[x]
#  endif
#  if !defined(PMC_REG)
#    define PMC_REG(x) interpreter->pmc_reg.registers[x]
#  endif

static void call_func(Parrot_jit_info_t *jit_info, void *addr)
{
    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_X86CALL;
    jit_info->arena.fixups->param.fptr = D2FPTR(addr);
    emitm_calll(jit_info->native_ptr, 0xdeafc0de);
}

#  ifndef NO_JIT_VTABLE_OPS

#    undef Parrot_jit_vtable1_op
#    undef Parrot_jit_vtable1r_op
#    undef Parrot_jit_vtable2rk_op
#    undef Parrot_jit_vtable3k_op

#    undef Parrot_jit_vtable_112_op
#    undef Parrot_jit_vtable_221_op
#    undef Parrot_jit_vtable_1121_op
#    undef Parrot_jit_vtable_1123_op
#    undef Parrot_jit_vtable_2231_op

#    undef Parrot_jit_vtable_1r223_op
#    undef Parrot_jit_vtable_1r332_op

#    undef Parrot_jit_vtable_ifp_op
#    undef Parrot_jit_vtable_unlessp_op
#    undef Parrot_jit_vtable_newp_ic_op

#    define EXR(m, s) (int *)(offsetof(struct Parrot_Interp, m) + s)
#    define IREG(i) EXR(int_reg.registers, i * sizeof(INTVAL))
#    define NREG(i) EXR(num_reg.registers, i * sizeof(FLOATVAL))
#    define PREG(i) EXR(pmc_reg.registers, i * sizeof(PMC *))
#    define SREG(i) EXR(string_reg.registers, i * sizeof(STRING *))
#    define CONST(i) (int *)(jit_info->cur_op[i] * \
       sizeof(struct PackFile_Constant) + \
       offsetof(struct PackFile_Constant, u))

#    define CALL(f) Parrot_exec_add_text_rellocation_func(jit_info->objfile, \
       jit_info->native_ptr, f); \
       emitm_calll(jit_info->native_ptr, EXEC_CALLDISP);
/* emit a call to a vtable func
 * $X->vtable(interp, $X [, $Y...] )
 */
#    define MAP(i) jit_info->optimizer->map_branch[jit_info->op_i + (i)]

static void
Parrot_jit_vtable_n_op(Parrot_jit_info_t *jit_info,
                struct Parrot_Interp * interpreter, int n, int bp, int *args)
{
    int nvtable = op_jit[*jit_info->cur_op].extcall;
    size_t offset;
    op_info_t *op_info = &interpreter->op_info_table[*jit_info->cur_op];
    int p[PARROT_MAX_ARGS];
    int idx, i, j;
    int st = 0;         /* stack pop correction */
    int saved = 0;
    Parrot_jit_register_usage_t *ru = jit_info->optimizer->cur_section->ru;
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    /* this is not callee saved, emit_EDX is 4th in intval_map
     * should also save floating regs back?
     */
    if (ru[0].registers_used >= 4) {
        emitm_pushl_r(jit_info->native_ptr, emit_EDX);
        saved = 1;
    }
    if (ru[0].registers_used == 5) {
        emitm_pushl_r(jit_info->native_ptr, emit_ECX);
        saved = 2;
    }
    if (bp) {
        jit_emit_stack_frame_enter(jit_info->native_ptr);
        jit_emit_sub_ri_i(jit_info->native_ptr, emit_ESP, sizeof(INTVAL));
    }

    /* get the offset of the first vtable func */
    offset = offsetof(struct _vtable, init);
    offset += nvtable * sizeof(void *);
    /* get params $i, 0 is opcode */
    for (idx = n; idx > 0; idx--) {
        i = args[idx-1];
        p[i] = *(jit_info->cur_op + i);
        switch (op_info->types[i]) {
            case PARROT_ARG_S:
#    if EXEC_CAPABLE
                if (jit_info->objfile) {
                    jit_emit_mov_rm_i(jit_info->native_ptr, emit_EAX,
                        SREG(p[i]));
                    Parrot_exec_add_text_rellocation(jit_info->objfile,
                        jit_info->native_ptr, RTYPE_COM, "interpre", -4);
                }
                else
#    endif
                    jit_emit_mov_rm_i(jit_info->native_ptr, emit_EAX,
                        &STR_REG(p[i]));
                emitm_pushl_r(jit_info->native_ptr, emit_EAX);
                break;
            case PARROT_ARG_K:
            case PARROT_ARG_P:
#    if EXEC_CAPABLE
                if (jit_info->objfile) {
                    jit_emit_mov_rm_i(jit_info->native_ptr, emit_EAX,
                        PREG(p[i]));
                    Parrot_exec_add_text_rellocation(jit_info->objfile,
                        jit_info->native_ptr, RTYPE_COM, "interpre", -4);
                }
                else
#    endif
                    jit_emit_mov_rm_i(jit_info->native_ptr, emit_EAX,
                        &PMC_REG(p[i]));
                /* push $i, the left most Pi stays in eax, which is used
                 * below, to call the vtable method
                 */
                emitm_pushl_r(jit_info->native_ptr, emit_EAX);
                break;
            case PARROT_ARG_KI:
            case PARROT_ARG_I:
                if (MAP(i))
                    emitm_pushl_r(jit_info->native_ptr, MAP(i));
                else {
#    if EXEC_CAPABLE
                    if (jit_info->objfile) {
                        jit_emit_mov_rm_i(jit_info->native_ptr, emit_EAX,
                            IREG(p[i]));
                        Parrot_exec_add_text_rellocation(jit_info->objfile,
                            jit_info->native_ptr, RTYPE_COM, "interpre", -4);
                    }
                    else
#    endif
                        jit_emit_mov_rm_i(jit_info->native_ptr, emit_EAX,
                            &INT_REG(p[i]));
                    emitm_pushl_r(jit_info->native_ptr, emit_EAX);
                }
                break;
                break;
            case PARROT_ARG_KIC:
            case PARROT_ARG_IC:
                /* XXX INTVAL_SIZE */
                /* push value */
                emitm_pushl_i(jit_info->native_ptr, p[i]);
                break;
            case PARROT_ARG_N:
                /* push num on st(0) */
                if (MAP(i)) {
                    emitm_fld(jit_info->native_ptr, MAP(i));
                }
                else
#    if EXEC_CAPABLE
                    if (jit_info->objfile) {
                        jit_emit_fload_m_n(jit_info->native_ptr, NREG(i));
                        Parrot_exec_add_text_rellocation(jit_info->objfile,
                            jit_info->native_ptr, RTYPE_COM, "interpre", -4);
                    }
                    else
#    endif
                        jit_emit_fload_m_n(jit_info->native_ptr,
                            &NUM_REG(p[i]));
                goto store;
            case PARROT_ARG_NC:
#    if EXEC_CAPABLE
                if (jit_info->objfile) {
                    jit_emit_fload_m_n(jit_info->native_ptr, CONST(i));
                    Parrot_exec_add_text_rellocation(jit_info->objfile,
                        jit_info->native_ptr, RTYPE_DATA, "const_table", -4);
                }
                else
#    endif
                    jit_emit_fload_m_n(jit_info->native_ptr,
                        &interpreter->code->const_table->
                            constants[p[i]]->u.number);
store:
#    if NUMVAL_SIZE == 8
                /* make room for double */
                emitm_addb_i_r(jit_info->native_ptr, -8, emit_ESP);
                emitm_fstpl(jit_info->native_ptr, emit_ESP, emit_None, 1, 0);
                /* additional stack adjustment */
                st += 4;
#    else
                emitm_addb_i_r(jit_info->native_ptr, -12, emit_ESP);
                emitm_fstpt(jit_info->native_ptr, emit_ESP, emit_None, 1, 0);
                st += 8;
#    endif
                break;

            case PARROT_ARG_SC:
#    if EXEC_CAPABLE
                if (jit_info->objfile) {
                    emitm_pushl_m(jit_info->native_ptr, CONST(i));
                    Parrot_exec_add_text_rellocation(jit_info->objfile,
                        jit_info->native_ptr, RTYPE_DATA, "const_table", -4);
                }
                else
#    endif
                    emitm_pushl_i(jit_info->native_ptr,
                        interpreter->code->const_table->
                            constants[p[i]]->u.string);
                break;

            case PARROT_ARG_KC:
                {
                    /* a key constant may have multiple integer arguments,
                     * so save mapped regs back to parrot regs */
                    for (j = 0; j < ru[0].registers_used; j++) {
                        int us = ru[0].reg_usage[j];
#    if EXEC_CAPABLE
                        if (jit_info->objfile) {
                            jit_emit_mov_mr_i(jit_info->native_ptr,
                                IREG(us), jit_info->intval_map[j]);
                            Parrot_exec_add_text_rellocation(jit_info->objfile,
                                jit_info->native_ptr, RTYPE_COM,
                                    "interpre", -4);
                        }
                        else
#    endif

                            jit_emit_mov_mr_i(jit_info->native_ptr,
                                &INT_REG(us),
                                    jit_info->intval_map[j]);
                    }
#    if EXEC_CAPABLE
                    if (jit_info->objfile) {
                        emitm_pushl_m(jit_info->native_ptr, CONST(i));
                        Parrot_exec_add_text_rellocation(jit_info->objfile,
                            jit_info->native_ptr, RTYPE_DATA,
                                "const_table", -4);
                    }
                    else
#    endif
                        emitm_pushl_i(jit_info->native_ptr,
                            interpreter->code->const_table->
                                constants[p[i]]->u.key);
                }
                break;

            default:
                internal_exception(1,
                        "jit_vtable_n_op: unimp type %d, arg %d vtable %d",
                        op_info->types[i], i, nvtable);
                break;
        }
    }
    /* push interpreter */
#    if EXEC_CAPABLE
    if (jit_info->objfile) {
        emitm_pushl_i(jit_info->native_ptr, 0);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_COM, "interpre", -4);
    }
    else
#    endif
        emitm_pushl_i(jit_info->native_ptr, interpreter);
    /* mov (offs)%eax, %eax i.e. $1->vtable */
    emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EAX, emit_None, 1,
            offsetof(struct PMC, vtable));
    /* call *(offset)eax */
    emitm_callm(jit_info->native_ptr, emit_EAX, emit_None, emit_None, offset);
    if (bp)
        jit_emit_stack_frame_leave(jit_info->native_ptr);
    else
        emitm_addb_i_r(jit_info->native_ptr,
                st + sizeof(void *) * (n + 1), emit_ESP);
    if (saved == 2)
        emitm_popl_r(jit_info->native_ptr, emit_ECX);
    if (saved)
        emitm_popl_r(jit_info->native_ptr, emit_EDX);
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
            if (MAP(1)) {
                jit_emit_mov_rr_i(jit_info->native_ptr, MAP(1), emit_EAX);
            }
            else
#    if EXEC_CAPABLE
                if (jit_info->objfile) {
                    jit_emit_mov_mr_i(jit_info->native_ptr, IREG(p1),
                        emit_EAX);
                    Parrot_exec_add_text_rellocation(jit_info->objfile,
                        jit_info->native_ptr, RTYPE_COM, "interpre", -4);
                }
                else
#    endif
                    jit_emit_mov_mr_i(jit_info->native_ptr, &INT_REG(p1),
                        emit_EAX);
            break;
        case PARROT_ARG_S:
#    if EXEC_CAPABLE
            if (jit_info->objfile) {
                jit_emit_mov_mr_i(jit_info->native_ptr, SREG(p1),
                    emit_EAX);
                Parrot_exec_add_text_rellocation(jit_info->objfile,
                    jit_info->native_ptr, RTYPE_COM, "interpre", -4);
            }
            else
#    endif
                jit_emit_mov_mr_i(jit_info->native_ptr, &STR_REG(p1),emit_EAX);
            break;
        case PARROT_ARG_P:
#    if EXEC_CAPABLE
            if (jit_info->objfile) {
                jit_emit_mov_mr_i(jit_info->native_ptr, PREG(p1),
                    emit_EAX);
                Parrot_exec_add_text_rellocation(jit_info->objfile,
                    jit_info->native_ptr, RTYPE_COM, "interpre", -4);
            }
            else
#    endif
                jit_emit_mov_mr_i(jit_info->native_ptr, &PMC_REG(p1),emit_EAX);
            break;
        case PARROT_ARG_N:
            if (MAP(1)) {
                emitm_fstp(jit_info->native_ptr, (1 + MAP(1)));
            }
            else
                jit_emit_fstore_m_n(jit_info->native_ptr, &NUM_REG(p1));
            break;
        default:
            internal_exception(1, "jit_vtable1r: ill LHS");
            break;
    }
}

/* emit a call to a vtable func
 * $1->vtable(interp, $1)
 */
static void
Parrot_jit_vtable1_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int a[] = { 1 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 1, 0, a);
}

/* emit a call to a vtable func
 * $1 = $2->vtable(interp, $2)
 */
static void
Parrot_jit_vtable1r_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int a[] = { 2 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 1, 0, a);
    Parrot_jit_store_retval(jit_info, interpreter);
}

/* emit a call to a vtable func
 * $1 = $2->vtable(interp, $2, &key)
 */
static void
Parrot_jit_vtable2rk_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int a[] = { 2 , 3};
    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, 1, a);
    Parrot_jit_store_retval(jit_info, interpreter);
}

/* emit a call to a vtable func
 * $1 = $2->vtable(interp, $2, $3)
 */
static void
Parrot_jit_vtable_1r223_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int a[] = { 2 , 3};
    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, 0, a);
    Parrot_jit_store_retval(jit_info, interpreter);
}

/* emit a call to a vtable func
 * $1 = $3->vtable(interp, $3, $2)
 */
static void
Parrot_jit_vtable_1r332_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int a[] = { 3 , 2};
    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, 0, a);
    Parrot_jit_store_retval(jit_info, interpreter);
}
/* emit a call to a vtable func
 * $1->vtable(interp, $1, $2)
 */
static void
Parrot_jit_vtable_112_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int a[] = { 1, 2 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, 0, a);
}

/* emit a call to a vtable func
 * $2->vtable(interp, $2, $1)
 */
static void
Parrot_jit_vtable_221_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int a[] = { 2, 1 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, 0, a);
}

/* emit a call to a vtable func
 * $2->vtable(interp, $2, $3, $1)
 */
static void
Parrot_jit_vtable_2231_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int a[] = { 2, 3, 1 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 3, 0, a);
}

/* emit a call to a vtable func
 * $1->vtable(interp, $1, $2, $3)
 */
static void
Parrot_jit_vtable_1123_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int a[] = { 1, 2, 3 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 3, 0, a);
}

/* emit a call to a vtable func
 * $1->vtable(interp, $1, $2, $1)
 */
static void
Parrot_jit_vtable_1121_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int a[] = { 1, 2, 1 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 3, 0, a);
}

/* emit a call to a vtable func
 * $1->vtable(interp, $1, &key, $3)
 */
static void
Parrot_jit_vtable3k_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int a[] = { 1, 2, 3 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 3, 1, a);
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
    int saved = 0;
    Parrot_jit_register_usage_t *ru = jit_info->optimizer->cur_section->ru;
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    /* this is not callee saved, emit_EDX is 4th in intval_map
     * should also save floating regs back?
     */
    if (ru[0].registers_used >= 4) {
        emitm_pushl_r(jit_info->native_ptr, emit_EDX);
        saved = 1;
    }
    if (ru[0].registers_used == 5) {
        emitm_pushl_r(jit_info->native_ptr, emit_ECX);
        saved = 2;
    }

    assert(nvtable == 0);       /* vtable->init */
    assert(op_info->types[1] == PARROT_ARG_P);
    p1 = *(jit_info->cur_op + 1);
    assert(p1 >= 0 && p1 < NUM_REGISTERS);
    i2 = *(jit_info->cur_op + 2);
    if (i2 <= 0 || i2 >= enum_class_max)
        internal_exception(1, "Illegal PMC enum (%d) in new\n", i2);
    /* push pmc enum and interpreter */
    emitm_pushl_i(jit_info->native_ptr, i2);
#    if EXEC_CAPABLE
    if (jit_info->objfile) {
        emitm_pushl_i(jit_info->native_ptr, 0);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_COM, "interpre", -4);
        CALL("pmc_new_noinit");
        /* result = eax = PMC */
        jit_emit_mov_mr_i(jit_info->native_ptr, PREG(p1), emit_EAX);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_COM, "interpre", -4);

        emitm_pushl_r(jit_info->native_ptr, emit_EAX);
        /* push interpreter */
        emitm_pushl_i(jit_info->native_ptr, 0);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_COM, "interpre", -4);
    }
    else
#    endif
    {
        emitm_pushl_i(jit_info->native_ptr, interpreter);
        call_func(jit_info, (void (*)(void))pmc_new_noinit);
        /* result = eax = PMC */
        jit_emit_mov_mr_i(jit_info->native_ptr,
                &interpreter->pmc_reg.registers[p1], emit_EAX);
        emitm_pushl_r(jit_info->native_ptr, emit_EAX);
        /* push interpreter */
        emitm_pushl_i(jit_info->native_ptr, interpreter);
    }
    /* mov (offs)%eax, %eax i.e. $1->vtable */
    emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EAX, emit_None, 1,
            offsetof(struct PMC, vtable));
    /* call *(offset)eax */
    emitm_callm(jit_info->native_ptr, emit_EAX, emit_None, emit_None, offset);
    /* adjust 4 args pushed */
    emitm_addb_i_r(jit_info->native_ptr, 16, emit_ESP);
    if (saved == 2)
        emitm_popl_r(jit_info->native_ptr, emit_ECX);
    if (saved)
        emitm_popl_r(jit_info->native_ptr, emit_EDX);
}

#    undef IREG
#    undef NREG
#    undef SREG
#    undef PREG
#    undef CONST
#    undef CALL

#  endif /* NO_JIT_VTABLE_OPS */

# if EXEC_CAPABLE
#  ifdef JIT_CGP
#    ifdef EXEC_SHARED
#      define exec_emit_end(pc) { \
         jit_emit_mov_rm_i(pc, c, 2); \
         Parrot_exec_add_text_rellocation(jit_info->objfile, \
           0, RTYPE_COM, "cgp_core", 0); \
         emitm_movl_m_r(jit_info->native_ptr, emit_ESI, emit_ESI, \
           emit_None, 1, 0); \
         emitm_addb_i_r(jit_info->native_ptr, \
           (int)((ptrcast_t)((op_func_t*) \
             interpreter->op_lib->op_func_table)[0]) - (int)cgp_core, \
               emit_ESI); \
         emitm_jumpr(pc, emit_ESI); \
       }
#    else /* EXEC_SHARED */
#      define exec_emit_end(pc) { \
         jit_emit_mov_ri_i(pc, emit_ESI, \
           (int)((ptrcast_t)((op_func_t*) \
             interpreter->op_lib->op_func_table)[0]) - (int)cgp_core); \
         Parrot_exec_add_text_rellocation(jit_info->objfile, \
           jit_info->native_ptr, RTYPE_COM, "cgp_core", -4); \
         emitm_jumpr(pc, emit_ESI); \
       }
#    endif /* EXEC_SHARED */

#  else /* JIT_CGP */

#    define exec_emit_end(pc) jit_emit_end(pc)

#  endif /* JIT_CGP */
# endif /* EXEC_CAPABLE */

#  ifdef JIT_CGP
#    define jit_emit_end(pc) { \
       jit_emit_mov_ri_i(pc, emit_ESI, \
         (ptrcast_t)((op_func_t*)interpreter->op_lib->op_func_table) [0]); \
       emitm_jumpr(pc, emit_ESI); \
     }
#  else /* JIT_CGP */
#    define jit_emit_end(pc) { \
       jit_emit_add_ri_i(pc, emit_ESP, 4); \
       emitm_popl_r(pc, emit_EDI); \
       emitm_popl_r(pc, emit_EBX); \
       emitm_popl_r(pc, emit_ESI); \
       emitm_popl_r(pc, emit_EBP); \
       emitm_ret(pc); \
     }

#  endif /* JIT_CGP */
#endif /* JIT_EMIT */

#if JIT_EMIT > 1

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

#  ifndef JIT_CGP
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
    if (!jit_info->objfile) {
        emitm_pushl_i(jit_info->native_ptr, interpreter);
    }
#    if EXEC_CAPABLE
    else {
        emitm_pushl_i(jit_info->native_ptr, 0x0);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_COM, "interpre", -4);
    }
#    endif

    /* get the pc from stack:  mov 12(%ebp), %eax */
    emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EBP, emit_None, 1, 12);

    /* jump to restart pos or first op */
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}
#  endif


void
Parrot_jit_emit_mov_mr_n(struct Parrot_Interp * interpreter, char *mem,int reg)
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
Parrot_jit_emit_mov_rm_n(struct Parrot_Interp * interpreter, int reg,char *mem)
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
#  ifdef JIT_CGP

#    include <parrot/oplib/core_ops_cgp.h>
/*
 * This is the somewhat complicated program flow
 *
 * JIT code                     prederef code
 * 1) jit_begin
 *    stack_enter
 *    call cgp_core  -->        set stack frame
 *                              jump to retaddr
 *    test EAX, 0    <--        also from HALT
 *    jnz code_start
 *    stack_leave
 *    ret
 * code_start: of JIT code
 *    jit code
 *    ....
 *
 * 2) normal_op
 *    mov prederef_code_ptr, esi
 *    call *(esi)    ---->      prederefed (non JITted code)
 *                              ....
 *    ....           <----      ret
 *    jit_code
 *    ....
 * 3) HALT == jit_end
 *    mov prederefed_op_func[0], esi
 *    jump *esi      ----->     cleanup prederef stack frame
 *                              xor eax,eax ; return 0
 *                              ret (--> after call cgp_core in 1)
 *
 */

void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 struct Parrot_Interp * interpreter)
{
    jit_emit_stack_frame_enter(jit_info->native_ptr);
    emitm_pushl_r(jit_info->native_ptr, emit_EBX);
    /* get the pc from stack:  mov 12(%ebp), %ebx */
    emitm_movl_m_r(jit_info->native_ptr, emit_EBX, emit_EBP, emit_None, 1, 12);
    /* emit cgp_core(1, interpreter) */
    if (!jit_info->objfile) {
        emitm_pushl_i(jit_info->native_ptr, interpreter);
    }
#    if EXEC_CAPABLE
    else {
        emitm_pushl_i(jit_info->native_ptr, 0x0);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_COM, "interpre", -4);
    }
#    endif
    emitm_pushl_i(jit_info->native_ptr, 1);
    /* use EAX as flag, when jumping back on init, EAX==1 */
    jit_emit_mov_ri_i(jit_info->native_ptr, emit_EAX, 1);
    /* TODO restart code */
    if (!jit_info->objfile)
        call_func(jit_info, (void (*)(void))cgp_core);
#    if EXEC_CAPABLE
    else {
        Parrot_exec_add_text_rellocation_func(jit_info->objfile,
            jit_info->native_ptr, "cgp_core");
        emitm_calll(jit_info->native_ptr, EXEC_CALLDISP);
    }
#    endif
    /* when cur_opcode == 1, cgp_core jumps back here
     * when EAX == 0, the official return from HALT was called */
    jit_emit_test_r_i(jit_info->native_ptr, emit_EAX);
    emitm_jxs(jit_info->native_ptr, emitm_jnz, 7);
    emitm_popl_r(jit_info->native_ptr, emit_EBX);
    jit_emit_stack_frame_leave(jit_info->native_ptr);
    emitm_ret(jit_info->native_ptr);
    /* get PC = ebx to eax, jump there */
    jit_emit_mov_rr_i(jit_info->native_ptr, emit_EAX, emit_EBX);
    Parrot_emit_jump_to_eax(jit_info, interpreter);

/* code_start: */
}

/*
 * XXX needs some fixing
 * s. t/sub/pmc_{8,9}.t: the 2 print in tail call without that 'end'
 *    are recogniced as one non JIIted block
 */
void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    Parrot_jit_optimizer_section_ptr cur_section =
        jit_info->optimizer->cur_section;
    int last_is_branch = 0;
    void ** offset;
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    assert(op_jit[*jit_info->cur_op].extcall == 1);
    if (cur_section->done == 1)
        return;
    else if (cur_section->done == -1 && --cur_section->ins_count > 0)
        return;
    /* check, where section ends
     */
    if (interpreter->op_info_table[*cur_section->end].jump)
        last_is_branch = 1;
    else if (cur_section->next && !cur_section->next->isjit)
        last_is_branch = 1;
    /* if more then 1 op, then jump to CGP, branches are never
     * executed in CGP, they are handled below */
    if (cur_section->done >= 0 &&
            (INTVAL)cur_section->op_count >= 2 + last_is_branch) {
        int saved = 0;
        offset = (jit_info->cur_op - interpreter->code->byte_code) +
            interpreter->code->cur_cs->prederef_code;

        jit_emit_mov_ri_i(jit_info->native_ptr, emit_ESI, offset);
        emitm_callm(jit_info->native_ptr, emit_ESI, 0, 0, 0);
        /* now patch a B<cpu_ret> opcode after the end of the
         * prederefed (non JIT) section
         */
        if (last_is_branch) {
            offset = (cur_section->end - interpreter->code->byte_code) +
                interpreter->code->cur_cs->prederef_code;
            cur_section->done = -1;
            /* ins to skip */
            cur_section->ins_count = cur_section->op_count - 1;
        }
        else {
            /* There must be a next section: either we have a B<end>
             * or a JITed branch,
             * when the branch is non JIT, we are in the above case
             */
            offset = (cur_section->next->begin - interpreter->code->byte_code)
                + interpreter->code->cur_cs->prederef_code;
            cur_section->done = 1;
        }
        *offset = ((op_func_t*)interpreter->op_lib->op_func_table)[2];
    }
    else {
        /* else call normal funtion */
        emitm_pushl_i(jit_info->native_ptr, interpreter);
        emitm_pushl_i(jit_info->native_ptr, jit_info->cur_op);
        call_func(jit_info,
            (void (*)(void))interpreter->op_func_table[*(jit_info->cur_op)]);
        emitm_addb_i_r(jit_info->native_ptr, 8, emit_ESP);
        /* when this was a branch, then EAX is now the offset
         * in the byte_code
         */
    }
}

#  else /* JIT_CGP */
extern int jit_op_count(void);

void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    int cur_op = *jit_info->cur_op;

    if (cur_op >= jit_op_count()) {
        cur_op = CORE_OPS_wrapper__;
    }
    emitm_pushl_i(jit_info->native_ptr, jit_info->cur_op);

    call_func(jit_info,
            (void (*)(void))interpreter->op_func_table[cur_op]);
    emitm_addb_i_r(jit_info->native_ptr, 4, emit_ESP);
}

#  endif /* JIT_CGP */

static void Parrot_end_jit(Parrot_jit_info_t *, struct Parrot_Interp * );

void
Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info, interpreter);
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}


#  undef Parrot_jit_restart_op
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
/*
 * params are put rigth to left on the stack
 * parrot registers are counted left to right
 * so this function returns for a given register type
 * the needed register number
 * TODO handel overflow params
 */
static int
count_regs(char *sig, char *sig_start)
{
    const char *typs[] = {
        "lisc234", /* I */
        "tbB",    /* S */
        "pP",   /* P */
        "fd"   /* N */
    };
    int first_reg = 5;
    int i, found;
    /* char at sig is the type to look at */
    for (found = -1, i = 0; i < 4; i++)
        if (strchr(typs[i], *sig)) {
            found = i;
            break;
        }
    if (found == -1)
        internal_exception(1,
                "Parrot_jit_build_call_func: sig char not found\n");
    for (--sig; sig > sig_start; --sig)
        if (strchr(typs[found], *sig))
            ++first_reg;
    return first_reg;
}
/*
 * TODO if this is called from an JITed op it has to use MAPs
 */
void *
Parrot_jit_build_call_func(struct Parrot_Interp *interpreter, PMC *pmc_nci,
        String *signature)
{
    Parrot_jit_info_t jit_info;
    char *sig, *pc;
    int next_n = 5;
    int next_p = 5;
    int next_s = 5;
    int next_i = 5;
    int st = 0;
    int size = 100 + signature->bufused * 20;
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    /* this ought to be enough - the caller of this function
     * should free the function pointer returned here
     */
    jit_info.native_ptr = jit_info.arena.start = mem_alloc_executable(size);
    pc = jit_info.native_ptr;

    /* make stack frame */
    jit_emit_stack_frame_enter(pc);
    /* get rightmost param, assume ascii chars */
    sig = (char *)signature->strstart + signature->bufused - 1;
    /* as long as there are params */
    while (sig > (char *)signature->strstart) {
        switch (*sig) {
            case '0':    /* null ptr or such - doesn't consume a reg */
                jit_emit_bxor_rr_i(pc, emit_EAX, emit_EAX);
                emitm_pushl_r(pc, emit_EAX);
                break;
            /* I have no idea how to handle these */
            case '2':
            case '3':
            case '4':
                /* This might be right. Or not... */
                jit_emit_mov_ri_i(pc, emit_EAX,
                    &INT_REG(count_regs(sig, signature->strstart)));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'f':
                /* get a double from next num reg and push it on stack */
                jit_emit_fload_m_n(pc,
                        &NUM_REG(count_regs(sig, signature->strstart)));
                /* make room for float */
                emitm_addb_i_r(pc, -4, emit_ESP);
                emitm_fstps(pc, emit_ESP, emit_None, 1, 0);
                break;
            case 'd':
                /* get a double from next num reg and push it on stack */
                jit_emit_fload_m_n(pc,
                        &NUM_REG(count_regs(sig, signature->strstart)));
                /* make room for double */
                emitm_addb_i_r(pc, -8, emit_ESP);
                emitm_fstpl(pc, emit_ESP, emit_None, 1, 0);
                st += 4;        /* extra stack for double */
                break;
            case 'l':   /* long */
            case 'i':   /* int */
                jit_emit_mov_rm_i(pc, emit_EAX,
                        &INT_REG(count_regs(sig, signature->strstart)));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 's':   /* short: movswl intreg, %eax */
                emitm_movswl_r_m(pc, emit_EAX, 0, 0, 1,
                        &INT_REG(count_regs(sig, signature->strstart)));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'c':   /* char: movsbl intreg, %eax */
                emitm_movsbl_r_m(pc, emit_EAX, 0, 0, 1,
                        &INT_REG(count_regs(sig, signature->strstart)));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'p':   /* push pmc->data */
#  if ! PMC_DATA_IN_EXT
                /* mov pmc, %edx
                 * mov 8(%edx), %eax
                 * push %eax
                 */
                jit_emit_mov_rm_i(pc, emit_EDX,
                        &PMC_REG(count_regs(sig, signature->strstart)));
                emitm_movl_m_r(pc, emit_EAX, emit_EDX, 0, 1,
                        offsetof(struct PMC, data));
#  else
                /* push pmc->pmc_ext->data
                 * mov pmc, %edx
                 * mov pmc_ext(%edx), %eax
                 * mov data(%eax), %eax
                 * push %eax
                 */
                jit_emit_mov_rm_i(pc, emit_EDX,
                        &PMC_REG(count_regs(sig, signature->strstart)));
                emitm_movl_m_r(pc, emit_EAX, emit_EDX, 0, 1,
                        offsetof(struct PMC, pmc_ext));
                emitm_movl_m_r(pc, emit_EAX, emit_EAX, 0, 1,
                        offsetof(struct PMC_EXT, data));
#  endif
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'P':   /* push PMC * */
                jit_emit_mov_rm_i(pc, emit_EAX,
                        &PMC_REG(count_regs(sig, signature->strstart)));
#if PARROT_CATCH_NULL
                jit_emit_cmp_rm_i(pc, emit_EAX, &PMCNULL);
                emitm_jxs(pc, emitm_jne, 2); /* skip the xor */
                jit_emit_bxor_rr_i(pc, emit_EAX, emit_EAX);
#endif
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'v':
                st -= 4;        /* undo default stack usage */
                break;
            case 'b':   /* buffer (void*) pass PObj_bufstart(SReg) */
                jit_emit_mov_rm_i(pc, emit_EDX,
                        &STR_REG(count_regs(sig, signature->strstart)));
                emitm_movl_m_r(pc, emit_EAX, emit_EDX, 0, 1,
                        (size_t) &PObj_bufstart((STRING *) 0));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'B':   /* buffer (void**) pass &PObj_bufstart(SReg) */
                jit_emit_mov_rm_i(pc, emit_EDX,
                        &STR_REG(count_regs(sig, signature->strstart)));
                emitm_lea_m_r (pc, emit_EAX, emit_EDX, 0, 1,
                        (size_t) &PObj_bufstart((STRING *) 0));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 't':   /* string, pass a cstring */
                jit_emit_mov_rm_i(pc, emit_EAX,
                        &STR_REG(count_regs(sig, signature->strstart)));
                emitm_pushl_r(pc, emit_EAX);
                emitm_pushl_i(pc, interpreter);
                emitm_calll(pc, (char*)string_to_cstring - pc - 4);
                emitm_addb_i_r(pc, 8, emit_ESP);
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'I':
                emitm_pushl_i(pc, interpreter);
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
    emitm_callm(pc, emit_EAX, emit_None, emit_None,
            (size_t) &PMC_struct_val((PMC *) 0));
    /*
     * TODO
     * if we have strings in the signature, then we are leaking memory
     * from string_to_cstring above:
     * - allocate area of stack positions with strings
     * - emit code to free these
     */

    /* adjust stack */
    if (st)
        emitm_addb_i_r(pc, st, emit_ESP);

    /* now place return value in registers */
    /* first in signature is the return value */
    switch (*sig) {
        /* I have no idea how to handle these */
        case '2':
        case '3':
        case '4':
            jit_emit_mov_ri_i(pc, emit_EAX, &INT_REG(next_i++));
            break;
        case 'f':
        case 'd':
            /* pop num from st(0) and mov to reg */
            jit_emit_fstore_m_n(pc, &NUM_REG(next_n++));
            break;
        case 's':
            /* movswl %ax, %edx */
            emitm_movswl_r_r(pc, emit_EDX, emit_EAX);
            jit_emit_mov_mr_i(pc, &INT_REG(next_i++), emit_EDX);
            break;
        case 'c':
            /* movsbl %al, %edx */
            emitm_movsbl_r_r(pc, emit_EDX, emit_EAX);
            jit_emit_mov_mr_i(pc, &INT_REG(next_i++), emit_EDX);
            break;
        case 'l':
        case 'i':
            jit_emit_mov_mr_i(pc, &INT_REG(next_i++), emit_EAX);
            /* fall through */
        case 'v': /* void - do nothing */
            break;
        case 'P':
            jit_emit_mov_mr_i(pc, &PMC_REG(next_p++), emit_EAX);
            break;
        case 'p':   /* make a new unmanaged struct */
            /* save return value on stack */
            emitm_pushl_r(pc, emit_EAX);
            /* make new pmc */
            emitm_pushl_i(pc, enum_class_UnManagedStruct);
            emitm_pushl_i(pc, interpreter);
            emitm_calll(pc, (char*)pmc_new - pc - 4);
            emitm_addb_i_r(pc, 8, emit_ESP);
            /* eax = PMC, get return value into edx */
            jit_emit_mov_mr_i(pc, &PMC_REG(next_p++), emit_EAX);
            emitm_popl_r(pc, emit_EDX);
            /* stuff return value into pmc->data */
#  if ! PMC_DATA_IN_EXT
            /* mov %edx, (data) %eax */
            emitm_movl_r_m(pc, emit_EDX, emit_EAX, 0, 1,
                    offsetof(struct PMC, data));
#  else
            /* mov pmc_ext(%eax), %eax
               mov %edx, data(%eax) */
            emitm_movl_m_r(pc, emit_EAX, emit_EAX, 0, 1,
                    offsetof(struct PMC, pmc_ext));
            emitm_movl_r_m(pc, emit_EDX, emit_EAX, 0, 1,
                    offsetof(struct PMC_EXT, data));
#  endif
            break;
        case 'b':   /* (void *) = PObj_bufstart(new_buffer_header) */
            /* preserve return value */
            jit_emit_mov_rr_i(pc, emit_EDX, emit_EAX);
            emitm_pushl_i(pc, interpreter);
            emitm_calll(pc, (char*)new_buffer_header - pc - 4);
            emitm_addb_i_r(pc, 4, emit_ESP);
            /* *eax = buffer_header */
            /* set external flag */
            emitm_orl_i_m(pc, PObj_external_FLAG, emit_EAX, 0, 1,
                    offsetof(pobj_t, flags));
            /* mov %edx, (bufstart) %eax */
            emitm_movl_r_m(pc, emit_EDX, emit_EAX, 0, 1,
                        (size_t) &PObj_bufstart((STRING *) 0));
            /* place result in SReg */
            jit_emit_mov_mr_i(pc, &STR_REG(next_s++), emit_EAX);

            break;
        case 't':   /* string, determine length, make string */
            emitm_pushl_i(pc, 0);
            emitm_pushl_i(pc, 0);
            emitm_pushl_i(pc, 0);
            emitm_pushl_r(pc, emit_EAX);
            emitm_calll(pc, (char*)strlen - pc - 4);
            emitm_popl_r(pc, emit_EDX);
            emitm_pushl_r(pc, emit_EAX);
            emitm_pushl_r(pc, emit_EDX);
            emitm_pushl_i(pc, interpreter);
            emitm_calll(pc, (char*)string_make - pc - 4);
            emitm_addb_i_r(pc, 24, emit_ESP);
            jit_emit_mov_mr_i(pc, &STR_REG(next_s++), emit_EAX);
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
    jit_emit_mov_mi_i(pc, &INT_REG(2), next_s-5);
    jit_emit_mov_mi_i(pc, &INT_REG(3), next_p-5);
    jit_emit_mov_mi_i(pc, &INT_REG(4), next_n-5);

    jit_emit_stack_frame_leave(pc);
    emitm_ret(pc);
    assert(pc - jit_info.arena.start <= size);
    /* could shrink arena.start here to used size */
    PObj_active_destroy_SET(pmc_nci);
    return (jit_f)D2FPTR(jit_info.arena.start);
}

#endif /* JIT_EMIT */
#if JIT_EMIT == 0
#  define REQUIRES_CONSTANT_POOL 0
#  define INT_REGISTERS_TO_MAP 5
#  define FLOAT_REGISTERS_TO_MAP 4

#  ifndef JIT_IMCC

char intval_map[] =
    /* Note: don't change order of these */
    { emit_EBX, emit_EDI, emit_ESI, emit_EDX, emit_ECX };

/* ST(0) is used as a scratch register,
 * using more then 4 registers breaks C<time N0>
 */
char floatval_map[] = { 1,2,3,4 };
#  endif

/* of these registers that much (from 0 < n) are callee saved, i.e. are
 * not changed around external calls
 */

#  define PRESERVED_INT_REGS 3

/* XXX
 * this 4 floatvals are currently assumed to be callee saved,
 * what is strictly not true conforming to the ABI
 * but currently, we don't have external functions, which
 * globber these regs
 * to be save the following line should be enabled:
 *
 * # define PRESERVED_FLOAT_REGS 0
 *
 */


/*
 * if jit_emit_noop is defined, it does align a jump target
 * to 1 << JUMP_ALIGN
 * It may emit exactly one byte, or some desired padding.
 * The instructions must perfomr like a noop.
 *
 *
 * s. also info gcc /align-jump
 *
 * noop; mov %esi, %esi; lea 0(%esi), %esi
 */

#  define jit_emit_noop(pc) do { \
     switch ( ((unsigned long) pc) & 3) { \
       case 1: *pc++ = (char) 0x8d; *pc++ = (char) 0x76; *pc++ = (char) 0x00; break; \
       case 2: *pc++ = (char) 0x89; *pc++ = (char) 0xf6; break; \
       case 3: *pc++ = (char) 0x90; break; \
     } \
   } while (0)

#  define JUMP_ALIGN 2

/* registers are either allocate per section or per basic block
 * set this to 1 or 0 to change allocation scheme
 */
#  define ALLOCATE_REGISTERS_PER_SECTION 1


/*
 * I386 has JITed vtables, which have the vtable# in extcall.
 * This Parrot_jit_vtable_n_op() doese use register mappings.
 */
#  define EXTCALL(op) (op_jit[*(op)].extcall == 1)

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
