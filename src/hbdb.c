/* Copyright (C) 2001-2011, Parrot Foundation. */

/*

=head1 NAME

src/hbdb.c - The Honey Bee Debugger

=head1 DESCRIPTION

This file contains functions and types used by the C<hbdb> debugger.

=head1 FUNCTIONS

=over 4

=cut

*/

#include <stdio.h>

#include "parrot/parrot.h"
#include "parrot/hbdb.h"
#include "parrot/string_funcs.h"
#include "parrot/sub.h"

/* HEADERIZER HFILE: include/parrot/hbdb.h */

typedef void (*cmd_func_t)(ARGIN(hbdb_t *hbdb), ARGIN(const char * const cmd));

typedef struct cmd      cmd;
typedef struct cmd_list cmd_list;

/*
 * Type:
 *     cmd
 *
 * Fields:
 *     c_func - points to the function that executes the command
 *     c_help - the help message associated with the command
 * 
 * Overview:
 *     Contains information about the implementation of a particular command.
 */

struct cmd {
    cmd_func_t         c_func;
    const char * const c_help;
};

/*
 * Type:
 *     cmd_list
 *
 * Fields:
 *     cl_name  - command name
 *     cl_short - command name abberviation
 *     cl_cmd   - "cmd" type for storing implementation details
 *
 * Overview:
 *     Contains general information about a particular command.
 */

struct cmd_list {
    const char * const cl_name;
    const char * const cl_short;
    const cmd  * const cl_cmd;        
};

/* Entire list of commands */
const cmd_list commands[] = {
    { "break", 'b', },
    { "help",  'h', },
};

/*

=item C<void hbdb_get_command(PARROT_INTERP)>

Prompts the user to enter a command.

*/

void
hbdb_get_command(PARROT_INTERP)
{
    ASSERT_ARGS(hbdb_get_command)

    STRING *cmd;

    PMC    *stdinput;
    STRING *readline;
    STRING *prompt;

    /* DEBUG */
    PMC    *stdoutput = Parrot_io_stdhandle(interp, STDOUT_FILENO, NULL);
    STRING *print     = Parrot_str_new_constant(interp, "print");
    STRING *newline   = Parrot_str_new_constant(interp, "\n");
    /* DEBUG */

    /* Create FileHandle PMC for stdin */
    stdinput = Parrot_io_stdhandle(interp, STDIN_FILENO, NULL);

    /* Create string constants */
    readline = Parrot_str_new_constant(interp, "readline_interactive");
    prompt   = Parrot_str_new_constant(interp, "(hbdb) ");

    while (1) {
        Parrot_pcc_invoke_method_from_c_args(interp, stdinput, readline, "S->S", prompt, &cmd);

        Parrot_pcc_invoke_method_from_c_args(interp,
                                             stdoutput,
                                             print,
                                             "S->",
                                             Parrot_str_concat(interp, cmd, newline));
    }
}

/*

=item C<INTVAL hbdb_get_line_number(PARROT_INTERP, PMC *context_pmc)>

Returns the line number for the current context.

=cut

*/

INTVAL
hbdb_get_line_number(PARROT_INTERP, ARGIN(PMC *context_pmc))
{
    ASSERT_ARGS(hbdb_get_line_number)

    INTVAL line_num;
    Parrot_Context * const context = PMC_data_typed(context_pmc, Parrot_Context *);

    /*line_num = Parrot_sub_get_line_from_pc(interp,
                                           Parrot_pcc_get_sub(interp, context_pmc),
                                           context->current_pc);*/

    return line_num;
}

/*

=back

=head1 SEE ALSO

F<frontend/hbdb/main.c>, F<include/parrot/hbdb.h>

=head1 HISTORY

The initial version of C<hbdb> was written by Kevin Polulak (soh_cah_toa) as
part of Google Summer of Code 2011.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

