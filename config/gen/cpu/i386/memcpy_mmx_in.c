#include <stdlib.h>
void*
Parrot_memcpy_aligned_mmx(void *dest, void *src, size_t n)
{
    double tos;
    /*
     * must preserve tos - need also a version with fstpt/fldt
     */
    asm(
        "fstpl %3\n\t"
	"mov %0, %%edi\n\t"
	"mov %1, %%esi\n\t"
	"mov %2, %%ecx\n\t"
	"shr $4, %%ecx\n\t"
	".p2align 3\n\t"
	"1:\n\t"
	"movq 0(%%esi), %%mm0\n\t"
	"movq 8(%%esi), %%mm1\n\t"
	"add $16, %%esi\n\t"
	"movq %%mm0, 0(%%edi)\n\t"
	"movq %%mm1, 8(%%edi)\n\t"
	"add $16, %%edi\n\t"
	"dec %%ecx\n\t"
	"jnz 1b\n\t"
        "emms\n\t"
        "fldl %3\n\t"
    : /* no out */
    : "g"(dest), "g"(src), "g"(n), "m"(tos)
    : "%esi", "%edi", "%ecx", "memory");

    return dest;
}

/*INTERFACE

#include <stdlib.h>
typedef void* (*@FUNC@_t)(void *dest, void *src, size_t);
@FUNC@_t @FUNC@ =
    (@FUNC@_t) @FUNC@_code;

#ifdef PARROT_TEST
#include <string.h>
#include <stdio.h>
int main(int argc, char *argv[]) {
    unsigned char *s, *d;
    size_t i, l;

    l = 640;	@* sizeof(reg_store) *@

    s = malloc(l);
    for (i = 0; i < l; ++i)
	s[i] = i & 0xff;
    d = malloc(l);
    for (i = 0; i < l; ++i)
	d[i] = 0xff;
    @FUNC@(d, s, l);
    for (i = 0; i < l; ++i)
	if (d[i] != (i & 0xff)) {
	    printf("error s[%d] = %d d = %d\n", i, s[i], d[i]);
	    exit(1);
	}
    puts("ok");
    return 0;
}
#endif @* PARROT_TEST *@
INTERFACE*/
