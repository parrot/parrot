/*
 * jit_emit.h
 * 
 * ARM (I think this is all ARM2 or later, although it is APCS-32)
 *
 * $Id$
 */

/*  Registers
 *
 *  r0  Argument/result/scratch register 0.
 *  r1  Argument/result/scratch register 1.
 *  r2  Argument/result/scratch register 2.
 *  r3  Argument/result/scratch register 3.
 *  r4  Variable register 1.
 *  r5  Variable register 2.
 *  r6  Variable register 3.
 *  r7  Variable register 4.
 *  r8  Variable register 5.
 *  r9  ARM State variable register 6. Static Base in PID, re-entrant
 *      shared-library variants.
 *  r10 ARM State variable register 7. Stack limit pointer in stack-checked 
 *      variants.
 *  r11 ARM State variable register 8. ARM state frame pointer.
 *  r12 The Intra-Procedure call scratch register.
 *  r13 The Stack Pointer.
 *  r14 The Link Register.
 *  r15 The Program Counter.
 *
 * r0-r3 are used to pass in first 4 arguments, and are not preserved by a
 * function. Results (that would fit) are returned in r0
 * Other registers are preserved across calls, although (by implication) r14
 * and r15 are used by the call process. I don't think that it is mandated
 * that r14 on return must hold the link address.
 * r12 (ip) is only used on subroutine entry for stack frame calculations -
 * after then it is a useful scratch register. If you push r14 you get
 * another scratch register quickly.
 *
 * Most things nowadays are StrongARM or later. StrongARM is v4 of the
 * architecture. ARM6 and ARM7 cores are v3, which introduced the 32 bit
 * address bus. Earlier cores (which you won't encounter) used a 26 bit address
 * bus, with program counter and status register combined in r15
 */

typedef enum {
    r0,
    r1,
    r2,
    r3,
    r4,
    r5,
    r6,
    r7,
    r8,
    r9,
    r10,
    r11,
    r12,
    r13,
    r14,
    r15,
    REG10_sl = 10, REG11_fp = 11,
    REG12_ip = 12,
    REG13_sp = 13,
    REG14_lr = 14,
    REG15_pc = 15

} arm_register_t;

typedef enum {
    cond_EQ = 0x00,
    cond_NE = 0x10,
    cond_CS = 0x20,
    cond_CC = 0x30,
    cond_MI = 0x40,
    cond_PL = 0x50,
    cond_VS = 0x60,
    cond_VC = 0x70,
    cond_HI = 0x80,
    cond_LS = 0x90,
    cond_GE = 0xA0,
    cond_LT = 0xB0,
    cond_GT = 0xC0,
    cond_LE = 0xD0,
    cond_AL = 0xE0,
/*    cond_NV = 0xF0, */
    /* synonyms for CS and CC:  */
    cond_HS = 0x20,
    cond_LO = 0x30
} arm_cond_t;

/* I've deliberately shifted these right by 1 bit so that I can forcibly
   set the status flag on ops such as CMP. It's easy to forget (the assembler
   doesn't mandate you explicitly write CMPS, it just sets the bit for you).
   I got an illegal instruction trap on a StrongARM for a CMP without S, but
   I think some of the other comparison operators have legal weird effects
   with no S flag.  */
typedef enum {
    AND = 0x00,
    EOR = 0x02,
    SUB = 0x04,  /* Subtract         rd = rn - op2   */
    RSB = 0x06,  /* Reverse SUbtract rd = op2 - rn  ; op2 is more flexible.   */
    ADD = 0x08,
    ADC = 0x0A,  /* ADd with Carry.  */
    SBC = 0x0C,  /* SuBtract with Carry.  */
    RSC = 0x0E,  /* Reverse Subtract with Carry.  */
    TST = 0x11,  /* TeST                  rn AND op2    (sets flags).  */
    TEQ = 0x13,  /* Test EQuivalence      rn XOR op2    (won't set V flag). */
    CMP = 0x15,  /* CoMPare		  rn  -  op2    */
    CMN = 0x17,  /* CoMpare Negated       rn  +  op2    */
    ORR = 0x18,
    MOV = 0x1A,  /* MOVe                  rd =   op2 */
    BIC = 0x1C,  /* BIt Clear             rd = rn AND NOT op2 */
    MVN = 0x1E   /* MoV Not               rd = NOT op2 */
} alu_op_t;

/* note MVN is move    NOT      (ie logical NOT, 1s complement), whereas
        CMN is compare NEGATIVE (ie arithmetic NEGATION, 2s complement)  */

#define arith_sets_S 0x10

#define INTERP_STRUCT_ADDR_REG r4

/* B / BL
 *
 *  +--------------------------------------------------------------------+
 *  | cond | 1 0 1 | L |                signed_immed_24                  |
 *  +--------------------------------------------------------------------+
 *   31  28 27   25 24  23                                              0
 *
 *
 * The L bit
 * 
 * If L == 1 the instruction will store a return address in the link
 * register (R14). Otherwise L == 0, the instruction will simply branch without
 * storing a return address.
 *
 * The target address
 *
 * Specifies the address to branch to. The branch target address is calculated
 * by:
 *
 *  - Sign-extending the 24-bit signed (two's complement) immediate to 32 bits.
 *
 *  - Shifting the result left two bits.
 *
 *  - Adding this to the contents of the PC, which contains the address of the
 *    branch instruction plus 8.
 *
 * The instruction can therefore specify a branch of approximately ±32MB.
 *
 * [Not the full 32 bit address range of the v3 and later cores.]
 */

/* IIRC bx is branch into thumb mode, so don't name this back to bx  */

char *emit_branch(char *pc,
                  arm_cond_t cond,
                  int L,
                  int imm) {
    *(pc++) = imm;
    *(pc++) = ((imm) >> 8);
    *(pc++) = ((imm) >> 16);
    *(pc++) = cond | 0xA | L;
    return pc;
}

#define emit_b(pc, cond, imm) \
  emit_branch(pc, cond, 0, imm)

#define emit_bl(pc, cond, imm) \
  emit_branch(pc, cond, 1, imm)


#define reg2mask(reg) (1<<(reg))

typedef enum {
    is_store      = 0x00,
    is_load       = 0x10,
    is_writeback  = 0x20,
    no_writeback  = 0,
    is_caret  	  = 0x40, /* assembler syntax is ^ - load sets status flags in
                             USR mode, or load/store use user bank registers
                             in other mode. IIRC.  */
    no_caret      = 0,
    is_byte  	  = 0x40,
    no_byte  	  = 0,	  /* It's a B suffix for a byte load, no suffix for
                             word load, so this is more natural than is_word  */
    is_pre  	  = 0x01, /* pre index addressing.  */
    is_post       = 0x00  /* post indexed addressing. ie arithmetic for free  */
} transfer_flags;

/* multiple register transfer direction.
   D = decrease, I = increase
   A = after, B = before
   or the stack notation
   FD = full descending (the usual)
   ED = empty descending
   FA = full ascending
   FD = full descending
   values for stack notation are 0x10 | (ldm type) << 2 | (stm type)
*/
typedef enum {
    dir_DA = 0,
    dir_IA = 1,
    dir_DB = 2,
    dir_IB = 3,
    dir_FD = 0x10 | (1 << 2) | 2,
    dir_FA = 0x10 | (0 << 2) | 3,
    dir_ED = 0x10 | (3 << 2) | 0,
    dir_EA = 0x10 | (2 << 2) | 1
} ldm_stm_dir_t;

typedef enum {
    dir_Up = 0x80,
    dir_Down = 0x00
} ldr_str_dir_t;

char *
emit_ldmstm_x(char *pc,
             arm_cond_t cond,
             int l_s,
             ldm_stm_dir_t direction,
             int caret,
             int writeback,
             int base,
             int regmask) {
    if ((l_s == is_load) && (direction & 0x10))
        direction >>= 2;

    *(pc++) = regmask;
    *(pc++) = regmask >> 8;
    /* bottom bit of direction is the up/down flag.  */
    *(pc++) = ((direction & 1) << 7) | caret | writeback | l_s | base;
    /* binary 100x is code for stm/ldm.  */
    /* Top bit of direction is pre/post increment flag.  */
    *(pc++) = cond | 0x8 | ((direction >> 1) & 1);
    return pc;
}

/* Is is going to be rare to non existent that anyone needs to use the ^
   syntax on LDM or STM, so make it easy to generate the normal form:  */
#define emit_ldmstm(pc, cond, l_s, direction, writeback, base, regmask) \
	emit_ldmstm_x(pc, cond, l_s, direction, 0, writeback, base, regmask)

/* Load / Store
 *
 *  +--------------------------------------------------------------------+
 *  | cond | 0 1 | I | P | U | B | W | L |  Rn  |  Rd  |      offset     |
 *  +--------------------------------------------------------------------+
 *   31  28 27 26 25  24  23  22  21  20  19  16 15  12 11              0
 *
 *
 * The P bit
 *
 * P == 0 indicates the use of post-indexed addressing. The base register value
 *        is used for the memory address, and the offset is then applied to the
 *        base register and written back to the base register.
 *
 * P == 1 indicates the use of offset addressing or pre-indexed addressing (the
 *        W bit determines which). The memory address is generated by applying
 *        the offset to the base register value.
 *
 * The U bit
 *
 * Indicates whether the offset is added to the base (U == 1) or is subtracted
 * from the base (U == 0).
 *
 * The B bit
 * 
 * Distinguishes between an unsigned byte (B == 1) and a word (B == 0) access.
 *
 * The W bit
 *
 * P == 0 If W == 0, the instruction is LDR, LDRB, STR or STRB and a normal
 *        memory access is performed. If W == 1, the instruction is LDRBT,
 *        LDRT, STRBT or STRT and an unprivileged (User mode) memory access is
 *        performed.
 *
 * P == 1 If W == 0, the base register is not updated (offset addressing). If
 *        W == 1, the calculated memory address is written back to the base 
 *        register (pre-indexed addressing).
 *
 * The L bit
 *
 * Distinguishes between a Load (L == 1) and a Store (L == 0).
 *
 *  <Rd> is the destination register.
 *  <Rn> is the base register.
 *
 * XXX need to detail addr mode, for I = 0 and I = 1
 *
 * Note that you can take advantage of post indexed addressing to get a free
 * add onto the base register if you need it for some other purpose.
 *
 * Note that on StrongARM [and later? but not XScale :-(] if you don't use Rd
 * next instruction then a load doesn't stall if it is from the cache (ie
 * 1 cycle loads). You will want to re-order things where possible to take
 * advantage of this.
 *
 * ARM1 had register shift register as possibilities for the offset (as the
 * ALU ops still do. These took 1 more cycle, and were taken out as virtually
 * no use was found for them. However, the bit patterns they represent
 * certainly didn't used to fault as an illegal instruction on ARM2s, and
 * probably later. So beware of generating illegal bit pattern offsets, as
 * you'll get silent undefined behaviour.
 */

char *
emit_ldrstr(char *pc,
            arm_cond_t cond,
            int l_s,
            ldr_str_dir_t direction,
            int pre,
            int writeback,
            int byte, 
            int dest,
            int base,
            int offset_type,
            unsigned int offset) {

    *(pc++) = offset;
    *(pc++) = ((offset >> 8) & 0xF) | (dest << 4);
    *(pc++) = direction | byte | writeback | l_s | base;
    *(pc++) = cond | 0x4 | offset_type | pre;
    return pc;
}

char *
emit_ldrstr_offset (char *pc,
                    arm_cond_t cond,
                    int l_s,
                    int pre,
                    int writeback,
                    int byte,
                    int dest,
                    int base,
                    int offset) {
    ldr_str_dir_t direction = dir_Up;
    if (offset > 4095 || offset < -4095) {
        internal_exception(JIT_ERROR,
                           "Unable to generate offset %d, larger than 4095\n",
                           offset);
    }
    if (offset < 0) {
        direction = dir_Down;
        offset = -offset;
    }
    return emit_ldrstr(pc, cond, l_s, direction, pre, writeback, byte, dest,
                       base, 0, offset);
}

/* Arithmetic
 *
 *  +--------------------------------------------------------------------+
 *  | cond | 0 0 | I |  ALU  Opcode  | S |  Rn  |  Rd  | shifted operand |
 *  +--------------------------------------------------------------------+
 *   31  28 27 26 25  24  23  22  21  20  19  16 15  12 11              0
 *
 *
 * The S bit
 * 
 * Indicates if the CPSR will be updated (S == 1) or not (S == 0).
 *
 * Two types of CPSR updates can occur:
 *
 *  - If <Rd> is not R15, the N and Z flags are set according to the result of
 *    of the addition, and C and V flags are set according to whether the
 *    addition generated a carry (unsigned overflow) and a signed overflow,
 *    respectively. The rest of the CPSR is unchanged.
 *
 * XXX shifted immediate values for the second operand can also set the C
 * flag (and therefore presumably also clear it) when the S flag is set for
 * certain ALU ops. (I think just the logical ops) This is obscure, but
 * sometimes useful. No idea where this is documented.
 *
 *  - If <Rd> is R15, the SPSR of the current mode is copied to the CPSR. This
 *    form of the instruction is UNPREDICTABLE if executed in User mode or
 *    System mode, because these do not have an SPSR.
 *
 *
 */

typedef enum {
    shift_LSL = 0x00,
    shift_LSR = 0x20,
    shift_ASR = 0x40,
    shift_ROR = 0x60,
    shift_ASL = 0x00	/* Synonym - no sign extension (or not) on <<  */
} barrel_shift_t;
/* RRX (rotate right with extend - a 1 position 33 bit rotate including the
   carry flag) is encoded as ROR by 0.  */

char *
emit_arith(char *pc,
           arm_cond_t cond,
           alu_op_t op,
           int status,
           arm_register_t rd,
           arm_register_t rn,
           int operand2_type,
           int operand2) {
    *(pc++) = operand2;
    *(pc++) = rd << 4 | ((operand2 >> 8) & 0xF);
    *(pc++) = op << 4 | status | rn;
    *(pc++) = cond | 0 | operand2_type | op >> 4;
    return pc;
}

/* eg add r0, r3, r7  */
#define emit_arith_reg(pc, cond, op, status, rd, rn, rm) \
	emit_arith (pc, cond, op, status, rd, rn, 0, rm)

/* eg sub r0, r3, r7 lsr #3 */
#define emit_arith_reg_shift_const(pc, cond, op, status, rd, rn, rm, shift, by) \
	emit_arith (pc, cond, op, status, rd, rn, 0, ((by) << 7) | shift | 0 | (rm))

/* eg orrs r1, r2, r1 rrx */
#define emit_arith_reg_rrx(pc, cond, op, status, rd, rn, rm) \
	emit_arith (pc, cond, op, status, rd, rn, 0, shift_ROR | 0 | (rm))

/* I believe these take 2 cycles (due to having to access a 4th register.  */
#define emit_arith_reg_shift_reg(pc, cond, op, status, rd, rn, rm, shift, rs) \
	emit_arith (pc, cond, op, status, rd, rn, 0, ((rs) << 8) | shift | 0x10 | (rm))

#define emit_arith_immediate(pc, cond, op, status, rd, rn, val, rotate) \
	emit_arith (pc, cond, op, status, rd, rn, 2, ((rotate) << 8) | (val))

/* I'll use mov r0, r0 as my NOP for now.  */
#define emit_nop(pc) emit_mov (pc, r0, r0)

/* MOV ignores rn  */
#define emit_mov(pc, dest, src) emit_arith_reg (pc, cond_AL, MOV, 0, dest, 0, src)

#define emit_dcd(pc, word)  { \
    *((int *)pc) = word; \
    pc+=4; }

static void Parrot_jit_int_load(Parrot_jit_info *jit_info,
                             struct Parrot_Interp *interpreter,
                             int param,
                             int hwreg)
{
    opcode_t op_type
        = interpreter->op_info_table[*jit_info->cur_op].types[param];
    int val = jit_info->cur_op[param];
    int offset;

    switch(op_type){
        case PARROT_ARG_I:
            offset = ((char *)&interpreter->ctx.int_reg.registers[val])
                - (char *)interpreter;
            if (offset > 4095) {
                internal_exception(JIT_ERROR,
                                   "integer load register %d generates offset %d, larger than 4095\n",
                           val, offset);
            }
            jit_info->native_ptr = emit_ldrstr_offset (jit_info->native_ptr,
                                                       cond_AL,
                                                       is_load,
                                                       is_pre,
                                                       0, 0,
                                                       hwreg,
                                                       INTERP_STRUCT_ADDR_REG,
                                                       offset);
            break;

        case PARROT_ARG_IC:
        default:
            internal_exception(JIT_ERROR,
                               "Unsupported op parameter type %d in jit_int_load\n",
                               op_type);
    }
}

static void Parrot_jit_int_store(Parrot_jit_info *jit_info,
                             struct Parrot_Interp *interpreter,
                             int param,
                             int hwreg)
{
    opcode_t op_type
         = interpreter->op_info_table[*jit_info->cur_op].types[param];
    int val = jit_info->cur_op[param];
    int offset;

    switch(op_type){
        case PARROT_ARG_I:
            offset = ((char *)&interpreter->ctx.int_reg.registers[val])
                - (char *)interpreter;
            if (offset > 4095) {
                internal_exception(JIT_ERROR,
                                   "integer store register %d generates offset %d, larger than 4095\n",
                           val, offset);
            }
            jit_info->native_ptr = emit_ldrstr_offset (jit_info->native_ptr,
                                                       cond_AL,
                                                       is_store,
                                                       is_pre,
                                                       0, 0,
                                                       hwreg,
                                                       INTERP_STRUCT_ADDR_REG,
                                                       offset);
            break;

        case PARROT_ARG_N:
        default:
            internal_exception(JIT_ERROR,
                            "Unsupported op parameter type %d in jit_int_store\n",
                               op_type);
    }
}

static void emit_jump_to_op(Parrot_jit_info *jit_info, arm_cond_t cond,
                            int L, opcode_t disp) {
    opcode_t opcode = jit_info->op_i + disp;

    if(opcode <= jit_info->op_i) {
        int offset = jit_info->op_map[opcode].offset -
            (jit_info->native_ptr - jit_info->arena_start);

        jit_info->native_ptr
            = emit_branch(jit_info->native_ptr, cond, L, (offset >> 2) - 2);
        return;
    }
    internal_exception(JIT_ERROR, "Can't go forward yet\n");
    
}

void Parrot_jit_dofixup(Parrot_jit_info *jit_info,
                        struct Parrot_Interp * interpreter)
{
    /* Todo.  */
}
/* My entry code is create a stack frame:
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	sub	fp, ip, #4
   Then store the first parameter (pointer to the interpreter) in r4.
	mov	r4, r0
*/

void
Parrot_jit_begin(Parrot_jit_info *jit_info,
                 struct Parrot_Interp * interpreter)
{
    jit_info->native_ptr = emit_mov (jit_info->native_ptr, REG12_ip, REG13_sp);
    jit_info->native_ptr = emit_ldmstm (jit_info->native_ptr,
                                        cond_AL, is_store, dir_FD,
                                        is_writeback,
                                        REG13_sp,
                                        reg2mask(4) | reg2mask(REG11_fp)
                                        | reg2mask(REG12_ip)
                                        | reg2mask(REG14_lr)
                                        | reg2mask(REG15_pc));
    jit_info->native_ptr = emit_arith_immediate (jit_info->native_ptr, cond_AL,
                                                 SUB, 0, REG11_fp, REG12_ip,
                                                 4, 0);
    jit_info->native_ptr = emit_mov (jit_info->native_ptr, 4, 0);
}

/* I'm going to load registers to call functions in general like this:
    adr     r14,  .L1
    ldmia   r14!,  {r0, r1, r2, pc} ; register list built by jit
    .L1:    r0 data
            r1 data
            r2 data
           <where ever>	; address of function.
    .L2:                      ; next instruction - return point from func.

    # here I'm going to do 

    mov	    r1, r4	; current interpreter is arg 1
    adr     r14,  .L1
    ldmia   r14!,  {r0, pc}
    .L1:    address of current opcode
           <where ever>	; address of function for op
    .L2:                      ; next instruction - return point from func.
*/

/*
XXX no.
need to adr beyond:

    mov	    r1, r4	; current interpreter is arg 1
    adr     r14,  .L1
    ldmda   r14!,  {r0, ip}
    mov     pc, ip
    .L1     address of current opcode
    dcd     <where ever>      ; address of function for op
    .L2:                      ; next instruction - return point from func.
*/
void
Parrot_jit_normal_op(Parrot_jit_info *jit_info,
                     struct Parrot_Interp * interpreter)
{
    jit_info->native_ptr = emit_mov (jit_info->native_ptr, r1, r4);
#ifndef ARM_K_BUG
    jit_info->native_ptr = emit_mov (jit_info->native_ptr, REG14_lr, REG15_pc);
    jit_info->native_ptr = emit_ldmstm (jit_info->native_ptr,
                                        cond_AL, is_load, dir_IA,
                                        is_writeback,
                                        REG14_lr,
                                        reg2mask(0) | reg2mask(REG15_pc));
#else
    jit_info->native_ptr = emit_arith_immediate (jit_info->native_ptr, cond_AL,
                                                 ADD, 0, REG14_lr, REG15_pc,
                                                 4, 0);
    jit_info->native_ptr = emit_ldmstm (jit_info->native_ptr,
                                        cond_AL, is_load, dir_IA,
                                        is_writeback,
                                        REG14_lr,
                                        reg2mask(0) | reg2mask(REG12_ip));
    jit_info->native_ptr = emit_mov (jit_info->native_ptr, REG15_pc, REG12_ip);
#endif
    emit_dcd (jit_info->native_ptr, (int) jit_info->cur_op);
    emit_dcd (jit_info->native_ptr,
              (int) interpreter->op_func_table[*(jit_info->cur_op)]);
}

/* We get back address of opcode in bytecode.
   We want address of equivalent bit of jit code, which is stored as an
   address at the same offset in a jit table. */
void Parrot_jit_cpcf_op(Parrot_jit_info *jit_info,
                        struct Parrot_Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info, interpreter);

    /* This is effectively the pseudo-opcode ldr - ie load relative to PC.
       So offset includes pipeline.  */
    jit_info->native_ptr = emit_ldrstr_offset (jit_info->native_ptr, cond_AL,
                                               is_load, is_pre, 0, 0,
                                               REG14_lr, REG15_pc, 0);
    /* ldr pc, [r14, r0]  */
    /* lazy. this is offset type 0, 0x000 which is r0 with zero shift  */
    jit_info->native_ptr = emit_ldrstr (jit_info->native_ptr, cond_AL,
                                        is_load, dir_Up, is_pre, 0, 0,
                                        REG15_pc, REG14_lr, 2, 0);
    /* and this "instruction" is never reached, so we can use it to store
       the constant that we load into r14  */
    emit_dcd (jit_info->native_ptr,
              ((long) jit_info->op_map) -
              ((long) interpreter->code->byte_code));
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
