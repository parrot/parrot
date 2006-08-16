! sparc-v9.s
! Copyright 2006 The Perl Foundation

! Contains atomic-ops support routines for Sparc chips supporting a compare-and-swap instruction.

        .section ".text"
        .align 4

! successp [%r8] = parrot_sparc_cas32(address [%r8], old [%r9], new [%r10])
parrot_sparc_cas32:
        cas [%r8],%r9,%r10
	or %g0, 1, %r8
        cmp %r9, %r10
        retl    ! return from leaf
	movne %icc, %g0, %r8 ! delay slot
        .global parrot_sparc_cas32

parrot_sparc_cas64:
        casx [%r8],%r9,%r10
        or %g0, 1, %r8
        cmp %r9, %r10
        retl    ! return from leaf
	movne %icc, %g0, %r8 ! delay slot
        .global parrot_sparc_cas64
