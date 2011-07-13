/* Copyright (C) 2001-2011, Parrot Foundation. */

/*

=head1 NAME

src/hbdb.c - The Honey Bee Debugger

=head1 DESCRIPTION

This file contains functions and types used by the HBDB debugger.

=head1 COMMAND FUNCTIONS

Each of the following functions serve as the implementation for a particular
command. They are of the form C<hbdb_cmd_*>. For instance, if you are looking
for the code for the C<break> command, it will be the C<hbdb_cmd_break()>
function.

=over 4

=cut

*/

/* TODO Change hbdb_init() to accept an hbdb_t to avoid assignment after call */
/* TODO Rewrite struct's to use STRING's instead */

#include <stdio.h>
#include <ctype.h>

#include "parrot/parrot.h"
#include "parrot/hbdb.h"
#include "parrot/embed.h"
#include "parrot/string_funcs.h"
#include "parrot/sub.h"
#include "parrot/pobj.h"
#include "pmc/pmc_parrotinterpreter.h"

/* Size of command-line buffer */
#define HBDB_CMD_BUFFER_LENGTH 128

/* Size of buffer allocated for source code */
#define HBDB_SOURCE_BUFFER_LENGTH 1024

/* Abstract access to fields in Parrot_Interp */
#define INTERP_ATTR(x) ((Parrot_ParrotInterpreter_attributes *)PMC_data(x))->interp

/* HEADERIZER HFILE: include/parrot/hbdb.h */

typedef void (*hbdb_cmd_func_t)(PARROT_INTERP, ARGIN(const char *cmd));

typedef struct hbdb_cmd_t       hbdb_cmd_t;
typedef struct hbdb_cmd_table_t hbdb_cmd_table_t;

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
static unsigned int check_file_exists(PARROT_INTERP)
        __attribute__nonnull__(1);

static void command_line(PARROT_INTERP)
        __attribute__nonnull__(1);

static void continue_running(PARROT_INTERP)
        __attribute__nonnull__(1);

static void display_breakpoint(
    ARGIN(hbdb_t *hbdb),
    ARGIN(hbdb_breakpoint_t *bp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void free_file(PARROT_INTERP, ARGIN(hbdb_file_t *file))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static unsigned long get_cmd_argument(
    ARGMOD(const char **cmd),
    unsigned long def_val)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*cmd);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const hbdb_cmd_t * parse_command(ARGIN_NULLOK(const char **cmd));

PARROT_IGNORABLE_RESULT
static int /*@alt void@*/
run_command(PARROT_INTERP, ARGIN(const char *cmd))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
static const char * skip_whitespace(ARGIN(const char *cmd))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_check_file_exists __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_command_line __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_continue_running __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_display_breakpoint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(hbdb) \
    , PARROT_ASSERT_ARG(bp))
#define ASSERT_ARGS_free_file __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(file))
#define ASSERT_ARGS_get_cmd_argument __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(cmd))
#define ASSERT_ARGS_parse_command __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_run_command __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cmd))
#define ASSERT_ARGS_skip_whitespace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(cmd))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* Contains information about the implementation of a particular command               */
struct hbdb_cmd_t {
    const hbdb_cmd_func_t function;      /* Points to function that executes command   */
    const char           *short_help;    /* Short help message associated with command */
    const char           *help;          /* Help message associated with command       */
};

/* Contains general information about a particular command                */
struct hbdb_cmd_table_t {
    const char       *name;          /* Command name                      */
    const char       *short_name;    /* Command name abbreviation         */
    const hbdb_cmd_t *cmd;           /* Command function and help message */
};

/* Define a 'hbdb_cmd_t' structure for each command */
hbdb_cmd_t cmd_break    = { &hbdb_cmd_break,

                            "Sets a breakpoint at the specified location.",

                            "Sets a breakpoint at the specified location.\n\n"
                            "break LOCATION\n\n"
                            "If LOCATION is an address, breaks at the exact address." },

           cmd_continue = { &hbdb_cmd_continue,

                            "Continue program being debugged after a breakpoint.",

                            "Continue program being debugged after a breakpoint.\n\n"
                            "A number N may be used as an argument, which means to set the ignore"
                            "count of that breakpoint to N - 1 (so that the breakpoint won't"
                            "break until the Nth time is reached)." },

           cmd_list     = { &hbdb_cmd_list,

                            "Lists specified line(s).",

                            "Lists specified line(s).\n\n"
                            "With no argument, lists 10 lines.\n"
                            "One argument specifies a line, and ten lines are listed around that line.\n"
                            "Two arguments with comma between specify starting and ending lines to list."},

           cmd_help     = { &hbdb_cmd_help,

                            "Displays a summary help message.",

                            "Displays a summary help message." },

           cmd_quit     = { &hbdb_cmd_quit,

                            "Exits HBDB.",

                            "Exits HBDB." },

           cmd_run      = { &hbdb_cmd_run,

                            "Start debugged program. You may specify arguments to give it.",

                            "Start debugged program. You may specify arguments to give it." };

/* Global command table */
hbdb_cmd_table_t command_table[] = {
    { "break",    "b", &cmd_break    },
    { "continue", "c", &cmd_continue },
    { "help",     "h", &cmd_help     },
    { "list",     "l", &cmd_list     },
    { "quit",     "q", &cmd_quit     },
    { "run",      "r", &cmd_run      }
};

/*

=item C<void hbdb_cmd_break(PARROT_INTERP, const char *cmd)>

Sets a breakpoint at a specific location.

=cut

*/

void
hbdb_cmd_break(PARROT_INTERP, ARGIN(const char *cmd))
{
    ASSERT_ARGS(hbdb_cmd_break)

    hbdb_t            *hbdb;
    hbdb_breakpoint_t *bp;
    opcode_t           pos;

    /* Get global structure */
    hbdb = interp->hbdb;

    /* Verify that an actual command was passed */
    if (!cmd)
        /* TODO Use an appropriate exception_type_enum */
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "Null value passed to hbdb_cmd_break()");

    /* Allocated memory for breakpoint */
    bp = mem_gc_allocate_zeroed_typed(interp, hbdb_breakpoint_t);

    /* Break at line number if debugging file, otherwise at program counter */
    if (hbdb->file && hbdb->file->size) {
        /* Do nothing thanks to IMCC */
    }
    else {
        pos = (opcode_t) interp->code->base.data;
    }

    /* TODO Logic for parsing conditionals goes here */

    bp->pc = &pos;
    /*bp->line = line->number;*/

    /* Don't skip, yet */
    bp->skip = 0;

    /* Check if this is the first breakpoint being added */
    if (!hbdb->breakpoint) {
        bp->id           = 1;
        hbdb->breakpoint = bp;
    }
    else {
        hbdb_breakpoint_t *old_bp;

        /* Iterate through breakpoint list to reach last node */
        for (old_bp = hbdb->breakpoint; old_bp->next; old_bp = old_bp->next );

        /* TODO Try using increment operator */
        bp->id       = old_bp->id + 1;

        old_bp->next = bp;
        bp->prev     = old_bp;
    }

    /* Show breakpoint position */
    display_breakpoint(hbdb, bp);
}

/*

=item C<void hbdb_cmd_continue(PARROT_INTERP, const char *cmd)>

Continues running the program being debugged.

TODO Describe what a numeric argument does once it works

=cut

*/

void
hbdb_cmd_continue(PARROT_INTERP, ARGIN(const char *cmd))
{
    ASSERT_ARGS(hbdb_cmd_continue)

    unsigned long skip;
    hbdb_t       *hbdb;

    /* Get global structure */
    hbdb = interp->hbdb;

    /* Verify that the source file has already been loaded */
    if (!check_file_exists(interp)) {
        Parrot_io_eprintf(hbdb->debugger, "The program is not being run.\n");
        return;
    }

    /* TODO Come back here as soon as breakpoints start working */

    /* Get argument (if any) */
    skip = get_cmd_argument(&cmd, 0);

    /* Check if a "skip" argument was given */
    if (skip != 0) {
        if (!hbdb->breakpoint) {
            Parrot_io_printf(hbdb->debugger, "No breakpoints to skip\n");
            return;
        }

    /* TODO Ignore this breakpoint "skip" times */
    }

    continue_running(interp);
}

/*

=item C<void hbdb_cmd_help(PARROT_INTERP, const char *cmd)>

If C<cmd> is non-NULL, displays help message for C<cmd>. Otherwise, a general
help message is displayed.

=cut

*/

void
hbdb_cmd_help(PARROT_INTERP, ARGIN(const char *cmd))
{
    ASSERT_ARGS(hbdb_cmd_help)

    const hbdb_t     *hbdb;
    const hbdb_cmd_t *c;
    
    /* Get global structure */
    hbdb = interp->hbdb;

    /* Get command name */
    c = parse_command(&cmd);

    /* Verify that an actual command was passed */
    if (c)  {
        Parrot_io_printf(hbdb->debugger, "%s\n", c->help);
    }
    else {
        if (*cmd == '\0') {
            unsigned int i;

            Parrot_io_printf(hbdb->debugger, "List of commands:\n\n");

            /* Iterate through global command table */
            for (i = 0; i < (sizeof (command_table) / sizeof (hbdb_cmd_table_t)); i++) {
                const hbdb_cmd_table_t * const tbl = command_table + i;

                /* Display name and short message about each command */
                Parrot_io_printf(hbdb->debugger,
                                 "   %-12s  %s\n",
                                 tbl->name,
                                 tbl->cmd->short_help);
            }

            Parrot_io_printf(hbdb->debugger,
                             "\nType \"help\" followed by a command name for full documentation.\n");
            Parrot_io_printf(hbdb->debugger,
                             "Command name abbreviations are allowed if it's unambiguous.\n");
        }
        else {
            Parrot_io_eprintf(hbdb->debugger, "Undefined command: \"%s\". Try \"help\".\n", cmd);
        }
    }
}

/*

=item C<void hbdb_cmd_list(PARROT_INTERP, const char *cmd)>

Display lines from the source file being debugged.

=cut

*/

void
hbdb_cmd_list(PARROT_INTERP, ARGIN(const char *cmd))
{
    ASSERT_ARGS(hbdb_cmd_list)

    char          *ch;
    unsigned long start,
                  count,
                  i;

    hbdb_t      *hbdb;
    hbdb_line_t *line;

    /* Get global structure */
    hbdb = interp->hbdb;

    /* Verify that the source file has already been loaded */
    if (!check_file_exists(interp)) {
        Parrot_io_eprintf(hbdb->debugger, "No symbol table is loaded. Use the \"file\" command.\n");
        return;
    }

    /* Get the range of lines to display */
    hbdb->file->next_line = start = get_cmd_argument(&cmd, 1);
    count                         = get_cmd_argument(&cmd, 10);

    /* Return if the user entered a number that was too large */
    if (count == ULONG_MAX || hbdb->file->next_line == ULONG_MAX) {
        Parrot_io_eprintf(hbdb->debugger, "Numerical result out of range.\n");
        return;
    }

    /* Iterate through source code until starting line is reached */
    for (i = 1, line = hbdb->file->line; (i < hbdb->file->next_line) && (line->next); i++)
        line = line->next;

    /* Check if requested line number is too large */
    if (i < start) {
        Parrot_io_eprintf(hbdb->debugger, "No line %d in file \"%s\".\n", start, hbdb->file);
        return;
    }

    /* Iterate through source code until end line is reached */
    for (i = 0; i < count; i++) {
        /* Display corresponding opcode (if any) */
        if (line->opcode)
            Parrot_io_printf(hbdb->debugger,
                             "(%-04d) ",
                             line->opcode - hbdb->debugee->code->base.data);

        /* Display line number */
        Parrot_io_printf(hbdb->debugger, "%-6ld", line->number);

        /* Display source code from line */
        for (ch = hbdb->file->source + line->offset; *ch != '\n'; ch++)
            Parrot_io_printf(hbdb->debugger, "%c", *ch);

        /* End code with a newline */
        Parrot_io_printf(hbdb->debugger, "\n");

        /* Get next line */
        line = line->next;

        /* Return if no more lines exist */
        if (!line) return;
    }
}

/*

=item C<void hbdb_cmd_quit(PARROT_INTERP, const char *cmd)>

Exits HBDB.

=cut

*/

void
hbdb_cmd_quit(PARROT_INTERP, ARGIN(const char *cmd))
{
    ASSERT_ARGS(hbdb_cmd_quit)

    hbdb_destroy(interp);

    /* FIXME With exit() quickfix, changing these flags actually isn't
     * necessary but I will leave it for now because it's supposed to work
     * without exit() but currently segfaults. See hbdb_runloop() +770 to see
     * why
     */

    /* Set status flags to indicate debugger isn't running and about to exit */
    HBDB_FLAG_SET(interp, HBDB_EXIT);
    HBDB_FLAG_CLEAR(interp, HBDB_RUNNING);

    exit(0);
}

/*

=item C<void hbdb_cmd_run(PARROT_INTERP, const char *cmd)>

Begins execution of the debugee process.

=cut

*/

void
hbdb_cmd_run(PARROT_INTERP, ARGIN(const char *cmd))
{
    ASSERT_ARGS(hbdb_cmd_run)

    continue_running(interp);
}

/*

=back

=head1 GENERAL FUNCTIONS

The following functions define some of the general behavior of the debugger.
Note that they all have the I<hbdb> prefix.

=over 4

=cut

*/

/*

=item C<void hbdb_destroy(PARROT_INTERP)>

Destroys the current instance of the debugger by freeing the memory allocated
for it's interpreter.

=cut

*/

void
hbdb_destroy(PARROT_INTERP)
{
    ASSERT_ARGS(hbdb_destroy)

    /* Get global structure */
    hbdb_t *hbdb = interp->hbdb;

    /* Free memory used for storing last command */
    mem_gc_free(interp, hbdb->last_command);
    interp->hbdb->last_command    = NULL;

    /* Free memory used for storing current command */
    mem_gc_free(interp, hbdb->current_command);
    interp->hbdb->current_command = NULL;

    /* Free memory used for source code */
    free_file(interp, hbdb->file);

    /* Free memory used for breakpoints list */
    mem_gc_free(interp, hbdb->breakpoint);
    interp->hbdb->breakpoint      = NULL;

    /* Free memory used for global structure */
    mem_gc_free(interp, hbdb);
    interp->hbdb                  = NULL;
}

/*

=item C<void hbdb_get_command(PARROT_INTERP)>

Prompts the user to enter a command.

The command entered is stored in C<< interp->hbdb->current_command >>. The
previous command is stored in C<< interp->hbdb->last_command >>.

It also prints the next line that will be executed.

=cut

*/

void
hbdb_get_command(PARROT_INTERP)
{
    ASSERT_ARGS(hbdb_get_command)

    char   *cmd;
    hbdb_t *hbdb;

    STRING *input;

    PMC    *stdinput;
    STRING *readline;
    STRING *prompt;

    /* Get global structure */
    hbdb = interp->hbdb;

    /* Flush stdout buffer */
    fflush(stdout);

    /* Update last command */
    if (hbdb->current_command != '\0')
        strcpy(hbdb->last_command, hbdb->current_command);

    /* Create FileHandle PMC for stdin */
    stdinput = Parrot_io_stdhandle(interp, STDIN_FILENO, NULL);

    /* Create string constants */
    readline = Parrot_str_new_constant(interp, "readline_interactive");
    prompt   = Parrot_str_new_constant(interp, "(hbdb) ");

    /* Invoke readline_interactive() */
    Parrot_pcc_invoke_method_from_c_args(interp, stdinput, readline, "S->S", prompt, &input);

    /* Store command */
    hbdb->current_command = Parrot_str_to_cstring(interp, input);
}

/*

=item C<void hbdb_init(PARROT_INTERP)>

Performs general initialization operations.

=cut

*/

void
hbdb_init(PARROT_INTERP)
{
    ASSERT_ARGS(hbdb_init)

    /* Check that debugger is not already initialized */
    if (!interp->hbdb) {
        hbdb_t        *hbdb;
        Parrot_Interp  debugger;

        /* Allocate memory for debugger  */
        hbdb = mem_gc_allocate_zeroed_typed(interp, hbdb_t);

        /* Create debugger interpreter */
        debugger = Parrot_new(interp);

        /* Assign global "hbdb_t" structures */
        interp->hbdb   = hbdb;
        debugger->hbdb = hbdb;

        /* Assign debugee and debugger interpreters */
        hbdb->debugee  = interp;
        hbdb->debugger = debugger;

        /* Allocate memory for command-line buffers, NULL terminated c strings */
        hbdb->current_command  = mem_gc_allocate_n_typed(interp, HBDB_CMD_BUFFER_LENGTH + 1, char);
        hbdb->last_command     = mem_gc_allocate_n_typed(interp, HBDB_CMD_BUFFER_LENGTH + 1, char);
        hbdb->file             = mem_gc_allocate_zeroed_typed(interp, hbdb_file_t);
    }

    /* Set HBDB_RUNNING and HBDB_ENTERED status flags */
    HBDB_FLAG_SET(interp, HBDB_RUNNING);
    HBDB_FLAG_SET(interp, HBDB_ENTERED);
}

/*

=item C<void hbdb_load_source(PARROT_INTERP, const char *file)>

Loads source file into memory.

=cut

*/

void
hbdb_load_source(PARROT_INTERP, ARGIN(const char *file))
{
    ASSERT_ARGS(hbdb_load_source)

    int       line;
    int       i, j, ch;
    size_t    buf_size;
    ptrdiff_t start_offset;
    FILE     *fd;

    hbdb_t      *hbdb;
    hbdb_file_t *dbg_file;
    hbdb_line_t *dbg_line,
                *prev_dbg_line;

    /* Get global structure */
    hbdb = interp->hbdb;

    /* Set default values for 'line' and 'prev-dbg_line' */
    line          = 0;
    prev_dbg_line = NULL;

    /* Free previous source file (if any) */
    if (hbdb->file) {
        free_file(hbdb->debugee, hbdb->debugee->hbdb->file);
        hbdb->debugee->hbdb->file = NULL;
    }

    /* Open file for reading */
    if (!(fd = fopen(file, "r"))) {
        Parrot_io_eprintf(hbdb->debugger, "%s: No such file or directory.\n", file);

        return;
    }

    /* Allocate memory for source code buffer */
    dbg_file         = mem_gc_allocate_zeroed_typed(interp, hbdb_file_t);
    dbg_file->source = mem_gc_allocate_n_typed(interp, HBDB_SOURCE_BUFFER_LENGTH, char);
    buf_size         = HBDB_SOURCE_BUFFER_LENGTH;

    /* Load source code */
    do {
        /* Iterate through characters until a newline is reached */
        start_offset = dbg_file->size;

        do {
            /* Read a character from source file, stop of EOF was found */
            if ((ch = fgetc(fd)) == EOF)
                break;

            /* Store character */
            dbg_file->source[dbg_file->size] = (char) ch;

            /* Extend buffer size if it's full */
            if (++dbg_file->size >= buf_size) {
                buf_size         += HBDB_SOURCE_BUFFER_LENGTH;
                dbg_file->source  = mem_gc_realloc_n_typed(interp,
                                                           dbg_file->source,
                                                           buf_size,
                                                           char);
            }
        } while (ch != '\n');

        /* Stop if the file is empty */
        if (ch == EOF && (dbg_file->size == 0 || dbg_file->source[dbg_file->size - 1] == '\n'))
            break;

        /* Append a newline to end of file */
        if (ch == EOF)
            dbg_file->source[dbg_file->size++] = '\n';

        /* Allocate memory for 'hbdb_line_t' structure */
        dbg_line = mem_gc_allocate_zeroed_typed(interp, hbdb_line_t);

        /* Store info about current line */
        dbg_line->offset = start_offset;
        dbg_line->number = ++line;

        /* Add line to list */
        if (prev_dbg_line)
            prev_dbg_line->next = dbg_line;
        else
            dbg_file->line      = dbg_line;

        /* Set previous line of next iteration to current line of current iteration */
        prev_dbg_line           = dbg_line;
    } while (ch != EOF);

    /* Close file descripter */
    fclose(fd);

    /* Globally set file structure */
    hbdb->file = dbg_file;

    /* Set flag to indicate that source file has been loaded */
    HBDB_FLAG_SET(interp, HBDB_SRC_LOADED);
}

/*

=item C<void hbdb_runloop(PARROT_INTERP, int argc, const char *argv[])>

Begins the main runloop by executing the debugee's source code.

=cut

*/

void
hbdb_runloop(PARROT_INTERP, int argc, ARGIN(const char *argv[]))
{
    ASSERT_ARGS(hbdb_runloop)

    /* Main loop */
    do {
        Parrot_runcode(interp, argc, argv);

        HBDB_FLAG_SET(interp, HBDB_STOPPED);
    } while (!(HBDB_FLAG_TEST(interp, HBDB_EXIT)));
}

/* TODO Does hbdb_start() need pc arg? interp->hbdb->current_opcode instead? */

/*

=item C<void hbdb_start(PARROT_INTERP, opcode_t *pc)>

Starts the "active" process of accepting commands and executing code.

=cut

*/

void
hbdb_start(PARROT_INTERP, ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(hbdb_start)

    /* Get global structure */
    hbdb_t *hbdb = interp->hbdb;

    /* Check that HBDB has been initialized properly */
    if(!hbdb)
        Parrot_ex_throw_from_c_args(interp,
                                    NULL,
                                    0,
                                    "FATAL ERROR: The debugger has not been initialized!");

    /* Make sure the HBDB_ENTERED flag is not set */
    if (HBDB_FLAG_TEST(interp, HBDB_ENTERED)) {
        HBDB_FLAG_CLEAR(interp, HBDB_ENTERED);
    }

    /* Get the current opcode */
    hbdb->current_opcode = pc;

    /* Set HBDB_STOPPED flag */
    HBDB_FLAG_SET(interp, HBDB_STOPPED);

    /* Start command-line interface */
    command_line(interp);

    /* Check if HBDB_EXIT has been set */
    if (HBDB_FLAG_TEST(interp, HBDB_EXIT)) {
        Parrot_x_exit(interp, 0);
    }
}

/*

=back

=head2 STATIC FUNCTIONS

The remaining functions are all static. As such, they will not appear
anywhere outisde this file. They are identified by their lack of the
I<hbdb> prefix.

=over 4

=cut

*/

/*

=item C<static unsigned int check_file_exists(PARROT_INTERP)>

Checks if a file has been loaded into memory. Returns 1 if it has and 0 if it
hasn't.

=cut

*/

PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
static unsigned int
check_file_exists(PARROT_INTERP)
{
    ASSERT_ARGS(check_file_exists)

    hbdb_t *hbdb = interp->hbdb;

    if (!(hbdb->file && hbdb->file->line)) {
        return 0;
    }
    else {
        return 1;
    }
}

/*

=item C<static void command_line(PARROT_INTERP)>

Begins the command-line interface. Fetches and executes commands in a
continuous loop.

=cut

*/

static void
command_line(PARROT_INTERP)
{
    ASSERT_ARGS(command_line)

    /* Get global structure */
    hbdb_t *hbdb = interp->hbdb;

    while (HBDB_FLAG_TEST(interp, HBDB_STOPPED)) {
        const char *cmd;

        /* Prompt user for command */
        hbdb_get_command(interp);

        /* Get command set by hbdb_get_command() */
        cmd = hbdb->current_command;

        if (cmd == '\0')
            cmd = hbdb->last_command;

        /* Execute command */
        run_command(interp, cmd);
    }
}

/*

=item C<static void continue_running(PARROT_INTERP)>

Manipulates a few status flags to indicate that the debugger should continue
running. Its usefulness it mainly limited to the C<run> and C<continue>
commands.

=cut

*/

static void
continue_running(PARROT_INTERP)
{
    ASSERT_ARGS(continue_running)

    /* Change status flags to indicate that debugger is running, not stopped */
    HBDB_FLAG_SET(interp, HBDB_RUNNING);
    HBDB_FLAG_CLEAR(interp, HBDB_STOPPED);

    /* Clear status flag to indicate the debugger shouldn't break */
    HBDB_FLAG_CLEAR(interp, HBDB_BREAK);
}

/*

=item C<static void display_breakpoint(hbdb_t *hbdb, hbdb_breakpoint_t *bp)>

Displays information about the breakpoint pointed to by C<bp> including its ID,
address, and line number. If the breakpoint is disabled, that will be displayed
as well. Note that not all of the later information will be displayed if it is
unknown at that time.

=cut

*/

static void
display_breakpoint(ARGIN(hbdb_t *hbdb), ARGIN(hbdb_breakpoint_t *bp)) {
    ASSERT_ARGS(display_breakpoint)

    Parrot_io_printf(hbdb->debugger,
                      "Breakpoint %d at %04d: ",
                      bp->id,
                      bp->pc - hbdb->debugee->code->base.data);

    if (hbdb->file)
        Parrot_io_printf(hbdb->debugger, "file %s", hbdb->file);

    if (bp->line)
        Parrot_io_printf(hbdb->debugger, ", line %d", bp->line);

    if (bp->skip < 0)
        Parrot_io_printf(hbdb->debugger, "  (DISABLED)");

    Parrot_io_printf(hbdb->debugger, "\n");
}

/*

=item C<static void free_file(PARROT_INTERP, hbdb_file_t *file)>

Frees the memory allocated for the debugee's source file.

=cut

*/

static void
free_file(PARROT_INTERP, ARGIN(hbdb_file_t *file))
{
    ASSERT_ARGS(free_file)

    hbdb_line_t  *line;
    hbdb_label_t *label;

    /* Get first line in source file */
    line = file->line;

    /* Loop through list of lines */
    while (line) {
        /* Set pointer to next line */
        hbdb_line_t *next_line = line->next;

        /* Free memory for current line */
        mem_gc_free(interp, line);

        /* Get next line */
        line = next_line;
    }

    /* Get first label in source file */
    label = file->label;

    /* Loop through list of labels */
    while (label) {
        /* Set pointer to next label */
        hbdb_label_t *next_label = label->next;

        /* Free memory for current label */
        mem_gc_free(interp, label);

        /* Get next label */
        label = next_label;
    }

    /* Free memory allocated for storing filename */
    if (file->filename)
        mem_gc_free(interp, file->filename);

    /* Free memory allocated for storing rest of source code */
    if (file->source)
        mem_gc_free(interp, file->source);

    /* Free memory for current file */
    mem_gc_free(interp, file);
}

/*

=item C<static unsigned long get_cmd_argument(const char **cmd, unsigned long
def_val)>

Returns the argument given to the command in C<cmd> as an <unsigned long>
value. If no arguments were given, the value in C<def_val> is returned instead.

If the argument given is too large to fit into an C<unsigned long> - that is,
the value is larger than C<ULONG_MAX> - then C<ULONG_MAX> is returned. It is
a good idea to check the return value for this situation when calling
C<get_cmd_argument()>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static unsigned long
get_cmd_argument(ARGMOD(const char **cmd), unsigned long def_val)
{
    ASSERT_ARGS(get_cmd_argument)

    char         *next;
    unsigned long result;

    /* Set errno to 0 since strtoul() can legitimately return 0 or ULONG_MAX */
    errno  = 0;

    /* Convert argument from a string to unsigned long integer */
    result = strtoul(*cmd, &next, 0);

    /* Check for possible errors */
    if ((errno == ERANGE && result == ULONG_MAX) || (errno != 0 && result == 0)) {
        return ULONG_MAX;
    }

    /* Check if a digit was found, otherwise use 'def_val' */
    if (next != *cmd)
        *cmd   = next;
    else
        result = def_val;

    return result;
}

/*

=item C<static const hbdb_cmd_t * parse_command(const char **cmd)>

Parses the command in C<cmd>. If it contains a valid command, a pointer to its
respective C<hbdb_cmd_t> structure is returned. Otherwise, it returns NULL.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const hbdb_cmd_t *
parse_command(ARGIN_NULLOK(const char **cmd))
{
    ASSERT_ARGS(parse_command)

    /* Check that "cmd" points to something */
    if (cmd && *cmd) {
        const char  *start;
        const char  *next;
        char         c;
        int          found = -1;
        unsigned int hits  =  0,
                     len,
                     i;

        /* Skip whitespace */
        start = skip_whitespace(*cmd);
        next  = start;

        *cmd  = start;

        /* Get command name */
        for (i = 0; (c = *next) != '\0' && !isspace((unsigned char) c); next++)
            continue;

        /* Find the length */
        len = next - start;

        /* Return NULL if there is no command */
        if (len == 0)
            return NULL;

        /* Iterate through global command table */
        for (i = 0; i < (sizeof (command_table) / sizeof (hbdb_cmd_table_t)); i++) {
            const hbdb_cmd_table_t * const tbl = command_table + i;

            /* Check if user entered command's abbreviation */
            if ((len == 1) && (tbl->short_name == *cmd)) {
                hits  = 1;
                found = i;
                break;
            }

            /* Check if input matches current entry */
            if (strncmp(*cmd, tbl->name, len) == 0) {
                /* Check that input matches length of command's name */
                if (strlen(tbl->name) == len) {
                    hits  = 1;
                    found = i;
                    break;
                }
                else {
                    hits++;
                    found = i;
                }
            }
        }

        /* Check if a match was found */
        if (hits == 1) {
            *cmd = skip_whitespace(next);

            return (const hbdb_cmd_t *) command_table[found].cmd;
        }
    }

    return NULL;
}

/*

=item C<static int run_command(PARROT_INTERP, const char *cmd)>

Executes the command in C<cmd> by calling it's associated C<hbdb_cmd_*>
function.

=cut

*/

PARROT_IGNORABLE_RESULT
static int
run_command(PARROT_INTERP, ARGIN(const char *cmd))
{
    ASSERT_ARGS(run_command)

    const char       *orig_cmd;

    hbdb_t           *hbdb;
    const hbdb_cmd_t *c;

    /* Get global structure */
    hbdb = interp->hbdb;

    /* Preseve original command in case of error */
    orig_cmd = cmd;

    /* Get command's hbdb_cmd_t structure */
    c = parse_command(&orig_cmd);

    /* Check if a match was found */
    if (c) {
        /* Call command's function */
        (*c->function)(interp, orig_cmd);
        return 0;
    }
    else {
        /* Check if nothing was entered at all */
        if (*orig_cmd == '\0') {
            return 0;
        }
        else {
            Parrot_io_eprintf(hbdb->debugger, "Undefined command: \"%s\". Try \"help\".\n", cmd);
            /* TODO Error message if script file */
            return 1;
        }
    }
}

/*

=item C<static const char * skip_whitespace(const char *cmd)>

Returns a pointer to the first non-whitespace character in C<cmd>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
static const char *
skip_whitespace(ARGIN(const char *cmd))
{
    ASSERT_ARGS(skip_whitespace)

    while (*cmd && isspace(*cmd))
        cmd++;

    return cmd;
}

/*

=back

=head1 SEE ALSO

F<frontend/hbdb/main.c>, F<src/embed/hbdb.c>, F<include/parrot/hbdb.h>

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

