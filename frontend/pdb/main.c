/* Copyright (C) 2001-2010, Parrot Foundation. */

#include <stdio.h>
#include <stdlib.h>
#include "parrot/api.h"

int
main(void) {
    Parrot_PMC    *interp;
    Parrot_Init_Args *initargs;

    /* DEBUG */
    printf("Reached line %d\n", __LINE__);
    /* DEBUG */

    /* Setup default initialization parameters */
    GET_INIT_STRUCT(initargs);

    /* Create new interpreter */
    if (!Parrot_api_make_interpreter(NULL, 0, initargs, &interp)) {
        fprintf(stderr, "[ERROR] Failed to allocate new interpreter\n");

        if (interp != NULL)
            exit(EXIT_FAILURE);
        else
            fprintf(stderr, "[ERROR] Failed to get error details\n");
            exit(EXIT_FAILURE);
    }

    /* Register pdb runcore */
    if (!Parrot_api_set_runcore(interp, "pdb", 0)) {
        exit(EXIT_FAILURE);
    }

    /* DEBUG */
    printf("Reached line %d\n", __LINE__);
    /* DEBUG */

    return (0);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

