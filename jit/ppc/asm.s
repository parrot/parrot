.text
	.align	12
	.globl Parrot_ppc_jit_restore_nonvolatile_registers
Parrot_ppc_jit_restore_nonvolatile_registers:

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
