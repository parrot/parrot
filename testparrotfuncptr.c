/*
 * testparrotfuncptr.c - figure out if the compiler will let us do
 *                       non-ansi function pointer casts.
 */

#include <stdio.h>

int
a_function(int some_number)
{
    if (some_number == 42) {
        printf("OK\n");
        return 0;
    }
    else {
        printf("FAIL\n");
        return -1;
    }
}

typedef int (*func_t) (int);

int
main(int argc, char *argv[])
{
    void *voidptr;
    func_t funcptr;

    voidptr = a_function;
    funcptr = a_function;
    funcptr = (func_t)voidptr;


    return funcptr(42);
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
