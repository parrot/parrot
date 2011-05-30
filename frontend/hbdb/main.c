/* Copyright (C) 2001-2010, Parrot Foundation. */

#include <stdio.h>
#include <stdlib.h>
#include "parrot/parrot.h"
#include "parrot/hbdb.h"
#include "parrot/api.h"

/* TODO Check for command line arguments */
/* TODO Define usage() function          */
/* TODO Add perldoc                      */

static void fail(Parrot_PMC interp);

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
        fail(NULL);
    }

    /* TODO Check for argv[1] here and call usage() */
    /* Get bytecode filename */
    if (!Parrot_api_string_import_ascii(interp, argv[1], &file)) {
        fail(interp);
    }

    /* Register hbdb runcore */
    if (!Parrot_api_set_runcore(interp, "hbdb", 0)) {
        Parrot_api_destroy_interpreter(interp);
        fail(interp);
    }

    /* Load bytecode file from command line */
    if (!Parrot_api_load_bytecode_file(interp, file, &pbc)) {
        Parrot_api_destroy_interpreter(interp);
        fail(interp);
    }

    /* Ready bytecode */
    if (!Parrot_api_ready_bytecode(interp, pbc, &main_sub)) {
        Parrot_api_destroy_interpreter(interp);
        fail(interp);
    }

    /* Run bytecode */
    if (!Parrot_api_run_bytecode(interp, pbc, NULL)) {
        Parrot_api_destroy_interpreter(interp);
        fail(interp);
    }

    /* DEBUG */
    printf("Reached line %d\n", __LINE__);
    /* DEBUG */

    Parrot_api_destroy_interpreter(interp);
    return (0);
}

static void
fail(Parrot_PMC interp)
{
    char          *msg;

    Parrot_Int    is_error,
                  exit_code;
    Parrot_String errmsg;
    Parrot_PMC    exception;

    if (!Parrot_api_get_result(interp, &is_error, &exception, &exit_code, &errmsg))
        exit(EXIT_FAILURE);

    if (is_error) {
        Parrot_api_string_export_ascii(interp, errmsg, &msg);
        fprintf(stderr, "ERROR: %s\n", msg);
        Parrot_api_string_free_exported_ascii(interp, msg);
    }

    exit(exit_code);
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

