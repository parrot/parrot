#include <assert.h>
#include "parrot/parrot.h"
#include "parrot/hash.h"
#include "parrot/oplib/ops.h"
#include "jit.h"

INTVAL
get_nci_I(PARROT_INTERP, ARGMOD(call_state *st), int n)
{
    if (n >= st->src.n)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "too few arguments passed to NCI function");

    Parrot_fetch_arg_nci(interp, st);

    return UVal_int(st->val);
}

FLOATVAL
get_nci_N(PARROT_INTERP, ARGMOD(call_state *st), int n)
{
    if (n >= st->src.n)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "too few arguments passed to NCI function");

    Parrot_fetch_arg_nci(interp, st);

    return UVal_num(st->val);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING*
get_nci_S(PARROT_INTERP, ARGMOD(call_state *st), int n)
{
    /* TODO or act like below? */
    if (n >= st->src.n)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "too few arguments passed to NCI function");

    Parrot_fetch_arg_nci(interp, st);

    return UVal_str(st->val);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
get_nci_P(PARROT_INTERP, ARGMOD(call_state *st), int n)
{
    /*
     * exessive args are passed as NULL
     * used by e.g. MMD infix like __add
     */
    if (n < st->src.n)
        Parrot_fetch_arg_nci(interp, st);
    else
        UVal_pmc(st->val) = PMCNULL;

    return UVal_pmc(st->val);
}

/*
 * set return value
 */
void
set_nci_I(PARROT_INTERP, ARGOUT(call_state *st), INTVAL val)
{
    Parrot_init_ret_nci(interp, st, "I");
    if (st->dest.i < st->dest.n) {
        UVal_int(st->val) = val;
        Parrot_convert_arg(interp, st);
        Parrot_store_arg(interp, st);
    }
}

void
set_nci_N(PARROT_INTERP, ARGOUT(call_state *st), FLOATVAL val)
{
    Parrot_init_ret_nci(interp, st, "N");
    if (st->dest.i < st->dest.n) {
        UVal_num(st->val) = val;
        Parrot_convert_arg(interp, st);
        Parrot_store_arg(interp, st);
    }
}

void
set_nci_S(PARROT_INTERP, ARGOUT(call_state *st), STRING *val)
{
    Parrot_init_ret_nci(interp, st, "S");
    if (st->dest.i < st->dest.n) {
        UVal_str(st->val) = val;
        Parrot_convert_arg(interp, st);
        Parrot_store_arg(interp, st);
    }
}

void
set_nci_P(PARROT_INTERP, ARGOUT(call_state *st), PMC* val)
{
    Parrot_init_ret_nci(interp, st, "P");
    if (st->dest.i < st->dest.n) {
        UVal_pmc(st->val) = val;
        Parrot_convert_arg(interp, st);
        Parrot_store_arg(interp, st);
    }
}

int
emit_is8bit(long disp)
{
    return disp >= -128 && disp <= 127;
}

char *
emit_disp8_32(char *pc, int disp)
{
    if (emit_is8bit(disp)) {
        *(pc++) = (char)disp;
        return pc;
    }
    else {
        *(long *)pc = disp;
        return pc + 4;
    }
}

/* Register codes */
/* XXX: These should be merged with the same definition in jit_emit.h */
#define emit_None 0
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

void
emit_sib(PARROT_INTERP, char *pc, int scale, int i, int base)
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
        default:
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                "Invalid scale factor %d\n", scale);
            return;
    }

    *pc = (char)(scale_byte | (i == emit_None ? emit_Index_None : emit_reg_Index(i)) |
            emit_reg_Base(base));
}

/* Mod values for Mod R/M Byte */
/* XXX: Duplicate */
#define emit_Mod_b00 emit_Mod(emit_b00)
#define emit_Mod_b01 emit_Mod(emit_b01)
#define emit_Mod_b10 emit_Mod(emit_b10)
#define emit_reg(x) ((x) << 3)
#define emit_Mod(Mod) ((Mod) << 6)
#define emit_reg_rm(x) ((x)-1)

#define emit_EAX 1
#define emit_ECX 2
#define emit_EDX 3
#define emit_EBX 4
#define emit_ESP 5
#define emit_EBP 6
#define emit_ESI 7
#define emit_EDI 8

#define emit_rm_b101 emit_b101
#define emit_rm_b100 emit_b100

char *
emit_r_X(PARROT_INTERP, char *pc, int reg_opcode, int base, int i, int scale, long disp)
{
    if (i && !scale)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
            "emit_r_X passed invalid scale+index combo\n");

    if (base == emit_EBP) {
    /* modrm disp */
        if (i == emit_None) {
            *(pc++) = (char)((emit_is8bit(disp) ? emit_Mod_b01 : emit_Mod_b10)
                    | reg_opcode | emit_reg_rm(emit_EBP));
            return emit_disp8_32(pc, disp);
        }
        /* modrm sib disp */
        else {
            *(pc++) = (char)((emit_is8bit(disp) ? emit_Mod_b01 : emit_Mod_b10)
                    | reg_opcode | emit_b100);
            emit_sib(interp, pc++, scale, i, base);
            return emit_disp8_32(pc, disp);
        }
    }

    /* modrm sib disp */
    if (base == emit_ESP) {
        *(pc++) = (char)((emit_is8bit(disp) ? emit_Mod_b01 : emit_Mod_b10)
                | reg_opcode | emit_rm_b100);
        emit_sib(interp, pc++, scale, i, emit_ESP);
        return emit_disp8_32(pc, disp);
    }

    /* modrm disp32 */
    if (!base && !(i && scale)) {
        *(pc++) = (char)(emit_Mod_b00 | reg_opcode | emit_rm_b101);
        *(long *)pc = disp;
        return pc + 4;
    }

    /* Ok, everything should be more regular here */
    *(pc++) = (char)((disp == 0 ? emit_Mod_b00 :
              (emit_is8bit(disp) ?
               emit_Mod_b01 : emit_Mod_b10)) |
               reg_opcode |
               (!base || (scale && i) ? emit_rm_b100 : emit_reg_rm(base)));

    if (!base || (scale && i)) {
        emit_sib(interp, pc++, scale, i, base);
    }
    if (disp)
        pc = emit_disp8_32(pc, disp);

    return pc;
}

#define emit_alu_X_r(X, reg) ((emit_b11 << 6) | ((X) << 3) | ((reg) - 1))

#define emit_alu_r_r(reg1, reg2) emit_alu_X_r(((reg1) - 1), (reg2))

char *
emit_shift_i_r(PARROT_INTERP, char *pc, int opcode, int imm, int reg)
{
    if (opcode == emit_b000 && imm < 0) {
        opcode = emit_b001;     /* -rol => 32 + ror */
        imm = -imm;
    }

    if (imm == 0) {
        /* noop */
    }
    else if (imm == 1) {
        *(pc++) = (char) 0xd1;
        *(pc++) = (char) emit_alu_X_r(opcode,  reg);
    }
    else if (imm > 1 && imm < 33) {
        *(pc++) = (char) 0xc1;
        *(pc++) = (char) emit_alu_X_r(opcode,  reg);
        *(pc++) = (char)imm;
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
            "emit_shift_i_r passed invalid shift\n");
    }

    return pc;
}

char *
emit_shift_i_m(PARROT_INTERP, char *pc, int opcode, int imm,
               int base, int i, int scale, long disp)
{
    if (imm == 0) {
        /* noop */
    }
    else if (imm == 1) {
        *(pc++) = (char) 0xd1;
        pc = emit_r_X(interp, pc, opcode,  base, i, scale, disp);
    }
    else if (imm > 1 && imm < 33) {
        *(pc++) = (char) 0xc1;
        pc = emit_r_X(interp, pc, opcode,  base, i, scale, disp);
        *(pc++) = (char)imm;
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
            "emit_shift_i_m passed invalid shift\n");
    }

    return pc;
}

char *
emit_shift_r_r(PARROT_INTERP, char *pc, int opcode, int reg1, int reg2)
{
    if (reg1 != emit_ECX)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
            "emit_shift_r_r passed invalid register\n");

    *(pc++) = (char) 0xd3;
    *(pc++) = (char) emit_alu_X_r(opcode,  reg2);

    return pc;
}

char *
emit_shift_r_m(PARROT_INTERP, char *pc, int opcode, int reg,
               int base, int i, int scale, long disp)
{
    if (reg != emit_ECX)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
            "emit_shift_r_m passed invalid register\n");

    *(pc++) = (char) 0xd3;
    pc = emit_r_X(interp, pc, opcode,  base, i, scale, disp);

    return pc;
}

char *
emit_pushl_m(PARROT_INTERP, char *pc, int base, int i, int scale, long disp)
{
    *(pc++) = (char) 0xff;
    return emit_r_X(interp, pc, emit_reg(emit_b110), base, i, scale, disp);
}

char *
emit_popl_r(char *pc, int reg)
{
    *(pc++) = (char)(0x58 | (reg - 1));
    return pc;
}

char *
emit_popl_m(PARROT_INTERP, char *pc, int base, int i, int scale, long disp)
{
    *(pc++) = (char) 0x8f;
    return emit_r_X(interp, pc, emit_reg(emit_b000), base, i, scale, disp);
}

char *
emit_movb_r_r(char *pc, int reg1, int reg2)
{
    *(pc++) = (char) 0x88;
    *(pc++) = (char) emit_alu_r_r(reg1, reg2);
    return pc;
}

char *
emit_movb_i_r(char *pc, char imm, int reg)
{
    *(pc++) = (char)(0xb0 | (reg - 1));
    *(pc++) = imm;
    return pc;
}

char *
emit_movb_i_m(PARROT_INTERP, char *pc, char imm, int base, int i, int scale, long disp)
{
    *(pc++) = (char) 0xc6;
    pc = emit_r_X(interp, pc, emit_reg(emit_b000), base, i, scale, disp);
    *(pc++) = imm;
    return pc;
}

#define emitm_movX_Y_Z(interp, op, pc, reg1, b, i, s, d) { \
    *((pc)++) = (char) (op); \
    (pc) = emit_r_m((interp), (pc), (reg1), (b), (i), (s), (long)(d)); }
	
#define emitm_alul_r_r(pc, op, reg1, reg2) { \
    *((pc)++) = (char) (op); *((pc)++) = (char) emit_alu_r_r((reg1), (reg2)); }

#define emit_alu_r_r(reg1, reg2) emit_alu_X_r(((reg1) - 1), (reg2))

#define emit_r_m(interp, pc, reg1, b, i, s, d) \
    emit_r_X((interp), (pc), emit_reg((reg1)-1), (b), (i), (s), (d))

#define jit_emit_mov_ri_i(interp, pc, reg, imm) { \
    *((pc)++) = (char)(0xb8 | ((reg) - 1)); \
    *(long *)(pc) = (long)(imm); (pc) += 4; }
	
#define jit_emit_mov_rr_i(pc, reg2, reg1) if ((reg1) != (reg2)) { \
    *((pc)++) = (char) 0x89; \
    *((pc)++) = (char) emit_alu_r_r((reg1), (reg2)); }

#define emitm_lea_m_r(interp, pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z((interp), 0x8d, (pc), (reg1), (b), (i), (s), (d))

#define jit_emit_add_rr_i(interp, pc, reg1, reg2) \
    emitm_alul_r_r((pc), 0x01, (reg2), (reg1))
	
char *
opt_mul(PARROT_INTERP, char *pc, int dest, INTVAL imm, int src)
{
    UINTVAL ld2 = ld((UINTVAL) imm);

    if (imm == 0) {
        jit_emit_mov_ri_i(interp, pc, dest, 0);
    }
    else if (imm > 0 && !(imm & (imm - 1))) {
        /* positive power of 2 - do a shift */
        jit_emit_mov_rr_i(pc, dest, src);
        pc = emit_shift_i_r(interp, pc, emit_b100, ld2, dest);
    }
    else {
        /* special small numbers */
        switch (imm) {
            case 3:
                /* LEA dest, base, index, scale, displace
                 * note: src may be dest, so can't be reused
                 *
                 * dest = src + src*2 */
                emitm_lea_m_r(interp, pc, dest, src, src, 2, 0);
                break;
            case 5:      /* dest = src + src*4 */
                emitm_lea_m_r(interp, pc, dest, src, src, 4, 0);
                break;
            case 6:     /* dest = src*3; dest += dest */
                emitm_lea_m_r(interp, pc, dest, src, src, 2, 0);
                jit_emit_add_rr_i(interp, pc, dest, dest);
                break;
            case 9:      /* dest = src + src*8 */
                emitm_lea_m_r(interp, pc, dest, src, src, 8, 0);
                break;
            case 10:      /* dest = src + src*4 ; dest+= dest */
                emitm_lea_m_r(interp, pc, dest, src, src, 4, 0);
                jit_emit_add_rr_i(interp, pc, dest, dest);
                break;
            case 12:     /* dest= src*3; dest <<= 2 */
                emitm_lea_m_r(interp, pc, dest, src, src, 2, 0);
                pc = emit_shift_i_r(interp, pc, emit_b100, 2, dest);
                break;
            case 100:      /* dest = src + src*4 ; dest <<= 2; dest = 5*dest*/
                emitm_lea_m_r(interp, pc, dest, src, src, 4, 0);
                pc = emit_shift_i_r(interp, pc, emit_b100, 2, dest);
                emitm_lea_m_r(interp, pc, dest, dest, dest, 4, 0);
                break;
            default:
                emitm_alul_r_r(pc, 0x69, dest, src);
                *(long *)(pc) = (long)imm;
                pc += 4;
        }
    }
    return pc;
}

int
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

#  define jit_emit_xchg_rr_i(interp, pc, r1, r2) { \
    if ((r1) != (r2)) { \
    *((pc)++) = (char) 0x87; \
    *((pc)++) = (char) emit_alu_r_r((r1), (r2)); \
    } \
}

#  define emitm_popl_r(pc, reg) \
    (pc) = emit_popl_r((pc), (reg))

#define emitm_pushl_r(pc, reg) \
    *((pc)++) = (char) 0x50 | ((reg) - 1)
	
#  define emitm_movl_m_r(interp, pc, reg1, b, i, s, d) \
    emitm_movX_Y_Z((interp), 0x8b, (pc), (reg1), (b), (i), (s), (d))

char *
opt_shift_rr(PARROT_INTERP, Parrot_jit_info_t *jit_info, int dest, int count, int op)
{
    char *pc = jit_info->native_ptr;
    if (count == emit_ECX) {
        pc = emit_shift_r_r(interp, pc, op, count, dest);
    }
    else {
        int saved = 0;
        PARROT_ASSERT(count != emit_EAX);
        if (dest == emit_EAX) {
            if (intreg_is_used(jit_info, emit_ECX)) {
                emitm_pushl_r(pc, emit_ECX);
                saved = 1;
            }
            jit_emit_mov_rr_i(pc, emit_ECX, count);
            pc = emit_shift_r_r(interp, pc, op, emit_ECX, dest);
            if (saved) {
                emitm_popl_r(pc, emit_ECX);
            }

        }
        else if (dest == emit_ECX) {
            jit_emit_xchg_rr_i(interp, pc, dest, count);
            pc = emit_shift_r_r(interp, pc, op, dest, count);
            jit_emit_xchg_rr_i(interp, pc, dest, count);
        }
        else {
            jit_emit_mov_rr_i(pc, emit_EAX, emit_ECX);
            jit_emit_mov_rr_i(pc, emit_ECX, count);
            pc = emit_shift_r_r(interp, pc, op, emit_ECX, dest);
            jit_emit_mov_rr_i(pc, emit_ECX, emit_EAX);
        }
    }
    return pc;
}

char *
opt_shift_rm(PARROT_INTERP, Parrot_jit_info_t *jit_info, int dest, int offs, int op)
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
        emitm_movl_m_r(interp, pc, emit_EAX, emit_EBX, emit_None, 1, offs);
        jit_emit_xchg_rr_i(interp, pc, dest, emit_EAX);
        pc = emit_shift_r_r(interp, pc, op, emit_ECX, emit_EAX);
        jit_emit_xchg_rr_i(interp, pc, dest, emit_EAX);
    }
    else {
        /* jit_emit_mov_RM_i(pc, emit_ECX, count); */
        emitm_movl_m_r(interp, pc, emit_ECX, emit_EBX, emit_None, 1, offs);
        pc = emit_shift_r_r(interp, pc, op, emit_ECX, dest);
    }
    if (saved) {
        emitm_popl_r(pc, emit_ECX);
    }
    return pc;
}

#  define emitm_jnz  5
#  define emitm_jp  10

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

#define INTERP_BP_OFFS -16

#define Parrot_jit_emit_get_INTERP(interp, pc, dest) \
    emitm_movl_m_r((interp), (pc), (dest), emit_EBP, emit_None, 1, INTERP_BP_OFFS)

#define emitm_pushl_i(pc, imm) { \
    *((pc)++) = (char) 0x68; \
    *(long *)(pc) = (long)(imm); \
    (pc) += 4; }

/* Short jump - 8 bit disp */
#  define emitm_jxs(pc, code, disp) { \
    *((pc)++) = (char)(0x70 | (code)); \
    *((pc)++) = (char)(disp); }

/* FXCH ST, ST(i) , optimize 2 consecutive fxch with same reg */
#  define emitm_fxch(pc, sti) { \
    emitm_fl_3((pc), emit_b001, emit_b001, (sti)); \
}

#  define emitm_fxam(pc)  { *((pc)++) = (char) 0xd9; *((pc)++) = (char) 0xe5; }

/* Ops Needed to support loading EFLAGs for conditional branches */
#  define emitm_fstw(pc) emitm_fl_3((pc), emit_b111, emit_b100, emit_b000)

#  define emitm_sahf(pc) *((pc)++) = (char) 0x9e

#  define emitm_calll(pc, disp) { \
    *((pc)++) = (char) 0xe8; \
    *(long *)(pc) = (disp); (pc) += 4; }
	
enum { JIT_X86BRANCH, JIT_X86JUMP, JIT_X86CALL };

void call_func(Parrot_jit_info_t *jit_info, void (*addr) (void))
{
    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_X86CALL;
    jit_info->arena.fixups->param.fptr = D2FPTR(addr);
    emitm_calll(jit_info->native_ptr, 0xdeafc0de);
}

void jit_emit_real_exception(Parrot_jit_info_t *jit_info)
{
    call_func(jit_info, (void (*) (void)) & Parrot_ex_throw_from_c_args);
}

#  define emitm_floatop 0xd8  /* 11011000 */

#  define emitm_fl_3(pc, d_p_opa, opb_r, sti) { \
    *((pc)++) = (char)(emitm_floatop | (d_p_opa)); \
    *((pc)++) = (char)(0xc0 | ((opb_r) << 3) | (sti)); }

/* FDIVP Div ST(i) = ST(0) / ST(i); POP ST(0) */
#  define emitm_fdivp(pc, sti) emitm_fl_3((pc), emit_b110, emit_b111, (sti))

/* FSTP ST(i) = ST, POP */
#  define emitm_fstp(pc, sti) { \
    lastpc = (unsigned char*) (pc); \
    emitm_fl_3((pc), emit_b101, emit_b011, (sti)); \
}

#  define emitm_fprem(pc) { *(pc)++ = 0xd9; *(pc)++ = 0xF8; }

unsigned char *lastpc;

/* ST(r1) /= ST(r2) */
char *
div_rr_n(PARROT_INTERP, Parrot_jit_info_t *jit_info, int r1)
{
    char *L1;
    static const char div_by_zero[] = "Divide by zero";
    char *pc = jit_info->native_ptr;

    jit_emit_test_r_n(pc, (char)0);   /* TOS */
    L1 = pc;
    emitm_jxs(pc, emitm_jnz, 0);
    emitm_pushl_i(pc, div_by_zero);
    emitm_pushl_i(pc, EXCEPTION_DIV_BY_ZERO);
    emitm_pushl_i(pc, 0);    /* NULL */
    Parrot_jit_emit_get_INTERP(interp, pc, emit_ECX);
    emitm_pushl_r(pc, emit_ECX);
    jit_info->native_ptr = pc;
    jit_emit_real_exception(jit_info);
    pc = jit_info->native_ptr;
    /* L1: */
    L1[1] = (char)(pc - L1 - 2);
    emitm_fdivp(pc, (r1+1));
    return pc;
}

char *
mod_rr_n(PARROT_INTERP, Parrot_jit_info_t *jit_info, int r)
{
    char *L1;
    static const char div_by_zero[] = "Divide by zero";
    char *pc = jit_info->native_ptr;

    jit_emit_test_r_n(pc, (char)0);   /* TOS */
    L1 = pc;
    emitm_jxs(pc, emitm_jnz, 0);
    emitm_pushl_i(pc, div_by_zero);
    emitm_pushl_i(pc, EXCEPTION_DIV_BY_ZERO);
    emitm_pushl_i(pc, 0);    /* NULL */
    Parrot_jit_emit_get_INTERP(interp, pc, emit_ECX);
    emitm_pushl_r(pc, emit_ECX);
    jit_info->native_ptr = pc;
    jit_emit_real_exception(jit_info);
    pc = jit_info->native_ptr;
    /* L1: */
    L1[1] = (char)(pc - L1 - 2);
    /* L2: */
    emitm_fxch(pc, (char)1);
    emitm_fprem(pc);
    emitm_fstw(pc);
    emitm_sahf(pc);
    emitm_jxs(pc, emitm_jp, -7); /* jo L2 */
    emitm_fstp(pc, (r+1));
    return pc;
}



