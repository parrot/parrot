/*
** jit_emit.h
** 
** ALPHA
**
** $Id$
**/

#define emit_nop(pc) { \
    *(pc++) = 0x1f; \
    *(pc++) = 0x04; \
    *(pc++) = 0xff; \
    *(pc++) = 0x47; }

#define emit_mov(pc, src, dest)  { \
    *(pc++) = dest; \
    *(pc++) = 0x04; \
    *(pc++) = 0xe0 + src; \
    *(pc++) = 0x47; } 

typedef enum {
    REG0_v0,
    REG1_t0,
    REG2_t1,
    REG3_t2,
    REG4_t3,
    REG5_t4,
    REG6_t5,
    REG7_t6,
    REG8_t7,
    REG9_s0,
    REG10_s1,
    REG11_s2,
    REG12_s3,
    REG13_s4,
    REG14_s5,
    REG15_s6,
    REG16_a0,
    REG17_a1,
    REG18_a2,
    REG19_a3,
    REG20_a4,
    REG21_a5,
    REG22_t8,
    REG23_t9,
    REG24_t10,
    REG25_t11,
    REG26_ra,
    REG27_t12,
    REG28_at,
    REG29_gp,
    REG30_sp,
    REG31_zero
} alpha_register_t;

typedef enum {
    LDA = 0x20,
    LDH = 0x24,
    LDQ = 0xa4,
    STQ = 0xb4
} ld_st_t;

typedef enum {
    SUBQ = 0x00,
    ADDQ = 0x40,
    MULQ = 0x4c
} arithmetic_t;

typedef enum {
    BSR = 0xd0,
    BEQ = 0xe4,
    BNE = 0xf4
} branch_t;

enum { JIT_ALPHABRANCH, JIT_ALPHABSR, JIT_ALPHASTART };

char section(alpha_register_t);
void calculate_displacement(long *,long *, long *, long *); 

char *
emit_arithmetic(char *,
                arithmetic_t,
                alpha_register_t,
                alpha_register_t,
                alpha_register_t);

char *
emit_l_c(Parrot_jit_info *,
         alpha_register_t,
         long *);

char *
emit_l_s_c(char *, 
           ld_st_t,
           alpha_register_t, 
           alpha_register_t,
           int);


char *
emit_l_s_r(char *, 
           struct Parrot_Interp *,
           ld_st_t,
           alpha_register_t, 
           alpha_register_t,
           long *);

char *
emit_l_s(char *, 
         ld_st_t,
         alpha_register_t, 
         alpha_register_t,
         long *);

char *
emit_b(Parrot_jit_info *,
       branch_t,
       alpha_register_t,
       opcode_t);

char *
emit_bsr(Parrot_jit_info *,
         struct Parrot_Interp *);


char *
emit_b(Parrot_jit_info *jit_info,
       branch_t type,
       alpha_register_t reg,
       opcode_t disp)
{
    char seg = section(reg);
    char *pc = jit_info->native_ptr;
    opcode_t opcode = jit_info->op_i + disp;

    Parrot_jit_newfixup(jit_info); 
    jit_info->fixups->type = JIT_ALPHABRANCH;
    jit_info->fixups->param.opcode = opcode;
    
    *(pc++) = 0;
    *(pc++) = 0;
    *(pc++) = 0x20 * (reg - 8 * seg);
    *(pc++) = type + seg;

    return pc;
}

/* Load a constant */

char *
emit_l_c(Parrot_jit_info *jit_info,
         alpha_register_t target, 
         long *address)
{
    char *pc = jit_info->native_ptr;
    long high,low;

    if ((*address < -0x7fffffff) || (*address > 0x7fffffff)) {

        Parrot_jit_newfixup(jit_info);
        jit_info->fixups->type = JIT_ALPHASTART;
        jit_info->fixups->param.fptr = 
                        (void (*)(void))*address; 
        high = 0;
        pc = emit_l_s(pc, LDH, target, REG27_t12, &high);
        pc = emit_l_s(pc, LDA, target, target, &high);
    }
    else if ((*address < -0x7fff) || (*address > 0x7fff)) {
        high = 0;
        calculate_displacement(&high, address, &high, &low);
        pc = emit_l_s(pc, LDH, target, REG31_zero, &high);
        pc = emit_l_s(pc, LDA, target, target, &low);
    }
    else {
        pc = emit_l_s(pc, LDA, target, REG31_zero, address);
    }
    return pc;
}        

/* Load an interger register */

char *
emit_l_s_r(char *pc, 
           struct Parrot_Interp *interpreter,
           ld_st_t ld_st,
           alpha_register_t target, 
           alpha_register_t base,
           long *address)
{
    long v = (long)(((char *)address) - 
             (char *)&interpreter->ctx.int_reg.registers[0]);

    pc = emit_l_s(pc, ld_st, target, base, &v); 

    return pc;
}

char *
emit_l_s_c(char *pc, 
           ld_st_t ld_st,
           alpha_register_t target, 
           alpha_register_t base,
           int constant)
{
    long a = (long)constant;
    pc = emit_l_s(pc, ld_st, target, base, &a);
    return pc;
}
 
/* Load or Store (ldq/lda/ldah/stq) */

char *
emit_l_s(char *pc, 
         ld_st_t ld_st,
         alpha_register_t target, 
         alpha_register_t base,
         long *address)
{
    char *immediate = (char *)address; 
    char seg = section(target);

    *(pc++) = *immediate;
    *(pc++) = *(immediate + 1); 
    *(pc++) = ((char)base) + 0x20 * (target - 8 * seg);
    *(pc++) = ld_st + seg;

    return pc;
}

char *
emit_arithmetic(char *pc,
                arithmetic_t type,
                alpha_register_t result,
                alpha_register_t src2,
                alpha_register_t src1)
{
    char seg = section(result);

    char base1 = 0,base2 = 0x04;

    if (type == SUBQ) {
        base1 = 0x20; 
        base2 = 0x05;
        type = ADDQ;
    }

    *(pc++) = base1 + src1;
    *(pc++) = base2;
    *(pc++) = src2 + 0x20 * (result - 8 * seg);
    *(pc++) = type + seg;

    return pc;
}

void
Parrot_jit_begin(Parrot_jit_info *jit_info,
                 struct Parrot_Interp * interpreter)
{
    jit_info->native_ptr = emit_l_s_c(jit_info->native_ptr, LDA,
                                      REG30_sp, REG30_sp, -16);
    jit_info->native_ptr = emit_l_s_c(jit_info->native_ptr, STQ,
                                      REG26_ra, REG30_sp, 0);
    jit_info->native_ptr = emit_l_s_c(jit_info->native_ptr, STQ, 
                                      REG15_s6, REG30_sp, 8);
    emit_mov(jit_info->native_ptr,REG16_a0,REG6_t5);
}

void
Parrot_jit_dofixup(Parrot_jit_info *jit_info,
                   struct Parrot_Interp * interpreter)
{
    Parrot_jit_fixup *fixup;
    char *fixup_ptr;
    char *disp;
    long d,high,low;

    fixup = jit_info->fixups;

    while(fixup){
        switch(fixup->type){
            case JIT_ALPHABRANCH:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = (jit_info->op_map[fixup->param.opcode].offset - 
                     fixup->native_offset - 4) / 4;
                disp = (char *)&d;
                *(fixup_ptr++) = *disp; 
                *(fixup_ptr++) = *(disp + 1); 
                *(fixup_ptr++) |= *(disp + 2) & 0x1f; 
                break;
            case JIT_ALPHABSR:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup) + 12;
                d = ((long)fixup->param.fptr - (long)fixup_ptr - 4) / 4;
                disp = (char *)&d;
                *(fixup_ptr++) = *disp; 
                *(fixup_ptr++) = *(disp + 1); 
                *(fixup_ptr++) |= *(disp + 2) & 0x1f; 
                break;
            case JIT_ALPHASTART:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = (long)fixup->param.fptr;
                high = (long)jit_info->arena_start;
                calculate_displacement(&high,&d,&high,&low);
                disp = (char *)&high;
                *(fixup_ptr++) = *disp; 
                *(fixup_ptr++) = *(disp + 1); 
                fixup_ptr += 2;
                disp = (char *)&low;
                *(fixup_ptr++) = *disp; 
                *(fixup_ptr++) = *(disp + 1); 
                break;
            default:
                internal_exception(JIT_ERROR, "Unknown fixup type:%d\n",
                                   fixup->type);
                break;
        }
        fixup = fixup->next;
    }
}

char *
emit_bsr(Parrot_jit_info *jit_info,
         struct Parrot_Interp * interpreter) 
{
    char *pc = jit_info->native_ptr;
    long high,low;

    Parrot_jit_newfixup(jit_info);
    jit_info->fixups->type = JIT_ALPHABSR;
    jit_info->fixups->param.fptr = 
        (void (*)(void))interpreter->op_func_table[*(jit_info->cur_op)];
    high = 0;

    Parrot_jit_newfixup(jit_info);
    jit_info->fixups->type = JIT_ALPHASTART;
    jit_info->fixups->param.fptr =  
        (void (*)(void))interpreter->op_func_table[*(jit_info->cur_op)];
    pc = emit_l_s(pc, LDH, REG1_t0, REG27_t12, &high); 
    pc = emit_l_s(pc, LDA, REG1_t0, REG1_t0, &high); 
    emit_mov(pc, REG1_t0, REG27_t12);

    *(pc++) = 0;
    *(pc++) = 0;
    *(pc++) = 0x40;
    *(pc++) = 0xd3;

    return pc;
}
    
/* TODO: re-write this properly */
#define emit_jsr(pc) { \
    *(pc++) = 0; \
    *(pc++) = 0x40; \
    *(pc++) = 0xe0; \
    *(pc++) = 0x6b; \
}

#define emit_ret(pc) { \
    *(pc++) = 1; \
    *(pc++) = 0x80; \
    *(pc++) = 0xfa; \
    *(pc++) = 0x6b; \
}
    
void
Parrot_jit_normal_op(Parrot_jit_info *jit_info,
                     struct Parrot_Interp * interpreter)
{
    jit_info->native_ptr = emit_l_c(jit_info, REG16_a0, 
                                    (long *)&jit_info->cur_op); 
    jit_info->native_ptr = emit_l_c(jit_info, REG17_a1, 
                                    (long *)&interpreter); 
    jit_info->native_ptr = emit_l_s_c(jit_info->native_ptr, LDA,
                                      REG30_sp, REG30_sp, -16);
    jit_info->native_ptr = emit_l_s_c(jit_info->native_ptr, STQ, 
                                      REG6_t5, REG30_sp, 0);
    jit_info->native_ptr = emit_l_s_c(jit_info->native_ptr, STQ, 
                                      REG27_t12, REG30_sp, 8);
    jit_info->native_ptr = emit_bsr(jit_info, interpreter);
    jit_info->native_ptr = emit_l_s_c(jit_info->native_ptr, LDQ, 
                                      REG6_t5, REG30_sp, 0);
    jit_info->native_ptr = emit_l_s_c(jit_info->native_ptr, LDQ, 
                                      REG27_t12, REG30_sp, 8);
    jit_info->native_ptr = emit_l_s_c(jit_info->native_ptr, LDA, 
                                      REG30_sp, REG30_sp, 16);
}

void
Parrot_jit_cpcf_op(Parrot_jit_info *jit_info,
                   struct Parrot_Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info,interpreter);

    jit_info->native_ptr = emit_l_c(jit_info, REG7_t6, 
                                    (long *)&interpreter->code->byte_code); 
    jit_info->native_ptr = emit_arithmetic(jit_info->native_ptr, 
                                           SUBQ, REG0_v0, REG7_t6, REG0_v0); 
    jit_info->native_ptr = emit_l_c(jit_info, REG7_t6, 
                                    (long *)&jit_info->op_map); 
    jit_info->native_ptr = emit_arithmetic(jit_info->native_ptr, 
                                           ADDQ, REG0_v0, REG7_t6, REG0_v0); 
    /* XXX this is incorrect, might blow the stack, use jmp instead */
    emit_jsr(jit_info->native_ptr);
} 

char
section(alpha_register_t r) {
    char s = 0;

    if ((r >= REG8_t7) && (r <= REG15_s6)) { 
        s = 1; 
    } else if ((r >= REG16_a0) && (r <= REG24_t10)) { 
        s = 2; 
    } else if (r >= REG25_t11) { 
        s = 3; 
    }
    return s;
}

/* calculates the proper values for the displacement                              
** from s to d.
** returned values should be interpreted as:
** d = s + *high * 65536 + *low                              
**/

void
calculate_displacement(long *s, long *d, long *high, long *low) 
{   
    long displacement = *d - *s;    
    
    *high = displacement / 65536;                                         
    *low = displacement % 65536;                                          
    if (*low > 32767) {                                                           
        *high += 1;
        *low -= 65536;                                                            
    }
    else if (*low < -32767) {                                                     
        *high -= 1;
        *low += 65536;                                                            
    }                                                                             
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
