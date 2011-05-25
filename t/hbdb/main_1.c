#include <stdio.h>
#include <stdlib.h>
#include "parrot/api.h"

static void fail(const char *msg);

static void
fail(const char *msg)
{
    fprintf(stderr, "[ERROR] %s\n", msg);
    exit(EXIT_FAILURE);
}
int
main(int argc, char *argv[])
{
    Parrot_PMC       interp    = NULL,
                     pbc       = NULL,
                     main_sub  = NULL;
    Parrot_String    file      = NULL;
    Parrot_Init_Args *initargs = NULL;

    GET_INIT_STRUCT(initargs);

    if (!Parrot_api_make_interpreter(NULL, 0, initargs, &interp)) {
        fail("Failed to allocate new interpreter");
    }

    Parrot_api_destroy_interpreter(interp);
    return (0);
}
