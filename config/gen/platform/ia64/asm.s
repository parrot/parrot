	.file	"ia64.s"
	        .text
	        .psr abi64
	        .psr lsb
	        .lsb

	        .align 16
	        .global flush_reg_store
	        .proc flush_reg_store
	flush_reg_store:
	        .body
	        flushrs
	        ;;
	        mov r8=ar.bsp
	        br.ret.sptk.few rp
	        .endp flush_reg_store
