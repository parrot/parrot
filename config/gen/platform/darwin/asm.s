#define PPC_JIT_GP_REGISTER_SAVE_SPACE (4*19)

;; This macro would generate the below asm, but requires using 'cc -c' 
;; rather than 'as' as the assembler (so that the preprocessor runs), 
;; and this is not currently configurable in the Parrot makefiles

.macro RESTORE_NONVOLATILE_FLOATS
    lfd    f14, -PPC_JIT_GP_REGISTER_SAVE_SPACE-1*8(r1)
    lfd    f15, -PPC_JIT_GP_REGISTER_SAVE_SPACE-2*8(r1)
    lfd    f16, -PPC_JIT_GP_REGISTER_SAVE_SPACE-3*8(r1)
    lfd    f17, -PPC_JIT_GP_REGISTER_SAVE_SPACE-4*8(r1)
    lfd    f18, -PPC_JIT_GP_REGISTER_SAVE_SPACE-5*8(r1)
    lfd    f19, -PPC_JIT_GP_REGISTER_SAVE_SPACE-6*8(r1)
    lfd    f20, -PPC_JIT_GP_REGISTER_SAVE_SPACE-7*8(r1)
    lfd    f21, -PPC_JIT_GP_REGISTER_SAVE_SPACE-8*8(r1)
    lfd    f22, -PPC_JIT_GP_REGISTER_SAVE_SPACE-9*8(r1)
    lfd    f23, -PPC_JIT_GP_REGISTER_SAVE_SPACE-10*8(r1)
    lfd    f24, -PPC_JIT_GP_REGISTER_SAVE_SPACE-11*8(r1)
    lfd    f25, -PPC_JIT_GP_REGISTER_SAVE_SPACE-12*8(r1)
    lfd    f26, -PPC_JIT_GP_REGISTER_SAVE_SPACE-13*8(r1)
    lfd    f27, -PPC_JIT_GP_REGISTER_SAVE_SPACE-14*8(r1)
    lfd    f28, -PPC_JIT_GP_REGISTER_SAVE_SPACE-15*8(r1)
    lfd    f29, -PPC_JIT_GP_REGISTER_SAVE_SPACE-16*8(r1)
    lfd    f30, -PPC_JIT_GP_REGISTER_SAVE_SPACE-17*8(r1)
    lfd    f31, -PPC_JIT_GP_REGISTER_SAVE_SPACE-18*8(r1)

.endmacro

.text
	.align	12		; vm page aligned
	.globl _Parrot_ppc_jit_restore_nonvolatile_registers
_Parrot_ppc_jit_restore_nonvolatile_registers:

    lfd     f14,-84(r1)
    lfd     f15,-92(r1)
    lfd     f16,-100(r1)
    lfd     f17,-108(r1)
    lfd     f18,-116(r1)
    lfd     f19,-124(r1)
    lfd     f20,-132(r1)
    lfd     f21,-140(r1)
    lfd     f22,-148(r1)
    lfd     f23,-156(r1)
    lfd     f24,-164(r1)
    lfd     f25,-172(r1)
    lfd     f26,-180(r1)
    lfd     f27,-188(r1)
    lfd     f28,-196(r1)
    lfd     f29,-204(r1)
    lfd     f30,-212(r1)
    lfd     f31,-220(r1)

    blr	
