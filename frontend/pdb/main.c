/* Copyright (C) 2001-2010, Parrot Foundation. */

#include <stdio.h>
#include <stdlib.h>
#include "parrot/embed.h"
#include "parrot/api.h"

/* TODO Check for command line arguments         */
/* TODO Change all references to "pdb" to "hbdb" */

int
main(int argc, char *argv[])
{
    Parrot_PMC       *interp,
                     *pbc,
                     *main_sub;
    Parrot_Init_Args *initargs;

    /* Setup default initialization parameters */
    GET_INIT_STRUCT(initargs);

    /* Create new interpreter */
    if (!Parrot_api_make_interpreter(NULL, 0, initargs, &interp)) {
        fprintf(stderr, "[ERROR] Failed to allocate new interpreter\n");

        /* FIXME Do I need this conditional? */
        if (interp != NULL)
            Parrot_x_exit(interp, EXIT_FAILURE);
        else
            fprintf(stderr, "[ERROR] Failed to get error details\n");
            Parrot_x_exit(interp, EXIT_FAILURE);
    }

    /* Register pdb runcore */
    if (!Parrot_api_set_runcore(interp, "pdb", 0)) {
        fprintf(stderr, "[ERROR] Failed to register runcore\n");
        Parrot_x_exit(interp, EXIT_FAILURE);
    }

    /* Load bytecode file from command line */
    if (!Parrot_api_load_bytecode_file(interp, argv[1], pbc)) {
        fprintf(stderr, "[ERROR] Failed to load bytecode in %s", argv[1]);
        Parrot_x_exit(interp, EXIT_FAILURE);
    }

    /* Ready bytecode */
    if (!Parrot_api_ready_bytecode(interp, pbc, main_sub)) {
        fprintf(stderr, "[ERROR] Failed to prepare byte in %s", argv[1]);
        Parrot_x_exit(interp, EXIT_FAILURE);
    }

    /* DEBUG */
    printf("Reached line %d\n", __LINE__);
    /* DEBUG */

    /* FIXME Which one: Parrot_x_exit() or return? */
    Parrot_x_exit(interp, EXIT_SUCCESS);
    /* return (0); */
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

