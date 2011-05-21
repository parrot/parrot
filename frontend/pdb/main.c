/* Copyright (C) 2001-2010, Parrot Foundation. */

#define PARROT_IN_EXTENSION

#include <stdio.h>
#include <stdlib.h>
#include "parrot/api.h"
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/runcore_api.h"

int
main(void) {
    Parrot_PMC       interp;
    Parrot_Init_Args *initargs;

    /* Setup default initialization parameters */
    GET_INIT_STRUCT(initargs);

    /* Create new interpreter */
    if (!Parrot_api_make_interpreter(NULL, 0, initargs, &interp)) {
        fprintf(stderr, "[ERROR] Failed to allocate new interpreter\n");

        if (interp != NULL)
            show_last_error_and_exit(interp);
        else
            fprintf(stderr, "[ERROR] Failed to get error details\n");

        exit(EXIT_FAILURE);
    }

    /* Register pdb runcore */
    if (!Parrot_api_set_runcore(interp, "pdb", 0)) {
        show_last_error_and_exit(interp);
    }

    /* DEBUG */
    printf("Reached line %d\n", __LINE__);
    /* DEBUG */

    Parrot_x_exit(interp, 0);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

