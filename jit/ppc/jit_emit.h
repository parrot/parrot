/*
 * jit_emit.h
 * 
 * PPC
 *
 * $Id$
 */
 
#include <unistd.h>
#include <sys/mman.h>
#include <limits.h>
#ifndef PAGESIZE
#  define PAGESIZE 10
#endif

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
    r16,
    r17,
    r18,
    r19,
    r20,
    r21,
    r22,
    r23,
    r24,
    r25,
    r26,
    r27,
    r28,
    r29,
    r30,
    r31
} ppc_register_t;

#if JIT_EMIT

enum { JIT_PPC_CALL };

#define emit_op(op) (op << 2)

#define emit_r3(reg) (reg >> 3)

#define emit_l5(reg) (reg << 5)

/* Move (mr).
 *
 * mr rD,rA
 *
 *  +-----------------------------------+
 *  | 31 |
 *  +-----------------------------------+
 * 0    5 6                     29 30 31 
 * */
#define emit_mr(pc, dst, src) \
  *(pc++) = emit_op(31) | emit_r3(src); \
  *(pc++) = (char)(emit_l5(src) | dst); \
  *(pc++) = (char)(0x3 | src * 8); \
  *(pc++) = 0x78

/* Move from/to special purpose register.
 *
 * mtspr SPR,rS
 *
 *  +--------------------------------------------------------------------+
 *  |    31    |     D-S    |         spr            |      type     | 0 |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11                    20 21           30  31 
 * 
 * spr = 8 == LR
 * spr = 9 == CTR
 *
 * mfspr type == 339
 * mtspr type == 467
 *
 * mtlr  rS == mtspr 8,rS
 * mtctr rS == mtspr 9,rS
 *
 */
#define emit_mxspr(pc, S, spr, type) \
  *(pc++) = 31 << 2 | S >> 3; \
  *(pc++) = (char)(S << 5 | spr); \
  *(pc++) = type >> 7; \
  *(pc++) = (char)type << 1

#define emit_mtlr(pc, S) \
  emit_mxspr(pc, S, 8, 467)

#define emit_mtctr(pc, S) \
  emit_mxspr(pc, S, 9, 467)

#define emit_mflr(pc, D) \
  emit_mxspr(pc, D, 8, 339)

/* Branches (b/bl/ba/bla) with 24 bits literal.
 *
 * b   (AA = 0, LK = 0)
 * bl  (AA = 0, LK = 1)
 * ba  (AA = 1, LK = 0)
 * bla (AA = 1, LK = 1)
 *
 *  +--------------------------------------------------------------------+
 *  |    18    |                      LI                       | AA | LK |
 *  +--------------------------------------------------------------------+
 * 0          5 6                                            29   30   31 
 *
 * If AA = 0, the branch target address is the sum of LI and the address of
 * this instruction.
 * If AA = 1, the branch target address is the value of LI.
 * If LK = 1, the effextive address of the instruction following the branch
 * instruction is placed into the link register.
 *
 */

#define emit_bx(pc, type, disp) \
  *(pc++) = emit_op(18) | disp >> 24; \
  *(pc++) = disp >> 16; \
  *(pc++) = disp >> 8; \
  *(pc++) = disp | type

#define emit_b(pc, disp) \
  emit_bx(pc, 0, disp)

#define emit_bl(pc, disp) \
  emit_bx(pc, 1, disp)

#define emit_ba(pc, disp) \
  emit_bx(pc, 2, disp)

#define emit_bla(pc, disp) \
  emit_bx(pc, 3, disp)

/* Branch conditional to count register or link register.
 *
 *  +--------------------------------------------------------------------+
 *  |    19    |     BO     |     BI     |     0     |     type     | LK |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11        15 16       20 21          30   31 
 *
 * cr [type = 528] 
 * lr [type = 16]
 */

#define emit_bcctrx(pc, bo, bi, type, lk) \
  *(pc++) = 19 << 2 | bo >> 3; \
  *(pc++) = (char)(bo << 5 | bi); \
  *(pc++) = type >> 8; \
  *(pc++) = (char)(type << 1| lk)

#define emit_bcctr(pc, bo, bi) \
  emit_bcctrx(pc, bo, bi, 528, 0)

#define emit_bcctrl(pc, bo, bi) \
  emit_bcctrx(pc, bo, bi, 528, 1)

#define emit_bctrl(pc) \
  emit_bcctrl(pc, 20, 0)

#define emit_blr(pc) \
  emit_bcctrx(pc, 20, 0, 16, 0)

#define emit_bclr(pc, bo, bi) \
  emit_bcctrx(pc, bo, bi, 16, 0)

#define emit_bclrl(pc, bo, bi) \
  emit_bcctrx(pc, bo, bi, 16, 1)

/* 3 register operation.
 * 
 *  +--------------------------------------------------------------------+
 *  |  Opcode  |     D     |     A     |     B     |OE|     type      |Rc|
 *  +--------------------------------------------------------------------+
 * 0          5 6        10 11       15 16       20 21 22           30 31
 * 
 */

#define emit_3reg(pc, opcode, D, A, B, OE, type, Rc) \
  *(pc++) = opcode << 2 | D >> 3; \
  *(pc++) = (char)(D << 5 | A); \
  *(pc++) = B << 3 | OE | type >> 7; \
  *(pc++) = (char)(type << 1 | Rc);

/* Add [type = 266, OE = 0, Rc = 0]
 *
 * adds rA and rB and place the result in rD.
 */

#define emit_add(pc, D, A, B) \
  emit_3reg(pc, 31, D, A, B, 0, 266, 0);

#define emit_sub(pc, D, A, B) \
  emit_3reg(pc, 31, D, A, B, 0, 40, 0);

/* 2 register and immediate operation.
 *
 *  +--------------------------------------------------------------------+
 *  |  Opcode  |    D-S     |     A      |       Immediate-Disp          |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11        15 16                           31
 *
 * addi  [opcode = 14] Adds rA to Immediate and place the result in rD. 
 *                  
 * addis [opcode = 15] Adds rA to Immediate shifted 16 bits and place the
 *                     result in rD.
 *
 * andil [opcode = 28] Ands rD and the (unsigned)Immediate and place the
 *                     result in rA.
 *
 * lwz   rD,d(rA) [op = 32]
 * lwzu  rD,d(rA) [op = 33]
 * lbz   rD,d(rA) [op = 34]
 * lbzu  rD,d(rA) [op = 35]
 * stw   rS,d(rA) [op = 36]
 * stwu  rS,d(rA) [op = 37]
 * stb   rS,d(rA) [op = 38]
 * stbu  rS,d(rA) [op = 39]
 * lhz   rD,d(rA) [op = 40]
 * lhzu  rD,d(rA) [op = 41]
 * lha   rD,d(rA) [op = 42]
 * lhau  rD,d(rA) [op = 43]
 * sth   rS,d(rA) [op = 44]
 * sthu  rS,d(rA) [op = 45]
 * lmw   rD,d(rA) [op = 46]
 * stmw  rS,d(rA) [op = 47]
 * lfu   frD,d(rA) [op = 48]
 * lfsu  frD,d(rA) [op = 49]
 * lfd   frD,d(rA) [op = 50]
 * lfdu  frD,d(rA) [op = 51]
 * stfs  frS,d(rA) [op = 52]
 * stfsu frS,d(rA) [op = 53]
 * stfd  frS,d(rA) [op = 54]
 * stfdu frS,d(rA) [op = 55]
 */

#define emit_2reg(pc, opcode, D, A, immediate) \
  *(pc++) = opcode << 2 | D >> 3; \
  *(pc++) = (char)(D << 5 | A); \
  *(pc++) = ((immediate) >> 8); \
  *(pc++) = (char)(immediate)

#define emit_addi(pc, D, A, immediate) \
  emit_2reg(pc, 14, D, A, immediate)

#define emit_addis(pc, D, A, immediate) \
  emit_2reg(pc, 15, D, A, immediate)

#define emit_andil(pc, S, A, uimm) \
  emit_2reg(pc, 28, S, A, uimm)

#define emit_lwz(pc, D, disp, A) \
  emit_2reg(pc, 32, D, A, disp)

#define emit_stw(pc, S, disp, A) \
  emit_2reg(pc, 36, S, A, disp)

#define emit_stwu(pc, S, disp, A) \
  emit_2reg(pc, 37, S, A, disp)

#define emit_stmw(pc, S, disp, A) \
  emit_2reg(pc, 47, S, A, disp)

#define emit_lmw(pc, D, disp, A) \
  emit_2reg(pc, 46, D, A, disp)


/* Load a CPU register from a Parrot register. */

#define emit_lwz_r(pc, reg, addr) \
  emit_lwz(pc, reg, (((char *)addr) - \
    ((char *)&interpreter->ctx.int_reg.registers[0])), r13)
  
/* Store a CPU register back to a Parrot register. */

#define emit_stw_r(pc, reg, addr) \
  emit_stw(pc, reg, (((char *)addr) - \
    ((char *)&interpreter->ctx.int_reg.registers[0])), r13)
/*
 * Load a 32-bit immediate value.  If the lower 16 bits are bigger than
 * 0x8000 we clear the higher 16 bits.  If the immediate only uses the
 * lower 16 bits, the third instruction is not necessary.
 */
#define emit_imm32(pc, D, imm) \
  emit_addi(pc, D, 0, (long)imm & 0xffff); \
  if (((long)imm & 0xffff) > 0x8000) { \
    emit_andil(pc, D, D, 0xffff); } \
  if ((long)imm >> 16 != 0) { \
    emit_addis(pc, D, D, (long)imm >> 16); }

void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 struct Parrot_Interp * interpreter)
{
    emit_mflr(jit_info->native_ptr, r0);
/*    emit_stmw(jit_info->native_ptr, r30, -8, r1); */
    emit_stw(jit_info->native_ptr, r0, 8, r1);
    emit_stwu(jit_info->native_ptr, r1, -64, r1);
    emit_mr(jit_info->native_ptr, r13, r3);
    emit_imm32(jit_info->native_ptr, r14, jit_info->arena.op_map);
    emit_imm32(jit_info->native_ptr, r15, interpreter->code->byte_code);
}

void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    emit_imm32(jit_info->native_ptr, r3, jit_info->cur_op);
    emit_mr(jit_info->native_ptr, r4, r13);

    Parrot_jit_newfixup(jit_info);

    jit_info->arena.fixups->type = JIT_PPC_CALL;
    jit_info->arena.fixups->param.fptr =
        (void (*)(void))interpreter->op_func_table[*(jit_info->cur_op)];

    emit_bl(jit_info->native_ptr, 0);
}
   
void
Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info, interpreter);
    emit_sub(jit_info->native_ptr, r0, r15, r0); 
    emit_add(jit_info->native_ptr, r0, r14, r0);
    emit_mr(jit_info->native_ptr, r12, r0); 
    emit_lwz(jit_info->native_ptr, r12, 0, r12);
    emit_mtlr(jit_info->native_ptr, r12);    
    emit_blr(jit_info->native_ptr);
}

void
Parrot_jit_dofixup(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{
    Parrot_jit_fixup_t *fixup;
    char *fixup_ptr;
    char *disp;
    long d,high,low;

    fixup = jit_info->arena.fixups;

    while(fixup){
        switch(fixup->type){
            case JIT_PPC_CALL:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = ((long)fixup->param.fptr - (long)fixup_ptr);
                *(fixup_ptr++) |= (char)(d >> 29) & 3;
                *(fixup_ptr++) = (char)(d >> 16);
                *(fixup_ptr++) = (char)(d >> 8);
                *(fixup_ptr++) |= (char)d; 
                break;
            default:
                internal_exception(JIT_ERROR, "Unknown fixup type:%d\n",
                                   fixup->type);
                break;
        }
        fixup = fixup->next;
    }
}

void
Parrot_jit_load_registers(Parrot_jit_info_t *jit_info,
    struct Parrot_Interp *interpreter)
{
    Parrot_jit_optimizer_section_t *cur_se = jit_info->optimizer->cur_section;
    int i = cur_se->registers_used;

    while (i--)
        if (cur_se->int_reg_dir[cur_se->int_reg_usage[i]] & PARROT_ARGDIR_IN) {
            emit_lwz_r(jit_info->native_ptr, jit_info->register_map[i],
                &interpreter->ctx.int_reg.registers[cur_se->int_reg_usage[i]]);
        }

    /* The total size of the loads */
    if (!jit_info->optimizer->cur_section->load_size)
        jit_info->optimizer->cur_section->load_size = jit_info->native_ptr -
            (jit_info->arena.start + 
                jit_info->arena.op_map[jit_info->op_i].offset); 
}

/* Save registers for the current section */
void
Parrot_jit_save_registers(Parrot_jit_info_t *jit_info,
    struct Parrot_Interp * interpreter)
{
    Parrot_jit_optimizer_section_t *cur_se = jit_info->optimizer->cur_section;
    int i = cur_se->registers_used;

    while (i--)
        if (cur_se->int_reg_dir[cur_se->int_reg_usage[i]] & PARROT_ARGDIR_OUT) {
            emit_stw_r(jit_info->native_ptr, jit_info->register_map[i],
                &interpreter->ctx.int_reg.registers[cur_se->int_reg_usage[i]]);
        }
}

#else

#  define REQUIRES_CONSTANT_POOL 0
#  define MAX_REGITERS_TO_MAP 25

/* Reserved:
 * r13 interpreter
 * r14 op_map
 * r15 code_start
 */
char register_map[MAX_REGITERS_TO_MAP] =
    { r16, r17, r18, r19, r20, r21, r22, r23, 
      r24, r25, r26, r27, r28, r29, r30, r31,
      r2, r3, r4, r5, r6, r7, r8, r9, r10 };
      

static void
ppc_sync_cache (void *_start, void *_end) 
{
    char *start = (char*)(((int)_start) &~(PAGESIZE - 1));
    char *end = (char *)((((int)_end) + PAGESIZE - 1) &~(PAGESIZE - 1));

    /* It seems like this isn't ppc-specific -- should other systems
     * do this, too?
     */
    if (mprotect(start, end - start, PROT_READ|PROT_WRITE|PROT_EXEC) < 0) {
        internal_exception(-1, "Can't mprotect jit code %x - %x: %s\n",
                           start, end, strerror(errno));
    }
static void
ppc_sync_cache (void *_start, void *_end)
{   
    char *start = (char*)(((int)_start) &~(PAGESIZE - 1));
    char *end = (char *)((((int)_end) + PAGESIZE - 1) &~(PAGESIZE - 1));
    char *_sync;
    
    /* It seems like this isn't ppc-specific -- should other systems
     * do this, too?
     */ 
    if (mprotect(start, end - start, PROT_READ|PROT_WRITE|PROT_EXEC) < 0) {
        internal_exception(-1, "Can't mprotect jit code %x - %x: %s\n",
                           start, end, strerror(errno));
    }

    for (_sync = start; _sync < end; _sync += PAGESIZE) {
        __asm__ __volatile__ (
/* for 601, do nothing: */
        "
        dcbst 0,%0
        sync
        dcbf 0,%0
        sync
        icbi 0,%0
        sync
        isync
        "
        :
        : "r" ((long)_sync)
        );  
    }
}

}

#endif
