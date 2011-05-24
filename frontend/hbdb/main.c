/* Copyright (C) 2001-2010, Parrot Foundation. */

#include <stdio.h>
#include <stdlib.h>
#include "parrot/api.h"

/* TODO Check for command line arguments */
/* TODO Define usage() function          */

int
main(int argc, char *argv[])
{
    Parrot_PMC       interp    = NULL,
                     pbc       = NULL,
                     main_sub  = NULL;
    Parrot_String    file      = NULL;
    Parrot_Init_Args *initargs = NULL;

    /* Setup default initialization parameters */
    GET_INIT_STRUCT(initargs);

    /* Create new interpreter */
    if (!Parrot_api_make_interpreter(NULL, 0, initargs, &interp)) {
        fprintf(stderr, "[ERROR] Failed to allocate new interpreter\n");
        exit(EXIT_FAILURE);
    }

    /* TODO Check for argv[1] here and call usage() */
    /* Get bytecode filename */
    if (!Parrot_api_string_import_ascii(interp, argv[1], &file)) {
        fprintf(stderr, "[ERROR] Bad filename\n");
        exit(EXIT_FAILURE);
    }

    /* Register hbdb runcore */
    if (!Parrot_api_set_runcore(interp, "hbdb", 0)) {
        fprintf(stderr, "[ERROR] Failed to register runcore\n");

        Parrot_api_destroy_interpreter(interp);
        exit(EXIT_FAILURE);
    }

    /* Load bytecode file from command line */
    if (!Parrot_api_load_bytecode_file(interp, file, &pbc)) {
        fprintf(stderr, "[ERROR] Failed to load bytecode in %s\n", argv[1]);

        Parrot_api_destroy_interpreter(interp);
        exit(EXIT_FAILURE);
    }

    /* Ready bytecode */
    if (!Parrot_api_ready_bytecode(interp, pbc, &main_sub)) {
        fprintf(stderr, "[ERROR] Failed to prepare byte in %s\n", argv[1]);

        Parrot_api_destroy_interpreter(interp);
        exit(EXIT_FAILURE);
    }

    /* DEBUG */
    printf("Reached line %d\n", __LINE__);
    /* DEBUG */

    Parrot_api_destroy_interpreter(interp);
    return (0);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

