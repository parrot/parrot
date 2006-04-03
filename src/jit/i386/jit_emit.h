/*
 * jit_emit.h
 *
 * i386
 *
 * $Id$
 */

#if !defined(PARROT_I386_JIT_EMIT_H_GUARD)
#define PARROT_I386_JIT_EMIT_H_GUARD

#include <assert.h>

#if defined HAVE_COMPUTED_GOTO && defined __GNUC__ && PARROT_I386_JIT_CGP
#  define JIT_CGP
#endif

static void call_func(Parrot_jit_info_t *jit_info, void *addr);
/*
 * get the register frame pointer
 */
#  define Parrot_jit_emit_get_base_reg_no(pc) \
    emit_EBX

/*
 * get the *runtime* interpreter
 */

#  define Parrot_jit_emit_get_INTERP(pc, dest) \
    emitm_movl_m_r(pc, dest, emit_EBP, emit_None, 1, INTERP_BP_OFFS)

/* see jit_begin */
#  ifdef JIT_CGP
#    define INTERP_BP_OFFS todo
#  else
#    define INTERP_BP_OFFS -16
#  endif

/*
 * if we have a delegated method like typeof_i_p, that returns an INTVAL
 * and that is all in a sequence of JITted opcodes, and when these INTVAL
 * is MAPped, we got a problem. So the EXT_CALL flag is disabled - mapped
 * registers are saved/restored around vtable calls.
 */
#  define  JIT_VTABLE_OPS 1

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

extern PARROT_API UINTVAL ld(UINTVAL);

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

#  define INT_REGISTERS_TO_MAP 4


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
#  endif /* EXEC_CAPABLE */

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
    extern PARROT_API char **Parrot_exec_rel_addr;
    extern PARROT_API int Parrot_exec_rel_count;

    if(emit_is8bit(disp)) {
        *(pc++) = (char)disp;
        return pc;
    }
    else {
        *(long *)pc = disp;
#  if EXEC_CAPABLE
        EXEC_RA(pc);
#  endif /* EXEC_CAPABLE */
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
    extern PARROT_API char **Parrot_exec_rel_addr;
    extern PARROT_API int Parrot_exec_rel_count;

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
#  endif /* EXEC_CAPABLE */
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
    if (opcode == emit_b000 && imm < 0) {
        opcode = emit_b001;     /* -rol => 32 + ror */
        imm = -imm;
    }
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
/* XXX kwoo:  I side with valgrind.  Is it safe to remove the obsolete code? */
#if 0
    /* valgrind doesn't like this and the version below is smaller anyway */
    *(pc++) = (char) 0x8f;
    *(pc++) = (char) emit_alu_X_r(emit_b000, reg);
#else
    *(pc++) = (char) 0x58 | (reg - 1);
#endif /* 0 */
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

/* TEST for zero */
#  define jit_emit_test_r_i(pc, reg1) emitm_alul_r_r(pc, 0x85, reg1, reg1)

#  define emitm_smull_r(pc, reg2) emitm_alu_imp_r((pc), emit_b101, (reg2))

#  define jit_emit_mul_rr_i(pc, reg1, reg2) { \
    *pc++ = 0xf; \
    emitm_alul_r_r(pc, 0xaf, reg1, reg2); }

#  define emitm_smull_r_m(pc, reg1, b, i, s, d) { \
    *pc++ = 0xf; \
    emitm_alul_r_m(pc, 0xaf, reg1, b, i, s, d); }

static char *
opt_mul(char *pc, int dest, INTVAL imm, int src)
{
    UINTVAL ld2 = ld((UINTVAL) imm);
    extern PARROT_API char **Parrot_exec_rel_addr;
    extern PARROT_API int Parrot_exec_rel_count;

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
                emitm_alul_r_r(pc, 0x69, dest, src);
                *(long *)(pc) = (long)imm;
                pc += 4;
        }
    }
    return pc;
}
#    define jit_emit_mul_rir_i(pc, dest, imm, src) \
       pc = opt_mul(pc, dest, imm, src)


#  define jit_emit_mul_ri_i(pc, r, imm) jit_emit_mul_rir_i(pc, r, imm, r)

#  define jit_emit_mul_RIM_ii(pc, reg, imm, ofs) \
    emitm_alul_r_m(pc, 0x69, reg, emit_EBX, emit_None, 1, ofs); \
    *(long *)(pc) = (long)imm; \
    pc += 4;


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

/* TEST op */
#  define jit_emit_test_rr_i(pc, r1, r2) emitm_alul_r_r(pc, 0x85, r1, r2)

#  define jit_emit_test_ri_i(pc, r, im)  \
           emitm_alul_i_r(pc, 0xF7, emit_b000, im, r)

#  define jit_emit_test_RM_i(pc, r, offs)  \
           emitm_alul_r_m(pc, 0x85, r, emit_EBX, 0, 1, offs)

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

#define jit_emit_not_M_i(pc, offs) emitm_notl_m(pc, emit_EBX, 0, 1, offs)

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
#  define jit_emit_xchg_RM_i(pc, r, offs) { \
    emitm_alul_r_m((pc), 0x87, (r), emit_EBX, emit_None, 1, (offs)) \
}
#  define jit_emit_xchg_MR_i(pc, offs, r) jit_emit_xchg_RM_i(pc, r, offs)

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

#  define jit_emit_lsr_ri_i(pc, reg, imm) \
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

#  define jit_emit_shr_ri_i(pc, reg, imm) \
    { pc = emit_shift_i_r(pc, emit_b111, imm, reg); }


#  define emitm_sarl_i_m(pc, imm, b, i, s, d) \
    { pc = emit_shift_i_m(pc, emit_b111, imm, b, i, s, d); }

#  define emitm_sarl_r_r(pc, reg1, reg2) \
    { pc = emit_shift_r_r(pc, emit_b111, reg1, reg2); }

#  define emitm_sarl_r_m(pc, reg, b, i, s, d) \
    { pc = emit_shift_r_m(pc, emit_b111, reg, b, i, s, d); }

/* rotate */

#  define jit_emit_rol_ri_i(pc, reg, imm) \
    { pc = emit_shift_i_r(pc, emit_b000, imm, reg); }

#  define jit_emit_ror_ri_i(pc, reg, imm) \
    { pc = emit_shift_i_r(pc, emit_b001, imm, reg); }

static int
intreg_is_used(Parrot_jit_info_t *jit_info, char reg)
{
    int i;
    const jit_arch_regs *reg_info;
    Parrot_jit_register_usage_t *ru = jit_info->optimizer->cur_section->ru;

    reg_info = jit_info->arch_info->regs + jit_info->code_type;

    for (i = 0; i < ru[0].registers_used; ++i) {
        if (reg_info->map_I[i] == reg) {
            return 1;
        }
    }
    return 0;
}

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
            if (intreg_is_used(jit_info, emit_ECX)) {
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
opt_shift_rm(Parrot_jit_info_t *jit_info, int dest, int offs, int op)
{
    char *pc = jit_info->native_ptr;
    int saved = 0;
    /* if ECX is mapped, save it */
    if (dest != emit_ECX && intreg_is_used(jit_info, emit_ECX)) {
        emitm_pushl_r(pc, emit_ECX);
        saved = 1;
    }
    if (dest == emit_ECX) {
        /* jit_emit_mov_RM_i(pc, emit_EAX, count); */
        emitm_movl_m_r(pc, emit_EAX, emit_EBX, emit_None, 1, offs);
        jit_emit_xchg_rr_i(pc, dest, emit_EAX);
        pc = emit_shift_r_r(pc, op, emit_ECX, emit_EAX);
        jit_emit_xchg_rr_i(pc, dest, emit_EAX);
    }
    else {
        /* jit_emit_mov_RM_i(pc, emit_ECX, count); */
        emitm_movl_m_r(pc, emit_ECX, emit_EBX, emit_None, 1, offs);
        pc = emit_shift_r_r(pc, op, emit_ECX, dest);
    }
    if (saved) {
        emitm_popl_r(pc, emit_ECX);
    }
    return pc;
}

/* interface, shift r1 by r2 bits */

#  define jit_emit_shl_rr_i(pc, r1, r2) \
    pc = opt_shift_rr(jit_info, r1, r2, emit_b100)

#  define jit_emit_shl_RM_i(pc, r1, offs)  \
    pc = opt_shift_rm(jit_info, r1, offs, emit_b100)

/* shr seems to be the arithmetic shift */
#  define jit_emit_shr_rr_i(pc, r1, r2)  \
    pc = opt_shift_rr(jit_info, r1, r2, emit_b111)

#  define jit_emit_shr_RM_i(pc, r1, offs)  \
    pc = opt_shift_rm(jit_info, r1, offs, emit_b111)

#  define jit_emit_lsr_rr_i(pc, r1, r2)  \
    pc = opt_shift_rr(jit_info, r1, r2, emit_b101)

#  define jit_emit_lsr_RM_i(pc, r1, offs)  \
    pc = opt_shift_rm(jit_info, r1, offs, emit_b101)

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

#    define jit_emit_fload_mb_n(pc, base, offs) \
      emitm_fldl(pc, base, emit_None, 1, offs)

#    define jit_emit_fstore_m_n(pc, address) \
      emitm_fstpl(pc, emit_None, emit_None, emit_None, address)

#    define jit_emit_fstore_mb_n(pc, base, offs) \
      emitm_fstpl(pc, base, emit_None, 1, offs)

#    define jit_emit_fst_mb_n(pc, base, offs) \
      emitm_fstl(pc, base, emit_None, 1, offs)

#  else /* NUMVAL_SIZE */

#    define jit_emit_fload_m_n(pc, address) \
      emitm_fldt(pc, emit_None, emit_None, emit_None, address)

#    define jit_emit_fload_mb_n(pc, base, offs) \
      emitm_fldt(pc, base, emit_None, 1, offs)

#    define jit_emit_fstore_m_n(pc, address) \
      emitm_fstpt(pc, emit_None, emit_None, emit_None, address)

#    define jit_emit_fstore_mb_n(pc, base, offs) \
      emitm_fstpt(pc, base, emit_None, 1, offs)

#    define jit_emit_fst_mb_n(pc, base, offs) \
      emitm_fstt(pc, base, emit_None, 1, offs)

#  endif /* NUMVAL_SIZE */

#  if INTVAL_SIZE == 4

#    define jit_emit_fload_m_i(pc, address) \
      emitm_fildl(pc, emit_None, emit_None, emit_None, address)
#    define jit_emit_fload_mb_i(pc, offs) \
      emitm_fildl(pc, emit_EBX, emit_None, 1, offs)
#    define jit_emit_fstore_m_i(pc, m) \
      emitm_fistpl(pc, emit_None, emit_None, emit_None, m)

#  else /* INTVAL_SIZE */

#    define jit_emit_fload_m_i(pc, address) \
      emitm_fildll(pc, emit_None, emit_None, emit_None, address)
#    define jit_emit_fload_mb_i(pc, offs) \
      emitm_fildll(pc, emit_EBX, emit_None, 1, offs)
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
#  define emitm_fsqrt(pc) { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xfa; }
#  define emitm_fsin(pc) { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xfe; }
#  define emitm_fcos(pc) { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xff; }

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
#  define emitm_faddr(pc, sti) emitm_fl_3(pc, emit_b100, emit_b000, sti)
#  define emitm_fmulr(pc, sti) emitm_fl_3(pc, emit_b100, emit_b001, sti)
#  define emitm_fsubr(pc, sti) emitm_fl_3(pc, emit_b100, emit_b100, sti)

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
/* FADDP Add ST(i) = ST + ST(i); POP  */
#  define emitm_faddp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b000, sti)

/* FMULP Mul ST(i) = ST * ST(i); POP  */
#  define emitm_fmulp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b001, sti)

/* FSUB ST = ST - ST(i) */

/* FSUBRP SubR ST(i) = ST - ST(i); POP  */
#  define emitm_fsubrp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b100, sti)

/* FSUBP Sub ST(i) = ST(i) - ST; POP  */
#  define emitm_fsubp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b101, sti)

/* FDIVRP DivR ST(i) = ST(i) / ST(0); POP  */
#  define emitm_fdivrp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b110, sti)

/* FDIVP Div ST(i) = ST(0) / ST(i); POP ST(0) */
#  define emitm_fdivp(pc, sti) emitm_fl_3(pc, emit_b110, emit_b111, sti)

/* 0xDF OPS: FCOMIP, FUCOMIP PPRO */

/* Negate - called change sign */
#  define emitm_fchs(pc) emitm_fl_4(pc, 0)

/* ABS - ST(0) = ABS(ST(0)) */
#  define emitm_fabs(pc) emitm_fl_4(pc, 1)

/* Comparisons */

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

/* ST -= int32_mem */
#  define emitm_fisub_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b01, 0, emit_b100, b, i, s, d)

#  define emitm_fadd_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b10, 0, emit_b000, b, i, s, d)

/* ST += int32_mem */
#  define emitm_fiadd_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b01, 0, emit_b000, b, i, s, d)

/* ST *= real64 */
#  define emitm_fmul_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b10, 0, emit_b001, b, i, s, d)

/* ST *= int32_mem */
#  define emitm_fimul_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b01, 0, emit_b001, b, i, s, d)

/* ST /= real64 */
#  define emitm_fdiv_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b10, 0, emit_b110, b, i, s, d)

/* ST /= int32_mem */
#  define emitm_fidiv_m(pc,b,i,s,d) \
    emitm_fl_2(pc, emit_b01, 0, emit_b110, b, i, s, d)

/* Ops Needed to support loading EFLAGs for conditional branches */
#  define emitm_fstw(pc) emitm_fl_3(pc, emit_b111, emit_b100, emit_b000)

#  define emitm_sahf(pc) *((pc)++) = (char) 0x9e

/* misc float */
#  define emitm_ftst(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xE4; }
#  define emitm_fprem(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xF8; }
#  define emitm_fprem1(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xF5; }

#  define emitm_fldcw(pc, mem) \
    emitm_fl_2(pc, emit_b00, 1, emit_b101, 0, 0, 0, mem)

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

#    define jit_emit_neg_M_n(pc, mem) { \
       jit_emit_fload_mb_n(pc, emit_EBX, mem); \
       emitm_fchs(pc); \
       jit_emit_fstore_mb_n(pc, emit_EBX, mem); \
     }

#  elif defined(NEG_ZERO_SUB)

#    define jit_emit_neg_r_n(pc, r) { \
       emitm_fldz(pc); \
       emitm_fsubrp(pc, (r+1)); \
     }

#    define jit_emit_neg_M_n(pc, mem) { \
       jit_emit_fload_mb_n(pc, emit_EBX, mem); \
       emitm_fldz(pc); \
       emitm_fsubrp(pc, 1); \
       jit_emit_fstore_mb_n(pc, emit_EBX, mem); \
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

#    define jit_emit_neg_M_n(pc, mem) { \
       jit_emit_fload_mb_n(pc, emit_EBX, mem); \
       emitm_ftst(pc); \
       emitm_fstw(pc); \
       emitm_sahf(pc); \
       emitm_jxs(pc, emitm_jz, 2); \
       emitm_fchs(pc); \
       jit_emit_fstore_mb_n(pc, emit_EBX, mem); \
     }
#  endif

#   define jit_emit_sin_r_n(pc, r) \
     if (r) { \
       emitm_fld(pc, r); \
     } \
     emitm_fsin(pc); \
     if (r) { \
       emitm_fstp(pc, (r+1)); \
     }

#   define jit_emit_cos_r_n(pc, r) \
     if (r) { \
       emitm_fld(pc, r); \
     } \
     emitm_fcos(pc); \
     if (r) { \
       emitm_fstp(pc, (r+1)); \
     }

#   define jit_emit_sqrt_r_n(pc, r) \
     if (r) { \
       emitm_fld(pc, r); \
     } \
     emitm_fsqrt(pc); \
     if (r) { \
       emitm_fstp(pc, (r+1)); \
     }

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

/* Integer comparisons */
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

/* set byte conditional */
#define jit_emit_setcc_r(pc, cc, r) \
    *pc++ = 0x0f; \
    *pc++ = 0x90 + cc; \
    *pc++ = (char) emit_alu_X_r(0, r) 

/*
 * core.jit interface
 *
 * The new offset based versions have uppercase RM or MR inside
 * That's probably only during transition time
 */

#  define jit_emit_mov_mi_i(pc, dest, immediate) \
    emitm_movl_i_m(pc, immediate, emit_None, emit_None, emit_None, dest)

#  define jit_emit_mov_MI_i(pc, offs, immediate) \
    emitm_movl_i_m(pc, immediate, emit_EBX, emit_None, 1, offs)

#  define jit_emit_mov_rm_i(pc, reg, address) \
    emitm_movl_m_r(pc, reg, emit_None, emit_None, emit_None, address)

#  define jit_emit_mov_RM_i(pc, reg, offs) \
    emitm_movl_m_r(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_mov_mr_i(pc, address, reg) \
    emitm_movl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#  define jit_emit_mov_MR_i(pc, offs, reg) \
    emitm_movl_r_m(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_mul_RM_i(pc, reg, offs) \
    emitm_smull_r_m(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_sub_RM_i(pc, reg, offs) \
    emitm_subl_m_r(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_sub_MR_i(pc, offs, reg) \
    emitm_subl_r_m(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_sub_MI_i(pc, offs, imm) \
    emitm_subl_i_m(pc, imm, emit_EBX, emit_None, 1, offs)

#  define jit_emit_add_RM_i(pc, reg, offs) \
    emitm_addl_m_r(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_add_MR_i(pc, offs, reg) \
    emitm_addl_r_m(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_add_MI_i(pc, offs, imm) \
    emitm_addl_i_m(pc, imm, emit_EBX, emit_None, 1, offs)

#  define jit_emit_cmp_rm_i(pc, reg, address) \
    emitm_cmpl_r_m(pc, reg, emit_None, emit_None, emit_None, address)

#  define jit_emit_cmp_RM_i(pc, reg, offs) \
    emitm_cmpl_r_m(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_cmp_MR_i(pc, offs, reg) \
    emitm_cmpl_m_r(pc, reg, emit_EBX, emit_None, 1, offs)


/* high level routines, behave like real 2 register FP */

/* mapped float registers numbers are ST(1)-ST(4).
 * scratch register is ST(0)
 */

/* ST(i) <- numvar */
#  define jit_emit_mov_RM_n(pc, r, d) { \
    jit_emit_fload_mb_n((pc), emit_EBX, d); \
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

/* ST(i) <= INT_REG */
#  define jit_emit_mov_RM_ni(pc, r, i) { \
    jit_emit_fload_mb_i(pc, i); \
    emitm_fstp((pc), (r+1)); \
}

/* NUM_REG(i) <= &INT_CONST
 * the int const i is loaded from the code memory
 */
#  define jit_emit_mov_MI_ni(pc, offs, i) { \
    jit_emit_fload_m_i(pc, i); \
    jit_emit_fstore_mb_n(pc, emit_EBX, offs); \
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

#  define jit_emit_mov_MR_n(pc, d, r) { \
    if (r) { \
        emitm_fld((pc), r); \
        jit_emit_fstore_mb_n((pc), emit_EBX, d); \
    } \
    else { \
        jit_emit_fst_mb_n((pc), emit_EBX, d); \
    } \
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

#  define jit_emit_xchg_RM_n(pc, r, offs) { \
    emitm_fld((pc), r); \
    jit_emit_fload_mb_n(pc, emit_EBX, offs); \
    emitm_fstp((pc), (r+2)); \
    jit_emit_fstore_mb_n(pc, emit_EBX, offs); \
}

#  define jit_emit_xchg_MR_n(pc, offs, r) { \
    emitm_fld((pc), r); \
    jit_emit_fload_mb_n(pc, emit_EBX, offs); \
    emitm_fstp((pc), (r+2)); \
    jit_emit_fstore_mb_n(pc, emit_EBX, offs); \
}


#  define jit_emit_finit(pc) { *((pc)++) = (char) 0xdb; *((pc)++) = (char) 0xe3; }

/* ST(i) op= MEM */

#  define jit_emit_xxx_rm_n(op, pc, r, m) { \
    jit_emit_fload_m_n(pc, m); \
    emitm_f ## op ## p(pc, (r+1)); \
}

#  define jit_emit_xxx_RM_n(op, pc, r, offs) { \
    jit_emit_fload_mb_n(pc, emit_EBX, offs); \
    emitm_f ## op ## p(pc, (r+1)); \
}

/*
 * float ops in two flavors: abs memory for constants, offsets for regs
 */

#  define jit_emit_add_ri_n(pc, r, m) jit_emit_xxx_rm_n(add, pc, r, m)
#  define jit_emit_sub_ri_n(pc, r, m) jit_emit_xxx_rm_n(sub, pc, r, m)
#  define jit_emit_mul_ri_n(pc, r, m) jit_emit_xxx_rm_n(mul, pc, r, m)

#  define jit_emit_add_RM_n(pc, r, o) jit_emit_xxx_RM_n(add, pc, r, o)
#  define jit_emit_sub_RM_n(pc, r, o) jit_emit_xxx_RM_n(sub, pc, r, o)
#  define jit_emit_mul_RM_n(pc, r, o) jit_emit_xxx_RM_n(mul, pc, r, o)


/* ST(r1) += ST(r2) */
/* r1 == 0:  ST(0) <- ST(0) + ST(i) 
 * r2 == 0:  ST(i) <- ST(0) + ST(i)
 */
#  define jit_emit_add_rr_n(pc, r1, r2) do { \
        if (!r1) { \
          emitm_fadd(pc, r2); \
        }  \
        else if (!r2) { \
          emitm_faddr(pc, r1); \
        }  \
        else { \
            emitm_fld(pc, r2); \
            emitm_faddp(pc, (r1+1)); \
        } \
    } \
    while (0)
/*
 * ST(r) += INT_REG
 */
#  define jit_emit_add_RM_ni(pc, r, offs) { \
    emitm_fld(pc, r); \
    emitm_fiadd_m(pc, emit_EBX, 0, 1, offs); \
    emitm_fstp(pc, (r+1)); \
}

/* ST(r1) -= ST(r2) */
/* r1 == 0:  ST(0) <- ST(0) - ST(i) 
 * r2 == 0:  ST(i) <- ST(i) - ST(0)
 */
#  define jit_emit_sub_rr_n(pc, r1, r2) do { \
        if (!r1) { \
          emitm_fsub(pc, r2); \
        }  \
        else if (!r2) { \
          emitm_fsubr(pc, r1); \
        }  \
        else { \
            emitm_fld(pc, r2); \
            emitm_fsubp(pc, (r1+1)); \
        } \
    } \
    while (0)

/*
 * ST(r) -= INT_REG
 */
#  define jit_emit_sub_RM_ni(pc, r, offs) { \
    emitm_fld(pc, r); \
    emitm_fisub_m(pc, emit_EBX, 0, 1, offs); \
    emitm_fstp(pc, (r+1)); \
}

#  define jit_emit_inc_r_n(pc, r) { \
    emitm_fld1(pc); \
    emitm_faddp(pc, (r+1)); \
}

#  define jit_emit_dec_r_n(pc, r) { \
    emitm_fld1(pc); \
    emitm_fsubp(pc, (r+1)); \
}

/* ST(r1) *= ST(r2) */
/* r1 == 0:  ST(0) <- ST(0) * ST(i) 
 * r2 == 0:  ST(i) <- ST(0) * ST(i)
 */
#  define jit_emit_mul_rr_n(pc, r1, r2) do { \
        if (!r1) { \
          emitm_fmul(pc, r2); \
        }  \
        else if (!r2) { \
          emitm_fmulr(pc, r1); \
        }  \
        else { \
            emitm_fld(pc, r2); \
            emitm_fmulp(pc, (r1+1)); \
        } \
    } \
    while (0)

/*
 * ST(r) *= INT_REG
 */
#  define jit_emit_mul_RM_ni(pc, r, offs) { \
    emitm_fld(pc, r); \
    emitm_fimul_m(pc, emit_EBX, 0, 1, offs); \
    emitm_fstp(pc, (r+1)); \
}

/*
 * ST(r) /= INT_REG
 */
#  define jit_emit_div_RM_ni(pc, r, offs) { \
    emitm_fld(pc, r); \
    emitm_fidiv_m(pc, emit_EBX, 0, 1, offs); \
    emitm_fstp(pc, (r+1)); \
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

/* ST(r1) /= ST(r2) */
static char *
div_rr_n(Parrot_jit_info_t *jit_info, int r1)
{
    char *L1;
    static const char* div_by_zero = "Divide by zero";
    char *pc = jit_info->native_ptr;

    jit_emit_test_r_n(pc, (char)0);   /* TOS */
    L1 = pc;
    emitm_jxs(pc, emitm_jnz, 0);
    emitm_pushl_i(pc, div_by_zero);
    emitm_pushl_i(pc, E_ZeroDivisionError);
    emitm_pushl_i(pc, 0);    /* NULL */
    Parrot_jit_emit_get_INTERP(pc, emit_ECX);
    emitm_pushl_r(pc, emit_ECX);
    jit_info->native_ptr = pc;
    call_func(jit_info, (void*) real_exception);
    pc = jit_info->native_ptr;
    /* L1: */
    L1[1] = pc - L1 - 2;
    emitm_fdivp(pc, (r1+1)); 
    return pc;
}

#  define jit_emit_div_rr_n(pc, r1, r2) \
    emitm_fld(pc, r2); \
    jit_info->native_ptr = pc; \
    pc = div_rr_n(jit_info, r1)

#  define jit_emit_div_ri_n(pc, r, m) \
    jit_emit_fload_m_n(pc, m); \
    jit_info->native_ptr = pc; \
    pc = div_rr_n(jit_info, r)

#  define jit_emit_div_RM_n(pc, r, o) \
    jit_emit_fload_mb_n(pc, emit_EBX, o); \
    jit_info->native_ptr = pc; \
    pc = div_rr_n(jit_info, r)

static char *
mod_rr_n(Parrot_jit_info_t *jit_info, int r)
{
    char *L1;
    static const char* div_by_zero = "Divide by zero";
    char *pc = jit_info->native_ptr;

    jit_emit_test_r_n(pc, (char)0);   /* TOS */
    L1 = pc;
    emitm_jxs(pc, emitm_jnz, 0);
    emitm_pushl_i(pc, div_by_zero);
    emitm_pushl_i(pc, E_ZeroDivisionError);
    emitm_pushl_i(pc, 0);    /* NULL */
    Parrot_jit_emit_get_INTERP(pc, emit_ECX);
    emitm_pushl_r(pc, emit_ECX);
    jit_info->native_ptr = pc;
    call_func(jit_info, (void*) real_exception);
    pc = jit_info->native_ptr;
    /* L1: */
    L1[1] = pc - L1 - 2;
    /* L2: */
    emitm_fxch(pc, (char)1); 
    emitm_fprem(pc); 
    emitm_fstw(pc); 
    emitm_sahf(pc);
    emitm_jxs(pc, emitm_jp, -7); /* jo L2 */
    emitm_fstp(pc, (r+1)); 
    return pc;
}

/* ST(i) %= MEM
 * please note the hardccded jumps */
#  define jit_emit_cmod_RM_n(pc, r, offs)  \
    if (r)  \
      emitm_fxch(pc, r); \
    jit_emit_fload_mb_n(pc, emit_EBX, offs); \
    pc = mod_rr_n(jit_info, r)

#  define jit_emit_cmod_ri_n(pc, r, mem)  \
    if (r)  \
      emitm_fxch(pc, r); \
    jit_emit_fload_m_n(pc, mem); \
    pc = mod_rr_n(jit_info, r)

/* ST(r1) %= ST(r2) */
#  define jit_emit_cmod_rr_n(pc, r1, r2)  \
    if (r1)  \
      emitm_fxch(pc, r1); \
    emitm_fld(pc, r2); \
    pc = mod_rr_n(jit_info, r1)

/* compare ST(r) <-> mem i.e. constant */
#  define jit_emit_cmp_ri_n(pc, r, mem) { \
    jit_emit_fload_m_n(pc, mem); \
    emitm_fld(pc, (r+1)); \
    emitm_fcompp(pc); \
    emitm_fstw(pc); \
    emitm_sahf(pc); \
}

#  define jit_emit_cmp_RM_n(pc, r, offs) { \
    jit_emit_fload_mb_n(pc, emit_EBX, offs); \
    emitm_fld(pc, (r+1)); \
    emitm_fcompp(pc); \
    emitm_fstw(pc); \
    emitm_sahf(pc); \
}


/* compare mem <-> ST(r) */
#  define jit_emit_cmp_mi_n(pc, mem, r) { \
    jit_emit_fload_m_n(pc, mem); \
    emitm_fcomip(pc, (r+1)); \
}

#  define jit_emit_cmp_MR_n(pc, offs, r) { \
    jit_emit_fload_mb_n(pc, emit_EBX, offs); \
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


#  define jit_emit_neg_M_i(pc, offs) \
    emitm_negl_m(pc, emit_EBX, emit_None, 1, (long)offs)

#  define jit_emit_band_MR_i(pc, offs, reg) \
    emitm_andl_r_m(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_band_RM_i(pc, reg, offs) \
    emitm_andl_m_r(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_band_MI_i(pc, offs, imm) \
    emitm_andl_i_m(pc, imm, emit_EBX, emit_None, 1, offs)

#  define jit_emit_bor_MR_i(pc, offs, reg) \
    emitm_orl_r_m(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_bor_RM_i(pc, reg, offs) \
    emitm_orl_m_r(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_bor_MI_i(pc, offs, imm) \
    emitm_orl_i_m(pc, imm, emit_EBX, emit_None, 1, offs)

#  define jit_emit_bxor_MR_i(pc, offs, reg) \
    emitm_xorl_r_m(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_bxor_RM_i(pc, reg, offs) \
    emitm_xorl_m_r(pc, reg, emit_EBX, emit_None, 1, offs)

#  define jit_emit_bxor_MI_i(pc, offs, imm) \
    emitm_xorl_i_m(pc, imm, emit_EBX, emit_None, 1, offs)

/* dest /= src
 * edx:eax /= src, quotient => eax, rem => edx
 */
static char *
opt_div_rr(Parrot_jit_info_t *jit_info, int dest, int src, int is_div)
{
    char *pc = jit_info->native_ptr;
    int saved = 0;
    int div_ecx = 0;
    char *L1, *L2, *L3;
    static const char* div_by_zero = "Divide by zero";

    assert(src != emit_EAX);

    if (dest != emit_EAX) {
        jit_emit_mov_rr_i(pc, emit_EAX, dest);
    }
    if (dest == emit_EDX) {
        /* all ok, we can globber it */
    }
    else {
        /* if ECX is not mapped use it */
        if (!intreg_is_used(jit_info, emit_ECX) && src == emit_EDX) {
            jit_emit_mov_rr_i(pc, emit_ECX, emit_EDX);
            div_ecx = 1;
        }
        else
            /* if EDX is mapped, preserve EDX on stack */
            if (intreg_is_used(jit_info, emit_EDX)) {
                emitm_pushl_r(pc, emit_EDX);
                saved = 1;
                /* if EDX is the src, we need another temp register: ECX */
                if (src == emit_EDX) {
                    /* if ECX is mapped save it, but not if it's dest */
                    if (intreg_is_used(jit_info, emit_ECX) && 
                            dest != emit_ECX) {
                        emitm_pushl_r(pc, emit_ECX);
                        saved = 2;
                    }
                    /* else just use it */
                    jit_emit_mov_rr_i(pc, emit_ECX, emit_EDX);
                    div_ecx = 1;
                }
            }
    }
#  if 0
    jit_emit_cdq(pc);
#  else
    /* this sequence allows 2 other instructions to run parallel */
    if (dest != emit_EDX) {
        jit_emit_mov_rr_i(pc, emit_EDX, emit_EAX);
    }
    pc = emit_shift_i_r(pc, emit_b111, 31, emit_EDX); /* SAR 31 */
#  endif
    if (div_ecx) {
        jit_emit_test_r_i(pc, emit_ECX);
        L1 = pc;
        emitm_jxs(pc, emitm_jz, 0);
        emitm_sdivl_r(pc, emit_ECX);
        L3 = pc;
        emitm_jumps(pc, 0);
        /* L1: */
        L1[1] = pc - L1 - 2;
    }
    else {
        jit_emit_test_r_i(pc, src);
        L2 = pc;
        emitm_jxs(pc, emitm_jz, 0);
        emitm_sdivl_r(pc, src);
        L3 = pc;
        emitm_jumps(pc, 0);
        /* L2: */
        L2[1] = pc - L2 - 2;
    }
    /* TODO real_exception */
    emitm_pushl_i(pc, div_by_zero);
    emitm_pushl_i(pc, E_ZeroDivisionError);
    emitm_pushl_i(pc, 0);    /* NULL */
    Parrot_jit_emit_get_INTERP(pc, emit_ECX);
    emitm_pushl_r(pc, emit_ECX);
    jit_info->native_ptr = pc;
    call_func(jit_info, (void*) real_exception);
    pc = jit_info->native_ptr;
    /* L3: */
    L3[1] = pc - L3 - 2;
    if (saved == 2) {
        emitm_popl_r(pc, emit_ECX);
    }
    if (is_div) {
        /* result = quotient in EAX */
        if (saved) {
            emitm_popl_r(pc, emit_EDX);
        }
        if (dest != emit_EAX) {
            jit_emit_mov_rr_i(pc, dest, emit_EAX);
        }
    }
    else {
        /* result = remainder in EDX */
        if (saved) {
            emitm_popl_r(pc, emit_EAX);
            jit_emit_mov_rr_i(pc, dest, emit_EDX);
            jit_emit_mov_rr_i(pc, emit_EDX, emit_EAX);
        }
        else {
            if (dest != emit_EDX)
                jit_emit_mov_rr_i(pc, dest, emit_EDX);
        }
    }
    if (!saved && div_ecx) {
        /* restore EDX */
        jit_emit_mov_rr_i(pc, emit_EDX, emit_ECX);
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
opt_div_RM(Parrot_jit_info_t *jit_info, int dest, int offs, int is_div)
{
    char *pc = jit_info->native_ptr;
    int saved = 0;
    extern PARROT_API char **Parrot_exec_rel_addr;
    extern PARROT_API int Parrot_exec_rel_count;

    if (dest != emit_EAX) {
        jit_emit_mov_rr_i(pc, emit_EAX, dest);
    }
    if (dest == emit_EDX) {
        /* all ok, we can globber it */
    }
    else {
        /* if ECX is mapped, push EDX on stack */
        if (intreg_is_used(jit_info, emit_ECX)) {
            emitm_pushl_r(pc, emit_EDX);
            saved = 2;
        }
        /* if EDX is mapped, save it in ECX */
        else if (intreg_is_used(jit_info, emit_EDX)) {
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
    emitm_sdivl_m(pc, emit_EBX, 0, 1, offs);

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
#  define jit_emit_div_RM_i(pc, r, m)  pc = opt_div_RM(jit_info, r, m, 1)
#  define jit_emit_cmod_RM_i(pc, r, m) pc = opt_div_RM(jit_info, r, m, 0)

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
            emitm_jumps(jit_info->native_ptr, (char)(offset - 2));
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
                   Interp * interpreter)
{
    extern PARROT_API char **Parrot_exec_rel_addr;
    extern PARROT_API int Parrot_exec_rel_count;

    /* we have to get the code pointer, which might change
     * due too intersegment branches
     */

    /* get interpreter
     */
    emitm_movl_m_r(jit_info->native_ptr,
            emit_EBX, emit_EBP, emit_None, 1, INTERP_BP_OFFS);
    if (!jit_info->objfile) {
        /* 
         * emit interpreter->code->base.data
         */
        emitm_movl_m_r(jit_info->native_ptr, emit_ECX, emit_EBX, 0, 1,
                offsetof(Interp, code));
        emitm_movl_m_r(jit_info->native_ptr, emit_EDX, emit_ECX, 0, 1,
                offsetof(struct PackFile_Segment, data));
        /* calc code offset */
        jit_emit_sub_rr_i(jit_info->native_ptr, emit_EAX, emit_EDX);
        /*
         * now we have the offset of the ins in EAX
         *
         * interpreter->code->jit_info->arena->op_map
         *
         * TODO interleave these 2 calculations
         */
        emitm_movl_m_r(jit_info->native_ptr, emit_EDX, emit_ECX, 0, 1,
                offsetof(struct PackFile_ByteCode, jit_info));
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
    /* get base pointer */
    emitm_movl_m_r(jit_info->native_ptr, emit_EBX, emit_EBX, 0, 1,
            offsetof(Interp, ctx.bp));

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



static void call_func(Parrot_jit_info_t *jit_info, void *addr)
{
    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_X86CALL;
    jit_info->arena.fixups->param.fptr = D2FPTR(addr);
    emitm_calll(jit_info->native_ptr, 0xdeafc0de);
}


#  if JIT_VTABLE_OPS

#    undef Parrot_jit_vtable1_op
#    undef Parrot_jit_vtable1r_op

#    undef Parrot_jit_vtable_111_op
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

#include "parrot/oplib/ops.h"
INTVAL Parrot_FixedIntegerArray_get_integer_keyed_int(Interp*, PMC*, INTVAL);
void Parrot_FixedIntegerArray_set_integer_keyed_int(Interp*,PMC*,INTVAL,INTVAL);
#define ROFFS_PMC(x) REG_OFFS_PMC(jit_info->cur_op[x])
#define ROFFS_INT(x) REG_OFFS_INT(jit_info->cur_op[x])
#define NATIVECODE jit_info->native_ptr

static char*
jit_set_i_p_ki(Parrot_jit_info_t *jit_info, Interp* interpreter, size_t offset)
{
    char *L1, *L2, *L3, *L4;
    /*
     * mov $2, %edi
     * mov (vtable)%edi, %eax
     * mov (offset)%eax, %esi
     * cmp Parrot_FixedIntegerArray_get_integer_keyed_int, %esi
     * jne L1
     */
    jit_emit_mov_RM_i(NATIVECODE, emit_EDI, ROFFS_PMC(2));
    emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EDI, emit_None, 1,
            offsetof(struct PMC, vtable));
    emitm_movl_m_r(NATIVECODE, emit_ESI, emit_EAX, emit_None, 1, offset);
    jit_emit_cmp_ri_i(NATIVECODE, emit_ESI,
            Parrot_FixedIntegerArray_get_integer_keyed_int);
    L1 = NATIVECODE;
    emitm_jxs(NATIVECODE, emitm_jnz, 0);
    /*
     * mov $3, %ecx
     * cmp %ecx, 0
     * js L2
     * mov (int_val)%edi, %eax
     * cmp %ecx, $eax
     * jge L3
     *
     */
    if (MAP(3)) {
        jit_emit_mov_rr_i(NATIVECODE, emit_ECX, MAP(3));
    }
    else {
        jit_emit_mov_RM_i(NATIVECODE, emit_ECX, ROFFS_INT(3));
    }
    /*  range check */
    jit_emit_cmp_ri_i(NATIVECODE, emit_ECX, 0);
    L2 = NATIVECODE;
    emitm_jxs(NATIVECODE, emitm_js, 0);
    emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EDI, 0, 1,
            offsetof(struct pobj_t, u._i._int_val));
    jit_emit_cmp_rr_i(NATIVECODE, emit_ECX, emit_EAX);
    L3 = NATIVECODE;
    emitm_jxs(NATIVECODE, emitm_jnl, 0);

    /*
     * mov (pmc_ext)%edi, %eax
     * mov (data)%eax, %eax
     * mov (%eax, %ecx, 4), %eax
     * jmp L4
     */
#  if ! PMC_DATA_IN_EXT
#error "todo"
#else
    emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EDI, 0, 1,
            offsetof(struct PMC, pmc_ext));
    emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EAX, 0, 1,
            offsetof(struct PMC_EXT, data));
#endif
    emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EAX, emit_ECX, 4, 0);

    L4 = NATIVECODE;
    emitm_jumps(NATIVECODE, 0);
    /* L1: L2: L3: */
    L1[1] = NATIVECODE - L1 - 2;
    L2[1] = NATIVECODE - L2 - 2;
    L3[1] = NATIVECODE - L3 - 2;
    return L4;
}

static char*
jit_set_p_ki_i(Parrot_jit_info_t *jit_info, Interp* interpreter, size_t offset)
{
    char *L1, *L2, *L3, *L4;
    /*
     * mov $1, %edi
     * mov (vtable)%edi, %eax
     * mov (offset)%eax, %esi
     * cmp Parrot_FixedIntegerArray_set_integer_keyed_int, %esi
     * jne L1
     */
    jit_emit_mov_RM_i(NATIVECODE, emit_EDI, ROFFS_PMC(1));
    emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EDI, emit_None, 1,
            offsetof(struct PMC, vtable));
    emitm_movl_m_r(NATIVECODE, emit_ESI, emit_EAX, emit_None, 1, offset);
    jit_emit_cmp_ri_i(NATIVECODE, emit_ESI,
            Parrot_FixedIntegerArray_set_integer_keyed_int);
    L1 = NATIVECODE;
    emitm_jxs(NATIVECODE, emitm_jnz, 0);
    /*
     * mov $2, %ecx
     * cmp %ecx, 0
     * js L2
     * mov (int_val)%edi, %eax
     * cmp %ecx, $eax
     * jge L3
     *
     */
    if (MAP(2)) {
        jit_emit_mov_rr_i(NATIVECODE, emit_ECX, MAP(2));
    }
    else {
        jit_emit_mov_RM_i(NATIVECODE, emit_ECX, ROFFS_INT(2));
    }
    /*  range check */
    jit_emit_cmp_ri_i(NATIVECODE, emit_ECX, 0);
    L2 = NATIVECODE;
    emitm_jxs(NATIVECODE, emitm_js, 0);
    emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EDI, 0, 1,
            offsetof(struct pobj_t, u._i._int_val));
    jit_emit_cmp_rr_i(NATIVECODE, emit_ECX, emit_EAX);
    L3 = NATIVECODE;
    emitm_jxs(NATIVECODE, emitm_jnl, 0);

    /*
     * mov (pmc_ext)%edi, %eax
     * mov (data)%eax, %eax
     * mov $3, %edx
     * mov $edx, (%eax, %ecx, 4)
     * jmp L4
     */
#  if ! PMC_DATA_IN_EXT
#error "todo"
#else
    emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EDI, 0, 1,
            offsetof(struct PMC, pmc_ext));
    emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EAX, 0, 1,
            offsetof(struct PMC_EXT, data));
#endif
    if (MAP(3)) {
        jit_emit_mov_rr_i(NATIVECODE, emit_EDX, MAP(3));
    }
    else {
        jit_emit_mov_RM_i(NATIVECODE, emit_EDX, ROFFS_INT(3));
    }
    emitm_movl_r_m(NATIVECODE, emit_EDX, emit_EAX, emit_ECX, 4, 0);

    L4 = NATIVECODE;
    emitm_jumps(NATIVECODE, 0);
    /* L1: L2: L3: */
    L1[1] = NATIVECODE - L1 - 2;
    L2[1] = NATIVECODE - L2 - 2;
    L3[1] = NATIVECODE - L3 - 2;
    return L4;
}

#undef ROFFS_PMC
#undef ROFFS_INT
#undef NATIVECODE

/*
 * for vtable calls registers are already saved back
 */
static void
Parrot_jit_vtable_n_op(Parrot_jit_info_t *jit_info,
                Interp * interpreter, int n, int *args)
{
    int nvtable = op_jit[*jit_info->cur_op].extcall;
    size_t offset;
    op_info_t *op_info = &interpreter->op_info_table[*jit_info->cur_op];
    int pi;
    int idx, i, op;
    int st = 0;         /* stack pop correction */
    extern PARROT_API char **Parrot_exec_rel_addr;
    extern PARROT_API int Parrot_exec_rel_count;

    char *L4 = NULL;

    /* get the offset of the first vtable func */
    offset = offsetof(struct _vtable, init);
    offset += nvtable * sizeof(void *);
    op = *jit_info->cur_op;
    if (op == PARROT_OP_set_i_p_ki) {
        L4 = jit_set_i_p_ki(jit_info,  interpreter, offset);
    }
    else if (op == PARROT_OP_set_p_ki_i) {
        L4 = jit_set_p_ki_i(jit_info,  interpreter, offset);
    }
    /* get params $i, 0 is opcode */
    for (idx = n; idx > 0; idx--) {
        i = args[idx-1];
        pi = *(jit_info->cur_op + i);
        switch (op_info->types[i - 1]) {
            case PARROT_ARG_S:
                emitm_movl_m_r(jit_info->native_ptr,
                        emit_EAX, emit_EBX, emit_None, 1, REG_OFFS_STR(pi));
                emitm_pushl_r(jit_info->native_ptr, emit_EAX);
                break;
            case PARROT_ARG_K:
            case PARROT_ARG_P:
                emitm_movl_m_r(jit_info->native_ptr,
                        emit_EAX, emit_EBX, emit_None, 1, REG_OFFS_PMC(pi));
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
                    emitm_movl_m_r(jit_info->native_ptr,
                            emit_EAX, emit_EBX, emit_None, 1, REG_OFFS_INT(pi));
                    emitm_pushl_r(jit_info->native_ptr, emit_EAX);
                }
                break;
                break;
            case PARROT_ARG_KIC:
            case PARROT_ARG_IC:
                /* XXX INTVAL_SIZE */
                /* push value */
                emitm_pushl_i(jit_info->native_ptr, pi);
                break;
            case PARROT_ARG_N:
                /* push num on st(0) */
                if (MAP(i)) {
                    emitm_fld(jit_info->native_ptr, MAP(i));
                }
                else
                    jit_emit_fload_mb_n(jit_info->native_ptr,
                            emit_EBX, REG_OFFS_NUM(pi));
                goto store;
            case PARROT_ARG_NC:
                /*
                 * TODO not all constants are shared between interpreters
                 */
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
                            constants[pi]->u.number);
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
                            constants[pi]->u.string);
                break;

            case PARROT_ARG_KC:
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
                            constants[pi]->u.key);
                break;

            default:
                internal_exception(1,
                        "jit_vtable_n_op: unimp type %d, arg %d vtable %d",
                        op_info->types[i - 1], i, nvtable);
                break;
        }
    }
    /* push interpreter */
    Parrot_jit_emit_get_INTERP(jit_info->native_ptr, emit_ECX);
    emitm_pushl_r(jit_info->native_ptr, emit_ECX);
    if (L4) {
        emitm_callr(jit_info->native_ptr, emit_ESI);
    }
    else {
        /* mov (offs)%eax, %eax i.e. $1->vtable */
        emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EAX, emit_None, 1,
                offsetof(struct PMC, vtable));
        /* call *(offset)eax */
        emitm_callm(jit_info->native_ptr, emit_EAX, emit_None, emit_None, offset);
    }
    emitm_addb_i_r(jit_info->native_ptr,
            st + sizeof(void *) * (n + 1), emit_ESP);
    /* L4: */
    if (L4)
        L4[1] = jit_info->native_ptr - L4 - 2;
}
static void
Parrot_jit_store_retval(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    op_info_t *op_info = &interpreter->op_info_table[*jit_info->cur_op];
    int p1 = *(jit_info->cur_op + 1);

    /* return result is in EAX or ST(0) */
    switch (op_info->types[0]) {
        case PARROT_ARG_I:
            emitm_movl_r_m(jit_info->native_ptr,
                    emit_EAX, emit_EBX, emit_None, 1, REG_OFFS_INT(p1));
            break;
        case PARROT_ARG_S:
            emitm_movl_r_m(jit_info->native_ptr,
                    emit_EAX, emit_EBX, emit_None, 1, REG_OFFS_STR(p1));
            break;
        case PARROT_ARG_P:
            emitm_movl_r_m(jit_info->native_ptr,
                    emit_EAX, emit_EBX, emit_None, 1, REG_OFFS_PMC(p1));
            break;
        case PARROT_ARG_N:
            jit_emit_fstore_mb_n(jit_info->native_ptr, emit_EBX,
                    REG_OFFS_NUM(p1));
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
                     Interp * interpreter)
{
    int a[] = { 1 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 1, a);
}

/* emit a call to a vtable func
 * $1 = $2->vtable(interp, $2)
 */
static void
Parrot_jit_vtable1r_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    int a[] = { 2 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 1, a);
    Parrot_jit_store_retval(jit_info, interpreter);
}


/* emit a call to a vtable func
 * $1 = $2->vtable(interp, $2, $3)
 */
static void
Parrot_jit_vtable_1r223_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    int a[] = { 2 , 3};
    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, a);
    Parrot_jit_store_retval(jit_info, interpreter);
}

/* emit a call to a vtable func
 * $1 = $3->vtable(interp, $3, $2)
 */
static void
Parrot_jit_vtable_1r332_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    int a[] = { 3 , 2};
    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, a);
    Parrot_jit_store_retval(jit_info, interpreter);
}
/* emit a call to a vtable func
 * $1->vtable(interp, $1, $2)
 */
static void
Parrot_jit_vtable_112_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    int a[] = { 1, 2 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, a);
}

/* emit a call to a vtable func
 * $1->vtable(interp, $1, $1)
 */
static void
Parrot_jit_vtable_111_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    int a[] = { 1, 1 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, a);
}
/* emit a call to a vtable func
 * $2->vtable(interp, $2, $1)
 */
static void
Parrot_jit_vtable_221_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    int a[] = { 2, 1 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 2, a);
}

/* emit a call to a vtable func
 * $2->vtable(interp, $2, $3, $1)
 */
static void
Parrot_jit_vtable_2231_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    int a[] = { 2, 3, 1 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 3, a);
}

/* emit a call to a vtable func
 * $1->vtable(interp, $1, $2, $3)
 */
static void
Parrot_jit_vtable_1123_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    int a[] = { 1, 2, 3 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 3, a);
}

/* emit a call to a vtable func
 * $1->vtable(interp, $1, $2, $1)
 */
static void
Parrot_jit_vtable_1121_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    int a[] = { 1, 2, 1 };
    Parrot_jit_vtable_n_op(jit_info, interpreter, 3, a);
}


/* if_p_ic, unless_p_ic */
static void
Parrot_jit_vtable_if_unless_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter, int unless)
{
    int ic = *(jit_info->cur_op + 2);   /* branch offset */

    /* emit call  vtable function i.e. get_bool, result eax */
    Parrot_jit_vtable1_op(jit_info, interpreter);
    /* test result */
    jit_emit_test_r_i(jit_info->native_ptr, emit_EAX);
    jit_emit_jcc(jit_info, unless ? emitm_jz : emitm_jnz, ic);
}

/* unless_p_ic */
static void
Parrot_jit_vtable_unlessp_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    Parrot_jit_vtable_if_unless_op(jit_info, interpreter, 1);
}

/* if_p_ic */
static void
Parrot_jit_vtable_ifp_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    Parrot_jit_vtable_if_unless_op(jit_info, interpreter, 0);
}

/* new_p_ic */
static void
Parrot_jit_vtable_newp_ic_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    int p1, i2;
    op_info_t *op_info = &interpreter->op_info_table[*jit_info->cur_op];
    size_t offset = offsetof(struct _vtable, init);
    extern PARROT_API char **Parrot_exec_rel_addr;
    extern PARROT_API int Parrot_exec_rel_count;

    assert(op_info->types[0] == PARROT_ARG_P);
    p1 = *(jit_info->cur_op + 1);
    i2 = *(jit_info->cur_op + 2);
    if (i2 <= 0 || i2 >= interpreter->n_vtable_max)
        internal_exception(1, "Illegal PMC enum (%d) in new", i2);
    /* get interpreter */
    Parrot_jit_emit_get_INTERP(jit_info->native_ptr, emit_ECX);
    /* push pmc enum and interpreter */
    emitm_pushl_i(jit_info->native_ptr, i2);
    emitm_pushl_r(jit_info->native_ptr, emit_ECX);
#    if EXEC_CAPABLE
    if (jit_info->objfile) {
        CALL("pmc_new_noinit");
    }
    else
#    endif
    {
        call_func(jit_info, (void (*)(void))pmc_new_noinit);
    }
    /* result = eax push pmc */
    emitm_pushl_r(jit_info->native_ptr, emit_EAX);
    /* store in PMC too */
    emitm_movl_r_m(jit_info->native_ptr,
            emit_EAX, emit_EBX, emit_None, 1, REG_OFFS_PMC(p1));
    /* push interpreter */
    Parrot_jit_emit_get_INTERP(jit_info->native_ptr, emit_ECX);
    emitm_pushl_r(jit_info->native_ptr, emit_ECX);
    /* mov (offs)%eax, %eax i.e. $1->vtable */
    emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EAX, emit_None, 1,
            offsetof(struct PMC, vtable));
    /* call *(offset)eax */
    emitm_callm(jit_info->native_ptr, emit_EAX, emit_None, emit_None, offset);
    /* adjust 4 args pushed */
    emitm_addb_i_r(jit_info->native_ptr, 16, emit_ESP);
}

#    undef IREG
#    undef NREG
#    undef SREG
#    undef PREG
#    undef CONST
#    undef CALL

#  endif /* JIT_VTABLE_OPS */

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
       emitm_popl_r(pc, emit_ESI); \
       emitm_popl_r(pc, emit_EBX); \
       emitm_popl_r(pc, emit_EBP); \
       emitm_ret(pc); \
     }

#  endif /* JIT_CGP */

#define NATIVECODE jit_info->native_ptr
#define CUR_OPCODE jit_info->cur_op
#define CONST(i) PCONST(jit_info->cur_op[i])
static void
jit_get_params_pc(Parrot_jit_info_t *jit_info, Interp * interpreter)
{
    PMC *sig_pmc;
    INTVAL *sig_bits, i, n;

    sig_pmc = CONTEXT(interpreter->ctx)->constants[CUR_OPCODE[1]]->u.key;
    sig_bits = SIG_ARRAY(sig_pmc);
    n = SIG_ELEMS(sig_pmc);
    jit_info->n_args = n;
    emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EBP, emit_None, 1, 16);
    for (i = 0; i < n; ++i) {
        switch (sig_bits[i] & PARROT_ARG_TYPE_MASK) {
            case PARROT_ARG_INTVAL:
                emitm_movl_m_r(NATIVECODE, MAP(2+i), emit_EAX, emit_None, 
                        1, 4 + i*4);
                break;
            case PARROT_ARG_FLOATVAL:
                emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EAX, emit_None, 
                        1, 4+ i*4);
                jit_emit_fload_mb_n(NATIVECODE, emit_EAX, 0);
                emitm_fstp(NATIVECODE, (MAP(2+i) + 1));
                if (i < n - 1)
                    emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EBP, 
                            emit_None, 1, 16);
                break;
        }
    }
}

/*
 * preserve registers
 * a) all callee saved on function entry 
 */
static void 
jit_save_regs(Parrot_jit_info_t *jit_info, Interp * interpreter)
{
    int i, used_i, save_i;
    const jit_arch_regs *reg_info;

    used_i = CONTEXT(interpreter->ctx)->n_regs_used[REGNO_INT];
    reg_info = &jit_info->arch_info->regs[jit_info->code_type]; 
    save_i = reg_info->n_preserved_I;
    for (i = save_i; i < used_i; ++i) {
        emitm_pushl_r(jit_info->native_ptr, reg_info->map_I[i]);
    }
}

/* restore saved regs, see above */
static void 
jit_restore_regs(Parrot_jit_info_t *jit_info, Interp * interpreter)
{

    int i, used_i, save_i;
    const jit_arch_regs *reg_info;

    used_i = CONTEXT(interpreter->ctx)->n_regs_used[REGNO_INT];
    reg_info = &jit_info->arch_info->regs[jit_info->code_type]; 
    save_i = reg_info->n_preserved_I;
    /* note - reversed order of jit_save_regs  */
    for (i = used_i - 1; i >= save_i; --i) {
        emitm_popl_r(jit_info->native_ptr, reg_info->map_I[i]);
    }
}

/*
 * preserve registers around a functioncall
 * 
 * all used register around a call (skip >= 0 := return result
 *
 * TODO factor out common code
 *      use jit_emit_mov_RM_{in} functions (load/store base indexed) 
 *      and a macro to retrive sp
 */
static int
jit_save_regs_call(Parrot_jit_info_t *jit_info, Interp * interpreter, int skip)
{
    int i, used_i, used_n;
    const jit_arch_regs *reg_info;

    used_i = CONTEXT(interpreter->ctx)->n_regs_used[REGNO_INT];
    used_n = CONTEXT(interpreter->ctx)->n_regs_used[REGNO_NUM];
    jit_emit_sub_ri_i(jit_info->native_ptr, emit_ESP, 
            (used_i * sizeof(INTVAL) + used_n * sizeof(FLOATVAL)));
    reg_info = &jit_info->arch_info->regs[jit_info->code_type]; 
    for (i = 0; i < used_i; ++i) {
        /* XXX need 2 skip vars */
        if (reg_info->map_I[i] == skip)
            continue;
        emitm_movl_r_m(NATIVECODE, reg_info->map_I[i], emit_ESP, 
                            emit_None, 1, 
                            (used_n * sizeof(FLOATVAL) +
                             i      * sizeof(INTVAL)) 
                            );
    }
    for (i = 0; i < used_n; ++i) {
        if (reg_info->map_F[i] == skip)
            continue;
        emitm_fld(NATIVECODE, reg_info->map_F[i]); 
        jit_emit_fstore_mb_n(NATIVECODE, emit_ESP, (i * sizeof(FLOATVAL)));
    }
    return used_n;
}

static void 
jit_restore_regs_call(Parrot_jit_info_t *jit_info, Interp * interpreter, 
        int skip)
{

    int i, used_i, used_n;
    const jit_arch_regs *reg_info;

    used_i = CONTEXT(interpreter->ctx)->n_regs_used[REGNO_INT];
    used_n = CONTEXT(interpreter->ctx)->n_regs_used[REGNO_NUM];
    reg_info = &jit_info->arch_info->regs[jit_info->code_type]; 
    
    for (i = 0; i < used_i; ++i) {
        if (reg_info->map_I[i] == skip)
            continue;
        emitm_movl_m_r(NATIVECODE, reg_info->map_I[i], emit_ESP, 
                            emit_None, 1, 
                            (used_n * sizeof(FLOATVAL) +
                             i      * sizeof(INTVAL)) 
                            );
    }
    for (i = 0; i < used_n; ++i) {
        if (reg_info->map_F[i] == skip)
            continue;
        jit_emit_fload_mb_n(NATIVECODE, emit_ESP, (i * sizeof(FLOATVAL)));
        emitm_fstp(NATIVECODE, (1+reg_info->map_F[i])); 
    }

    jit_emit_add_ri_i(jit_info->native_ptr, emit_ESP, 
            (used_i * sizeof(INTVAL) + used_n * sizeof(FLOATVAL)));
}

static void
jit_set_returns_pc(Parrot_jit_info_t *jit_info, Interp * interpreter, 
        int recursive)
{
    PMC *sig_pmc;
    INTVAL *sig_bits, sig;

    sig_pmc = CONTEXT(interpreter->ctx)->constants[CUR_OPCODE[1]]->u.key;
    if (!SIG_ELEMS(sig_pmc))
        return;
    sig_bits = SIG_ARRAY(sig_pmc);
    sig = sig_bits[0];
    if (!recursive) {
        /* mov 16(%ebp), %eax - fetch args ptr */
        emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EBP, emit_None, 1, 16);
        emitm_movl_m_r(NATIVECODE, emit_EAX, emit_EAX, emit_None, 1, 0);
    }
    /*
     * recursive returns according to ABI */
    switch (sig & (PARROT_ARG_TYPE_MASK|PARROT_ARG_CONSTANT)) {
        case PARROT_ARG_INTVAL:
            if (recursive) {
                jit_emit_mov_rr_i(NATIVECODE, emit_EAX, MAP(2));
            }
            else {
                emitm_movl_r_m(NATIVECODE, MAP(2), emit_EAX, 0, 1, 0);
            }
            break;
        case PARROT_ARG_INTVAL|PARROT_ARG_CONSTANT:
            if (recursive) {
                jit_emit_mov_ri_i(NATIVECODE, emit_EAX, CUR_OPCODE[2]);
            }
            else {
                emitm_movl_i_m(NATIVECODE, CUR_OPCODE[2], emit_EAX, 0, 1, 0);
            }
            break;
        case PARROT_ARG_FLOATVAL:
            if (recursive) {
                jit_emit_mov_rr_n(NATIVECODE, FSR1, MAP(2));
            }
            else {
                emitm_fld(NATIVECODE, MAP(2));
                jit_emit_fstore_mb_n(NATIVECODE, emit_EAX, 0);
            }
            break;
        case PARROT_ARG_FLOATVAL|PARROT_ARG_CONSTANT:
            if (recursive) {
                jit_emit_mov_ri_n(NATIVECODE, FSR1, &CONST(2)->u.number);
            }
            else {
                jit_emit_mov_ri_n(NATIVECODE, FSR1, &CONST(2)->u.number);
                jit_emit_fstore_mb_n(NATIVECODE, emit_EAX, 0);
            }
            break;
        default:
            internal_exception(1, "set_returns_jit - unknown typ");
            break;
    }
}

static void
jit_set_args_pc(Parrot_jit_info_t *jit_info, Interp * interpreter, 
        int recursive)
{
    PMC *sig_args, *sig_params, *sig_result;
    INTVAL *sig_bits, sig, i, n;
    struct PackFile_Constant ** constants;
    opcode_t *params, *result;
    char params_map;
    int skip, used_n;
    char collision[16];
    const jit_arch_regs *reg_info;

    reg_info = &jit_info->arch_info->regs[jit_info->code_type]; 

    if (!recursive) {
        /* create args array */
        internal_exception(1, "set_args_jit - can't do that yet ");
    }

    constants = CONTEXT(interpreter->ctx)->constants;
    sig_args = constants[CUR_OPCODE[1]]->u.key;
    if (!SIG_ELEMS(sig_args))
        return;
    params = jit_info->optimizer->sections->begin;
    sig_params = constants[params[1]]->u.key;
    ASSERT_SIG_PMC(sig_params);
    sig_bits = SIG_ARRAY(sig_args);
    n = SIG_ELEMS(sig_args);  
    /*
     * preserve registers - need get_results, because we skip the 
     * return value
     */
    result = CUR_OPCODE + 2 + n + 3; /* set_args, set_p_pc */
    assert(*result == PARROT_OP_get_results_pc);
    sig_result = constants[result[1]]->u.key;
    ASSERT_SIG_PMC(sig_result);

    if (!SIG_ELEMS(sig_result))
        skip = -1;
    else 
        skip = MAP(2 + n + 3 + 2);
    used_n = jit_save_regs_call(jit_info, interpreter, skip);
    memset(collision, 0, 16);
    for (i = 0; i < n; ++i) {
        sig = sig_bits[i];
        /* move args to params regs */
        params_map = jit_info->optimizer->map_branch[2 + i];
        switch (sig & (PARROT_ARG_TYPE_MASK|PARROT_ARG_CONSTANT)) {
            case PARROT_ARG_INTVAL:
                /* if the arg was already set,
                 * we can't use the src again - fetch from stack
                 *
                 * XXX skip
                 *
                 * TODO write a general reg_move
                 */
                if (collision[(int)MAP(2+i)]) {
                    int j;
                    for (j = 0; j < reg_info->n_mapped_I; ++j) {
                        if (reg_info->map_I[j] == MAP(2+i)) {
                            emitm_movl_m_r(NATIVECODE, params_map, emit_ESP, 
                                    emit_None, 1, 
                                    (used_n * sizeof(FLOATVAL) +
                                     j  * sizeof(INTVAL)) 
                                    );
                            break;
                        }
                    }
                }
                else {
                    if (params_map != MAP(2+i)) {
                        jit_emit_mov_rr_i(NATIVECODE, params_map, MAP(2 + i));
                    }
                }
                collision[(int)params_map] = 1;
                break;
            case PARROT_ARG_INTVAL|PARROT_ARG_CONSTANT:
                /* TODO move constants last */
                jit_emit_mov_ri_i(NATIVECODE, params_map, CUR_OPCODE[2 + i]);
                break;
            case PARROT_ARG_FLOATVAL:
                if (collision[(int)MAP(2+i)]) {
                    int j;
                    for (j = 0; j < reg_info->n_mapped_F; ++j) {
                        if (reg_info->map_F[j] == MAP(2+i)) {
                            jit_emit_fload_mb_n(NATIVECODE, emit_ESP, (j * sizeof(FLOATVAL)));
                            emitm_fstp(NATIVECODE, (1+params_map)); 
                            break;
                        }
                    }
                }
                else {
                    jit_emit_mov_rr_n(NATIVECODE, params_map, MAP(2 + i));
                }
                collision[(int)params_map] = 1;
                break;
            case PARROT_ARG_FLOATVAL|PARROT_ARG_CONSTANT:
                jit_emit_mov_ri_n(NATIVECODE, params_map, 
                        &CONST(2 + i)->u.number);
                break;
            default:
                internal_exception(1, "set_args_jit - unknown typ");
                break;
        }
    }
}

#    undef CONST
/*
 * if jit_emit_noop is defined, it does align a jump target
 * to 1 << JUMP_ALIGN
 * It may emit exactly one byte, or some desired padding.
 * The instructions must perform like a noop.
 *
 * Alignment effects seem to be rather processor specific and
 * it's not quite clear if the branch src or target should be
 * aligned. Turned off for now.
 *
 * s. also info gcc /align-jump
 *
 * noop; mov %esi, %esi; lea 0(%esi), %esi
 * TODO
 * 7 bytes: 8d b4 26 00 00 00 00    lea    0x0(%esi),%esi
 * 6 bytes: 8d b6 00 00 00 00       lea    0x0(%esi),%esi
 * 5 bytes: 90 8d 74 26 00          nop,   lea    0x0(%esi),%esi                
 * 4 bytes: 8d 74 26 00             lea    0x0(%esi),%esi
 *
 */

#  define jit_emit_noop(pc) do { \
     switch ( ((unsigned long) pc) & 3) { \
       case 1: *pc++ = (char) 0x8d; *pc++ = (char) 0x76; *pc++ = (char) 0x00; break; \
       case 2: *pc++ = (char) 0x89; *pc++ = (char) 0xf6; break; \
       case 3: *pc++ = (char) 0x90; break; \
     } \
   } while (0)

#  define JUMP_ALIGN 0
#  define SUB_ALIGN 0

#if JIT_EMIT == 0

static void
Parrot_jit_dofixup(Parrot_jit_info_t *jit_info, Interp * interpreter)
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

static int control_word = 0x27f;

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

static void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
    jit_emit_stack_frame_enter(jit_info->native_ptr);
    emitm_fldcw(jit_info->native_ptr, &control_word);
    emitm_pushl_r(jit_info->native_ptr, emit_EBX);
    /* get the pc from stack:  mov 12(%ebp), %ebx */
    emitm_movl_m_r(jit_info->native_ptr, emit_EBX, emit_EBP, emit_None, 1, 12);
    /* emit cgp_core(1, interpreter) */
    /* get the interpreter from stack:  mov 8(%ebp), %eax */
    emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EBP, emit_None, 1, 8);
    emitm_pushl_r(jit_info->native_ptr, emit_EAX);
    /*
     * TODO define the offset of the interpreter on the stack
     *      relative to %ebp
     */
    emitm_pushl_i(jit_info->native_ptr, 1);
    /* use EAX as flag, when jumping back on init, EAX==1 */
    jit_emit_mov_ri_i(jit_info->native_ptr, emit_EAX, 1);
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
    emitm_jxs(jit_info->native_ptr, emitm_jnz, 5);
    emitm_popl_r(jit_info->native_ptr, emit_EBX);
    jit_emit_stack_frame_leave(jit_info->native_ptr);
    emitm_ret(jit_info->native_ptr);
    /* get PC = ebx to eax, jump there */
    jit_emit_mov_rr_i(jit_info->native_ptr, emit_EAX, emit_EBX);
    Parrot_emit_jump_to_eax(jit_info, interpreter);

/* code_start: */
}

#else /* JIT_CGP */
static void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
    /* the generated code gets called as:
     * (jit_code)(interpreter, pc)
     * jumping to pc is the same code as used in Parrot_jit_cpcf_op()
     */

    /* Maintain the stack frame pointer for the sake of gdb */
    jit_emit_stack_frame_enter(jit_info->native_ptr);
    emitm_fldcw(jit_info->native_ptr, &control_word);
    /* stack:
     *  12   pc
     *   8   interpreter
     *   4   retaddr
     *   0   ebp <----- ebp
     *  -4   ebx .. preserved regs
     *  -8   esi ..
     * -12   edi ..
     * -16   interpreter
     */

    /* Save all callee-saved registers (cdecl)
     */
    emitm_pushl_r(jit_info->native_ptr, emit_EBX);
    emitm_pushl_r(jit_info->native_ptr, emit_ESI);
    emitm_pushl_r(jit_info->native_ptr, emit_EDI);

    /* Cheat on op function calls by writing the interpreter arg on the stack
     * just once. If an op function ever modifies the interpreter argument on
     * the stack this will stop working !!! */

    /* get the interpreter from stack:  mov 8(%ebp), %eax */
    emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EBP, emit_None, 1, 8);
    emitm_pushl_r(jit_info->native_ptr, emit_EAX);

    /* get the pc from stack:  mov 12(%ebp), %eax */
    emitm_movl_m_r(jit_info->native_ptr, emit_EAX, emit_EBP, emit_None, 1, 12);

    /* jump to restart pos or first op */
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}

#endif /* JIT_CGP */

/*
 * create a JITted version of a PIR sub, where everything
 * resided in registers
 *
 * The sub is called as
 *
 *   opcode_t * func(Interp *i, INTVAL *sig_bits, void **args);
 *
 *   args[0] ...    NULL / return value address
 *   args[1..n] ... addresses of n arguments
 *   args[n + 1] .. opcode_t* next - ususally just returned
 */

static void
Parrot_jit_begin_sub_regs(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
    jit_emit_stack_frame_enter(jit_info->native_ptr);
    /* stack:
     *  16   args
     *  12   sig_bits
     *   8   interpreter
     *   4   retaddr
     *   0   ebp <----- ebp
     * [ -4   ebx .. preserved regs ]
     * [ -8   edi .. preserved regs ]
     */
    /*
     * check register usage of the subroutine
     * how many we have to preserve
     */ 
    jit_save_regs(jit_info, interpreter);
    /* when it's a recursive sub, we fetch params to registers
     * and all a inner helper sub, which run with registers only
     */
    if (jit_info->flags & JIT_CODE_RECURSIVE) {
        char * L1;
        struct PackFile_Constant ** constants;
        PMC *sig_result;
        opcode_t *result;

        jit_get_params_pc(jit_info, interpreter);
        /* remember fixup position - call sub */
        L1 = NATIVECODE;
        emitm_calll(NATIVECODE, 0);
        /* check type of return value */
        constants = CONTEXT(interpreter->ctx)->constants;
        result = CONTEXT(interpreter->ctx)->current_results;
        sig_result = constants[result[1]]->u.key;
        if (!SIG_ELEMS(sig_result))
            goto no_result;
        /* fetch args to %edx */
        emitm_movl_m_r(NATIVECODE, emit_EDX, emit_EBP, emit_None, 1, 16);
        emitm_movl_m_r(NATIVECODE, emit_ECX, emit_EDX, emit_None, 1, 0);
        if (SIG_ITEM(sig_result, 0) == PARROT_ARG_FLOATVAL) {
            jit_emit_fst_mb_n(jit_info->native_ptr, emit_ECX, 0);
        }
        else {
            emitm_movl_r_m(NATIVECODE, emit_EAX, emit_ECX, 0, 1, 0);
        }
no_result:
        /* return 0 - no branch */
        jit_emit_bxor_rr_i(NATIVECODE, emit_EAX, emit_EAX);
        /* restore pushed callee saved */
        jit_restore_regs(jit_info, interpreter);
        jit_emit_stack_frame_leave(NATIVECODE);
        emitm_ret(NATIVECODE);
        /* align the inner sub */
#  if SUB_ALIGN
        while ((long)jit_info->native_ptr & ((1<<SUB_ALIGN) - 1)) {
            jit_emit_noop(jit_info->native_ptr);
        }
#  endif
        /* fixup call statement */
        L1[1] = NATIVECODE - L1 - 5;
    }
    /* TODO be sure we got a label here in map_branch */
}


static void
Parrot_jit_begin_sub(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
}

static void
jit_mov_mr_n_offs(Parrot_jit_info_t *jit_info,
        int base_reg, INTVAL offs, int src_reg)
{
    emitm_fld(jit_info->native_ptr, src_reg);
    jit_emit_fstore_mb_n(jit_info->native_ptr, base_reg, offs);
}

static void
jit_mov_mr_offs(Parrot_jit_info_t *jit_info,
        int base_reg, INTVAL offs, int src_reg)
{
    emitm_movl_r_m(jit_info->native_ptr,
            src_reg, base_reg, emit_None, 1, offs);
}

static void
jit_mov_rm_n_offs(Parrot_jit_info_t *jit_info,
        int dst_reg, int base_reg, INTVAL offs)
{
    jit_emit_fload_mb_n(jit_info->native_ptr, base_reg,  offs);
    emitm_fstp(jit_info->native_ptr, (dst_reg+1));
}

static void
jit_mov_rm_offs(Parrot_jit_info_t *jit_info,
        int dst_reg, int base_reg, INTVAL offs)
{
    emitm_movl_m_r(jit_info->native_ptr,
            dst_reg, base_reg, emit_None, 1, offs);
}

#endif

#if JIT_EMIT == 2
/* generate code just once */

static void
Parrot_jit_emit_finit(Parrot_jit_info_t *jit_info)
{
    jit_emit_finit(jit_info->native_ptr);
}



#  ifdef JIT_CGP
/*
 * XXX needs some fixing
 * s. t/sub/pmc_{8,9}.t: the 2 print in tail call without that 'end'
 *    are recogniced as one non JIIted block
 */
void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    Parrot_jit_optimizer_section_ptr cur_section =
        jit_info->optimizer->cur_section;
    int last_is_branch = 0;
    void ** offset;
    extern PARROT_API char **Parrot_exec_rel_addr;
    extern PARROT_API int Parrot_exec_rel_count;

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
        offset = (jit_info->cur_op - interpreter->code->base.data) +
            interpreter->code->prederef.code;

        jit_emit_mov_ri_i(jit_info->native_ptr, emit_ESI, offset);
        emitm_callm(jit_info->native_ptr, emit_ESI, 0, 0, 0);
        /* now patch a B<cpu_ret> opcode after the end of the
         * prederefed (non JIT) section
         */
        if (last_is_branch) {
            offset = (cur_section->end - interpreter->code->base.data) +
                interpreter->code->prederef.code;
            cur_section->done = -1;
            /* ins to skip */
            cur_section->ins_count = cur_section->op_count - 1;
        }
        else {
            /* There must be a next section: either we have a B<end>
             * or a JITed branch,
             * when the branch is non JIT, we are in the above case
             */
            offset = (cur_section->next->begin - interpreter->code->base.data)
                + interpreter->code->prederef.code;
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
                     Interp * interpreter)
{
    int cur_op = *jit_info->cur_op;

    if (cur_op >= jit_op_count()) {
        cur_op = CORE_OPS_wrapper__;
    }
    /*
     * op functions have the signature (cur_op, interpreter)
     * we use the interpreter already on stack and only push the
     * cur_op
     */
    emitm_pushl_i(jit_info->native_ptr, jit_info->cur_op);

    call_func(jit_info,
            (void (*)(void))interpreter->op_func_table[cur_op]);
    emitm_addb_i_r(jit_info->native_ptr, 4, emit_ESP);
}

#  endif /* JIT_CGP */

void
Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                   Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info, interpreter);
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}


/* autogened inside core.ops */
static void
Parrot_end_jit(Parrot_jit_info_t *jit_info, Interp * interpreter);

#  undef Parrot_jit_restart_op
void
Parrot_jit_restart_op(Parrot_jit_info_t *jit_info,
                   Interp * interpreter)
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
        "lisc",         /* I */
        "tbB",          /* S */
        "pP234",        /* P */
        "fd"            /* N */
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
 * The function generated here is called as func(interpreter, nci_pmc)
 * interpreter ...  8(%ebp)
 * pmc         ... 12(%ebp)
 *
 * The generate function for a specific signature looks quite similar to
 * an optimized compile of src/nci.c:pcf_x_yy(). In case of any troubles
 * just compare the disassembly.
 */
void *
Parrot_jit_build_call_func(Interp *interpreter, PMC *pmc_nci,
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
    extern PARROT_API char **Parrot_exec_rel_addr;
    extern PARROT_API int Parrot_exec_rel_count;

    /* this ought to be enough - the caller of this function
     * should free the function pointer returned here
     */
    jit_info.native_ptr = jit_info.arena.start = mem_alloc_executable(size);
    pc = jit_info.native_ptr;

    /* make stack frame, preserve %ebx */
    jit_emit_stack_frame_enter(pc);
    emitm_pushl_r(pc, emit_EBX);
    /* get interp into %ebx */
    emitm_movl_m_r(pc, emit_EBX, emit_EBP, 0, 1, 8);
    /* get base pointer */
    emitm_movl_m_r(pc, emit_EBX, emit_EBX, 0, 1,
            offsetof(struct parrot_interp_t, ctx.bp));

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
                /* we need the offset of PMC_int_val */
                jit_emit_mov_RM_i(pc, emit_EDX,
                        REG_OFFS_PMC(count_regs(sig, signature->strstart)));
                emitm_lea_m_r (pc, emit_EAX, emit_EDX, 0, 1,
                        (size_t) &PMC_int_val((PMC *) 0));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'f':
                /* get a double from next num reg and push it on stack */
                jit_emit_fload_mb_n(pc, emit_EBX,
                        REG_OFFS_NUM(count_regs(sig, signature->strstart)));
                /* make room for float */
                emitm_addb_i_r(pc, -4, emit_ESP);
                emitm_fstps(pc, emit_ESP, emit_None, 1, 0);
                break;
            case 'd':
                /* get a double from next num reg and push it on stack */
                jit_emit_fload_mb_n(pc, emit_EBX,
                        REG_OFFS_NUM(count_regs(sig, signature->strstart)));
                /* make room for double */
                emitm_addb_i_r(pc, -8, emit_ESP);
                emitm_fstpl(pc, emit_ESP, emit_None, 1, 0);
                st += 4;        /* extra stack for double */
                break;
            case 'I':   /* INTVAL */
            case 'l':   /* long */
            case 'i':   /* int */
                jit_emit_mov_RM_i(pc, emit_EAX,
                        REG_OFFS_INT(count_regs(sig, signature->strstart)));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 's':   /* short: movswl intreg_o(base), %eax */
                emitm_movswl_r_m(pc, emit_EAX, emit_EBX, 0, 1,
                        REG_OFFS_INT(count_regs(sig, signature->strstart)));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'c':   /* char: movsbl intreg_o(base), %eax */
                emitm_movsbl_r_m(pc, emit_EAX, emit_EBX, 0, 1,
                        REG_OFFS_INT(count_regs(sig, signature->strstart)));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'p':   /* push pmc->data */
#  if ! PMC_DATA_IN_EXT
                /* mov pmc, %edx
                 * mov 8(%edx), %eax
                 * push %eax
                 */
                jit_emit_mov_RM_i(pc, emit_EDX,
                        REG_OFFS_PMC(count_regs(sig, signature->strstart)));
                emitm_movl_m_r(pc, emit_EAX, emit_EDX, 0, 1,
                        offsetof(struct PMC, data));
#  else
                /* push pmc->pmc_ext->data
                 * mov pmc, %edx
                 * mov pmc_ext(%edx), %eax
                 * mov data(%eax), %eax
                 * push %eax
                 */
                jit_emit_mov_RM_i(pc, emit_EDX,
                        REG_OFFS_PMC(count_regs(sig, signature->strstart)));
                emitm_movl_m_r(pc, emit_EAX, emit_EDX, 0, 1,
                        offsetof(struct PMC, pmc_ext));
                emitm_movl_m_r(pc, emit_EAX, emit_EAX, 0, 1,
                        offsetof(struct PMC_EXT, data));
#  endif
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'O':   /* push PMC * object in P2 */
                jit_emit_mov_RM_i(pc, emit_EAX, REG_OFFS_PMC(2));
                goto preg;
            case 'P':   /* push PMC * */
                jit_emit_mov_RM_i(pc, emit_EAX,
                        REG_OFFS_PMC(count_regs(sig, signature->strstart)));
preg:
#if PARROT_CATCH_NULL
                /* PMCNULL is a global */
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
                jit_emit_mov_RM_i(pc, emit_EDX,
                        REG_OFFS_STR(count_regs(sig, signature->strstart)));
                emitm_movl_m_r(pc, emit_EAX, emit_EDX, 0, 1,
                        (size_t) &PObj_bufstart((STRING *) 0));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'B':   /* buffer (void**) pass &PObj_bufstart(SReg) */
                jit_emit_mov_RM_i(pc, emit_EDX,
                        REG_OFFS_STR(count_regs(sig, signature->strstart)));
                emitm_lea_m_r (pc, emit_EAX, emit_EDX, 0, 1,
                        (size_t) &PObj_bufstart((STRING *) 0));
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 't':   /* string, pass a cstring */
                jit_emit_mov_RM_i(pc, emit_EAX,
                        REG_OFFS_STR(count_regs(sig, signature->strstart)));
                emitm_pushl_r(pc, emit_EAX);
                emitm_pushl_r(pc, emit_EBX);
                emitm_calll(pc, (char*)string_to_cstring - pc - 4);
                emitm_addb_i_r(pc, 8, emit_ESP);
                emitm_pushl_r(pc, emit_EAX);
                break;
            case 'J':   /* interpreter */
                emitm_movl_m_r(pc, emit_ECX, emit_EBP, 0, 1, 8);
                emitm_pushl_r(pc, emit_ECX);
                break;
            default:
                /*
                 * oops unknown signature:
                 * cleanup and try nci.c
                 */
                mem_free_executable(jit_info.native_ptr);
                return NULL;
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
            /* get integer from pointer - untested */
            emitm_movl_m_r(pc, emit_EDX, emit_EAX, 0, 1, 0);
            if (*sig == 2)      /* short */
                emitm_movswl_r_r(pc, emit_EDX, emit_EDX);
            jit_emit_mov_MR_i(pc, REG_OFFS_INT(next_i++), emit_EDX);
            break;
        case 'f':
        case 'd':
            /* pop num from st(0) and mov to reg */
            jit_emit_fstore_mb_n(pc, emit_EBX, REG_OFFS_NUM(next_n++));
            break;
        case 's':
            /* movswl %ax, %edx */
            emitm_movswl_r_r(pc, emit_EDX, emit_EAX);
            jit_emit_mov_MR_i(pc, REG_OFFS_INT(next_i++), emit_EDX);
            break;
        case 'c':
            /* movsbl %al, %edx */
            emitm_movsbl_r_r(pc, emit_EDX, emit_EAX);
            jit_emit_mov_MR_i(pc, REG_OFFS_INT(next_i++), emit_EDX);
            break;
        case 'I':   /* INTVAL */
        case 'l':
        case 'i':
            jit_emit_mov_MR_i(pc, REG_OFFS_INT(next_i++), emit_EAX);
            /* fall through */
        case 'v': /* void - do nothing */
            break;
        case 'P':
            jit_emit_mov_MR_i(pc, REG_OFFS_PMC(next_p++), emit_EAX);
            break;
        case 'p':   /* make a new unmanaged struct */
            /* save return value on stack */
            emitm_movl_m_r(pc, emit_ECX, emit_EBP, 0, 1, 8);
            emitm_pushl_r(pc, emit_EAX);
            /* make new pmc */
            emitm_pushl_i(pc, enum_class_UnManagedStruct);
            emitm_pushl_r(pc, emit_ECX);
            emitm_calll(pc, (char*)pmc_new - pc - 4);
            emitm_addb_i_r(pc, 8, emit_ESP);
            /* eax = PMC, get return value into edx */
            jit_emit_mov_MR_i(pc, REG_OFFS_PMC(next_p++), emit_EAX);
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
            emitm_movl_m_r(pc, emit_ECX, emit_EBP, 0, 1, 8);
            emitm_pushl_r(pc, emit_EAX);
            emitm_pushl_r(pc, emit_ECX);
            emitm_calll(pc, (char*)new_buffer_header - pc - 4);
            emitm_addb_i_r(pc, 4, emit_ESP);
            /* *eax = buffer_header */
            /* set external flag */
            emitm_orl_i_m(pc, PObj_external_FLAG, emit_EAX, 0, 1,
                    offsetof(pobj_t, flags));
            emitm_popl_r(pc, emit_EDX);
            /* mov %edx, (bufstart) %eax */
            emitm_movl_r_m(pc, emit_EDX, emit_EAX, 0, 1,
                        (size_t) &PObj_bufstart((STRING *) 0));
            /* place result in SReg */
            jit_emit_mov_MR_i(pc, REG_OFFS_STR(next_s++), emit_EAX);

            break;
        case 'S':
            jit_emit_mov_MR_i(pc, REG_OFFS_STR(next_s++), emit_EAX);
            break;
        case 't':   /* string */
            /* EAX is char* */
            emitm_pushl_i(pc, 0);               /* len */
            emitm_movl_m_r(pc, emit_ECX, emit_EBP, 0, 1, 8);
            emitm_pushl_r(pc, emit_EAX);        /* string */
            emitm_pushl_r(pc, emit_ECX);        /* interpreter */
            emitm_calll(pc, (char*)string_from_cstring - pc - 4);
            emitm_addb_i_r(pc, 12, emit_ESP);
            jit_emit_mov_MR_i(pc, REG_OFFS_STR(next_s++), emit_EAX);
            break;
        default:
            mem_free_executable(jit_info.native_ptr);
            return NULL;
    }
    /* set prototyped return */
    jit_emit_mov_MI_i(pc, REG_OFFS_INT(0), 1);
    /* set return values in I,S,P,N regs */
    jit_emit_mov_MI_i(pc, REG_OFFS_INT(1), next_i-5);
    jit_emit_mov_MI_i(pc, REG_OFFS_INT(2), next_s-5);
    jit_emit_mov_MI_i(pc, REG_OFFS_INT(3), next_p-5);
    jit_emit_mov_MI_i(pc, REG_OFFS_INT(4), next_n-5);

    emitm_popl_r(pc, emit_EBX);
    jit_emit_stack_frame_leave(pc);
    emitm_ret(pc);
    assert(pc - jit_info.arena.start <= size);
    /* could shrink arena.start here to used size */
    PObj_active_destroy_SET(pmc_nci);
    return (jit_f)D2FPTR(jit_info.arena.start);
}

#endif

#if JIT_EMIT == 0

#  define REQUIRES_CONSTANT_POOL 0
/*
 * examples/pir/mandel.pir and t/op/jitn_14 show rounding problems
 * due to keeping intermediate results in FP registers
 * When intermediates are written back to parrot regs, rounding to
 * 64 bit is performed, which changes results slightly
 *
 * One method is to just turn off mapped floats. The other one is
 * setting a different control word (with precision control = double)
 * see emitm_fldcw above
 */
#  define FLOAT_REGISTERS_TO_MAP 4

/*
 * register usage
 * %edi, %esi ... mapped, preserved
 * %edx, %ecx ... mapped, not preserved
 * %ebx       ... base pointer for register access, preserved
 * %eax       ... scratch, return value register
 */

static const char i_map[] =
    { emit_EDI, emit_ESI, emit_EDX, emit_ECX };
static const char floatval_map[] =
    { 1,2,3,4,5 };         /* ST(1) .. (ST(4) */

static const char i_map_sub[] =
    { emit_EDX, emit_ECX, emit_EBX, emit_EDI, emit_ESI };

static const jit_arch_info arch_info = {
    jit_mov_rm_offs,
    jit_mov_rm_n_offs,
    jit_mov_mr_offs,
    jit_mov_mr_n_offs,
    Parrot_jit_dofixup,
    (jit_arch_f)0,              /* no cache flush needed */      
    {
        {
            Parrot_jit_begin,   /* emit code prologue */
            4,                  /* 4 mapped ints */
            2,                  /* first 2 are preserved */
            i_map,
            4,                  /* 4 mapped float regs */
            0,                  /* ABI sez it's not preserved */
            floatval_map
        },
        /* unused */
        {
            Parrot_jit_begin_sub,   /* emit code prologue */
            4,                  /* 4 mapped ints */
            2,                  /* first 2 are *non*preserved */
            i_map_sub,
            4,                  /* 4 mapped float regs */
            0,                  /* ABI sez it's not preserved */
            floatval_map
        },
        /*
         * compile a sub to registers only
         * if a mapped count is 0, code containing this register kind
         * will not be created
         *
         * TODO implement FLOATVAL arg passing and set mapped
         * register count.
         */
        {
            Parrot_jit_begin_sub_regs,   /* emit code prologue */
            5,                  /* 5 mapped ints */
            2,                  /* first 2 are *non*preserved */
            i_map_sub,
            5,                  /* TODO 0 mapped float regs */
            5,                  /* ABI sez it's not preserved */
            floatval_map
        }
    }
};


const jit_arch_info * 
Parrot_jit_init(Interp *interpreter)
{
    return &arch_info;
}


/* registers are either allocate per section or per basic block
 * set this to 1 or 0 to change allocation scheme
 */
#  define ALLOCATE_REGISTERS_PER_SECTION 1

/*
 * new style move function using offsets relative to the base_reg
 */
#  ifdef JIT_CGP
#    define INTERP_BP_OFFS todo
#  else
#    define INTERP_BP_OFFS -16
#  endif

#endif  /* JIT_EMIT */

#  undef INT_REGISTERS_TO_MAP
#endif /* PARROT_I386_JIT_EMIT_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
