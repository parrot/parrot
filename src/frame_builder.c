/*
Copyright (C) 2008-2009, Parrot Foundation.
$Id$

=head1 NAME

src/frame_builder.c

=head1 DESCRIPTION

Functions for the ManagedStruct PMC and others.

=head1 FUNCTIONS

=cut

*/

/* HEADERIZER HFILE: none */
/* HEADERIZER STOP */

#include "parrot/parrot.h"
#include "pmc/pmc_fixedintegerarray.h"
#include "pmc/pmc_unmanagedstruct.h"
#include "pmc/pmc_managedstruct.h"
#include "frame_builder.h"

/*

=over 4

=item C<void Parrot_jit_free_buffer(PARROT_INTERP, void *ptr, void *priv)>

This is a callback to implement the proper freeing semantics.  It is called by
the ManagedStruct PMC as it is garbage collected.

=cut

*/

void
Parrot_jit_free_buffer(SHIM_INTERP, void *ptr, void *priv)
{
    const struct jit_buffer_private_data * const jit = (struct jit_buffer_private_data*)priv;
    mem_free_executable(ptr, jit->size);
    free(priv);
}

/*

=item C<PMC *Parrot_jit_clone_buffer(PARROT_INTERP, PMC *pmc, void *priv)>

This is a callback to implement the proper cloning semantics for jit buffers.
It is called by the ManagedStruct PMC's clone() function.

=back

=cut

*/

PMC *
Parrot_jit_clone_buffer(PARROT_INTERP, PMC *pmc, void *priv)
{
    PMC * const rv = Parrot_pmc_new(interp, pmc->vtable->base_type);

    VTABLE_init(interp, rv);
    /* copy the attributes */
    {
        void (*tmpfreefunc)(PARROT_INTERP, void*, void*);
        GETATTR_ManagedStruct_custom_free_func(interp, pmc, tmpfreefunc);
        SETATTR_ManagedStruct_custom_free_func(interp, rv , tmpfreefunc);
    }
    {
        PMC* (*tmpclonefunc)(PARROT_INTERP, PMC*, void*);
        GETATTR_ManagedStruct_custom_clone_func(interp, pmc, tmpclonefunc);
        SETATTR_ManagedStruct_custom_clone_func(interp, rv , tmpclonefunc);
    }

    {
        void *freepriv, *clonepriv;
        GETATTR_ManagedStruct_custom_free_priv(interp , pmc, freepriv);
        GETATTR_ManagedStruct_custom_clone_priv(interp, pmc, clonepriv);
        if (freepriv) {
            void *tmp = mem_gc_allocate_zeroed_typed(interp, struct jit_buffer_private_data);
            memcpy(tmp, freepriv, sizeof (struct jit_buffer_private_data));
            SETATTR_ManagedStruct_custom_free_priv(interp, rv , tmp);
            if (clonepriv == freepriv) {
                /* clonepriv is a copy of freepriv, make it a copy in the clone too. */
                SETATTR_ManagedStruct_custom_clone_priv(interp, rv , tmp);
                clonepriv = NULL; /* disable the clonepriv copying below */
            }
        }
        if (clonepriv) {
            void *tmp = mem_gc_allocate_zeroed_typed(interp, struct jit_buffer_private_data);
            memcpy(tmp, clonepriv, sizeof (struct jit_buffer_private_data));
            SETATTR_ManagedStruct_custom_clone_priv(interp, rv , tmp);
        }
    }

    /* copy the execmem buffer */
    if (PARROT_MANAGEDSTRUCT(pmc)->ptr) {
        struct jit_buffer_private_data *jit = (struct jit_buffer_private_data*)priv;
        void *ptr = PARROT_MANAGEDSTRUCT(pmc)->ptr;
        void *newptr = mem_alloc_executable(jit->size);
        if (!newptr)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                    "Cannot allocate executable memory");
        memcpy(newptr, ptr, jit->size);
        PARROT_MANAGEDSTRUCT(rv)->ptr = newptr;
    }

    return rv;
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
emit_popl_r(char *pc, int reg)
{
    *(pc++) = (char)(0x58 | (reg - 1));
    return pc;
}

unsigned char *lastpc;

size_t
calc_signature_needs(const char *sig, int *strings)
{
    size_t stack_size = 0;
    while (*sig) {
        switch (*sig) {
          case 't':
            ++(*strings);
            stack_size +=4;
            break;
          case 'd':
            stack_size +=8;
            break;
          default:
            stack_size +=4;
            break;
        }
        ++sig;
    }
    return stack_size;

}

/*
 * The function generated here is called as func(interp, nci_info)
 * interp   ...  8(%ebp)
 * nci_info ... 12(%ebp)
 *
 * The generate function for a specific signature looks quite similar to
 * an optimized compile of src/nci.c:pcf_x_yy(). In case of any troubles
 * just compare the disassembly.
 *
 * If a non-NULL sizeptr is passed, the integer it points to will be written
 * with the size of the allocated execmem buffer.
 */

void *
Parrot_jit_build_call_func(PARROT_INTERP, PMC *pmc_nci, STRING *signature, int *sizeptr)
{
    char     *pc;
    char     *execmem;
    int       i                    = 0;
    int       arg_count            = 0;
    int       string_buffer_count  = 0;
    const int ST_SIZE_OF           = 124;
    const int JIT_ALLOC_SIZE       = 1024;

    char      *signature_str      = Parrot_str_to_cstring(interp, signature);
    /* skip over the result */
    char      *sig                = signature_str + 1;
    size_t     stack_space_needed = calc_signature_needs(sig,
                                        &string_buffer_count);

    int base_offset        = 0;
    int strings_offset     = base_offset - (sizeof (char *) * string_buffer_count);
    int st_offset          = strings_offset - ST_SIZE_OF;
    int args_offset        = st_offset - stack_space_needed;
    int temp_calls_offset  = args_offset - 16;
    int total_stack_needed = -temp_calls_offset;

    UNUSED(pmc_nci);

    /*
     * ESP
     * 0-15, 16 bytes for utility calls
     * stack_space_needed for actual NCI call
     * st
     * STRINGS -> char * holding space
     * EBP
     */

    /* this ought to be enough - the caller of this function
     * should free the function pointer returned here
     */
    pc = execmem = (char *)mem_alloc_executable(JIT_ALLOC_SIZE);
    if (! pc)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                "Cannot allocate executable memory");


    /* this generated jit function will be called as (INTERP (EBP 8), func_ptr
    * (ESP 12), args signature (ESP 16)) */

    /* make stack frame, preserve %ebx */
    jit_emit_stack_frame_enter(pc);

    emitm_subl_i_r(pc, total_stack_needed, emit_ESP);

    /* Parrot_init_arg_nci(interp, &st, "S"); */
    /* args signature "S" */
    emitm_movl_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, 16);
    emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 8);

    /*&st*/
    emitm_lea_m_r(interp,  pc, emit_EAX, emit_EBP, 0, 1, st_offset);
    emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 4);

    /*interpreter*/
    emitm_movl_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, 8);
    emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 0);

    /* XXX FIXME (TT #1325) This whole function require major rework */
    /* if (sig && *sig) */
    /*   emitm_call_cfunc(pc, Parrot_init_arg_nci); */

    while (*sig) {
        emitm_movl_i_m(pc, arg_count, emit_EBP, 0, 1, temp_calls_offset + 8);

        switch (*sig) {
          case '0':    /* null ptr or such - doesn't consume a reg */
            jit_emit_bxor_rr_i(interp, pc, emit_EAX, emit_EAX);
            emitm_movl_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, args_offset);
            break;
          case 'f':
            /* FIXME (TT #1325) emitm_call_cfunc(pc, get_nci_N); */
            emitm_fstps(interp, pc, emit_EBP, 0, 1, args_offset);
            break;
          case 'N':
          case 'd':
            /* FIXME (TT #1325) emitm_call_cfunc(pc, get_nci_N); */
            emitm_fstpl(interp, pc, emit_EBP, 0, 1, args_offset);
            args_offset += 4;
            break;
          case 'I':   /* INTVAL */
          case 'l':   /* long */
          case 'i':   /* int */
            /* FIXME (TT #1325) emitm_call_cfunc(pc, get_nci_I); */
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, args_offset);
            break;
          case 't':   /* string, pass a cstring */
            /* FIXME (TT #1325) emitm_call_cfunc(pc, get_nci_S); */
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 4);
            emitm_call_cfunc(pc, string_to_cstring_nullable);

            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, args_offset);
            /* save off temporary allocation address */
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, strings_offset);
            strings_offset += 4;

            /* reset ESP(4) */
            emitm_lea_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, st_offset);
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 4);
            break;
          case 's':   /* short: movswl intreg_o(base), %eax */
            /* FIXME (TT #1325) emitm_call_cfunc(pc, get_nci_I); */
            emitm_movswl_r_r(pc, emit_EAX, emit_EAX);
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, args_offset);
            break;
          case 'c':   /* char: movsbl intreg_o(base), %eax */
            /* emitm_call_cfunc(pc, get_nci_I); */
            emitm_movsbl_r_r(pc, emit_EAX, emit_EAX);
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, args_offset);
            break;
          case 'J':   /* interpreter */
            emitm_movl_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, 8);
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, args_offset);
            --arg_count;
            break;
          case 'p':   /* push pmc->data */
            /* FIXME (TT #1325) emitm_call_cfunc(pc, get_nci_p); */
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, args_offset);
            break;
          case 'O':   /* push PMC * object in P2 */
          case 'P':   /* push PMC * */
          case '@':
            /* FIXME (TT #1325) emitm_call_cfunc(pc, get_nci_P); */
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, args_offset);
            break;
          case 'v':
            break;
          case 'b':   /* buffer (void*) pass Buffer_bufstart(SReg) */
            /* FIXME (TT #1325) emitm_call_cfunc(pc, get_nci_S); */
            emitm_movl_m_r(interp, pc, emit_EAX, emit_EAX, 0, 1,
                               (size_t) &Buffer_bufstart((STRING *) NULL));
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, args_offset);
            break;
          case 'B':   /* buffer (void**) pass &Buffer_bufstart(SReg) */
            /* FIXME (TT #1325) emitm_call_cfunc(pc, get_nci_S); */
            emitm_lea_m_r(interp, pc, emit_EAX, emit_EAX, 0, 1,
                              (size_t) &Buffer_bufstart((STRING *) NULL));
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, args_offset);
            break;
          case 'S':
            /* FIXME (TT #1325) emitm_call_cfunc(pc, get_nci_S); */
            emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, args_offset);
            break;


            /* I have no idea how to handle these */
          case '2':
          case '3':
          case '4':
          case 'V':
            mem_free_executable(execmem, JIT_ALLOC_SIZE);
            Parrot_str_free_cstring(signature_str);
            return NULL;
            break;
          default:
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                    "Unknown arg Signature %c\n", *sig);
            /*
             * oops unknown signature:
             * cleanup and try nci.c
             */
            mem_free_executable(execmem, JIT_ALLOC_SIZE);
            Parrot_str_free_cstring(signature_str);
            return NULL;
        }
        args_offset +=4;
        ++arg_count;
        ++sig;
    }

    /* prepare to call VTABLE_get_pointer, set up args */
    /* interpreter - movl 8(%ebp), %eax */
    emitm_movl_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, 8);
    emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 0);

    /* pmc - movl 12(%ebp), %eax */
    emitm_movl_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, 12);
    emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 4);

    /* get the get_pointer() pointer from the pmc's vtable */
    emitm_movl_m_r(interp, pc, emit_EAX, emit_EAX, 0, 1, offsetof(PMC, vtable));
    emitm_movl_m_r(interp, pc, emit_EAX, emit_EAX, 0, 1, offsetof(VTABLE, get_pointer));

    /* call get_pointer(), result goes into eax */
    emitm_callr(pc, emit_EAX);
    emitm_addl_i_r(pc, 16, emit_ESP);

    /* call the resulting function pointer */
    emitm_callr(pc, emit_EAX);
    emitm_subl_i_r(pc, 16, emit_ESP);

    /* SAVE OFF EAX */
    emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 8);

    /*&st*/
    emitm_lea_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, st_offset);
    emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 4);

    /*interpreter*/
    emitm_movl_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, 8);
    emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 0);

    /* RESTORE BACK EAX */
    emitm_movl_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 8);

    /* now place return value in registers */
    /* first in signature is the return value */
    sig = signature_str; /* the result */
    switch (*sig) {
      /* I have no idea how to handle these */
      case '2':
      case '3':
      case '4':
        /* get integer from pointer - untested */
        emitm_movl_m_r(interp, pc, emit_EAX, emit_EAX, 0, 1, 0);
        if (*sig == 2)      /* short */
            emitm_movswl_r_r(pc, emit_EAX, emit_EAX);
        /* XXX FIXME (TT #1325) emitm_call_cfunc(pc, set_nci_I);*/
        break;
      case 'f':
      case 'd':
        jit_emit_fstore_mb_n(interp, pc, emit_EBP, temp_calls_offset + 8);
        /* XXX FIXME (TT #1325) emitm_call_cfunc(pc, set_nci_N); */
        /* pop num from st(0) and mov to reg */
        break;
      case 's':
        /* movswl %ax, %eax */
        emitm_movswl_r_r(pc, emit_EAX, emit_EAX);
        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 8);
        /* XXX FIXME (TT #1325) emitm_call_cfunc(pc, set_nci_I); */
        break;
      case 'c':
        /* movsbl %al, %eax */
        emitm_movsbl_r_r(pc, emit_EAX, emit_EAX);
        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 8);
        /* XXX FIXME (TT #1325) emitm_call_cfunc(pc, set_nci_I); */
        break;
      case 'I':   /* INTVAL */
      case 'l':
      case 'i':
        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 8);
        /* XXX FIXME (TT #1325) emitm_call_cfunc(pc, set_nci_I); */
        break;
      case 'v': /* void - do nothing */
        break;
      case 'P':
        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 8);
        /* XXX FIXME (TT #1325) emitm_call_cfunc(pc, set_nci_P); */
        break;
      case 'p':   /* make a new unmanaged struct */
        /* save return value on stack */

        /* save pointer p */
        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 12);

        /* make new pmc */
        emitm_movl_i_m(pc, enum_class_UnManagedStruct, emit_EBP, 0, 1, temp_calls_offset + 4);
        emitm_call_cfunc(pc, Parrot_pmc_new);

        /* restore pointer p to EDX */
        emitm_movl_m_r(interp, pc, emit_EDX, emit_EBP, 0, 1, temp_calls_offset + 12);

        /* copy UnManagedStruct to stack for set_nci_P call */
        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 8);

        /* eax = PMC, get return value into edx */
        /* mov data(%eax), %eax
           mov %edx, ptr(%eax) */
        emitm_movl_m_r(interp, pc, emit_EAX, emit_EAX, 0, 1, offsetof(struct PMC, data));
        emitm_movl_r_m(interp, pc, emit_EDX, emit_EAX, 0, 1,
                           offsetof(struct Parrot_UnManagedStruct_attributes, ptr));

        /* reset EBP(4) */
        emitm_lea_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, st_offset);
        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 4);

        /* XXX FIXME (TT #1325) emitm_call_cfunc(pc, set_nci_P); */
        break;
      case 'S':
        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 8);
        /* XXX FIXME (TT #1325) emitm_call_cfunc(pc, set_nci_S); */
        break;
      case 't':   /* string */
        /* EAX is char* */
        emitm_movl_i_m(pc, 0, emit_EBP, 0, 1, temp_calls_offset + 8); /* len */

        /* overwrites address of st in EBP(4) */
        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 4);

        emitm_call_cfunc(pc, Parrot_str_new);

        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 8);

        /* reset EBP(4) */
        emitm_lea_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, st_offset);
        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 4);

        /* XXX FIXME (TT #1325) emitm_call_cfunc(pc, set_nci_S); */
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                "Unknown return Signature %c\n", *sig);
        /*
         * oops unknown signature:
         * cleanup and try nci.c
         */
        Parrot_str_free_cstring(signature_str);
        mem_free_executable(execmem, JIT_ALLOC_SIZE);
        return NULL;
    }

    /* free temporary strings */
    strings_offset = st_offset + ST_SIZE_OF;
    for (i=0; i<string_buffer_count; ++i) {
        emitm_movl_m_r(interp, pc, emit_EAX, emit_EBP, 0, 1, strings_offset);
        emitm_movl_r_m(interp, pc, emit_EAX, emit_EBP, 0, 1, temp_calls_offset + 0);
        emitm_call_cfunc(pc, Parrot_str_free_cstring);
        strings_offset += 4;
    }

    jit_emit_stack_frame_leave(pc);
    emitm_ret(pc);
    PARROT_ASSERT(pc - execmem <= JIT_ALLOC_SIZE);

    if (sizeptr)
        *sizeptr = JIT_ALLOC_SIZE;
    Parrot_str_free_cstring(signature_str);
    return (void *)D2FPTR(execmem);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
