/*
** jit_emit.h
**
** SPARC
**
** $Id$
**/

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
#define emitm_mov(pc, rs, rd) emitm_or_r(pc, emitm_g(0), rs, rd)

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

#define emitm_fitod(pc, rs, rd) emitm_3c(pc, 2, rd, 064, 0, 0310, rs)
#define emitm_fdtoi(pc, rs, rd) emitm_3c(pc, 2, rd, 064, 0, 0322, rs)

/* Jump and Link */

#define emitm_jumpl_r(pc, rs1, rs2, rd) emitm_3a(pc, 2, rd, 070, rs1, 0, rs2)
#define emitm_jumpl_i(pc, rs1, i, rd)   emitm_3b(pc, 2, rd, 070, rs1, i)

/* RET */
#define emitm_ret(pc) emitm_jumpl_i(pc, emitm_i(7), 8, emitm_g(0))

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

/* Branch */
#define emitm_bicc(pc, a, cond, disp22) emitm_2b(pc, a, cond, 02, disp22)

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
#define Parrot_jit_regbase emitm_i(1)

/* The register containing the address of the opmap */
#define Parrot_jit_opmap emitm_i(3)

/* The scratch register used for certain address calculations */
#define Parrot_jit_tmp emitm_l(7)

#define Parrot_jit_regbase_ptr(i) &((i)->ctx.int_reg.registers[0])

/* The offset of a Parrot register from the base register */
#define Parrot_jit_regoff(a, i) (unsigned)(a) - (unsigned)(Parrot_jit_regbase_ptr(i))

/* Generate conditional branch to offset from current parrot op */
static void Parrot_jit_bicc(Parrot_jit_info_t *jit_info, int cond, int annul,
                            opcode_t disp)
{
    int offset;
    opcode_t opcode;

    opcode = jit_info->op_i + disp;
    if(opcode <= jit_info->op_i){
        offset = jit_info->arena.op_map[opcode].offset -
                    (jit_info->native_ptr - jit_info->arena.start);

        if((offset > emitm_branch_max) || (offset < emitm_branch_min))
            internal_exception(JIT_ERROR,
                           "Branches beyond 8 Megabytes not yet supported\n"); 
        offset /= 4;
        emitm_bicc(jit_info->native_ptr, annul, cond, offset);
        return;
    }

    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_BRANCH;
    jit_info->arena.fixups->param.opcode = opcode;
    emitm_bicc(jit_info->native_ptr, annul, cond, 0);
}

/* This function loads a value */
static void Parrot_jit_int_load(Parrot_jit_info_t *jit_info,
                             struct Parrot_Interp *interpreter,
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
                    constants[val]->number;

            /* Load double into integer registers */
            emitm_sethi(jit_info->native_ptr, emitm_hi22(val), Parrot_jit_tmp);
            emitm_ldd_i(jit_info->native_ptr, Parrot_jit_tmp, emitm_lo10(val),
                        hwreg);
            break;

        case PARROT_ARG_I:
            val = (int)&interpreter->ctx.int_reg.registers[val];
            emitm_ld_i(jit_info->native_ptr, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter), hwreg);
            break;

        case PARROT_ARG_N:
            val = (int)&interpreter->ctx.num_reg.registers[val];
            emitm_ldd_i(jit_info->native_ptr, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter), hwreg);
            break;

        default:
            internal_exception(JIT_ERROR,
                               "Unsupported op parameter type %d\n",
                               op_type);
    }
}

static void Parrot_jit_int_store(Parrot_jit_info_t *jit_info,
                             struct Parrot_Interp *interpreter,
                             int param,
                             int hwreg)
{
    opcode_t op_type;
    int val;

    op_type = interpreter->op_info_table[*jit_info->cur_op].types[param];
    val = jit_info->cur_op[param];

    switch(op_type){
        case PARROT_ARG_I:
            val = (int)&interpreter->ctx.int_reg.registers[val];
            emitm_st_i(jit_info->native_ptr, hwreg, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter));
            break;

        case PARROT_ARG_N:
            val = (int)&interpreter->ctx.num_reg.registers[val];
            emitm_std_i(jit_info->native_ptr, hwreg, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter));
            break;

        default:
            internal_exception(JIT_ERROR,
                            "Unsupported op parameter type %d\n", op_type);
    }
}

static void Parrot_jit_float_load(Parrot_jit_info_t *jit_info,
                             struct Parrot_Interp *interpreter,
                             int param,
                             int hwreg)
{
    opcode_t op_type;
    int val;

    op_type = interpreter->op_info_table[*jit_info->cur_op].types[param];
    val = jit_info->cur_op[param];

    switch(op_type){
        case PARROT_ARG_I:
            val = (int)&interpreter->ctx.int_reg.registers[val];
            emitm_ldf_i(jit_info->native_ptr, Parrot_jit_regbase,
                        Parrot_jit_regoff(val, interpreter), hwreg);
            break;

        case PARROT_ARG_N:
            val = (int)&interpreter->ctx.num_reg.registers[val];
            emitm_lddf_i(jit_info->native_ptr, Parrot_jit_regbase,
                         Parrot_jit_regoff(val, interpreter), hwreg);
            break;

        default:
            internal_exception(JIT_ERROR,
                            "Unsupported op parameter type %d\n", op_type);
    }
}

static void Parrot_jit_float_store(Parrot_jit_info_t *jit_info,
                             struct Parrot_Interp *interpreter,
                             int param,
                             int hwreg)
{
    opcode_t op_type;
    int val;

    op_type = interpreter->op_info_table[*jit_info->cur_op].types[param];
    val = jit_info->cur_op[param];

    switch(op_type){
        case PARROT_ARG_I:
            val = (int)&interpreter->ctx.int_reg.registers[val];
            emitm_stf_i(jit_info->native_ptr, hwreg, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter));
            break;

        case PARROT_ARG_N:
            val = (int)&interpreter->ctx.num_reg.registers[val];
            emitm_stdf_i(jit_info->native_ptr, hwreg, Parrot_jit_regbase,
                       Parrot_jit_regoff(val, interpreter));
            break;

        default:
            internal_exception(JIT_ERROR,
                            "Unsupported op parameter type %d\n", op_type);
    }
}


void Parrot_jit_dofixup(Parrot_jit_info_t *jit_info,
                        struct Parrot_Interp * interpreter)
{
    Parrot_jit_fixup *fixup;
    Parrot_jit_fixup *last_fixup;
    char *fixup_ptr;
    int fixup_val;

    fixup = jit_info->arena.fixups;

    while(fixup){
        switch(fixup->type){
        /* This fixes-up a branch to a known opcode offset */
            case JIT_BRANCH:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                fixup_val = (jit_info->arena.op_map[fixup->param.opcode].offset
                                - fixup->native_offset) / 4;
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

void Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                      struct Parrot_Interp * interpreter)
{
    int ireg0_offset;

    /* Standard Prolog */
    emitm_save_i(jit_info->native_ptr, emitm_SP, -104, emitm_SP);

    /* Calculate the offset of I0 in the interpreter struct */
    ireg0_offset = (int)Parrot_jit_regbase_ptr(interpreter) -
        (int)interpreter;

    if(ireg0_offset > 4095){
        internal_exception(JIT_ERROR,
                           "Unable to support interpreter structure\n" );
    }

    /* Calculate the address of I0 */
    /* All parrot registers will be addressed relative to I0 */
    emitm_add_i(jit_info->native_ptr, Parrot_jit_intrp, ireg0_offset,
                Parrot_jit_regbase);

    /* Setup the pointer to the opcode map */
    emitm_sethi(jit_info->native_ptr,
        emitm_hi22(jit_info->arena.op_map), Parrot_jit_opmap);
    emitm_or_i(jit_info->native_ptr,
        emitm_i(3), emitm_lo10(jit_info->arena.op_map), Parrot_jit_opmap);
}

void Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                          struct Parrot_Interp * interpreter)
{
    emitm_sethi(jit_info->native_ptr, emitm_hi22(jit_info->cur_op), emitm_o(0));
    emitm_or_i(jit_info->native_ptr,
        emitm_o(0), emitm_lo10(jit_info->cur_op), emitm_o(0));

    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_CALL30;
    jit_info->arena.fixups->param.fptr =
        (void (*)(void))interpreter->op_func_table[*(jit_info->cur_op)];

    emitm_call_30(jit_info->native_ptr, 0);
    emitm_mov(jit_info->native_ptr, Parrot_jit_intrp, emitm_o(1));
}

void Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                        struct Parrot_Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info, interpreter);

    emitm_sethi(jit_info->native_ptr, emitm_hi22(interpreter->code->byte_code),
        emitm_l(1));
    emitm_or_i(jit_info->native_ptr, emitm_l(1),
        emitm_lo10(interpreter->code->byte_code), emitm_l(1));

    /* This calculates offset into op_map shadow array */
    emitm_sub_r(jit_info->native_ptr, emitm_o(0), emitm_l(1), emitm_o(0));

    /* Load the address of the native code from op_map */
    emitm_ld_r(jit_info->native_ptr, emitm_i(3), emitm_o(0), emitm_o(0));

    /* This jumps to the address from op_map */
    emitm_jumpl_i(jit_info->native_ptr, emitm_o(0), 0, emitm_g(0));
    emitm_nop(jit_info->native_ptr);
}

void
Parrot_jit_load_registers(Parrot_jit_info_t *jit_info,
    struct Parrot_Interp *interpreter)
{
/* TODO write me */
}

void
Parrot_jit_save_registers(Parrot_jit_info_t *jit_info,
    struct Parrot_Interp * interpreter)
{
/* TODO write me */
}

#else

#  define REQUIRES_CONSTANT_POOL 0
#  define MAX_REGITERS_TO_MAP 1

char register_map[MAX_REGITERS_TO_MAP] = { emitm_l(0) }; 

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
