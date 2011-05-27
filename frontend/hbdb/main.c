/* Copyright (C) 2001-2010, Parrot Foundation. */

#include <stdio.h>
#include <stdlib.h>

#include "parrot/parrot.h"

#include "parrot/hbdb.h"
#include "parrot/api.h"

/* TODO Check for command line arguments */
/* TODO Define usage() function          */

static void fail(const char *msg);

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
        fail("Failed to allocate new interpreter");
    }

    /* TODO Check for argv[1] here and call usage() */
    /* Get bytecode filename */
    if (!Parrot_api_string_import_ascii(interp, argv[1], &file)) {
        fail("Bad filename");
    }

    /* Register hbdb runcore */
    if (!Parrot_api_set_runcore(interp, "hbdb", 0)) {
        Parrot_api_destroy_interpreter(interp);
        fail("Failed to register runcore");
    }

    /* Load bytecode file from command line */
    if (!Parrot_api_load_bytecode_file(interp, file, &pbc)) {
        Parrot_api_destroy_interpreter(interp);
        fail("Failed to load bytecode");
    }

    /* Ready bytecode */
    if (!Parrot_api_ready_bytecode(interp, pbc, &main_sub)) {
        Parrot_api_destroy_interpreter(interp);
        fail("Failed to prepare bytecode");
    }

    /* Run bytecode */
    if (!Parrot_api_run_bytecode(interp, pbc, NULL)) {
        Parrot_api_destroy_interpreter(interp);
        fail("Failed to run bytecode");
    }

    /* DEBUG */
    printf("Reached line %d\n", __LINE__);
    /* DEBUG */

    Parrot_api_destroy_interpreter(interp);
    return (0);
}

static void
fail(const char *msg)
{
    fprintf(stderr, "[ERROR] %s\n", msg);
    exit(EXIT_FAILURE);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

