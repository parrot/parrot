/*
 * jit_emit.h
 *
 * skeleton example - a stripped down jit/ppc/jit_emit.h
 *
 * $Id: jit_emit.h 18484 2007-05-09 12:16:31Z paultcochrane $
 */

#if 0

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
    
#endif

#ifndef PARROT_JIT_AMD64_JIT_EMIT_H_GUARD
#define PARROT_JIT_AMD64_JIT_EMIT_H_GUARD

#  include <unistd.h>
#  include <limits.h>

void Parrot_jit_begin(Parrot_jit_info_t *, Interp *);


#if DEBUG_ENUM_TEST
#define foobar(a) printf("%-16s %d\n", #a, a)
#define foobar2(a, e) do { \
    if (a == e) \
    printf("%-16s is %x\n", #a, e); \
    else \
    printf("%-16s is %x, not %x\n", #a, a, e); \
} while (0)
foobar(RAX); foobar(RCX); foobar(RDX); foobar(RBX); foobar(RSP);
foobar(RBP); foobar(RSI); foobar(RDI);
foobar(R8); foobar(R9); foobar(R10); foobar(R11); foobar(R12); foobar(R13);
foobar(R14); foobar(R15);
#undef foobar
#undef foobar2
#endif
/*
 * define all the available cpu registers
 * reserve some for special purposes
 */
typedef enum {
    RAX,    /* return values */
    RCX,
    RDX,
    RBX,
    RSP,    /* stack pointer */
    RBP,    /* base pointer */
    RSI,
    RDI,

    R8,
    R9,
    R10,
    R11, /* Scratch */
    ISR1 = R11,
    R12,
    R13,
    CODE_START = R13, /* Don't forget, there are very weird pecularities */
    R14,
    OP_MAP = R14,
    R15,
    INTERP = R15
} amd64_iregister_t;

/*
 * If your arch doesn't have that much register available, you
 * don't cache OP_MAP, CODE_START, and INTERP in a cpu register.
 * Only BP (the register base pointer is needed and 1 or 2 temp regs
 */


/*
 * define, which register is the register base pointer
 */

#define Parrot_jit_emit_get_base_reg_no(pc) RBP

/*
 * define floating point register too, if there are some
 */
typedef enum {
      XMM0, XMMM1, XMM2, XMM3, XMM4, XMM5, XMM6, XMM7,
      XMM8, XMM9, XMM10, XMM11, XMM12, XMM13, XMM14, XMM15
} amd64_fregister_t;


/* Call can be handled without a fixup */
enum { JIT_X86BRANCH, JIT_X86JUMP };


/*
 * now define macros for all possible (and implemented) operations
 *
 * Parrot defines JIT_EMIT to 1 or 2, when this file is included in
 * exec_cpu.c or jit_cpu.c
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
#  define emit_REX(pc, dst, src) { \
        *(pc++) = (char)(0x48 | (((dst) & 8) >> 1) | (((src) & 8) >> 3)); }

#  define emit_nop(pc) { \
        *(pc++) = (char)(0x90); }

/* Same as above, but different disassemble from gdb */
#  define emit_64nop(pc) { \
        *(pc++) = (char)(0x48); \
        *(pc++) = (char)(0x90); }

#  define emit_modrm(pc, mod, dst, src) { \
        *(pc++) = (char)((mod << 6) | ((dst & 7) << 3) | (src & 7)); }

#  define emit_sib(pc, scale, index, base) { \
        *(pc++) = (char)((scale << 6) | ((index & 7) << 3) | (base & 7)); }

/* 0xXX +rq */
#  define emit_op_r(op, rexreq,  pc, reg) do { \
        if (rexreq) { \
            *(pc++) = (char)(0x48 | (((reg) & 8) >> 3)); \
        } \
        else if ((reg) & 8) { \
            *(pc++) = (char)(0x40 | (((reg) & 8) >> 3)); \
        } \
        *(pc++) = (char)((op) | ((reg) & 7)); \
    } while (0)

/* 0xXX /r */
#  define emit_op_r_r(op, pc, dst, src, disp) do { \
        emit_REX(pc, dst, src); \
        *(pc++) = (char) op; \
        if (disp == 0) { \
            emit_modrm(pc, b11, dst, src); \
        } \
        else if (is8bit(disp)) { \
            emit_modrm(pc, b01, dst, src); \
            *(pc++) = (char)disp; \
        } \
        else { \
            emit_modrm(pc, b10, dst, src); \
            *(int *)pc = (int)disp; \
            pc += 4; \
        } \
    } while (0)

#  define emit_op_i(op, pc, imm) do { \
        *(pc++) = (char)(op); \
        *(int *)pc = (int)imm; \
        pc += 4; \
    } while (0)


#  define emit_op_r_i(pc, op, op2, code, dst, imm) do { \
        emit_REX(pc, dst, 0x0); \
        if (is8bit(imm)) { \
            *(pc++) = (char) op; \
            emit_modrm(pc, b11, code, dst); \
            *(pc++) = (char)imm; \
        } \
        else { \
            *(pc++) = (char) op2; \
            emit_modrm(pc, b11, code, dst); \
            *(int *)pc = (int)imm; \
            pc += 4; \
        } \
    } while (0)


#  define emit_add_r_i(pc, dst, imm) emit_op_r_i(pc, 0x83, 0x81, 0x0, dst, imm)

#  define emit_call_i(pc, imm) emit_op_i(0xe8, pc, (imm) - (long)(pc) - 4)
#  define emit_call_r(pc, reg) { \
        emit_REX(pc, 0x0, reg); \
        *(pc)++ = (char)0xff; \
        emit_modrm(pc, b11, 0x2, reg); }
#  define emit_leave(pc) *(pc++) = (char)0xc9;
#  define emit_ret(pc) *(pc++) = (char)0xc3;

#  define emit_mov_r_r(pc, dst, src) \
            emit_op_r_r(0x8B, pc, dst, src, 0)

#  define emit_mov_r_i(pc, reg, imm) do {\
            emit_op_r(0xb8, 1, pc, reg); \
            *(long *)pc = (long)(imm); \
            pc += 8; \
 } while (0)

#  define emit_sub_r_r(pc, dst, src) \
          emit_op_r_r(0x29, pc, src, dst, 0)

#  define emit_push_r(pc, reg) emit_op_r(0x50, 0, pc, reg)
#  define emit_pop_r(pc, reg)  emit_op_r(0x58, 0, pc, reg)

#  define emit_push_i(pc, imm) emit_op_i(0x68, pc, imm)

#  define is8bit(c) ((c) >= -128 && (c) <= 127)

#  define emit_get_int_from_stack(pc, dst, disp) \
    emit_mov_r_mr(pc, dst, RBP, disp)

#  define emit_send_int_to_stack(pc, src, disp) \
    emit_mov_mr_r(pc, RBP, src, disp)

#  define emit_mov_r_mr(pc, dst, src, disp) \
          emit_op_r_r(0x8b, pc, dst, src, disp)
#  define emit_mov_mr_r(pc, dst, src, disp) \
          emit_op_r_r(0x89, pc, src, dst, disp)

#  define emit_lea_r_mr(pc, dst, src, disp) \
          emit_op_r_r(0x8d, pc, src, dst, disp)

/* push rbp
 * mov rbp, rsp */
/* move rsp to rbp; set rbp to rsp */
#  define jit_emit_stack_frame_enter(pc) do { \
        emit_push_r(pc, RBP); \
        emit_mov_r_r(pc, RBP, RSP); \
    } while (0)

/* pop rbp */
#  define jit_emit_stack_frame_leave(pc) do { \
        emit_pop_r(pc, RBP); \
    } while (0)

#  define emit_jcc(pc, code, disp) { \
        if (is8bit(disp)) { \
            *(pc++) = (char) 0x70 | (code); \
            *(pc++) = (char) disp; \
        } \
        else { \
            *(pc++) = (char) 0x0f; \
            *(pc++) = (char) 0x80 | (code); \
            *(int *)pc = (int)disp; \
            pc += 4; \
        } \
} while (0) 

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

#  define emit_test_r_r(pc, dst, src) \
          emit_op_r_r(0x85, pc, src, dst, 0)

    /* pop r15
     * pop r14
     * pop r13
     * pop r12
     * pop rbx
     * pop rbp
     * ret */
#  define jit_emit_end(pc) { \
    emit_pop_r(pc, R15); \
    emit_pop_r(pc, R14); \
    emit_pop_r(pc, R13); \
    emit_pop_r(pc, R12); \
    emit_pop_r(pc, RBX); \
    emit_pop_r(pc, RBP); \
    emit_leave(pc); \
    emit_ret(pc); \
}

#ifdef JIT_EMIT

/*
 * load register from memory offset, relative to the register base pointer
 * this is used to load hardware cpu registers from parrot registers
 */
//#  define jit_emit_mov_rm_i(pc, reg, offs) \
//      jit_emit_lwz(pc, reg, offs, BP)     /* e.g. PPC */

/* load floating point register from Parrot register */
//#  define jit_emit_mov_rm_n(pc, reg, offs) \
//      jit_emit_lfd(pc, reg, offs, BP)     /* e.g. PPC */

/* Store a CPU register back to a Parrot register. */

//#  define jit_emit_mov_mr_i(pc, offs, reg) \
      jit_emit_stw(pc, reg, offs, BP)

//#  define jit_emit_mov_mr_n(pc, offs, reg) \
      jit_emit_stfd(pc, reg,  offs, BP)

/*
 * emit a branch and remember the branch target for code fixup,
 * which id done, when all code is emitted
 */

//static void
//jit_emit_bc(Parrot_jit_info_t *jit_info, branch_t cond, opcode_t disp)
//{
//    /* see other architectures */
//}


/*
 * Load a 32-bit immediate value.
 */

//#  define jit_emit_mov_ri_i(pc, D, imm)   ...

/*
 * define some helper macros for code generation
 * Parrot_jit_normal_op() is: create code that does the equivalent of:
 *
 * PC = ((INTERP->op_func_table)[*PC])(PC,INTERP)
 *
 * First we need to calculate the PC at runtime by adding disp to
 * to the cached CODE_START register 'add_disp' in jit/ppc
 */

//#  define add_disp(pc, D, disp) \
//      jit_emit_mov_ri_i(pc, ISR1, disp); \
//      jit_emit_add_rrr(pc, D, CODE_START, ISR1)

/* These two can be mixed together just like in the i386 jit.  All the places I
 * can see this being called require it to be included, but for the moment I'm
 * keeping it as these macros. */
/*
 * emit code that gets interp->code->jit_info->arena->op_map
 * and sets the OP_MAP register
 */
#  define jit_emit_load_op_map(pc) { \
        emit_mov_r_mr(jit_info->native_ptr, OP_MAP, INTERP, (long)offsetof(Interp, code)); \
        emit_mov_r_mr(jit_info->native_ptr, OP_MAP, OP_MAP, (long)offsetof(PackFile_ByteCode, jit_info)); \
        emit_lea_r_mr(jit_info->native_ptr, OP_MAP, OP_MAP, (long)offsetof(Parrot_jit_info_t, arena)); \
        emit_mov_r_mr(jit_info->native_ptr, OP_MAP, OP_MAP, (long)offsetof(Parrot_jit_arena_t, op_map)); \
}

/*
 * emit code that gets interp->code->base.data
 * and sets the CODE_START register
 */
#  define jit_emit_load_code_start(pc) { \
        emit_mov_r_mr(jit_info->native_ptr, CODE_START, INTERP, (long)offsetof(Interp, code)); \
        emit_mov_r_mr(jit_info->native_ptr, CODE_START, CODE_START, (long)offsetof(PackFile_Segment, data)); \
}

/*
 * emit code that branches to the next code piece
 */
//#  define jit_emit_branch_to_opcode(pc, D)  ...

/*
 * emit code that calls a Parrot opcode function
 */
static void call_func(Parrot_jit_info_t *jit_info, void *addr) {
    /* Despite what gcc says, I'm not afraid of the following line */
    if ((long)addr > INT_MAX) {
        /* Move the address into our scratch register R11
         * We cannot use just the immediate form of call because the address
         * will be too large if we're using a shared parrot, but will be ok on
         * a static parrot.
         *
         * This will most likely only be used on shared libraries.
         */
        /* Absolute near call to R11 */
        emit_mov_r_i(jit_info->native_ptr, R11, addr);
        emit_call_r(jit_info->native_ptr, R11);
    }
    else {
        /* Call with an immediate value.  Mainly for a static parrot, and
         * debugging */
        emit_call_i(jit_info->native_ptr, addr);
    }
}

#endif /* JIT_EMIT */

#if JIT_EMIT == 2

/*
 * emit code that calls a core.ops function from src/core_ops.c,
 * the generated code is the translation of this:
 *
 *  PC = ((INTERP->op_func_table)[*PC])(PC,INTERP)
 */


extern int jit_op_count(void);

void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                     Interp *interp)
{
    int cur_op = *jit_info->cur_op;
    static int check;

    if (cur_op >= jit_op_count()) {
        cur_op = CORE_OPS_wrapper__;
    }

    /* check every eight ops, could be changed to 16, or 32, or ... */
    if ((++check & 0x7) == 0) {
        emit_mov_r_i(jit_info->native_ptr, RDI, jit_info->cur_op);
        emit_mov_r_r(jit_info->native_ptr, RSI, INTERP);
        call_func(jit_info, (void (*)(void))interp->op_func_table[CORE_OPS_check_events]);
    }

    emit_mov_r_i(jit_info->native_ptr, RDI, jit_info->cur_op);
    emit_mov_r_r(jit_info->native_ptr, RSI, INTERP);

    call_func(jit_info, (void (*)(void))interp->op_func_table[cur_op]);


}

/*
 * emit code for a branching parrot opcode. All cached registers
 * need recalculation, as a branch can go into different code segments
 * with different code start and different jit_info
 */
void
Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                   Interp *interp)
{
    Parrot_jit_normal_op(jit_info, interp);
    /* Parrot_emit_jump_to_eax */
    if (!jit_info->objfile) {
        // Get interp->code->base.data
        jit_emit_load_code_start(jit_info->native_ptr);
        emit_sub_r_r(jit_info->native_ptr, RAX, CODE_START);

        // Get interp->code->jit_info->arena->op_map
        jit_emit_load_op_map(jit_info->native_ptr);
    }

    emit_REX(jit_info->native_ptr, 0x0, OP_MAP);
    *(jit_info->native_ptr++) = (char)0xff;
    emit_modrm(jit_info->native_ptr, b00, 0x4, RSP);
    emit_sib(jit_info->native_ptr, b00, RAX, OP_MAP);
    /* END Parrot_emit_jump_to_eax */
}

/*
 * release stack frame end exit see core.jit
 */
static void Parrot_end_jit(Parrot_jit_info_t *, Interp *);

#  undef Parrot_jit_restart_op
/*
 * emit code that might leave the JIT runcore
 * see  ppc or i386
 */
void
Parrot_jit_restart_op(Parrot_jit_info_t *jit_info,
                      Interp *interp)
{
    char *sav_ptr;

    Parrot_jit_normal_op(jit_info, interp);
    emit_test_r_r(jit_info->native_ptr, RAX, RAX);

    /* Quick fixup, but we know it's 12, anyway it needs to be a byte */
    emit_jcc(jit_info->native_ptr, jcc_jnz, 0x00);
    sav_ptr = (long)jit_info->native_ptr - 1;
    Parrot_end_jit(jit_info, interp);
    *sav_ptr = (char)(jit_info->native_ptr - sav_ptr - 1);

    /* Parrot_emit_jump_to_eax */
    if (!jit_info->objfile) {
        // Get interp->code->base.data
        jit_emit_load_code_start(jit_info->native_ptr);
        emit_sub_r_r(jit_info->native_ptr, RAX, CODE_START);

        // Get interp->code->jit_info->arena->op_map
        jit_emit_load_op_map(jit_info->native_ptr);
    }

    emit_REX(jit_info->native_ptr, 0x0, OP_MAP);
    *(jit_info->native_ptr++) = (char)0xff;
    emit_modrm(jit_info->native_ptr, b00, 0x4, RSP);
    emit_sib(jit_info->native_ptr, b00, RAX, OP_MAP);
    /* END Parrot_emit_jump_to_eax */
    
}

#endif /* JIT_EMIT == 2 */

#if JIT_EMIT == 0

/*
 * emit stack frame according to ABI
 * preserve mapped registers according to ABI
 * load INTERP, OP_MAP, CODE_START, BP registers
 * then run the code at pc
 *
 * the function is called as
 *   runops(interp, pc)
 *
 * at runtime
 */
void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 Interp *interp)
{
    jit_emit_stack_frame_enter(jit_info->native_ptr);

    /* Saved registers */
    /* push rbp
     * push rbx
     * push r12
     * push r13
     * push r14
     * push r15 */
    emit_push_r(jit_info->native_ptr, RBP);
    emit_push_r(jit_info->native_ptr, RBX);
    emit_push_r(jit_info->native_ptr, R12);
    emit_push_r(jit_info->native_ptr, R13);
    emit_push_r(jit_info->native_ptr, R14);
    emit_push_r(jit_info->native_ptr, R15);
    /* When our "function" gets called, RDI will be the interp,
     * and RSI will be jit_info->native_ptr */
    /* Set R15 to interp */
    /* mov r15, rdi */
    emit_mov_r_r(jit_info->native_ptr, R15, RDI);
    emit_mov_r_r(jit_info->native_ptr, RAX, RSI);


    /* Parrot_emit_jump_to_eax */
    if (!jit_info->objfile) {
        // Get interp->code->base.data
        jit_emit_load_code_start(jit_info->native_ptr);
        emit_sub_r_r(jit_info->native_ptr, RAX, CODE_START);

        // Get interp->code->jit_info->arena->op_map
        jit_emit_load_op_map(jit_info->native_ptr);
    }

    emit_REX(jit_info->native_ptr, 0x0, OP_MAP);
    *(jit_info->native_ptr++) = (char)0xff;
    emit_modrm(jit_info->native_ptr, b00, 0x4, RSP);
    emit_sib(jit_info->native_ptr, b00, RAX, OP_MAP);
    /* END Parrot_emit_jump_to_eax */

}


/*
 * fix up all emitted branches
 * see  ppc or i386
 */
static void
Parrot_jit_dofixup(Parrot_jit_info_t *jit_info,
                   Interp *interp)
{
}

static void
Parrot_jit_begin_sub(Parrot_jit_info_t *jit_info,
                         Interp *interp)
{
    // NOT CALLED CURRENTLY
}



/*
 * define interface functions for register -> parrot register moves
 * and v.v.
 */

/* set mem to reg */
static void
jit_mov_mr_n_offs(Parrot_jit_info_t *jit_info,
        int base_reg, INTVAL offs, int src_reg)
{
    emit_64nop(jit_info->native_ptr);
}

static void
jit_mov_mr_offs(Parrot_jit_info_t *jit_info,
        int base_reg, INTVAL offs, int src_reg)
{
    emit_get_int_from_stack(jit_info->native_ptr, src_reg, offs);
}

/* set reg to mem */
static void
jit_mov_rm_n_offs(Parrot_jit_info_t *jit_info,
        int dst_reg, int base_reg, INTVAL offs)
{
    emit_64nop(jit_info->native_ptr);
}

static void
jit_mov_rm_offs(Parrot_jit_info_t *jit_info,
        int dst_reg, int base_reg, INTVAL offs)
{
    emit_send_int_to_stack(jit_info->native_ptr, dst_reg, offs);
}

/*
 * define how many int and float registers can be used by the
 * jit core
 */

#  define INT_REGISTERS_TO_MAP 16
#  define FLOAT_REGISTERS_TO_MAP 16

/*
 * enumerate these mapped registers
 * please note that you have to preserve registers in
 * Parrot_jit_begin according to the ABI of the architecture
 */

static const char intval_map[INT_REGISTERS_TO_MAP] =
    {
        /* Preserved */
        RBP, RBX, R12, R13, R14, R15,
        /* Unpreserved */
        RAX, RCX, RDX,  RSP, RSI, RDI, R8, R9, R10, R11, 
    };

static const char floatval_map[FLOAT_REGISTERS_TO_MAP] =
    {
      XMM0, XMMM1, XMM2, XMM3, XMM4, XMM5, XMM6, XMM7,
      XMM8, XMM9, XMM10, XMM11, XMM12, XMM13, XMM14, XMM15
    };


/*
 * define arch specific details in jit_arch_info
 */

static const jit_arch_info arch_info = {
    jit_mov_rm_offs,
    jit_mov_rm_n_offs,
    jit_mov_mr_offs,
    jit_mov_mr_n_offs,
    Parrot_jit_dofixup,
    (jit_arch_f)0,
    {
        /* JIT_CODE_FILE */
        {
            Parrot_jit_begin,   /* emit code prologue */
            0,
            0,
            intval_map,
            0,    /* mapped float regs */
            0,    /* all preserved */
            floatval_map
        },
        /* JIT_CODE_SUB */
        {
            Parrot_jit_begin_sub,   /* emit code prologue */
            0,                  /* 7 mapped ints */
            0,                   /* all volatile */
            intval_map,
            0,                  /* mapped float regs */
            0,                   /* all volatile */
            floatval_map
        },
        /* JIT_CODE_SUB_REGS_ONLY */
        {
            /*Parrot_jit_begin_sub_regs*/0,  /* emit code prologue */
            16,                  /* 7 mapped ints */
            6,                   /* all volatile */
            intval_map,
            0,                  /* 12 mapped float regs */
            0,                   /* all volatile */
            floatval_map
        }
    }
};

/*
 * and finally you need an interface function to return above structure
 */

const jit_arch_info *
Parrot_jit_init(Interp *interp)
{
    return &arch_info;
}


#endif /* JIT_EMIT == 0 */
#endif /* PARROT_JIT_AMD64_JIT_EMIT_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
