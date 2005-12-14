.text
	.align	12
	.globl Parrot_ppc_jit_restore_nonvolatile_registers
Parrot_ppc_jit_restore_nonvolatile_registers:

    lfd     14,-84(1)
    lfd     15,-92(1)
    lfd     16,-100(1)
    lfd     17,-108(1)
    lfd     18,-116(1)
    lfd     19,-124(1)
    lfd     20,-132(1)
    lfd     21,-140(1)
    lfd     22,-148(1)
    lfd     23,-156(1)
    lfd     24,-164(1)
    lfd     25,-172(1)
    lfd     26,-180(1)
    lfd     27,-188(1)
    lfd     28,-196(1)
    lfd     29,-204(1)
    lfd     30,-212(1)
    lfd     31,-220(1)

    blr
