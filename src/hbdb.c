/*
Copyright (C) 2001-2011, Parrot Foundation.

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
/* TODO Take it easy on the comments, remove some of the blatantly obvious ones */

#include <stdio.h>
#include <ctype.h>

#include "parrot/parrot.h"
#include "parrot/hbdb.h"
#include "parrot/embed.h"
#include "parrot/string_funcs.h"
#include "parrot/sub.h"
#include "parrot/oplib.h"
#include "parrot/oplib/ops.h"
#include "parrot/oplib/core_ops.h"
#include "parrot/pobj.h"

#include "pmc/pmc_callcontext.h"
#include "pmc/pmc_continuation.h"
#include "pmc/pmc_parrotinterpreter.h"

/* HEADERIZER HFILE: include/parrot/hbdb.h */

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

PARROT_WARN_UNUSED_RESULT
static size_t disassemble_op(PARROT_INTERP,
    ARGOUT(char *dest),
    size_t space,
    ARGIN(op_info_t *info),
    ARGIN(opcode_t *op),
    ARGMOD_NULLOK(hbdb_file_t *file),
    ARGIN_NULLOK(opcode_t *code_start),
    unsigned int full_name)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*dest)
        FUNC_MODIFIES(*file);

static void display_breakpoint(
    ARGIN(hbdb_t *hbdb),
    ARGIN(hbdb_breakpoint_t *bp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
static char * escape_char(PARROT_INTERP,
    ARGIN(char *string),
    UINTVAL length)
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

static void welcome(void);
#define ASSERT_ARGS_check_file_exists __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_command_line __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_continue_running __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_disassemble_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(info) \
    , PARROT_ASSERT_ARG(op))
#define ASSERT_ARGS_display_breakpoint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(hbdb) \
    , PARROT_ASSERT_ARG(bp))
#define ASSERT_ARGS_escape_char __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(string))
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
#define ASSERT_ARGS_welcome __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* Define a 'hbdb_cmd_t' structure for each command */
hbdb_cmd_t
   cmd_backtrace  = { &hbdb_cmd_backtrace,

                      "Print backtrace of current continuation chain.",

                      "Print backtrace of current continuation chain." },

   cmd_break      = { &hbdb_cmd_break,

                      "Sets a breakpoint at the specified location.",

                      "Sets a breakpoint at the specified location.\n\n"
                      "break LOCATION\n\n"
                      "If LOCATION is an address, breaks at the exact address." },

   cmd_continue   = { &hbdb_cmd_continue,

                      "Continue program being debugged after a breakpoint.",

                      "Continue program being debugged after a breakpoint.\n\n"
                      "A number N may be used as an argument, which means to set the ignore"
                      "count of that breakpoint to N - 1 (so that the breakpoint won't"
                      "break until the Nth time is reached)." },

   cmd_disassemble = { &hbdb_cmd_disassemble,

                       "Disassembles the bytecode generated by the file being debugged",

                       "Disassembles the bytecode generated by the file being debugged" },

   cmd_help        = { &hbdb_cmd_help,

                       "Displays a summary help message.",

                       "Displays a summary help message." },

   cmd_list        = { &hbdb_cmd_list,

                       "Lists specified line(s).",

                       "Lists specified line(s).\n\n"
                       "With no argument, lists 10 lines.\n"
                       "One argument specifies a line, and ten lines are listed around that line.\n"
                       "Two arguments with comma between specify starting and ending lines "
                       "to list." },

   cmd_quit        = { &hbdb_cmd_quit,

                       "Exits HBDB.",

                       "Exits HBDB." },

   cmd_run         = { &hbdb_cmd_run,

                       "Start debugged program. You may specify arguments to give it.",

                       "Start debugged program. You may specify arguments to give it." },

   cmd_step        = { &hbdb_cmd_step,

                       "Step program until it reaches a different source line.",

                       "Step program until it reaches a different source line.\n\n"
                       "Argument N means do this N times (or till program stops for "
                       "another reason." },

   cmd_nop         = { &hbdb_cmd_nop,

                       "",

                       "" };

/* Global command table */
hbdb_cmd_table_t command_table[] = {
    { "backtrace",   "t", &cmd_backtrace   },
    { "break",       "b", &cmd_break       },
    { "continue",    "c", &cmd_continue    },
    { "disassemble", "d", &cmd_disassemble },
    { "help",        "h", &cmd_help        },
    { "list",        "l", &cmd_list        },
    { "quit",        "q", &cmd_quit        },
    { "run",         "r", &cmd_run         },
    { "step",        "s", &cmd_step        },
    { "nop",         "",  &cmd_nop         }
};

/*

=item C<void hbdb_cmd_backtrace(PARROT_INTERP, const char *cmd)>

Displays a backtrace of the current continuation chain.

=cut

*/

void
hbdb_cmd_backtrace(PARROT_INTERP, ARGIN(const char *cmd))
{
    ASSERT_ARGS(hbdb_cmd_backtrace)

    int     rec_cnt = 0,
            rec_lvl = 0;

    STRING *infostr;
    PMC    *ctx,
           *old,
           *output,
           *sub;

    ctx    = interpinfo_p(interp, CURRENT_CTX);
    sub    = interpinfo_p(interp, CURRENT_SUB);

    old    = PMCNULL;
    output = Parrot_pmc_new(interp, enum_class_StringBuilder);

    /* Get context information about current subroutine first */
    if (!PMC_IS_NULL(sub)) {
        if ((infostr = Parrot_sub_Context_infostr(interp, ctx))) {
            VTABLE_push_string(interp, output, infostr);

            /* Get hash representation of annotations in effect (if any) */
            if (interp->code->annotations) {
                opcode_t offset = Parrot_pcc_get_pc(interp, ctx) - interp->code->base.data + 1;
                PMC     *annot  = PackFile_Annotations_lookup(interp,
                                                              interp->code->annotations,
                                                              offset,
                                                              NULL);

                /* Get 'file' and 'line' annotations */
                if (!PMC_IS_NULL(annot)) {
                    PMC *file_annot = VTABLE_get_pmc_keyed_str(interp,
                                                               annot,
                                                               Parrot_str_new_constant(interp,
                                                                                       "file"));
                    PMC *line_annot = VTABLE_get_pmc_keyed_str(interp,
                                                               annot,
                                                               Parrot_str_new_constant(interp,
                                                                                       "line"));

                    /* Add format string for 'file' and 'line' annotations to output */
                    if (!(PMC_IS_NULL(file_annot) || PMC_IS_NULL(line_annot))) {
                        INTVAL  line = VTABLE_get_integer(interp, line_annot);
                        STRING *file = VTABLE_get_string(interp,  file_annot);
                        STRING *fmt  = Parrot_sprintf_c(interp,   " (%Ss:%li)", file, (long) line);

                        VTABLE_push_string(interp, output, fmt);
                    }
                }
            }

            VTABLE_push_string(interp, output, Parrot_str_new_constant(interp, "\n"));
        }
    }

    /* Loop through the continuation chain */
    while (1) {
        Parrot_Continuation_attributes *ctx_attr;

        if (++rec_cnt > RECURSION_LIMIT)
            break;

        /* Get return continuation */
        sub = Parrot_pcc_get_continuation(interp, ctx);

        if (PMC_IS_NULL(sub))
            break;

        if (!(ctx_attr = PARROT_CONTINUATION(sub)))
            break;

        /* Format caller's context information to display */
        if (!(infostr = Parrot_sub_Context_infostr(interp, Parrot_pcc_get_caller_ctx(interp, ctx))))
            break;

        /* Check if current subroutine is recursive */
        if (ctx == ctx_attr->to_ctx) {
            rec_lvl++;
        }
        else if (!PMC_IS_NULL(old)
                 && PARROT_CONTINUATION(old)
                 && Parrot_pcc_get_pc(interp,      PARROT_CONTINUATION(old)->to_ctx)
                     == Parrot_pcc_get_pc(interp,  PARROT_CONTINUATION(sub)->to_ctx)
                 && Parrot_pcc_get_sub(interp,     PARROT_CONTINUATION(old)->to_ctx)
                     == Parrot_pcc_get_sub(interp, PARROT_CONTINUATION(sub)->to_ctx)) {

                rec_lvl++;
        }
        else if (rec_lvl != 0) {
            STRING *fmt = Parrot_sprintf_c(interp, "... call repeated %d times\n", rec_lvl);

            VTABLE_push_string(interp, output, fmt);
            rec_lvl = 0;
        }

        if (rec_lvl == 0) {
            PackFile_ByteCode *seg = ctx_attr->seg;

            VTABLE_push_string(interp, output, infostr);

            /* Get hash representation of annotations in effect (if any) */
            if (seg->annotations) {
                opcode_t offset = Parrot_pcc_get_pc(interp, ctx_attr->to_ctx) - seg->base.data;
                PMC     *annot  = PackFile_Annotations_lookup(interp,
                                                              seg->annotations,
                                                              offset,
                                                              NULL);

                if (!PMC_IS_NULL(annot)) {
                    PMC *file_annot = VTABLE_get_pmc_keyed_str(interp,
                                                               annot,
                                                               Parrot_str_new_constant(interp,
                                                                                       "file"));
                    PMC *line_annot = VTABLE_get_pmc_keyed_str(interp,
                                                               annot,
                                                               Parrot_str_new_constant(interp,
                                                                                       "line"));

                    /* Get 'file' and 'line' annotations */
                    if (!(PMC_IS_NULL(file_annot) || PMC_IS_NULL(line_annot))) {
                        INTVAL  line = VTABLE_get_integer(interp, line_annot);
                        STRING *file = VTABLE_get_string(interp,  file_annot);
                        STRING *fmt  = Parrot_sprintf_c(interp,   " (%Ss:%li)", file, (long) line);

                        VTABLE_push_string(interp, output, fmt);
                    }
                }
            }

            VTABLE_push_string(interp, output, Parrot_str_new_constant(interp, "\n"));
        }

        old = sub;

        /* Get previous caller in chain and repeat */
        if (!(ctx = Parrot_pcc_get_caller_ctx(interp, ctx)))
            break;
    }

    /* Don't display recursive calls, display level of recursion instead */
    if (rec_lvl != 0) {
        STRING *fmt = Parrot_sprintf_c(interp, "... call repeated %d times\n", rec_lvl);

        VTABLE_push_string(interp, output, fmt);
    }

    Parrot_io_printf(interp->hbdb->debugger, "%Ss", VTABLE_get_string(interp, output));
}

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

    hbdb = interp->hbdb;

    if (!cmd)
        /* TODO Use an appropriate exception_type_enum */
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "Null value passed to hbdb_cmd_break()");

    /* Allocate memory for breakpoint */
    bp = mem_gc_allocate_zeroed_typed(interp, hbdb_breakpoint_t);

    /* Break at line number if debugging file, otherwise at program counter */
    if (hbdb->file && hbdb->file->size) {
        /* Do nothing thanks to IMCC */
    }
    else {
        /*pos = (opcode_t) interp->code->base.data;*/
    }

    /* TODO Logic for parsing conditionals goes here */

    {
        long pos;
        pos = get_cmd_argument(&cmd, 0);

        bp->pc = pos;
        /*bp->line = line->number;*/
    }

    bp->skip = 0;

    /* Check if this is the first breakpoint being added */
    if (!hbdb->breakpoint) {
        bp->id           = 1;
        hbdb->breakpoint = bp;
    }
    else {
        hbdb_breakpoint_t *old_bp;

        /* Iterate through breakpoint list to reach last node */
        for (old_bp = hbdb->breakpoint; old_bp->next; old_bp = old_bp->next);

        /* TODO Try using increment operator */
        bp->id       = old_bp->id + 1;

        old_bp->next = bp;
        bp->prev     = old_bp;
    }

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

    hbdb = interp->hbdb;

    if (!check_file_exists(interp)) {
        Parrot_io_eprintf(hbdb->debugger, "The program is not being run.\n");
        return;
    }

    /* TODO Come back here as soon as breakpoints start working */

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

=item C<void hbdb_cmd_disassemble(PARROT_INTERP, const char *cmd)>

Disassembles bytecode.

=cut

*/

void
hbdb_cmd_disassemble(PARROT_INTERP, ARGIN_NULLOK(SHIM(const char *cmd)))
{
    ASSERT_ARGS(hbdb_cmd_disassemble)

    size_t       space,
                 allocated,
                 n;

    hbdb_t       *hbdb;
    hbdb_file_t  *file;
    hbdb_label_t *label;
    hbdb_line_t  *line;

    opcode_t     *pc,
                 *code_end;

    const unsigned int default_size = 32768;

    hbdb = interp->hbdb;

    /* Free previous source file (if any) */
    if (hbdb->file) {
        free_file(interp, hbdb->file);
        hbdb->file = NULL;
    }

    /* Get program counter */
    pc   = interp->code->base.data;

    /* Allocate memory for source file and lines */
    file              = mem_gc_allocate_zeroed_typed(interp, hbdb_file_t);
    file->line = line = mem_gc_allocate_zeroed_typed(interp, hbdb_line_t);
    file->source      = mem_gc_allocate_n_typed(interp, default_size, char);

    /* Set first line number */
    line->number  = 1;

    allocated = space = default_size;
    code_end  = pc    + interp->code->base.size;

    /* Loop through bytecode */
    while (pc != code_end) {
        size_t size;

        /* Grow it early */
        if (space < default_size) {
            allocated   += default_size;
            space       += default_size;
            file->source = mem_gc_realloc_n_typed(interp, file->source, allocated, char);
        }

        size = disassemble_op(interp,
                              file->source + file->size,
                              space,
                              interp->code->op_info_table[*pc],
                              pc,
                              file,
                              NULL,
                              1);

        space       -= size;
        file->size += size;
        file->source[file->size - 1] = '\n';

        /* Store the opcode of this line */
        line->opcode = pc;
        n             = interp->code->op_info_table[*pc]->op_count;

        ADD_OP_VAR_PART(interp, interp->code, pc, n);
        pc += n;

        /* Prepare for next line unless there will be no next line. */
        if (pc < code_end) {
            hbdb_line_t *newline = mem_gc_allocate_zeroed_typed(interp, hbdb_line_t);

            newline->label  = NULL;
            newline->next   = NULL;
            newline->number = line->number + 1;
            line->next      = newline;
            line            = newline;
            line->offset    = file->size;
        }
    }

    /* Add labels to the lines they belong to */
    label = file->label;

    /* Loop through list of labels */
    while (label) {
        /* Get the line to apply the label */
        line = file->line;

        while (line && line->opcode != label->opcode)
            line = line->next;

        if (!line) {
            Parrot_io_eprintf(hbdb->debugger,
                        "Label number %li out of bounds.\n", label->id);

            free_file(interp, file);
            return;
        }

        line->label = label;

        label        = label->next;
    }

    HBDB_FLAG_SET(interp, HBDB_SRC_LOADED);
    hbdb->file   = file;

    HBDB_FLAG_SET(interp, HBDB_STOPPED);
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

    hbdb = interp->hbdb;

    c    = parse_command(&cmd);

    /* Display help for one command if there's one argument, otherwise display all */
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

            /* FIXME Is there a better way not to print "nop" command? */
            if (strcmp(tbl->name, "nop") != 0)
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

    HBDB_FLAG_SET(interp, HBDB_STOPPED);
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

    const char   *comma;
    char         *ch;
    unsigned long start,
                  count,
                  i;

    hbdb_t      *hbdb;
    hbdb_line_t *line;

    hbdb  = interp->hbdb;
    count = 10;

    if (!check_file_exists(interp)) {
        Parrot_io_eprintf(hbdb->debugger, "No symbol table is loaded. Use the \"file\" command.\n");
        return;
    }

    if ((comma = strchr(cmd, ','))) {
        unsigned long stop;
        comma += 1;

        hbdb->file->next_line = start = get_cmd_argument(&cmd,   1);
        stop                          = get_cmd_argument(&comma, 10);

        if (start == ULONG_MAX || stop == ULONG_MAX) {
            Parrot_io_eprintf(hbdb->debugger,
                              "Line number %lu out of range; %s has %lu lines.\n",
                              ULONG_MAX, hbdb->file->filename, hbdb->file->total_lines);
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

        for (i = 0; i <= (stop - start); i++) {
            /* Display corresponding opcode (if any) */
            if (line->opcode)
                Parrot_io_printf(hbdb->debugger,
                                 "(%-04d) ",
                                 line->opcode - hbdb->debugee->code->base.data);

            Parrot_io_printf(hbdb->debugger, "%-6ld", line->number);

            /* Display source code from line */
            for (ch = hbdb->file->source + line->offset; *ch != '\n'; ch++)
                Parrot_io_printf(hbdb->debugger, "%c", *ch);

            Parrot_io_printf(hbdb->debugger, "\n");

            if (!(line = line->next))
                return;
        }
    }
    else {
        hbdb->file->next_line = get_cmd_argument(&cmd, 6);

        if (hbdb->file->next_line == ULONG_MAX) {
            Parrot_io_eprintf(hbdb->debugger,
                              "Line number %lu out of range; %s has %lu lines.\n",
                              ULONG_MAX, hbdb->file->filename, hbdb->file->total_lines);
            return;
        }

        if (hbdb->file->next_line > hbdb->file->total_lines) {
            Parrot_io_eprintf(hbdb->debugger,
                              "No line %d in file \"%s\".\n",
                              hbdb->file->next_line,
                              hbdb->file->filename);
            return;
        }

        hbdb->file->next_line -= 5;

        /* Iterate through source code until starting line is reached */
        for (i = 1, line = hbdb->file->line; (i < hbdb->file->next_line) && (line->next); i++)
            line = line->next;

        /* Iterate through source code until end line is reached */
        for (i = 0; i < count; i++) {
            /* Display corresponding opcode (if any) */
            if (line->opcode)
                Parrot_io_printf(hbdb->debugger,
                                 "(%-04d) ",
                                 line->opcode - hbdb->debugee->code->base.data);

            Parrot_io_printf(hbdb->debugger, "%-6ld", line->number);

            /* Display source code from line */
            for (ch = hbdb->file->source + line->offset; *ch != '\n'; ch++)
                Parrot_io_printf(hbdb->debugger, "%c", *ch);

            Parrot_io_printf(hbdb->debugger, "\n");

            if (!(line = line->next))
                return;
        }
    }

    HBDB_FLAG_SET(interp, HBDB_STOPPED);
}

/*

=item C<void hbdb_cmd_nop(PARROT_INTERP, const char *cmd)>

Unlike some of the other C<hbdb_cmd_*> functions, this is not a "nop" command.
This function effectively does nothing at all.

=cut

*/

void
hbdb_cmd_nop(PARROT_INTERP, ARGIN(const char *cmd))
{
    ASSERT_ARGS(hbdb_cmd_nop)

    /* Do nothing */

    HBDB_FLAG_SET(interp, HBDB_STOPPED);
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

    /* Set status flags to indicate debugger isn't running and is about to exit */
    HBDB_FLAG_SET(interp, HBDB_EXIT);
    HBDB_FLAG_CLEAR(interp, HBDB_RUNNING);
    HBDB_FLAG_CLEAR(interp, HBDB_STOPPED);
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

=item C<void hbdb_cmd_step(PARROT_INTERP, const char *cmd)>

Step program until it reaches the next source line.

=cut

*/

void
hbdb_cmd_step(PARROT_INTERP, ARGIN(const char *cmd))
{
    ASSERT_ARGS(hbdb_cmd_step)

    /* Clear status flag to indicate that debugger is stopped, only executing one instruction */
    HBDB_FLAG_SET(interp, HBDB_RUNNING);
    HBDB_FLAG_CLEAR(interp, HBDB_STOPPED);

    HBDB_FLAG_SET(interp, HBDB_STEP);
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

=item C<unsigned int hbdb_check_breakpoint(PARROT_INTERP)>

Checks if the the debugee process should halt because of a breakpoint set at
the current program counter. Returns 1 if execution should halt and returns 0
if execution should continue.

=cut

*/

PARROT_WARN_UNUSED_RESULT
unsigned int
hbdb_check_breakpoint(PARROT_INTERP)
{
    ASSERT_ARGS(hbdb_check_breakpoint)

    hbdb_t            *hbdb;
    hbdb_breakpoint_t *bp;

    hbdb = interp->hbdb;
    bp   = hbdb->breakpoint;

    /* TODO Come back here when implementing watchpoints */

    /* Check if the debugee has reached the end */
    if (hbdb->current_opcode < 0) {
        HBDB_FLAG_CLEAR(interp, HBDB_RUNNING);

        Parrot_io_printf(hbdb->debugger, "\nProgram exited normally.\n");
        return 1;
    }

    /* Clear status flag to indicate that debugger is not stopped and can continue */
    if (HBDB_FLAG_TEST(interp, HBDB_STOPPED)) {
        HBDB_FLAG_CLEAR(interp, HBDB_STOPPED);

        return 0;
    }

    if (HBDB_FLAG_TEST(interp, HBDB_STEP)) {
        HBDB_FLAG_CLEAR(interp, HBDB_STEP);

        return 1;
    }

    /* Cycle through list of breakpoints */
    while (bp) {
        /* Stop if a breakpoint is set at current opcode */
        if (hbdb->current_opcode == bp->pc)
            break;

        bp = bp->next;
    }

    if (bp) {
        /* Continue execution if user said to skip all breakpoints */
        if (hbdb->breakpoint_skip) {
            hbdb->breakpoint_skip--;
            return 0;
        }

        /* Continue execution if user said to skip this breakpoint */
        if (bp->skip == -1)
            return 0;

        /* Check for conditions associatied with this breakpoint */
        /*if ((bp->condition) && (!hbdb_check_condition(interp, bp->condition)))*/
            /*return 0;*/

        /* Re-enable status flag so execution enters command-line */
        HBDB_FLAG_SET(interp, HBDB_STOPPED);

        /* TODO Make output similar to GDB's when encountering breakpoints */

        display_breakpoint(hbdb, bp);

        return 1;
    }

    return 0;
}

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

    hbdb_t *hbdb = interp->hbdb;

    mem_gc_free(interp, hbdb->last_command);
    interp->hbdb->last_command    = NULL;

    mem_gc_free(interp, hbdb->current_command);
    interp->hbdb->current_command = NULL;

    free_file(interp, hbdb->file);

    mem_gc_free(interp, hbdb->breakpoint);
    interp->hbdb->breakpoint      = NULL;

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

    hbdb_t *hbdb;

    STRING *input;

    PMC    *stdinput;
    STRING *readline;
    STRING *prompt;

    hbdb = interp->hbdb;

    fflush(stdout);

    stdinput = Parrot_io_stdhandle(interp, STDIN_FILENO, NULL);

    readline = Parrot_str_new_constant(interp, "readline_interactive");
    prompt   = Parrot_str_new_constant(interp, "(hbdb) ");

    Parrot_pcc_invoke_method_from_c_args(interp, stdinput, readline, "S->S", prompt, &input);

    /* Check if nothing was entered, otherwise just store command */
    if (Parrot_str_byte_length(interp, input) == 0) {
        /* Check if this is the first time anything was entered */
        if (!HBDB_FLAG_TEST(interp, HBDB_CMD_ENTERED)) {
            size_t len = sizeof (hbdb->current_command);

            strncpy(hbdb->current_command, "nop", len);
        }
    }
    else
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

        hbdb = mem_gc_allocate_zeroed_typed(interp, hbdb_t);

        debugger = Parrot_new(interp);

        interp->hbdb   = hbdb;
        debugger->hbdb = hbdb;

        hbdb->debugee  = interp;
        hbdb->debugger = debugger;

        hbdb->current_command  = mem_gc_allocate_n_typed(interp, HBDB_CMD_BUFFER_LENGTH + 1, char);
        hbdb->last_command     = mem_gc_allocate_n_typed(interp, HBDB_CMD_BUFFER_LENGTH + 1, char);
        hbdb->file             = mem_gc_allocate_zeroed_typed(interp, hbdb_file_t);
    }

    /* Set status flags to indicate that debugger has started running */
    /*HBDB_FLAG_SET(interp, HBDB_RUNNING);*/
    HBDB_FLAG_SET(interp, HBDB_STARTED);
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

    int           i, j, ch;
    unsigned long line;
    size_t        buf_size;
    ptrdiff_t     offset;
    FILE         *fd;

    hbdb_t      *hbdb;
    hbdb_file_t *dbg_file;
    hbdb_line_t *dbg_line,
                *prev_dbg_line;

    hbdb = interp->hbdb;

    line          = 0;
    prev_dbg_line = NULL;

    /* Free previous source file (if any) */
    if (hbdb->file) {
        free_file(hbdb->debugee, hbdb->debugee->hbdb->file);
        hbdb->debugee->hbdb->file = NULL;
    }

    if (!(fd = fopen(file, "r"))) {
        Parrot_io_eprintf(hbdb->debugger, "%s: No such file or directory.\n", file);

        return;
    }

    dbg_file           = mem_gc_allocate_zeroed_typed(interp, hbdb_file_t);
    dbg_file->source   = mem_gc_allocate_n_typed(interp, HBDB_SOURCE_BUFFER_LENGTH, char);
    dbg_file->filename = mem_gc_allocate_n_typed(interp, sizeof (file), char);
    buf_size           = HBDB_SOURCE_BUFFER_LENGTH;

    dbg_file->filename = file;

    /* Load source code */
    do {
        /* Iterate through characters until a newline is reached */
        offset = dbg_file->size;

        do {
            if ((ch = fgetc(fd)) == EOF)
                break;

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

        if (ch == EOF)
            dbg_file->source[dbg_file->size++] = '\n';

        dbg_line = mem_gc_allocate_zeroed_typed(interp, hbdb_line_t);

        dbg_line->offset = offset;
        dbg_line->number = ++line;

        /* Add line to list */
        if (prev_dbg_line)
            prev_dbg_line->next = dbg_line;
        else
            dbg_file->line      = dbg_line;

        prev_dbg_line           = dbg_line;
    } while (ch != EOF);

    fclose(fd);

    hbdb->file              = dbg_file;
    hbdb->file->total_lines = line;

    /* Set status flag to indicate that source file has been loaded */
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

    welcome();

    /* Main loop */
    do {
        /* Enter runcore if source file has been loaded, otherwise start command-line directly */
        if (HBDB_FLAG_TEST(interp, HBDB_SRC_LOADED))
            Parrot_runcode(interp, argc, argv);
        else
            command_line(interp);

        /* Set status flag to indicate that debugger has stopped/paused */
        if (!HBDB_FLAG_TEST(interp, HBDB_RUNNING))
            HBDB_FLAG_SET(interp, HBDB_STOPPED);
    } while (!(HBDB_FLAG_TEST(interp, HBDB_EXIT)));
}

/* TODO Does hbdb_start() need pc arg? interp->hbdb->current_opcode instead? */

/*

=item C<void hbdb_start(PARROT_INTERP)>

Starts the "active" process of accepting commands and executing code.

=cut

*/

void
hbdb_start(PARROT_INTERP)
{
    ASSERT_ARGS(hbdb_start)

    hbdb_t *hbdb = interp->hbdb;

    if (!hbdb)
        Parrot_ex_throw_from_c_args(interp,
                                    NULL,
                                    0,
                                    "FATAL ERROR: The debugger has not been initialized!");

    if (HBDB_FLAG_TEST(interp, HBDB_STARTED)) {
        HBDB_FLAG_CLEAR(interp, HBDB_STARTED);
    }

    HBDB_FLAG_SET(interp, HBDB_STOPPED);

    command_line(interp);
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

=item C<long add_label(PARROT_INTERP, hbdb_file_t *file, opcode_t *cur_opcode,
opcode_t offset)>

Add a label to the label list.

=cut

*/

long
add_label(PARROT_INTERP, ARGMOD(hbdb_file_t *file), ARGIN(opcode_t *cur_opcode), opcode_t offset)
{
    ASSERT_ARGS(add_label)

    hbdb_label_t *_new;
    hbdb_label_t *label;

    label = file->label;

    /* Loop through list of labels */
    while (label) {
        if (label->opcode == cur_opcode + offset)
            return label->id;

        label = label->next;
    }

    label        = file->label;
    _new         = mem_gc_allocate_zeroed_typed(interp, hbdb_label_t);
    _new->opcode = cur_opcode + offset;
    _new->next   = NULL;

    if (label) {
        while (label->next)
            label   = label->next;

        _new->id    = label->id + 1;
        label->next = _new;
    }
    else {
        file->label = _new;
        _new->id    = 1;
    }

    return _new->id;
}

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

    hbdb_t *hbdb = interp->hbdb;

    while (HBDB_FLAG_TEST(interp, HBDB_STOPPED)) {
        const char *cmd;

        hbdb_get_command(interp);

        cmd = hbdb->current_command;

        /* Check if this is the first real (non-nop) command */
        if (!HBDB_FLAG_TEST(interp, HBDB_CMD_ENTERED)
             && strcmp(cmd, "nop") != 0) {

            /* Set status flag to indicate that a real command has been entered */
            HBDB_FLAG_SET(interp, HBDB_CMD_ENTERED);
        }

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

    /*HBDB_FLAG_CLEAR(interp, HBDB_BREAK);*/
}

/* FIXME Find a more logical order for the arguments to disassemble_op()   */
/* TODO  Describe what the third argument - "code_start" - does in perldoc */

/*

=item C<static size_t disassemble_op(PARROT_INTERP, char *dest, size_t space,
op_info_t *info, opcode_t *op, hbdb_file_t *file, opcode_t *code_start, unsigned
int full_name)>

Disassembles the opcode pointed to by C<op> and stores it in C<dest>.

The amount of space allocated for the disassembly is given to C<space>.

The C<info> argument is of type C<op_info_t> which contains some general
information about the opcode pointed to by C<op>. It can easily be found in
C<< interp->code->op_info_table[*op] >>.

The last argument, C<full_name>, is an C<unsigned int> indicating whether to
use the opcode's full name or short name; 1 for "Yes", 0 for "No".

Returns the size of the disassembled opcode.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static size_t
disassemble_op(PARROT_INTERP,
               ARGOUT(char *dest),
               size_t space,
               ARGIN(op_info_t *info),
               ARGIN(opcode_t *op),
               ARGMOD_NULLOK(hbdb_file_t *file),
               ARGIN_NULLOK(opcode_t *code_start),
               unsigned int full_name)
{
    ASSERT_ARGS(disassemble_op)

    const char *op_name;
    int         specialop,
                j;

    size_t      size;
    op_lib_t   *core_ops;

    size = specialop = 0;

    /* Get core opcode library */
    core_ops = PARROT_GET_CORE_OPLIB(interp);

    op_name = full_name ? info->full_name : info->name;

    if (!op_name)
        op_name = "**UNKNOWN**";

    strcpy(dest, op_name);
    size += strlen(op_name);

    dest[size++] = ' ';

    /* Concatenate the arguments */
    for (j = 1; j < info->op_count; j++) {
        char      buf[256];
        INTVAL    i = 0;

        PARROT_ASSERT(size + 2 < space);

        switch (info->types[j - 1]) {
          case PARROT_ARG_I:
            dest[size++] = 'I';
            goto INTEGER;
          case PARROT_ARG_N:
            dest[size++] = 'N';
            goto INTEGER;
          case PARROT_ARG_S:
            dest[size++] = 'S';
            goto INTEGER;
          case PARROT_ARG_P:
            dest[size++] = 'P';
            goto INTEGER;
          case PARROT_ARG_IC:
            /* If the opcode jumps and this is the last argument,
               that means this is a label */
            if ((j == info->op_count - 1) &&
                (info->jump & PARROT_JUMP_RELATIVE)) {
                if (file) {
                    dest[size++] = 'L';

                    i            = add_label(interp, file, op, op[j]);
                }
                else if (code_start) {
                    dest[size++] = 'O';
                    dest[size++] = 'P';
                    i            = op[j] + (op - code_start);
                }
                else {
                    if (op[j] > 0)
                        dest[size++] = '+';

                    i = op[j];
                }
            }

            /* Convert the integer to a string */
            INTEGER:
            if (i == 0)
                i = (INTVAL) op[j];

            PARROT_ASSERT(size + 20 < space);

            size += sprintf(&dest[size], INTVAL_FMT, i);

            break;
          case PARROT_ARG_NC:
            {
                /* Convert the float to a string */
                const FLOATVAL f = interp->code->const_table->num.constants[op[j]];
                Parrot_snprintf(interp, buf, sizeof (buf), FLOATVAL_FMT, f);
                strcpy(&dest[size], buf);
                size += strlen(buf);
            }
            break;
          case PARROT_ARG_SC:
            {
                const STRING *s = interp->code->const_table->str.constants[op[j]];

                if (s->encoding != Parrot_ascii_encoding_ptr) {
                    strcpy(&dest[size], s->encoding->name);
                    size += strlen(s->encoding->name);
                    dest[size++] = ':';
                }

                dest[size++] = '"';
                if (s->strlen) {
                    char * const unescaped =
                        Parrot_str_to_cstring(interp, s);
                    char * const escaped =
                        escape_char(interp, unescaped, s->bufused);
                    if (escaped) {
                        strcpy(&dest[size], escaped);
                        size += strlen(escaped);
                        mem_gc_free(interp, escaped);
                    }
                    Parrot_str_free_cstring(unescaped);
                }
                dest[size++] = '"';
            }
            break;
          case PARROT_ARG_PC:
            Parrot_snprintf(interp, buf, sizeof (buf), "PMC_CONST(%d)", op[j]);
            strcpy(&dest[size], buf);
            size += strlen(buf);
            break;
          case PARROT_ARG_K:
            dest[size - 1] = '[';
            Parrot_snprintf(interp, buf, sizeof (buf), "P" INTVAL_FMT, op[j]);
            strcpy(&dest[size], buf);
            size += strlen(buf);
            dest[size++] = ']';
            break;
          case PARROT_ARG_KC:
            {
                PMC * k = interp->code->const_table->pmc.constants[op[j]];
                dest[size - 1] = '[';
                while (k) {
                    switch (PObj_get_FLAGS(k)) {
                      case 0:
                        break;
                      case KEY_integer_FLAG:
                        Parrot_snprintf(interp, buf, sizeof (buf),
                                    INTVAL_FMT, VTABLE_get_integer(interp, k));
                        strcpy(&dest[size], buf);
                        size += strlen(buf);
                        break;
                      case KEY_string_FLAG:
                        dest[size++] = '"';
                        {
                            char * const temp = Parrot_str_to_cstring(interp,
                                    VTABLE_get_string(interp, k));
                            strcpy(&dest[size], temp);
                            Parrot_str_free_cstring(temp);
                        }
                        size += Parrot_str_byte_length(interp,
                                VTABLE_get_string(interp, (k)));
                        dest[size++] = '"';
                        break;
                      case KEY_integer_FLAG|KEY_register_FLAG:
                        Parrot_snprintf(interp, buf, sizeof (buf),
                                    "I" INTVAL_FMT, VTABLE_get_integer(interp, k));
                        strcpy(&dest[size], buf);
                        size += strlen(buf);
                        break;
                      case KEY_string_FLAG|KEY_register_FLAG:
                        Parrot_snprintf(interp, buf, sizeof (buf),
                                    "S" INTVAL_FMT, VTABLE_get_integer(interp, k));
                        strcpy(&dest[size], buf);
                        size += strlen(buf);
                        break;
                      case KEY_pmc_FLAG|KEY_register_FLAG:
                        Parrot_snprintf(interp, buf, sizeof (buf),
                                    "P" INTVAL_FMT, VTABLE_get_integer(interp, k));
                        strcpy(&dest[size], buf);
                        size += strlen(buf);
                        break;
                      default:
                        dest[size++] = '?';
                        break;
                    }

                    /*GETATTR_Key_next_key(interp, k, k);*/

                    if (k)
                        dest[size++] = ';';
                }

                dest[size++] = ']';
            }
            break;
          case PARROT_ARG_KI:
            dest[size - 1] = '[';
            Parrot_snprintf(interp, buf, sizeof (buf), "I" INTVAL_FMT, op[j]);
            strcpy(&dest[size], buf);
            size += strlen(buf);
            dest[size++] = ']';
            break;
          case PARROT_ARG_KIC:
            dest[size - 1] = '[';
            Parrot_snprintf(interp, buf, sizeof (buf), INTVAL_FMT, op[j]);
            strcpy(&dest[size], buf);
            size += strlen(buf);
            dest[size++] = ']';
            break;
          default:
            Parrot_ex_throw_from_c_args(interp, NULL, 1, "Unknown opcode type");
        }

        if (j != info->op_count - 1)
            dest[size++] = ',';
    }

    /* Special decoding for the signature used in args/returns.  Such ops have
       one fixed parameter (the signature vector), plus a varying number of
       registers/constants.  For each arg/return, we show the register and its
       flags using PIR syntax. */
    if (OPCODE_IS(interp, interp->code, *(op), core_ops, PARROT_OP_set_args_pc)
    ||  OPCODE_IS(interp, interp->code, *(op), core_ops, PARROT_OP_set_returns_pc))
        specialop = 1;

    /* if it's a retrieving op, specialop = 2, so that later a :flat flag
     * can be changed into a :slurpy flag. See flag handling below.
     */
    if (OPCODE_IS(interp, interp->code, *(op), core_ops, PARROT_OP_get_results_pc)
    ||  OPCODE_IS(interp, interp->code, *(op), core_ops, PARROT_OP_get_params_pc))
        specialop = 2;

    if (specialop > 0) {
        char buf[1000];
        PMC * const sig = interp->code->const_table->pmc.constants[op[1]];
        const int n_values = VTABLE_elements(interp, sig);
        /* The flag_names strings come from Call_bits_enum_t (with which it
           should probably be colocated); they name the bits from LSB to MSB.
           The two least significant bits are not flags; they are the register
           type, which is decoded elsewhere.  We also want to show unused bits,
           which could indicate problems.
        */
        PARROT_OBSERVER const char * const flag_names[] = {
                                     "",
                                     "",
                                     " :unused004",
                                     " :unused008",
                                     " :const",
                                     " :flat", /* should be :slurpy for args */
                                     " :unused040",
                                     " :optional",
                                     " :opt_flag",
                                     " :named"
        };

        /* Register decoding.  It would be good to abstract this, too. */
        PARROT_OBSERVER static const char regs[] = "ISPN";

        for (j = 0; j < n_values; ++j) {
            size_t idx = 0;
            const int sig_value = VTABLE_get_integer_keyed_int(interp, sig, j);

            /* Print the register name, e.g. P37. */
            buf[idx++] = ',';
            buf[idx++] = ' ';
            buf[idx++] = regs[sig_value & PARROT_ARG_TYPE_MASK];
            Parrot_snprintf(interp, &buf[idx], sizeof (buf)-idx,
                            INTVAL_FMT, op[j+2]);
            idx = strlen(buf);

            /* Add flags, if we have any. */
            {
                unsigned int flag_idx = 0;
                int flags = sig_value;

                /* End when we run out of flags, off the end of flag_names, or
                 * get too close to the end of buf.
                 * 100 is just an estimate of all buf lengths added together.
                 */
                while (flags && idx < sizeof (buf) - 100) {
                    const char * const flag_string =
                            flag_idx < (sizeof flag_names / sizeof (char *))
                                ? (specialop == 2  && STREQ(flag_names[flag_idx], " :flat"))
                                    ? " :slurpy"
                                    : flag_names[flag_idx]
                                : (const char *) NULL;

                    if (! flag_string)
                        break;
                    if (flags & 1 && *flag_string) {
                        const size_t n = strlen(flag_string);
                        strcpy(&buf[idx], flag_string);
                        idx += n;
                    }
                    flags >>= 1;
                    flag_idx++;
                }
            }

            /* Add it to dest. */
            buf[idx++] = '\0';
            strcpy(&dest[size], buf);
            size += strlen(buf);
        }
    }

    dest[size] = '\0';
    return ++size;
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
display_breakpoint(ARGIN(hbdb_t *hbdb), ARGIN(hbdb_breakpoint_t *bp))
{
    ASSERT_ARGS(display_breakpoint)

    /* TODO Add check if we're in a function and if so, display value of arguments */

    Parrot_io_printf(hbdb->debugger,
                     "Breakpoint %d at PC %04ld: ",
                     bp->id,
                     bp->pc);
                     /*bp->pc - hbdb->debugee->code->base.data);*/

    if (hbdb->file)
        Parrot_io_printf(hbdb->debugger, "file %s", hbdb->file->filename);

    if (bp->line)
        Parrot_io_printf(hbdb->debugger, ", line %d", bp->line);

    if (bp->skip == -1)
        Parrot_io_printf(hbdb->debugger, "  (DISABLED)");

    Parrot_io_printf(hbdb->debugger, "\n");
}

/*

=item C<static char * escape_char(PARROT_INTERP, char *string, UINTVAL length)>

Escapes C<">, C<\r>, C<\n>, C<\t>, C<\a> and C<\\>.

Note that the returned string I<must> be freed.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
static char *
escape_char(PARROT_INTERP, ARGIN(char *string), UINTVAL length)
{
    ASSERT_ARGS(escape_char)

    char *new_str,
         *fill,
         *end;

    if (!string)
        return NULL;

    length = (length > 20) ? 20 : length;

    fill = new_str = mem_gc_allocate_n_typed(interp, (length * 2) + 1, char);

    /* Iterate through each character in 'string' */
    for (end = string + length; string < end; string++) {
        /* For each case of an invalid character, insert a '\' before it */
        switch (*string) {
          case '\0':
            *(fill++) = '\\';
            *(fill++) = '0';
            break;
          case '\n':
            *(fill++) = '\\';
            *(fill++) = 'n';
            break;
          case '\r':
            *(fill++) = '\\';
            *(fill++) = 'r';
            break;
          case '\t':
            *(fill++) = '\\';
            *(fill++) = 't';
            break;
          case '\a':
            *(fill++) = '\\';
            *(fill++) = 'a';
            break;
          case '\\':
            *(fill++) = '\\';
            *(fill++) = '\\';
            break;
          case '"':
            *(fill++) = '\\';
            *(fill++) = '"';
            break;
          default:
            /* Hide non-ASCII characters that may come from UTF-8 or Latin-1
             * strings in constant strings.
             *
             * Workaround for TT #1557
             */
            if ((unsigned char) *string > 127)
                *(fill++) = '?';
            else
                *(fill++) = *string;

            break;
        }
    }

    *fill = '\0';

    return new_str;
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

    line = file->line;

    /* Loop through list of lines */
    while (line) {
        hbdb_line_t *next_line = line->next;

        mem_gc_free(interp, line);

        line = next_line;
    }

    label = file->label;

    /* Loop through list of labels */
    while (label) {
        hbdb_label_t *next_label = label->next;

        mem_gc_free(interp, label);

        label = next_label;
    }

    /*if (file->filename)*/
        /*mem_gc_free(interp, file->filename);*/

    if (file->source)
        mem_gc_free(interp, file->source);

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

    result = strtoul(*cmd, &next, 0);

    if ((errno == ERANGE && result == ULONG_MAX) || (errno != 0 && result == 0))
        return ULONG_MAX;

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

    if (cmd && *cmd) {
        const char  *start;
        const char  *next;
        char         c;
        int          found = -1;
        unsigned int hits  =  0,
                     len,
                     i;

        start = skip_whitespace(*cmd);
        next  = start;

        *cmd  = start;

        /* Get command name */
        for (i = 0; (c = *next) != '\0' && !isspace((unsigned char) c); next++)
            continue;

        len = next - start;

        if (len == 0)
            return NULL;

        /* Iterate through global command table */
        for (i = 0; i < (sizeof (command_table) / sizeof (hbdb_cmd_table_t)); i++) {
            const hbdb_cmd_table_t * const tbl = command_table + i;

            /* Check if user entered command's abbreviation */
            if ((len == 1) && (strncmp(*cmd, tbl->short_name, len) == 0)) {
                hits  = 1;
                found = i;
                break;
            }

            /* Check if input matches current entry */
            if (strncmp(*cmd, tbl->name, len) == 0) {
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

    hbdb = interp->hbdb;

    /* Preseve original command in case of error */
    orig_cmd = cmd;

    /* Get command's hbdb_cmd_t structure */
    c = parse_command(&orig_cmd);

    /* Call command's function if match was found */
    if (c) {
        (*c->function)(interp, orig_cmd);
        return 0;
    }
    else {
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

    while (*cmd && isspace((unsigned char) *cmd))
        cmd++;

    return cmd;
}

/*

=item C<static void welcome(void)>

Displays welcome message.

=cut

*/

static void
welcome(void)
{
    ASSERT_ARGS(welcome)
    puts("HBDB: The Honey Bee Debugger");
    puts("Copyright (C) 2001-2011, Parrot Foundation.\n");
    puts("Enter \"h\" or \"help\" for help or see docs/hbdb.pod for further information.\n");
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

