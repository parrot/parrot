#include <stdlib.h>
void*
Parrot_memcpy_aligned_sse(void *dest, const void *src, size_t n)
{
    asm(
	"mov %0, %%ecx\n\t"
	"mov %1, %%esi\n\t"
	"mov %2, %%edi\n\t"
	"shr $5, %%ecx\n\t"
	"#.p2align 4\n\t"
	"1:\n\t"
	"movups 0(%%esi), %%xmm0\n\t"
	"movups 16(%%esi), %%xmm1\n\t"
	"add $32, %%esi\n\t"
	"movups %%xmm0, 0(%%edi)\n\t"
	"movups %%xmm1, 16(%%edi)\n\t"
	"add $32, %%edi\n\t"
	"dec %%ecx\n\t"
	"jnz 1b\n\t"

    : : "g"(n), "g"(src), "g"(dest) : "%esi", "%edi", "%ecx");
    return dest;
}

/*INTERFACE

#include <stdlib.h>
typedef void* (*@FUNC@_t)(void *dest, const void *src, size_t);

#ifndef NDEBUG
#include <assert.h>
static void*
@FUNC@_debug(void* d, const void* s, size_t n)
{
    assert( (n & 0x1f) == 0);
    assert( ((unsigned long) d & 7) == 0);
    assert( ((unsigned long) s & 7) == 0);
    return ((@FUNC@_t)@FUNC@_code)(d, s, n);
}

@FUNC@_t @FUNC@ = @FUNC@_debug;

#else
@FUNC@_t @FUNC@ =
    (@FUNC@_t) @FUNC@_code;
#endif

#ifdef PARROT_CONFIG_TEST
#include <string.h>
#include <stdio.h>
int main(int argc, char *argv[]) {
    unsigned char *s, *d;
    size_t i, n;

    n = 640;	@* sizeof(reg_store) *@

    s = malloc(n);
    for (i = 0; i < n; ++i)
	s[i] = i & 0xff;
    d = malloc(n);
    for (i = 0; i < n; ++i)
	d[i] = 0xff;
    @FUNC@(d, s, n);
    for (i = 0; i < n; ++i)
	if (d[i] != (i & 0xff)) {
	    printf("error s[%d] = %d d = %d\n", i, s[i], d[i]);
	    exit(1);
	}
    puts("ok");
    return 0;
}
#endif @* PARROT_CONFIG_TEST *@
INTERFACE*/
