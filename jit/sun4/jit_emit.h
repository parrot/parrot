/*
** jit_emit.h
**
** SPARC
**
** $Id$
**/

#if !defined(PARROT_SUN4_JIT_EMIT_H_GUARD)
#define PARROT_SUN4_JIT_EMIT_H_GUARD

/*
 * SPARC JIT overview:
 *
 * The interpreter pointer is kept in i0.
 * The address of register I0 is stored in i1, with all parrot register access
 * performed relative to this register.
 * The address of the opcode - native code mapping array is kept in i3.
 *
 * See IMPORTANT SHORTCUTS below.
 */

/* Sparc register numbers */
#define emitm_g(n) (n)
#define emitm_o(n) ((n) + 8)
#define emitm_l(n) ((n) + 16)
#define emitm_i(n) ((n) + 24)
#define emitm_f(n) (n)

#if JIT_EMIT

#define emitm_FP emitm_i(6)
#define emitm_SP emitm_o(6)

#define emitm_mask(n, val) ((unsigned)(val) & ((1U << n) - 1))

#define emitm_hi30(val)   ((unsigned)(val) >> 2)
#define emitm_hi22(val)   ((unsigned)(val) >> 10)
#define emitm_lo10(val)   emitm_mask(10, val)
#define emitm_simm13(val) emitm_mask(13, val)

#define emitm_opval(val)  ((unsigned)(val) << 30)
#define emitm_op2val(val) ((unsigned)(val) << 22)
#define emitm_op3val(val) ((unsigned)(val) << 19)
#define emitm_rd(val)     ((unsigned)(val) << 25)
#define emitm_rs1(val)    ((unsigned)(val) << 14)

#define emitm_simm13_max 4095
#define emitm_simm13_min -4096

#define emitm_simm13_const(val) (((val) >= emitm_simm13_min) && ((val) < emitm_simm13_max))

#define emitm_branch_max 8388607
#define emitm_branch_min -8388608

/* format 1 - only instruction */
#define emitm_call_30(pc, disp30) { \
    *(unsigned *)(pc) = emitm_opval(1) | (disp30); \
    pc += 4; }

/* format 2a - sethi primarily */
#define emitm_2a(pc, op, rd, op2, imm22) { \
    *(unsigned *)(pc) = emitm_opval(op) | emitm_rd(rd) | emitm_op2val(op2) | \
        (imm22); \
    pc += 4; }

/* format 2b - branches */
#define emitm_2b(pc, a, cond, op2, disp22) { \
    *(unsigned *)(pc) = emitm_opval(0) | ((unsigned)(a) << 29) | \
                        ((unsigned)(cond) << 25) | emitm_op2val(op2) | \
                        emitm_mask(22, disp22); \
                        pc += 4; }

/* Generic fields of format 3 */
#define emitm_fmt3(pc, op, rd, op3, rs1, low14) { \
    *(unsigned *)pc = emitm_opval(op) |emitm_rd(rd) | emitm_op3val(op3) | \
        emitm_rs1(rs1) | (low14); \
    pc +=4 ; }

/* format 3a */
#define emitm_3a(pc, op, rd, op3, rs1, asi, rs2) \
    emitm_fmt3(pc, op, rd, op3, rs1, ((asi) << 5) | (rs2))

/* format 3b */
#define emitm_3b(pc, op, rd, op3, rs1, simm13) \
    emitm_fmt3(pc, op, rd, op3, rs1, (1L << 13) | emitm_mask(13, (simm13)))

/* format 3c */
#define emitm_3c(pc, op, rd, op3, rs1, opf, rs2) \
    emitm_fmt3(pc, op, rd, op3, rs1, (opf << 5) | (rs2))

/* Miscellaneous instructions */

/* sethi imm22, r[rd] */
#define emitm_sethi(pc, imm22, rd) emitm_2a(pc, 0, rd, 04, imm22)

/* NOP */
#define emitm_nop(pc) emitm_sethi(pc, 0, 0)

/* SAVE */

#define emitm_save_r(pc, rs1, rs2, rd) emitm_3a(pc, 2, rd, 074, rs1, 0, rs2)
#define emitm_save_i(pc, rs1, i, rd)   emitm_3b(pc, 2, rd, 074, rs1, i)

/* RESTORE */
#define emitm_restore_r(pc, rs1, rs2, rd) emitm_3a(pc, 2, rd, 075, rs1, 0, rd)
#define emitm_restore_i(pc, rs1, i, rd)   emitm_3b(pc, 2, rd, 075, rs1, i)

/* MOV */
#define emitm_mov_r(pc, rs, rd) emitm_or_r(pc, emitm_g(0), rs, rd)
#define emitm_mov_i(pc, i, rd)  emitm_or_i(pc, emitm_g(0), i, rd)

/* Integer Register Loads */

/* ldX[rs1 + simm13], rd */
#define emitm_ldsb_i(pc, rs1, i, rd) emitm_3b(pc, 3, rd, 011, rs1, i)
#define emitm_ldub_i(pc, rs1, i, rd) emitm_3b(pc, 3, rd, 001, rs1, i)
#define emitm_ldsh_i(pc, rs1, i, rd) emitm_3b(pc, 3, rd, 012, rs1, i)
#define emitm_lduh_i(pc, rs1, i, rd) emitm_3b(pc, 3, rd, 002, rs1, i)
#define emitm_ld_i(pc, rs1, i, rd)   emitm_3b(pc, 3, rd, 000, rs1, i)
#define emitm_ldd_i(pc, rs1, i, rd)  emitm_3b(pc, 3, rd, 003, rs1, i)

/* ldX[rs1 + rs2], rd */
#define emitm_ldsb_r(pc, rs1, rs2, rd) emitm_3a(pc, 3, rd, 011, rs1, 0, rs2)
#define emitm_ldub_r(pc, rs1, rs2, rd) emitm_3a(pc, 3, rd, 001, rs1, 0, rs2)
#define emitm_ldsh_r(pc, rs1, rs2, rd) emitm_3a(pc, 3, rd, 012, rs1, 0, rs2)
#define emitm_lduh_r(pc, rs1, rs2, rd) emitm_3a(pc, 3, rd, 002, rs1, 0, rs2)
#define emitm_ld_r(pc, rs1, rs2, rd)   emitm_3a(pc, 3, rd, 000, rs1, 0, rs2)
#define emitm_ldd_r(pc, rs1, rs2, rd)  emitm_3a(pc, 3, rd, 003, rs1, 0, rs2)

/* Integer Register Stores */

/* stX rd, [rs1 + simm13] */
#define emitm_stb_i(pc, rd, rs1, i) emitm_3b(pc, 3, rd, 005, rs1, i)
#define emitm_sth_i(pc, rd, rs1, i) emitm_3b(pc, 3, rd, 006, rs1, i)
#define emitm_st_i(pc, rd, rs1, i)  emitm_3b(pc, 3, rd, 004, rs1, i)
#define emitm_std_i(pc, rd, rs1, i) emitm_3b(pc, 3, rd, 007, rs1, i)

/* stX rd, [rs1 + rs2] */
#define emitm_stb_r(pc, rd, rs1, rs2) emitm_3a(pc, 3, rd, 005, rs1, 0, rs2)
#define emitm_sth_r(pc, rd, rs1, rs2) emitm_3a(pc, 3, rd, 006, rs1, 0, rs2)
#define emitm_st_r(pc, rd, rs1, rs2)  emitm_3a(pc, 3, rd, 004, rs1, 0, rs2)
#define emitm_std_r(pc, rd, rs1, rs2) emitm_3a(pc, 3, rd, 007, rs1, 0, rs2)

/* Floating Point Register Loads */

/* ldX[rs1 + simm13], freg[rd] */
#define emitm_ldf_i(pc, rs1, i, rd)   emitm_3b(pc, 3, rd, 040, rs1, i)
#define emitm_lddf_i(pc, rs1, i, rd)  emitm_3b(pc, 3, rd, 043, rs1, i)

#define emitm_ldfsr_i(pc, rs1, i, rd) emitm_3b(pc, 3, rd, 041, rs1, i)

/* ldX[rs1 + rs2], freg[rd] */
#define emitm_ldf_r(pc, rs1, rs2, rd)   emitm_3a(pc, 3, rd, 040, rs1, 0, rs2)
#define emitm_lddf_r(pc, rs1, rs2, rd)  emitm_3a(pc, 3, rd, 043, rs1, 0, rs2)

#define emitm_ldfsr_r(pc, rs1, rs2, rd) emitm_3a(pc, 3, rd, 041, rs1, 0, rs2)

/* Floating Point Register Stores */

/* stX freg[rd], [rs1 + simm13] */
#define emitm_stf_i(pc, rd, rs1, i)   emitm_3b(pc, 3, rd, 044, rs1, i)
#define emitm_stdf_i(pc, rd, rs1, i)  emitm_3b(pc, 3, rd, 047, rs1, i)

#define emitm_stfsr_i(pc, rd, rs1, i) emitm_3b(pc, 3, rd, 045, rs1, i)

/* stX freg[rd], [rs1 + rs2] */
#define emitm_stf_r_r(pc, rd, rs1, rs2)   emitm_3a(pc, 3, rd, 044, rs1, 0, rs2)
#define emitm_stdf_r_r(pc, rd, rs1, rs2)  emitm_3a(pc, 3, rd, 047, rs1, 0, rs2)
#define emitm_stfsr_r_r(pc, rd, rs1, rs2) emitm_3a(pc, 3, rd, 045, rs1, 0, rs2)

/* Logical instructions */

/* op r[rs1], r[rs2], r[rd] */
#define emitm_logic_r(pc, op3, rs1, rs2, rd) \
    emitm_3a(pc, 2, rd, op3, rs1, 0, rs2)

/* op r[rs1], simm13, r[rd] */
#define emitm_logic_i(pc, op3, rs1, simm13, rd) \
    emitm_3b(pc, 2, rd, op3, rs1, simm13)

#define emitm_and_r(pc, rs1, rs2, rd)    emitm_logic_r(pc, 001, rs1, rs2, rd)
#define emitm_andcc_r(pc, rs1, rs2, rd)  emitm_logic_r(pc, 021, rs1, rs2, rd)
#define emitm_andn_r(pc, rs1, rs2, rd)   emitm_logic_r(pc, 005, rs1, rs2, rd)
#define emitm_andncc_r(pc, rs1, rs2, rd) emitm_logic_r(pc, 025, rs1, rs2, rd)
#define emitm_and_i(pc, rs1, i, rd)      emitm_logic_i(pc, 001, rs1, i, rd)
#define emitm_andcc_i(pc, rs1, i, rd)    emitm_logic_i(pc, 021, rs1, i, rd)
#define emitm_andn_i(pc, rs1, i, rd)     emitm_logic_i(pc, 005, rs1, i, rd)
#define emitm_andncc_i(pc, rs1, i, rd)   emitm_logic_i(pc, 025, rs1, i, rd)
#define emitm_or_r(pc, rs1, rs2, rd)     emitm_logic_r(pc, 002, rs1, rs2, rd)
#define emitm_orcc_r(pc, rs1, rs2, rd)   emitm_logic_r(pc, 022, rs1, rs2, rd)
#define emitm_orn_r(pc, rs1, rs2, rd)    emitm_logic_r(pc, 006, rs1, rs2, rd)
#define emitm_orncc_r(pc, rs1, rs2, rd)  emitm_logic_r(pc, 026, rs1, rs2, rd)
#define emitm_or_i(pc, rs1, i, rd)       emitm_logic_i(pc, 002, rs1, i, rd)
#define emitm_orcc_i(pc, rs1, i, rd)     emitm_logic_i(pc, 022, rs1, i, rd)
#define emitm_orn_i(pc, rs1, i, rd)      emitm_logic_i(pc, 006, rs1, i, rd)
#define emitm_orncc_i(pc, rs1, i, rd)    emitm_logic_i(pc, 026, rs1, i, rd)
#define emitm_xor_r(pc, rs1, rs2, rd)    emitm_logic_r(pc, 003, rs1, rs2, rd)
#define emitm_xorcc_r(pc, rs1, rs2, rd)  emitm_logic_r(pc, 023, rs1, rs2, rd)
#define emitm_xorn_r(pc, rs1, rs2, rd)   emitm_logic_r(pc, 007, rs1, rs2, rd)
#define emitm_xorncc_r(pc, rs1, rs2, rd) emitm_logic_r(pc, 027, rs1, rs2, rd)
#define emitm_xor_i(pc, rs1, i, rd)      emitm_logic_i(pc, 003, rs1, i, rd)
#define emitm_xorcc_i(pc, rs1, i, rd)    emitm_logic_i(pc, 023, rs1, i, rd)
#define emitm_xorn_i(pc, rs1, i, rd)     emitm_logic_i(pc, 007, rs1, i, rd)
#define emitm_xorncc_i(pc, rs1, i, rd)   emitm_logic_i(pc, 027, rs1, i, rd)

/* Shift Left Logical */
#define emitm_sll_r(pc, rs1, rs2, rd) emitm_3a(pc, 2, rd, 045, rs1, 0, rs2)
#define emitm_sll_i(pc, rs1, i, rd)   emitm_3b(pc, 2, rd, 045, rs1, i)

/* Shift Right Logical */
#define emitm_srl_r(pc, rs1, rs2, rd) emitm_3a(pc, 2, rd, 046, rs1, 0, rs2)
#define emitm_srl_i(pc, rs1, i, rd)   emitm_3b(pc, 2, rd, 046, rs1, i)

/* Shift Right Arithmetic */
#define emitm_sra_r(pc, rs1, rs2, rd) emitm_3a(pc, 2, rd, 047, rs1, 0, rs2)
#define emitm_sra_i(pc, rs1, i, rd)   emitm_3a(pc, 2, rd, 047, rs1, i)

/* Arithmetic ops */
#define emitm_add_r(pc, rs1, rs2, rd)    emitm_3a(pc, 2, rd, 0, rs1, 0, rs2)
#define emitm_addcc_r(pc, rs1, rs2, rd)  emitm_3a(pc, 2, rd, 020, rs1, 0, rs2)
#define emitm_addX_r(pc, rs1, rs2, rd)   emitm_3a(pc, 2, rd, 010, rs1, 0, rs2)
#define emitm_addXcc_r(pc, rs1, rs2, rd) emitm_3a(pc, 2, rd, 030, rs1, 0, rs2)
#define emitm_add_i(pc, rs1, i, rd)      emitm_3b(pc, 2, rd, 0, rs1, i)
#define emitm_addcc_i(pc, rs1, i, rd)    emitm_3b(pc, 2, rd, 020, rs1, i)
#define emitm_addX_i(pc, rs1, i, rd)     emitm_3b(pc, 2, rd, 010, rs1, i)
#define emitm_addXcc_i(pc, rs1, i, rd)   emitm_3b(pc, 2, rd, 030, rs1, i)

/* Arithmetic ops */
#define emitm_sub_r(pc, rs1, rs2, rd)    emitm_3a(pc, 2, rd, 004, rs1, 0, rs2)
#define emitm_subcc_r(pc, rs1, rs2, rd)  emitm_3a(pc, 2, rd, 024, rs1, 0, rs2)
#define emitm_subX_r(pc, rs1, rs2, rd)   emitm_3a(pc, 2, rd, 014, rs1, 0, rs2)
#define emitm_subXcc_r(pc, rs1, rs2, rd) emitm_3a(pc, 2, rd, 034, rs1, 0, rs2)
#define emitm_sub_i(pc, rs1, i, rd)      emitm_3b(pc, 2, rd, 004, rs1, i)
#define emitm_subcc_i(pc, rs1, i, rd)    emitm_3b(pc, 2, rd, 024, rs1, i)
#define emitm_subX_i(pc, rs1, i, rd)     emitm_3b(pc, 2, rd, 014, rs1, i)
#define emitm_subXcc_i(pc, rs1, i, rd)   emitm_3b(pc, 2, rd, 034, rs1, i)

/* Floating point operations */

/* MOV */
#define emitm_fmovs(pc, rs, rd) emitm_3c(pc, 2, rd, 064, 0, 0001, rs)

/* Arithmetic operations */
#define emitm_faddd(pc, rs1, rs2, rd) emitm_3c(pc, 2, rd, 064, rs1, 0102, rs2)
#define emitm_fsubd(pc, rs1, rs2, rd) emitm_3c(pc, 2, rd, 064, rs1, 0106, rs2)
#define emitm_fmuld(pc, rs1, rs2, rd) emitm_3c(pc, 2, rd, 064, rs1, 0112, rs2)
#define emitm_fdivd(pc, rs1, rs2, rd) emitm_3c(pc, 2, rd, 064, rs1, 0116, rs2)
#define emitm_fabss(pc, rs, rd) emitm_3c(pc, 2, rd, 064, 0, 0011, rs)
#define emitm_fnegs(pc, rs, rd) emitm_3c(pc, 2, rd, 064, 0, 0005, rs)

/* Floating <-> Integer Conversion */
#define emitm_fitod(pc, rs, rd) emitm_3c(pc, 2, rd, 064, 0, 0310, rs)
#define emitm_fdtoi(pc, rs, rd) emitm_3c(pc, 2, rd, 064, 0, 0322, rs)

/* Floating point tests */
#define emitm_fcmpd(pc, rs1, rs2) emitm_3c(pc, 2, 0, 065, rs1, 0122, rs2)

/* Jump and Link */

#define emitm_jumpl_r(pc, rs1, rs2, rd) emitm_3a(pc, 2, rd, 070, rs1, 0, rs2)
#define emitm_jumpl_i(pc, rs1, i, rd)   emitm_3b(pc, 2, rd, 070, rs1, i)

/* RET */
#define emitm_ret(pc) emitm_jumpl_i(pc, emitm_i(7), 8, emitm_g(0))

/* integer conditions */
#define emitm_ba   010
#define emitm_bn   000
#define emitm_bne  011
#define emitm_be   001
#define emitm_bg   012
#define emitm_ble  002
#define emitm_bge  013
#define emitm_bl   003
#define emitm_bgu  014
#define emitm_bleu 004
#define emitm_bcc  015
#define emitm_bcs  005
#define emitm_bpos 016
#define emitm_bneg 006
#define emitm_bvc  017
#define emitm_bvs  007

/* floating-point conditions */
#define emitm_fba   010
#define emitm_fbn   000
#define emitm_fbu   007
#define emitm_fbg   006
#define emitm_fbug  005
#define emitm_fbl   004
#define emitm_fbul  003
#define emitm_fblg  002
#define emitm_fbne  001
#define emitm_fbe   011
#define emitm_fbue  012
#define emitm_fbge  013
#define emitm_fbuge 014
#define emitm_fble  015
#define emitm_fbule 016
#define emitm_fbo   017

#define emitm_icc   02
#define emitm_fcc   06

/* Branch on integer condition codes */
#define emitm_bicc(pc, a, cond, disp22) emitm_2b(pc, a, cond, 02, disp22)

/* Branch on floating-point condition codes */
#define emitm_fbfcc(pc, a, cond, disp22) emitm_2b(pc, a, cond, 06, disp22)

#define jit_emit_mov_rr_i(pc, dst, src) emitm_mov_r(pc, src, dst)
#define jit_emit_mov_rr_n(pc, dst, src) { \
    emitm_fmovs(pc, src, dst); \
    emitm_fmovs(pc, (src)+1, (dst)+1); }

/*
void main(){
    char ar[1024];
    char *ar2;

    ar2 = &ar[0];
    emitm_ld_r(ar2, emitm_g(0), emitm_i(1), emitm_o(7));
    emitm_ldub_r(ar2, emitm_g(0), emitm_i(1), emitm_o(7));
    emitm_ldsh_r(ar2, emitm_g(0), emitm_i(1), emitm_o(7));
}
*/

/* Fixup types */
enum  {JIT_BRANCH, JIT_CALL30 };

/*
 *
 * IMPORTANT SHORTCUTS
 *
 * */

/* The register holding the interpreter pointer */
#define Parrot_jit_intrp emitm_i(0)

/* The register holding the address of I0 */
#define Parrot_jit_regbase emitm_i(2)

/* The register containing the address of the opmap */
#define Parrot_jit_opmap emitm_i(3)

/* These registers should be used only in .jit ops and not helper routines
 *   in jit_emit.h
 */
#define ISR1 emitm_i(4)
#define ISR2 emitm_i(5)
#define FSR1 emitm_f(0)
#define FSR2 emitm_f(2)

/* This register can be used only in jit_emit.h calculations */
#define XSR1 emitm_l(0)

#define Parrot_jit_regbase_ptr(interpreter) &REG_INT(0)

/* The offset of a Parrot register from the base register */
#define Parrot_jit_regoff(a, i) (unsigned)(a) - (unsigned)(Parrot_jit_regbase_ptr(i))

/* Generate a jump to a bytecode address in reg_num
 *  - uses the temporary register
 */
static void
Parrot_jit_bytejump(Parrot_jit_info_t *jit_info,
                    Interp *interpreter, int reg_num)
{

    /* Construct the starting address of the byte code */
    emitm_sethi(jit_info->native_ptr, emitm_hi22(interpreter->code->byte_code),
        XSR1);
    emitm_or_i(jit_info->native_ptr, XSR1,
        emitm_lo10(interpreter->code->byte_code), XSR1);

    /* Calculates the offset into op_map shadow array
     * assuming sizeof(opcode_t) == sizeof(opmap array entry) */
    emitm_sub_r(jit_info->native_ptr, reg_num, XSR1,
                XSR1);

    /* Load the address of the native code from op_map */
    emitm_ld_r(jit_info->native_ptr, Parrot_jit_opmap, XSR1,
               XSR1);

    /* This jumps to the address from op_map */
    emitm_jumpl_i(jit_info->native_ptr, XSR1, 0, XSR1);
    emitm_nop(jit_info->native_ptr);
}

/* Generate conditional branch to offset from current parrot op */
static void Parrot_jit_branch(Parrot_jit_info_t *jit_info, int branch, int cond,
                              int annul, opcode_t disp)
{
    int offset;
    opcode_t opcode;

    opcode = jit_info->op_i + disp;
    if(opcode <= jit_info->op_i){
        offset = jit_info->arena.op_map[opcode].offset -
                    (jit_info->native_ptr - jit_info->arena.start);

        if (jit_info->optimizer->cur_section->branch_target ==
            jit_info->optimizer->cur_section)
                offset +=
                    jit_info->optimizer->cur_section->branch_target->load_size;

        if((offset > emitm_branch_max) || (offset < emitm_branch_min))
            internal_exception(JIT_ERROR,
                           "Branches beyond 8 Megabytes not yet supported\n");
        offset /= 4;
        emitm_2b(jit_info->native_ptr, annul, cond, branch, offset);
        return;
    }

    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_BRANCH;
    jit_info->arena.fixups->param.opcode = opcode;

    /* If the branch is to the current section, skip the load instructions. */
    if (jit_info->optimizer->cur_section->branch_target ==
        jit_info->optimizer->cur_section)
            jit_info->arena.fixups->skip =
                jit_info->optimizer->cur_section->branch_target->load_size;

    emitm_2b(jit_info->native_ptr, annul, cond, branch, 0);
}

/* Generate branch on integer condition codes */
#define Parrot_jit_bicc(jit_info, cond, annul, disp) \
        Parrot_jit_branch(jit_info, emitm_icc, cond, annul, disp)

/* Generate branch on floating-point condition codes */
#define Parrot_jit_fbfcc(jit_info, cond, annul, disp) \
        Parrot_jit_branch(jit_info, emitm_fcc, cond, annul, disp)

/* This function loads a value */
static void jit_emit_load_i(Parrot_jit_info_t *jit_info,
                             Interp *interpreter,
                             int param,
                             int hwreg)
{
    opcode_t op_type;
    int val;

    op_type = interpreter->op_info_table[*jit_info->cur_op].types[param];
    val = jit_info->cur_op[param];

    switch(op_type){
        case PARROT_ARG_IC:
            if((val < emitm_simm13_min) || (val > emitm_simm13_max)){
                emitm_sethi(jit_info->native_ptr, emitm_hi22(val), hwreg);
                emitm_or_i(jit_info->native_ptr, hwreg, emitm_lo10(val),
                           hwreg);
            }
            else {
                emitm_or_i(jit_info->native_ptr, emitm_g(0), val, hwreg);
            }

            break;
        case PARROT_ARG_NC:
            val = (int)&interpreter->code->const_table->
                    constants[val]->u.number;

            /* Load double into integer registers */
            emitm_sethi(jit_info->native_ptr, emitm_hi22(val), XSR1);
            emitm_ldd_i(jit_info->native_ptr, XSR1, emitm_lo10(val),
                        hwreg);
            break;

        case PARROT_ARG_I:
            val = (int)&REG_INT(val);
            emitm_ld_i(jit_info->native_ptr, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter), hwreg);
            break;

        case PARROT_ARG_P:
            val = (int)&REG_PMC(val);
            emitm_ld_i(jit_info->native_ptr, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter), hwreg);
            break;

        case PARROT_ARG_S:
            val = (int)&REG_STR(val);
            emitm_ld_i(jit_info->native_ptr, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter), hwreg);
            break;

        case PARROT_ARG_N:
            val = (int)&REG_NUM(val);
            emitm_ldd_i(jit_info->native_ptr, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter), hwreg);
            break;

        default:
            internal_exception(JIT_ERROR,
                               "Unsupported op parameter type %d\n",
                               op_type);
    }
}

static void jit_emit_store_i(Parrot_jit_info_t *jit_info,
                             Interp *interpreter,
                             int param,
                             int hwreg)
{
    opcode_t op_type;
    int val;

    op_type = interpreter->op_info_table[*jit_info->cur_op].types[param];
    val = jit_info->cur_op[param];

    switch(op_type){
        case PARROT_ARG_I:
            val = (int)&REG_INT(val);
            emitm_st_i(jit_info->native_ptr, hwreg, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter));
            break;

        case PARROT_ARG_P:
            val = (int)&REG_PMC(val);
            emitm_st_i(jit_info->native_ptr, hwreg, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter));
            break;

        case PARROT_ARG_S:
            val = (int)&REG_STR(val);
            emitm_st_i(jit_info->native_ptr, hwreg, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter));
            break;

        case PARROT_ARG_N:
            val = (int)&REG_NUM(val);
            emitm_std_i(jit_info->native_ptr, hwreg, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter));
            break;

        default:
            internal_exception(JIT_ERROR,
                            "Unsupported op parameter type %d\n", op_type);
    }
}

static void jit_emit_load_n(Parrot_jit_info_t *jit_info,
                             Interp *interpreter,
                             int param,
                             int hwreg)
{
    opcode_t op_type;
    long val;

    op_type = interpreter->op_info_table[*jit_info->cur_op].types[param];
    val = jit_info->cur_op[param];

    switch(op_type){
        case PARROT_ARG_IC:
            /* Load integer into floating point registers - should use 
               constant pool */
            val = &jit_info->cur_op[param];
            emitm_sethi(jit_info->native_ptr, emitm_hi22(val), XSR1);
            emitm_ldf_i(jit_info->native_ptr, XSR1, emitm_lo10(val), hwreg);
            break;

        case PARROT_ARG_NC:
            val = (int)&interpreter->code->const_table->
                    constants[val]->u.number;

            /* Load double into floating point registers */
            emitm_sethi(jit_info->native_ptr, emitm_hi22(val), XSR1);
            emitm_lddf_i(jit_info->native_ptr, XSR1, emitm_lo10(val),
                        hwreg);
            break;

        case PARROT_ARG_I:
            val = (int)&REG_INT(val);
            emitm_ldf_i(jit_info->native_ptr, Parrot_jit_regbase,
                        Parrot_jit_regoff(val, interpreter), hwreg);
            break;

        case PARROT_ARG_N:
            val = (int)&REG_NUM(val);
            emitm_lddf_i(jit_info->native_ptr, Parrot_jit_regbase,
                         Parrot_jit_regoff(val, interpreter), hwreg);
            break;

        default:
            internal_exception(JIT_ERROR,
                            "Unsupported op parameter type %d\n", op_type);
    }
}

static void jit_emit_store_n(Parrot_jit_info_t *jit_info,
                             Interp *interpreter,
                             int param,
                             int hwreg)
{
    opcode_t op_type;
    int val;

    op_type = interpreter->op_info_table[*jit_info->cur_op].types[param];
    val = jit_info->cur_op[param];

    switch(op_type){
        case PARROT_ARG_I:
            val = (int)&REG_INT(val);
            emitm_stf_i(jit_info->native_ptr, hwreg, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter));
            break;

        case PARROT_ARG_N:
            val = (int)&REG_NUM(val);
            emitm_stdf_i(jit_info->native_ptr, hwreg, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter));
            break;

        default:
            internal_exception(JIT_ERROR,
                            "Unsupported op parameter type %d\n", op_type);
    }
}


void Parrot_jit_dofixup(Parrot_jit_info_t *jit_info,
                        Interp * interpreter)
{
    Parrot_jit_fixup_t *fixup;
    Parrot_jit_fixup_t *last_fixup;
    char *fixup_ptr;
    int fixup_val;

    fixup = jit_info->arena.fixups;

    while(fixup){
        switch(fixup->type){
        /* This fixes-up a branch to a known opcode offset */
            case JIT_BRANCH:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                fixup_val = (jit_info->arena.op_map[fixup->param.opcode].offset
                                - fixup->native_offset + fixup->skip) / 4;
                *(int *)(fixup_ptr) |= emitm_mask(22, fixup_val);
                break;

            case JIT_CALL30:
                fixup_ptr = jit_info->arena.start + fixup->native_offset;
                fixup_val = (int)fixup->param.fptr - (int)fixup_ptr;
                emitm_call_30(fixup_ptr, emitm_hi30(fixup_val));
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
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                      Interp * interpreter)
{
    /* generated code is called as jit_code(interpreter, pc)
     * so interpreter is in i0 and pc in i1.
     * i1 is reusable once past the jump. interpreter is preserved in i0
     */
    int ireg0_offset;
    int ireg0_address;

    /* Standard Prolog */
    emitm_save_i(jit_info->native_ptr, emitm_SP, -104, emitm_SP);

    /* Calculate the offset of I0 in the interpreter struct */
    ireg0_address = (int)Parrot_jit_regbase_ptr(interpreter);
    ireg0_offset  = ireg0_address - (int)interpreter;

    /* All parrot registers will be addressed relative to I0 */
    if((ireg0_offset < emitm_simm13_min) || (ireg0_offset > emitm_simm13_max)){
        /* Store the address of I0 if its offset doesnt fit in the immediate */
        emitm_sethi(jit_info->native_ptr, emitm_hi22(ireg0_address), Parrot_jit_regbase);
        emitm_or_i(jit_info->native_ptr, Parrot_jit_regbase, emitm_lo10(ireg0_address),
                   Parrot_jit_regbase);
    }
    else {
        /* Calculate the address of I0 */
        emitm_add_i(jit_info->native_ptr, Parrot_jit_intrp, ireg0_offset,
                    Parrot_jit_regbase);
    }

    /* Setup the pointer to the opcode map */
    emitm_sethi(jit_info->native_ptr,
        emitm_hi22(jit_info->arena.op_map), Parrot_jit_opmap);
    emitm_or_i(jit_info->native_ptr,
        Parrot_jit_opmap, emitm_lo10(jit_info->arena.op_map), Parrot_jit_opmap);

    /* Jump to the current pc */
    Parrot_jit_bytejump(jit_info, interpreter, emitm_i(1));
}

void Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                          Interp * interpreter)
{
    emitm_sethi(jit_info->native_ptr, emitm_hi22(jit_info->cur_op), emitm_o(0));
    emitm_or_i(jit_info->native_ptr,
        emitm_o(0), emitm_lo10(jit_info->cur_op), emitm_o(0));

    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_CALL30;
    jit_info->arena.fixups->param.fptr =
        (void (*)(void))interpreter->op_func_table[*(jit_info->cur_op)];

    emitm_call_30(jit_info->native_ptr, 0);
    emitm_mov_r(jit_info->native_ptr, Parrot_jit_intrp, emitm_o(1));
}

void Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                        Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info, interpreter);
    Parrot_jit_bytejump(jit_info, interpreter, emitm_o(0));
}

#undef Parrot_jit_restart_op
void Parrot_jit_restart_op(Parrot_jit_info_t *jit_info,
                        Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info, interpreter);

    /* Test whether the return value is 0 */
    emitm_subcc_r(jit_info->native_ptr, emitm_o(0), emitm_g(0), emitm_g(0));

    /* If the return pc is not zero skip the next 3 instructions */
    emitm_bicc(jit_info->native_ptr, 0, emitm_bne, 4);
    emitm_nop(jit_info->native_ptr);

    /* Return if the return pc is 0 */
    emitm_ret(jit_info->native_ptr);
    emitm_restore_i(jit_info->native_ptr, emitm_g(0), emitm_g(0), emitm_g(0));

    Parrot_jit_bytejump(jit_info, interpreter, emitm_o(0));
}

/* move reg to mem (i.e. intreg) */
void
Parrot_jit_emit_mov_mr(Interp * interpreter, char *mem, int reg)
{
    emitm_st_i(((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr,
               reg, Parrot_jit_regbase, Parrot_jit_regoff(mem, interpreter));
}

/* move mem (i.e. intreg) to reg */
void
Parrot_jit_emit_mov_rm(Interp * interpreter, int reg, char *mem)
{
    emitm_ld_i(((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr,
               Parrot_jit_regbase, Parrot_jit_regoff(mem, interpreter), reg);
}

/* move reg to mem (i.e. numreg) */
void
Parrot_jit_emit_mov_mr_n(Interp * interpreter, char *mem, int reg)
{
    emitm_stdf_i(((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr,
                 reg, Parrot_jit_regbase, Parrot_jit_regoff(mem, interpreter));
}

/* move mem (i.e. numreg) to reg */
void
Parrot_jit_emit_mov_rm_n(Interp * interpreter, int reg, char *mem)
{
    emitm_lddf_i(((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr,
                 Parrot_jit_regbase, Parrot_jit_regoff(mem, interpreter), reg);
}

#  ifndef NO_JIT_VTABLE_OPS

#    undef Parrot_jit_vtable1_op
/* #    undef Parrot_jit_vtable1r_op */
 
#    undef Parrot_jit_vtable_111_op
#    undef Parrot_jit_vtable_112_op
#    undef Parrot_jit_vtable_221_op
#    undef Parrot_jit_vtable_1121_op
#    undef Parrot_jit_vtable_1123_op
#    undef Parrot_jit_vtable_2231_op
/* 
#    undef Parrot_jit_vtable_1r223_op
#    undef Parrot_jit_vtable_1r332_op
 
#    undef Parrot_jit_vtable_ifp_op
#    undef Parrot_jit_vtable_unlessp_op
#    undef Parrot_jit_vtable_newp_ic_op
*/
/* emit a call to a vtable func
 * $X->vtable(interp, $X [, $Y...] )
 */
static void
Parrot_jit_vtable_n_op(Parrot_jit_info_t *jit_info,
                       Interp *interpreter, int n, int *args)
{
    int        nvtable = op_jit[*jit_info->cur_op].extcall;
    op_info_t *op_info = &interpreter->op_info_table[*jit_info->cur_op];

    int    pmc = 0;  /* pmc saves the left most Pi       */
    int    rdx = 1;  /* native (outgoing) register index */

    int    idx, pi, i;
    size_t offset;

    offset  = offsetof(struct _vtable, init);
    offset += nvtable * sizeof(void *);

    for (idx = 1; idx <= n; idx++) {
        i  = args[idx - 1];
        pi = *(jit_info->cur_op + i);

        switch (op_info->types[i]) {
            case PARROT_ARG_S:
                emitm_ld_i(jit_info->native_ptr, Parrot_jit_regbase,
                           REG_OFFS_STR(pi), emitm_o(rdx));
                break;
            case PARROT_ARG_K:
            case PARROT_ARG_P:
                emitm_ld_i(jit_info->native_ptr, Parrot_jit_regbase,
                           REG_OFFS_PMC(pi), emitm_o(rdx));
                if (! pmc) { pmc = rdx; }
                break;
            case PARROT_ARG_KI:
            case PARROT_ARG_I:
                emitm_ld_i(jit_info->native_ptr, Parrot_jit_regbase,
                           REG_OFFS_INT(pi), emitm_o(rdx));
                break;
            case PARROT_ARG_KIC:
            case PARROT_ARG_IC:
                if (emitm_simm13_const(pi)) {
                    emitm_mov_i(jit_info->native_ptr, pi, emitm_o(rdx));
                } else {
                    emitm_sethi(jit_info->native_ptr, emitm_hi22(pi), emitm_o(rdx));
                    emitm_or_i(jit_info->native_ptr, emitm_o(rdx), emitm_lo10(pi), emitm_o(rdx));
                }
                break;
            case PARROT_ARG_N:
                emitm_ld_i(jit_info->native_ptr, Parrot_jit_regbase,
                           REG_OFFS_NUM(pi), emitm_o(rdx));
                emitm_ld_i(jit_info->native_ptr, Parrot_jit_regbase,
                           REG_OFFS_NUM(pi) + 4, emitm_o(++rdx));
                break;
            case PARROT_ARG_NC:
#                define NC_addr &interpreter->code->const_table->constants[pi]->u.number
                emitm_sethi(jit_info->native_ptr, emitm_hi22(NC_addr), XSR1);
                emitm_or_i(jit_info->native_ptr, XSR1, emitm_lo10(NC_addr), XSR1);

                emitm_ld_i(jit_info->native_ptr, XSR1, 0, emitm_o(rdx));
                emitm_ld_i(jit_info->native_ptr, XSR1, 4, emitm_o(++rdx));
                break;
            case PARROT_ARG_SC:
#                define SC_addr &interpreter->code->const_table->constants[pi]->u.string
                emitm_sethi(jit_info->native_ptr, emitm_hi22(SC_addr), XSR1);
                emitm_or_i(jit_info->native_ptr, XSR1, emitm_lo10(SC_addr), XSR1);

                emitm_ld_i(jit_info->native_ptr, XSR1, 0, emitm_o(rdx));
              break;
            case PARROT_ARG_KC:
#                define KC_addr &interpreter->code->const_table->constants[pi]->u.key
                emitm_sethi(jit_info->native_ptr, emitm_hi22(KC_addr), XSR1);
                emitm_or_i(jit_info->native_ptr, XSR1, emitm_lo10(KC_addr), XSR1);

                emitm_ld_i(jit_info->native_ptr, XSR1, 0, emitm_o(rdx));
              break;
            default:
                internal_exception(1,
                        "jit_vtable_n_op: unimp type %d, arg %d vtable %d",
                        op_info->types[i], i, nvtable);
                break;
        }

        rdx++;
    }

    emitm_ld_i(jit_info->native_ptr, emitm_o(pmc), offsetof(struct PMC, vtable), XSR1);
    emitm_ld_i(jit_info->native_ptr, XSR1, offset, XSR1);

    emitm_jumpl_i(jit_info->native_ptr, XSR1, 0, emitm_o(7));
    emitm_mov_r(jit_info->native_ptr, Parrot_jit_intrp, emitm_o(0));
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

#endif /* NO_JIT_VTABLE_OPS */

#else

#  define REQUIRES_CONSTANT_POOL 0
#  define INT_REGISTERS_TO_MAP 6
#  define FLOAT_REGISTERS_TO_MAP 6

#ifndef JIT_IMCC
char intval_map[INT_REGISTERS_TO_MAP] =
    { emitm_l(1), emitm_l(2), emitm_l(3), emitm_l(4), emitm_l(5), emitm_l(6)
    };

char floatval_map[] = 
    { emitm_f(4), emitm_f(6), emitm_f(8), emitm_f(10), emitm_f(12), emitm_f(14)
    };
#endif

#define PRESERVED_INT_REGS 6
#define PRESERVED_FLOAT_REGS 0

#endif
#endif /* PARROT_SUN4_JIT_EMIT_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
