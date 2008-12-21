/*
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

/*
 * jit_emit.h
 *
 * amd64
 *
 * $Id$

=head1 NAME

src/jit/amd64/jit_emit.h - AMD64 JIT Generation

=head1 DESCRIPTION

Provide the support for a JIT on the AMD64 architecture.

=cut

*/

#ifndef PARROT_JIT_AMD64_JIT_EMIT_H_GUARD
#define PARROT_JIT_AMD64_JIT_EMIT_H_GUARD

/*

hex to binary converter
perl -ne '@a=split;push@b,unpack"B*",chr hex foreach@a;print"@b\n";@b=()'

src/jit/amd64/jit_emit.h copied to src/jit_emit.h
src/jit/amd64/exec_dep.h copied to src/exec_dep.h
src/jit/amd64/core.jit used to build src/jit_cpu.h
src/jit/amd64/core.jit used to build src/exec_cpu.h

src/exec_start.c    #define JIT_EMIT 1
src/exec.c          #define JIT_EMIT 1
src/jit.c           #define JIT_EMIT 0
src/jit_cpu.c       #define JIT_EMIT 2

REX Byte
    0100 wrxb
        w => make 64 bits
        r => use upper 8 registers for REG
        x => high bit of index in SIB
        b => use upper 8 registers for r/m, and for the base in SIB

ModRM
    mm REG R/m
    mm => mode
        00  no displacement
        01  disp8
        10  disp16/32
        11  only regs
    xxx/yyy
        0   EAX     AX  AL  SS0 MM0
        1   ECX     CX  CL  SS1 MM1
        2   EDX     DX  DL  SS2 MM2
        3   EBX     BX  BL  SS3 MM3
        4   ESP     SP  AH  SS4 MM4
        5   EBP     BP  CH  SS5 MM5
        6   ESI     SI  DH  SS6 MM6
        7   EDI     DI  BH  SS7 MM7

SIB
    ssiiibbb
        scale
        index
        base
        [index * 2**scale + base]


For calling functions use:  RDI, RSI, RDX, RCX, R8, and R9
                            XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6, and XMM7
    For varargs, RAX is used for the number of SSE regs
    Extras are pushed onto the stack
    The return is in RAX

    R11 is a scratch register, not preserved, not used in calling
    R10 is used for a static chain pointer

RBP, RBX, and R12->R15 are preserved

*/

#include "parrot/parrot.h"
#include "jit.h"
#include <unistd.h>
#include <limits.h>

void Parrot_jit_begin(Parrot_jit_info_t *, PARROT_INTERP);


/* This is used for testing whether or not keeping these two in registers is an
 * improvement or not.  This file may need to be expanded further to know for
 * sure.  But so far, there appears a 20 second improvement on my 2GHz. */
#undef USE_OP_MAP_AND_CODE_START

/*
 * define all the available cpu registers
 * reserve some for special purposes
 */
typedef enum {
    RAX,
    ISR2 = RAX, /* Not like it's good for anything else */
    RCX,
    RDX,
    RBX,
    RSP,
    RBP,
    RSI,
    RDI,

    R8,
    R9,
    R10,
    R11,
    ISR1 = R11,
    R12,
    R13,
#ifdef USE_OP_MAP_AND_CODE_START
    CODE_START = R13,
#endif
    R14,
#ifdef USE_OP_MAP_AND_CODE_START
    OP_MAP = R14,
#endif
    R15,
    INTERP = R15
} amd64_iregister_t;


/*

=head2 Register usage

=over 4

=item RAX

Return values, second scratch

=item RCX

Allocated, unpreserved

=item RDX

Allocated, unpreserved

=item RBX

Parrot register frame pointer

=item RSP

Stack pointer

=item RBP

Base pointer

=item RSI

Allocated, unpreserved

=item RDI

Allocated, unpreserved

=item R8

Allocated, unpreserved

=item R9

Allocated, unpreserved

=item R10

Allocated, unpreserved

=item R11

Scratch

=item R12

Allocated, preserved

=item R13

Allocated, preserved, or code_start

=item R14

Allocated, preserved, or op_map

=item R15

Interp

=item XMM0

Scratch

=item XMM1-XMM15

Allocated, all unpreserved

=back

=cut

*/


#define Parrot_jit_emit_get_base_reg_no(pc) RBX

typedef enum {
      XMM0,
      FSR1 = XMM0,
      XMM1,
      FSR2 = XMM1,
      XMM2, XMM3, XMM4, XMM5, XMM6, XMM7,
      XMM8, XMM9, XMM10, XMM11, XMM12, XMM13, XMM14, XMM15
} amd64_fregister_t;


/* Call can be handled without a fixup */
enum { JIT_AMD64BRANCH, JIT_AMD64JUMP, JIT_AMD64CALL };


/*
 * now define macros for all possible (and implemented) operations
 *
 * Parrot defines JIT_EMIT to 1 or 2, when this file is included in
 * exec_cpu.c or jit_cpu.c
 */

/*

=head2 Macros

Most of the functionality is provided by macros instead of functions.

=over 4

=cut

*/

#define b00 0
#define b01 1
#define b10 2
#define b11 3

#define b000 0
#define b001 1
#define b010 2
#define b011 3
#define b100 4
#define b101 5
#define b110 6
#define b111 7

/* rex.[wrxb], incomplete but oh well */
/*

=item C<emit_rex64(pc, reg, rm)>

The REX prefix, setting REX.W making the instruction 64 bit.

=item C<emit_rex(pc, reg, rm)>

The REX prefix, only emitted if using an extended register.

=cut

*/
#  define emit_rex64(pc, reg, rm) \
    *((pc)++) = (char)(0x48 | (((reg) & 8) >> 1) | (((rm) & 8) >> 3))

#  define emit_rex(pc, dst, src) { \
        if ((dst) & 8 || (src) & 8) \
        *((pc)++) = (char)(0x40 | (((dst) & 8) >> 1) | (((src) & 8) >> 3)); }

/* Use a 0x66 prefix for increased padding */
#  define emit_nop(pc) { \
        *((pc)++) = (char)(0x90); }

#  define emit_modrm(pc, mod, dst, src) { \
        *((pc)++) = (char)(((mod) << 6) | (((dst) & 7) << 3) | ((src) & 7)); }

#  define emit_sib(pc, scale, index, base) { \
        *((pc)++) = (char)(((scale) << 6) | (((index) & 7) << 3) | ((base) & 7)); }

/* 0xXX +rq */
#  define emit_op_r(op, pc, reg) { \
        emit_rex64((pc), 0x0, (reg)); \
        *((pc)++) = (char)((op) | ((reg) & 7)); \
    }

#  define emit_64op_r(op, pc, reg) { \
        emit_rex((pc), 0x0, (reg)); \
        *((pc)++) = (char)((op) | ((reg) & 7)); \
    }

/* 0xXX /r */
#  define emit_op_r_r(op, pc, dst, src) { \
        emit_rex64((pc), (dst), (src)); \
        *((pc)++) = (char) (op); \
        emit_modrm((pc), b11, (dst), (src)); \
    }

#  define emit_op_r_mr(op, pc, dst, src, disp) { \
        emit_rex64((pc), (dst), (src)); \
        *((pc)++) = (char) (op); \
        if ((disp) == 0) { \
            emit_modrm((pc), b00, (dst), (src)); \
        } \
        else if (is8bit(disp)) { \
            emit_modrm((pc), b01, (dst), (src)); \
            *((pc)++) = (char)(disp); \
        } \
        else { \
            emit_modrm((pc), b10, (dst), (src)); \
            *(int *)(pc) = (int)(disp); \
            (pc) += 4; \
        } \
    }

#  define emit_op_i(op, pc, imm) { \
        *((pc)++) = (char)(op); \
        *(int *)(pc) = (int)(imm); \
        (pc) += 4; \
    }

#  define emit_op_r_i(pc, op, op2, code, dst, imm) { \
        emit_rex64((pc), 0x0, (dst)); \
        if (is8bit(imm)) { \
            *((pc)++) = (char) (op); \
            emit_modrm((pc), b11, (code), (dst)); \
            *((pc)++) = (char)(imm); \
        } \
        else { \
            *((pc)++) = (char) (op2); \
            emit_modrm((pc), b11, (code), (dst)); \
            *(int *)(pc) = (int)(imm); \
            (pc) += 4; \
        } \
    }

#  define emit_op_mr_i(pc, op, op2, code, dst, disp, imm) { \
        emit_rex64((pc), 0x0, (dst)); \
        if (is8bit(imm)) { \
            *((pc)++) = (char) (op); \
            if ((disp) == 0) { \
                emit_modrm((pc), b00, (code), (dst)); \
            } \
            else if (is8bit(disp)) { \
                emit_modrm((pc), b01, (code), (dst)); \
                *((pc)++) = (char)(disp); \
            } \
            else { \
                emit_modrm((pc), b10, (code), (dst)); \
                *(int *)(pc) = (int)(disp); \
                (pc) += 4; \
            } \
            *((pc)++) = (char)(imm); \
        } \
        else { \
            *((pc)++) = (char) (op2); \
            if ((disp) == 0) { \
                emit_modrm((pc), b00, (code), (dst)); \
            } \
            else if (is8bit(disp)) { \
                emit_modrm((pc), b01, (code), (dst)); \
                *((pc)++) = (char)(disp); \
            } \
            else { \
                emit_modrm((pc), b10, (code), (dst)); \
                *(int *)(pc) = (int)(disp); \
                (pc) += 4; \
            } \
            *(int *)(pc) = (int)(imm); \
            (pc) += 4; \
        } \
    }

/* Test for zero, then call this; it'll call Parrot_ex_throw_from_c_args if you try
 * to divide by zero */
#  define emit_div_check_zero(pc) { \
    char *sav_ptr; \
    emit_jcc((pc), jcc_jnz, 0x00); \
    sav_ptr = (char *)((pc) - 1); \
    emit_mov_r_r((pc), RDI, INTERP); \
    emit_mov_r_i((pc), RSI, 0); \
    emit_mov_r_i((pc), RDX, EXCEPTION_DIV_BY_ZERO); \
    emit_mov_r_i((pc), RCX, div_by_zero); \
    /* We must explicitly zero out RAX, since RAX is used in calling
     * conventions for va_arg functions, and Parrot_ex_throw_from_c_args is a va_arg
     * function */ \
    emit_xor_r_r((pc), RAX, RAX); \
    /* This assumes that jit_info is defined, if it's not, the code's not "consistent" */ \
    call_func(jit_info, (void (*)(void)) Parrot_ex_throw_from_c_args); \
    *sav_ptr = (char)((pc) - sav_ptr - 1); \
}

#  define emit_cmp_r_i(pc, dst, imm) emit_op_r_i((pc), 0x83, 0x81, 0x7, (dst), (imm))
#  define emit_cmp_mr_i(pc, dst, disp, imm) emit_op_mr_i((pc), 0x83, 0x81, 0x7, (dst), (disp), (imm))
#  define emit_cmp_r_r(pc, dst, src) emit_op_r_r(0x3b, (pc), (dst), (src))
#  define emit_cmp_r_mr(pc, dst, src, disp) emit_op_r_mr(0x3b, (pc), (dst), (src), (disp))
#  define emit_cmp_mr_r(pc, dst, disp, src) emit_op_r_mr(0x39, (pc), (src), (dst), (disp))


#  define emit_add_r_i(pc, dst, imm) emit_op_r_i((pc), 0x83, 0x81, 0x0, (dst), (imm))
#  define emit_add_mr_i(pc, dst, disp, imm) emit_op_mr_i((pc), 0x83, 0x81, 0x0, (dst), (disp), (imm))
#  define emit_add_r_r(pc, dst, src) emit_op_r_r(0x03, (pc), (dst), (src))
#  define emit_add_r_mr(pc, dst, src, disp) emit_op_r_mr(0x03, (pc), (dst), (src), (disp))
#  define emit_add_mr_r(pc, dst, disp, src) emit_op_r_mr(0x01, (pc), (src), (dst), (disp))

#  define emit_sub_r_i(pc, dst, imm) emit_op_r_i((pc), 0x83, 0x81, 0x5, (dst), (imm))
#  define emit_sub_mr_i(pc, dst, disp, imm) emit_op_mr_i((pc), 0x83, 0x81, 0x5, (dst), (disp), (imm))
#  define emit_sub_r_r(pc, dst, src) emit_op_r_r(0x2b, (pc), (dst), (src))
#  define emit_sub_r_mr(pc, dst, src, disp) emit_op_r_mr(0x29, (pc), (dst), (src), (disp))
#  define emit_sub_mr_r(pc, dst, disp, src) emit_op_r_mr(0x2b, (pc), (src), (dst), (disp))

#  define emit_xchg_r_r(pc, dst, src) emit_op_r_r(0x87, (pc), (dst), (src))
#  define emit_xchg_r_mr(pc, dst, src, disp) emit_op_r_mr(0x87, (pc), (dst), (src), (disp))
#  define emit_xchg_mr_r(pc, dst, disp, src) emit_op_r_mr(0x87, (pc), (src), (dst), (disp))

#  define emit_xor_r_i(pc, dst, imm) emit_op_r_i((pc), 0x83, 0x81, 0x6, (dst), (imm))
#  define emit_xor_mr_i(pc, dst, disp, imm) emit_op_mr_i((pc), 0x83, 0x81, 0x6, (dst), (disp), (imm))
#  define emit_xor_r_r(pc, dst, src) emit_op_r_r(0x33, (pc), (dst), (src))
#  define emit_xor_r_mr(pc, dst, src, disp) emit_op_r_mr(0x33, (pc), (dst), (src), (disp))
#  define emit_xor_mr_r(pc, dst, disp, src) emit_op_r_mr(0x31, (pc), (src), (dst), (disp))

#  define emit_and_r_i(pc, dst, imm) emit_op_r_i((pc), 0x83, 0x81, 0x4, (dst), (imm))
#  define emit_and_mr_i(pc, dst, disp, imm) emit_op_mr_i((pc), 0x83, 0x81, 0x4, (dst), (disp), (imm))
#  define emit_and_r_r(pc, dst, src) emit_op_r_r(0x23, (pc), (dst), (src))
#  define emit_and_r_mr(pc, dst, src, disp) emit_op_r_mr(0x23, (pc), (dst), (src), (disp))
#  define emit_and_mr_r(pc, dst, disp, src) emit_op_r_mr(0x21, (pc), (src), (dst), (disp))

#  define emit_or_r_i(pc, dst, imm) emit_op_r_i((pc), 0x83, 0x81, 0x1, (dst), (imm))
#  define emit_or_mr_i(pc, dst, disp, imm) emit_op_mr_i((pc), 0x83, 0x81, 0x1, (dst), (disp), (imm))
#  define emit_or_r_r(pc, dst, src) emit_op_r_r(0x0b, (pc), (dst), (src))
#  define emit_or_r_mr(pc, dst, src, disp) emit_op_r_mr(0x0b, (pc), (dst), (src), (disp))
#  define emit_or_mr_r(pc, dst, disp, src) emit_op_r_mr(0x09, (pc), (src), (dst), (disp))

#  define emit_imul_r_r(pc, dst, src) { \
    emit_rex64((pc), (dst), (src)); \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) 0xaf; \
    emit_modrm((pc), b11, (dst), (src)); \
}
#  define emit_imul_r_mr(pc, dst, src, disp) { \
    emit_rex64((pc), (dst), (src)); \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) 0xaf; \
    if ((disp) == 0) { \
        emit_modrm((pc), b00, (dst), (src)); \
    } \
    else if (is8bit(disp)) { \
        emit_modrm((pc), b01, (dst), (src)); \
        *((pc)++) = (char)(disp); \
    } \
    else { \
        emit_modrm((pc), b10, (dst), (src)); \
        *(int *)(pc) = (int)(disp); \
        (pc) += 4; \
    } \
}

#  define emit_idiv_r_r(pc, dst, src) { \
    emit_xor_r_r((pc), RDX, RDX); \
    emit_test_r((pc), (src)); \
    emit_div_check_zero(pc); \
    emit_op_r_r(0xf7, (pc), 0x7, (src)); \
}
#  define emit_idiv_r_mr(pc, dst, src, disp) { \
    emit_xor_r_r((pc), RDX, RDX); \
    emit_mov_r_mr((pc), ISR1, (src), (disp)); \
    emit_test_r((pc), ISR1); \
    emit_div_check_zero(pc); \
    emit_op_r_mr(0xf7, (pc), 0x7, (src), (disp)); \
}

#  define emit_abs_r(pc, reg) emit_and_r_i((pc), (reg), ~(1L << 63))

#  define emit_neg_r(pc, reg) emit_op_r_r(0xf7, (pc), 0x2, (reg))
#  define emit_not_r(pc, reg) emit_op_r_r(0xf7, (pc), 0x3, (reg))
#  define emit_inc_r(pc, reg) emit_op_r_r(0xff, (pc), 0x0, (reg))
#  define emit_dec_r(pc, reg) emit_op_r_r(0xff, (pc), 0x1, (reg))

/* This needs a fixup it seems...  call_r doesn't */
#  define emit_call_i(pc, imm) emit_op_i(0xe8, (pc), (imm))
#  define emit_call_r(pc, reg) { \
        emit_rex64((pc), 0x0, (reg)); \
        *(pc)++ = (char)0xff; \
        emit_modrm((pc), b11, 0x2, (reg)); }

#  define emit_jmp_r_r(pc, reg1, reg2) { \
    emit_rex((pc), (reg1), (reg2)); \
    *((pc)++) = (char)0xff; \
    emit_modrm((pc), b00, 0x4, b100); \
    emit_sib((pc), b00, (reg1), (reg2)); \
}

#  define emit_jmp_i(pc, imm) emit_op_i(0xe9, (pc), (imm))
#  define emit_jmp_i_fixup(ji, imm) { \
    opcode_t opcode; \
    opcode = jit_info->op_i + (imm); \
    Parrot_jit_newfixup(jit_info); \
    jit_info->arena.fixups->type = JIT_AMD64JUMP; \
    jit_info->arena.fixups->param.opcode = opcode; \
    if (jit_info->optimizer->cur_section->branch_target == \
            jit_info->optimizer->cur_section) \
        jit_info->arena.fixups->skip = \
            jit_info->optimizer->cur_section->branch_target->load_size; \
    emit_jmp_i(jit_info->native_ptr, 0xdead); \
}

#  define emit_leave(pc) *((pc)++) = (char)0xc9;
#  define emit_ret(pc) *((pc)++) = (char)0xc3;

#  define emit_mov_r_r(pc, dst, src) \
            emit_op_r_r(0x8B, (pc), (dst), (src))

/* mov [reg + offs], imm */
#  define emit_mov_mr_i(pc, reg, offs, imm) {\
            if (is32bit(imm)) { \
                emit_rex64((pc), 0x0, (reg)); \
                *((pc)++) = (char) 0xc7; \
                    if ((offs) == 0) { \
                        emit_modrm((pc), b00, 0x0, (reg)); \
                    } \
                    else if (is8bit(offs)) { \
                        emit_modrm((pc), b01, 0x0, (reg)); \
                        *((pc)++) = (char)(offs); \
                    } \
                    else { \
                        emit_modrm((pc), b10, 0x0, (reg)); \
                        *(int *)(pc) = (int)(offs); \
                        (pc) += 4; \
                    } \
                *(int *)(pc) = (int)(imm); \
                (pc) += 4; \
            } \
            else { \
                emit_mov_r_i((pc), ISR1, (imm)); \
                emit_mov_mr_r((pc), (reg), (offs), ISR1); \
            } \
 }

/* mov reg, imm */
#  define emit_mov_r_i(pc, reg, imm) {\
            emit_op_r(0xb8, (pc), (reg)); \
            *(long *)(pc) = (long)(imm); \
            (pc) += 8; \
 }

/* push reg */
#  define emit_push_r(pc, reg) emit_64op_r(0x50, (pc), (reg))
/* pop reg */
#  define emit_pop_r(pc, reg)  emit_64op_r(0x58, (pc), (reg))

/* push imm */
#  define emit_push_i(pc, imm) emit_op_i(0x68, (pc), (imm))

/* did you know, that (unsigned)0 is not an 8 bit value? */
#  define is8bit(c) (((long)(c)) >= -128 && ((long)(c)) <= 127)
#  define is32bit(c) (((long)(c)) >= -2147483648 && ((long)(c)) <= 2147483647)

#  define emit_get_int_from_stack(pc, dst, disp) \
    emit_mov_r_mr((pc), (dst), RBP, (disp))

#  define emit_send_int_to_stack(pc, src, disp) \
    emit_mov_mr_r((pc), RBP, (disp), (src))

/* mov dst, [src + disp] */
#  define emit_mov_r_mr(pc, dst, src, disp) \
          emit_op_r_mr(0x8b, (pc), (dst), (src), (disp))
/* mov [dst + disp], src */
#  define emit_mov_mr_r(pc, dst, disp, src) \
          emit_op_r_mr(0x89, (pc), (src), (dst), (disp))

/* lea dst, [src + disp] */
#  define emit_lea_r_mr(pc, dst, src, disp) \
          emit_op_r_mr(0x8d, (pc), (src), (dst), (disp))

/* push rbp
 * mov rbp, rsp */
/* move rsp to rbp; set rbp to rsp */
#  define jit_emit_stack_frame_enter(pc) { \
        emit_push_r((pc), RBP); \
        emit_mov_r_r((pc), RBP, RSP); \
    }

/* pop rbp */
#  define jit_emit_stack_frame_leave(pc) { \
        emit_pop_r((pc), RBP); \
    }

#  define emit_jcc(pc, code, disp) { \
        if (is8bit(disp)) { \
            *((pc)++) = (char) 0x70 | (code); \
            *((pc)++) = (char) (disp); \
        } \
        else { \
            *((pc)++) = (char) 0x0f; \
            *((pc)++) = (char) 0x80 | (code); \
            *(int *)(pc) = (int)(disp); \
            (pc) += 4; \
        } \
}

#  define emit_jcc_fixup(ji, code, imm) { \
    opcode_t opcode; \
    opcode = (ji)->op_i + (imm); \
    Parrot_jit_newfixup(ji); \
    (ji)->arena.fixups->type = JIT_AMD64BRANCH; \
    (ji)->arena.fixups->param.opcode = opcode; \
    if ((ji)->optimizer->cur_section->branch_target == \
            (ji)->optimizer->cur_section) \
        (ji)->arena.fixups->skip = \
            (ji)->optimizer->cur_section->branch_target->load_size; \
    emit_jcc((ji)->native_ptr, (code), 0xdead); \
}

typedef enum {
 jcc_jo,                /* Jump if overflow */
 jcc_jno,               /* Jump if not overflow */
 jcc_jb,                /* Jump if below */
 jcc_jc   = jcc_jb,     /* Jump if carry */
 jcc_jnae = jcc_jb,     /* Jump if not above or equal */
 jcc_jnb,               /* Jump if not below */
 jcc_jnc  = jcc_jnb,    /* Jump if not carry */
 jcc_jae  = jcc_jnb,    /* Jump if above or equal */
 jcc_jz,                /* Jump if zero */
 jcc_je   = jcc_jz,     /* Jump if equal */
 jcc_jnz,               /* Jump if not zero */
 jcc_jne  = jcc_jnz,    /* Jump if not equal */
 jcc_jbe,               /* Jump if below or equal */
 jcc_jna  = jcc_jbe,    /* Jump if not above */
 jcc_jnbe,              /* Jump if not below or equal */
 jcc_ja   = jcc_jnbe,   /* Jump if above */
 jcc_js,                /* Jump if sign */
 jcc_jns,               /* Jump if not sign */
 jcc_jp,                /* Jump if parity */
 jcc_jpe  = jcc_jp,     /* Jump if parity even */
 jcc_jnp,               /* Jump if not parity */
 jcc_jpo  = jcc_jnp,    /* Jump if parity odd */
 jcc_jl,                /* Jump if less */
 jcc_jnge = jcc_jl,     /* Jump if not greater or equal */
 jcc_jnl,               /* Jump if not less */
 jcc_jge  = jcc_jnl,    /* Jump if greater or equal */
 jcc_jle,               /* Jump if less or equal */
 jcc_jng  = jcc_jle,    /* Jump if not greater */
 jcc_jnle,              /* Jump if not less or equal */
 jcc_jg   = jcc_jnle    /* Jump if greater */
} amd64_jcc_t;

#  define emit_test_r(pc, reg) \
          emit_op_r_r(0x85, (pc), (reg), (reg))

#  define emit_test_r_r(pc, dst, src) \
          emit_op_r_r(0x85, (pc), (src), (dst))

    /* pop r15
     * pop r14
     * pop r13
     * pop r12
     * pop rbx
     * pop rbp
     * ret */
#  define jit_emit_end(pc) { \
    emit_pop_r((pc), R15); \
    emit_pop_r((pc), R14); \
    emit_pop_r((pc), R13); \
    emit_pop_r((pc), R12); \
    emit_pop_r((pc), RBX); \
    emit_pop_r((pc), RBP); \
    emit_leave(pc); \
    emit_ret(pc); \
}


/**************************************
 * Floating Point                     *
 **************************************/

#  define emit_op_x_x(prefix, op, pc, dst, src) { \
    *((pc)++) = (char) (prefix); \
    emit_rex((pc), (dst), (src)); \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) (op); \
    emit_modrm((pc), b11, (dst), (src)); \
}

#  define emit_op64_x_x(prefix, op, pc, dst, src) { \
    *((pc)++) = (char) (prefix); \
    emit_rex64((pc), (dst), (src)); \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) (op); \
    emit_modrm((pc), b11, (dst), (src)); \
}

#  define emit_op_x_mx(prefix, op, pc, dst, src, offs) { \
    *((pc)++) = (char) (prefix); \
    emit_rex((pc), (dst), (src)); \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) (op); \
    if ((offs) == 0) { \
        emit_modrm((pc), b00, (dst), (src)); \
    } \
    else if (is8bit(offs)) { \
        emit_modrm((pc), b01, (dst), (src)); \
        *((pc)++) = (char)(long)(offs); \
    } \
    else { \
        emit_modrm((pc), b10, (dst), (src)); \
        *(int *)(pc) = (int)(long)(offs); \
        (pc) += 4; \
    } \
}

#  define emit_op64_x_mx(prefix, op, pc, dst, src, offs) { \
    *((pc)++) = (char) (prefix); \
    emit_rex64((pc), (dst), (src)); \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) (op); \
    if ((offs) == 0 || (src) == RBP) { \
        emit_modrm((pc), b00, (dst), (src)); \
    } \
    else if (is8bit(offs)) { \
        emit_modrm((pc), b01, (dst), (src)); \
        *((pc)++) = (char)(long)(offs); \
    } \
    else { \
        emit_modrm((pc), b10, (dst), (src)); \
        *(int *)(pc) = (int)(long)(offs); \
        (pc) += 4; \
    } \
}

#  define emit_mov_x_x(pc, dst, src) emit_op_x_x(0x66, 0x28, (pc), (dst), (src))

#  define emit_mov_x_mx(pc, dst, src, offs) emit_op_x_mx(0xf2, 0x10, (pc), (dst), (src), (offs))
#  define emit_mov_mx_x(pc, dst, offs, src) emit_op_x_mx(0xf2, 0x11, (pc), (src), (dst), (offs))

/* Intended to zero a register */
#  define emit_movhlps_x_x(pc, dst, src) { \
    emit_rex((pc), (src), (dst)); \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) 0x12; \
    emit_modrm((pc), b11, (src), (dst)); \
}

#  define emit_movlhps_x_x(pc, dst, src) { \
    emit_rex((pc), (src), (dst)); \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) 0x16; \
    emit_modrm((pc), b11, (src), (dst)); \
}

#  define emit_movd_r_x(pc, dst, src) { \
    *((pc)++) = (char) 0x66; \
    emit_rex64((pc), (dst), (src)); \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) 0x7e; \
    emit_modrm((pc), b11, (dst), (src)); \
}

#  define emit_movd_x_r(pc, dst, src) { \
    *((pc)++) = (char) 0x66; \
    emit_rex64((pc), (dst), (src)); \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) 0x6e; \
    emit_modrm((pc), b11, (dst), (src)); \
}

#  define emit_test_x(pc, reg) { \
    emit_xor_x_x((pc), FSR2, FSR2); \
    emit_comisd_x_x((pc), (reg), FSR2); \
}

#  define emit_comisd_x_x(pc, dst, src)         emit_op_x_x(0x66, 0x2f, (pc), (dst), (src))
#  define emit_comisd_x_mx(pc, dst, src, offs) emit_op_x_mx(0x66, 0x2f, (pc), (dst), (src), (offs))

#  define emit_add_x_x(pc, dst, src)         emit_op_x_x(0xf2, 0x58, (pc), (dst), (src))
#  define emit_add_x_mx(pc, dst, src, offs) emit_op_x_mx(0xf2, 0x58, (pc), (dst), (src), (offs))

#  define emit_sub_x_x(pc, dst, src)         emit_op_x_x(0xf2, 0x5c, (pc), (dst), (src))
#  define emit_sub_x_mx(pc, dst, src, offs) emit_op_x_mx(0xf2, 0x5c, (pc), (dst), (src), (offs))

#  define emit_and_x_x(pc, dst, src)         emit_op_x_x(0x66, 0x54, (pc), (dst), (src))
#  define emit_and_x_mx(pc, dst, src, offs) emit_op_x_mx(0x66, 0x54, (pc), (dst), (src), (offs))

#  define emit_xor_x_x(pc, dst, src)         emit_op_x_x(0x66, 0x57, (pc), (dst), (src))
#  define emit_xor_x_mx(pc, dst, src, offs) emit_op_x_mx(0x66, 0x57, (pc), (dst), (src), (offs))

#  define emit_mul_x_x(pc, dst, src)         emit_op_x_x(0xf2, 0x59, (pc), (dst), (src))
#  define emit_mul_x_mx(pc, dst, src, offs) emit_op_x_mx(0xf2, 0x59, (pc), (dst), (src), (offs))

/* I tried to do a check for FSR1 == dst, such as from core.jit, but the bugs
 * to track down, the hackish things to do(movhlpd and movlhpd were used, but I
 * gave up and settled on the cleaner and likely faster overall method of
 * getting an FSR2 and going down to 14 mapped registers.
 */
#  define emit_div_x_x(pc, dst, src) { \
    emit_movhlps_x_x((pc), FSR2, FSR2); \
    emit_comisd_x_x((pc), FSR2, (src)); \
    emit_div_check_zero((pc)); \
    emit_op_x_x(0xf2, 0x5e, (pc), (dst), (src)); \
}
#  define emit_div_x_mx(pc, dst, src, offs) { \
    emit_movhlps_x_x((pc), FSR2, FSR2); \
    emit_comisd_x_mx((pc), FSR2, (src), (offs)); \
    emit_div_check_zero((pc)); \
    emit_op_x_mx(0xf2, 0x5e, (pc), (dst), (src), (offs)); \
}

#  define emit_sqrt_x_x(pc, dst, src)         emit_op_x_x(0xf2, 0x51, (pc), (dst), (src))
#  define emit_sqrt_x_mx(pc, dst, src, offs) emit_op_x_mx(0xf2, 0x51, (pc), (dst), (src), (offs))

#  define emit_cvtsi2sd_x_mr(pc, dst, src, offs) emit_op64_x_mx(0xf2, 0x2a, (pc), (dst), (src), (offs))
#  define emit_cvtsi2sd_x_r(pc, dst, src)         emit_op64_x_x(0xf2, 0x2a, (pc), (dst), (src))

/* Truncate */
#  define emit_cvttsd2si_r_mx(pc, dst, src, offs) emit_op64_x_mx(0xf2, 0x2c, (pc), (dst), (src), (offs))
#  define emit_cvttsd2si_r_x(pc, dst, src)         emit_op64_x_x(0xf2, 0x2c, (pc), (dst), (src))

/* Round */
#  define emit_cvtsd2si_r_mx(pc, dst, src, offs) emit_op64_x_mx(0xf2, 0x2d, (pc), (dst), (src), (offs))
#  define emit_cvtsd2si_r_x(pc, dst, src)         emit_op64_x_x(0xf2, 0x2d, (pc), (dst), (src))

#  define emit_ldmxcsr(pc) { \
    emit_xor_r_r((pc), ISR2, ISR2); \
    *((pc)++) = (char) 0x0f; \
    *((pc)++) = (char) 0xAE; \
    emit_modrm((pc), b10, 0x2, ISR2); \
    *(int *)(pc) = (int)&mxcsr; \
    (pc) += 4; \
}
/*********************************************************/

#  ifdef USE_OP_MAP_AND_CODE_START
/* These two can be mixed together just like in the i386 jit.  All the places I
 * can see this being called require it to be included, but for the moment I'm
 * keeping it as these macros. */
/*
 * emit code that gets interp->code->jit_info->arena->op_map
 * and sets the OP_MAP register
 */
#    define jit_emit_load_op_map(pc) { \
        emit_mov_r_mr((pc), OP_MAP, INTERP, (long)offsetof(Interp, code)); \
        emit_mov_r_mr((pc), OP_MAP, OP_MAP, (long)offsetof(PackFile_ByteCode, jit_info)); \
        emit_lea_r_mr((pc), OP_MAP, OP_MAP, (long)offsetof(Parrot_jit_info_t, arena)); \
        emit_mov_r_mr((pc), OP_MAP, OP_MAP, (long)offsetof(Parrot_jit_arena_t, op_map)); \
}

/*
 * emit code that gets interp->code->base.data
 * and sets the CODE_START register
 */
#    define jit_emit_load_code_start(pc) { \
        emit_mov_r_mr((pc), CODE_START, INTERP, (long)offsetof(Interp, code)); \
        emit_mov_r_mr((pc), CODE_START, CODE_START, (long)offsetof(PackFile_Segment, data)); \
}

#  endif /* USE_OP_MAP_AND_CODE_START */

void call_func(Parrot_jit_info_t *jit_info, void *addr);
void Parrot_emit_jump_to_rax(Parrot_jit_info_t *jit_info, Interp *interp);

/*
 * emit code that calls a core.ops function from src/core_ops.c,
 * the generated code is the translation of this:
 *
 *  PC = ((INTERP->op_func_table)[*PC])(PC,INTERP)
 */

extern int jit_op_count(void);

/*
 * release stack frame end exit see core.jit
 */
//extern static void Parrot_end_jit(Parrot_jit_info_t *, Interp *);

#  undef Parrot_jit_restart_op

void Parrot_jit_normal_op(Parrot_jit_info_t *jit_info, Interp *interp);
void Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info, Interp *interp);
void Parrot_jit_restart_op(Parrot_jit_info_t *jit_info, Interp *interp);
void jit_mov_mx_x(Interp *interp, Parrot_jit_info_t *jit_info,
        int base_reg, INTVAL offs, int src_reg);
void jit_mov_mr_r(Interp *interp, Parrot_jit_info_t *jit_info,
        int base_reg, INTVAL offs, int src_reg);
void jit_mov_x_mx(Interp *interp, Parrot_jit_info_t *jit_info,
        int dst_reg, int base_reg, INTVAL offs);
void jit_mov_r_mr(Interp *interp, Parrot_jit_info_t *jit_info,
        int dst_reg, int base_reg, INTVAL offs);
const jit_arch_info * Parrot_jit_init(Interp *interp);


/*
 * define how many int and float registers can be used by the
 * jit core
 */

#  define INT_REGISTERS_TO_MAP 10
#  define FLOAT_REGISTERS_TO_MAP 15

#  define REQUIRES_CONSTANT_POOL 0

void Parrot_jit_begin(Parrot_jit_info_t *jit_info, Interp *interp);
void Parrot_jit_dofixup(Parrot_jit_info_t *jit_info, Interp *interp);
void Parrot_jit_begin_sub(Parrot_jit_info_t *jit_info, Interp *interp);

extern const char intval_map[INT_REGISTERS_TO_MAP];
extern const char floatval_map[FLOAT_REGISTERS_TO_MAP];
extern const jit_arch_info arch_info;
extern const char div_by_zero[];
extern const int mxcsr;

#endif /* PARROT_JIT_AMD64_JIT_EMIT_H_GUARD */

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
