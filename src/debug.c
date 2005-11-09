/*
Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/debug.c - Parrot debugging

=head1 DESCRIPTION

This file implements Parrot debugging and is used by C<pdb>, the Parrot
debugger, and the C<debug> ops.

=head2 Functions

=over 4

=cut

*/

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "parrot/parrot.h"
#include "parrot/interp_guts.h"
#include "parrot/oplib.h"
#include "parrot/trace.h"
#include "parrot/debug.h"

/* na(c) [Next Argument (Char pointer)]
 *
 * Moves the pointer to the next argument in the user input.
 */
#define na(c) { \
    while(*c && !isspace((int) *c)) \
        c++; \
    while(*c && isspace((int) *c)) \
        c++; }

/*

=item C<static char* nextarg(char* command)>

Returns the position just past the current argument in a PASM
instruction. This is not the same as C<na()>, above, which is intended
for debugger commands. This function is used for C<eval>.

=cut

*/

static char*
nextarg(char* command)
{
    while (*command && (isalnum((int) *command) || *command == ',' ||
        *command == ']'))
            command++;
    while (*command && isspace((int) *command))
        command++;
    return command;
}

/*

=item C<static const char* skip_ws(const char* str)>

Returns the pointer past any whitespace.

=cut

*/

static const char*
skip_ws(const char* str)
{
    while (*str && isspace((int) *str))
        str++;
    return str;
}

/*

=item C<static const char* skip_command(const char* str)>

Returns the pointer past the current debugger command. (This is an
alternative to the C<na()> macro above.)

=cut

*/

static const char*
skip_command(const char* str)
{
    while (*str && !isspace((int) *str))
        str++;
    while (*str && isspace((int) *str))
        str++;
    return str;
}

/*

=item C<static const char* parse_int(const char* str, int* intP)>

Parse an C<int> out of a string and return a pointer to just after the
C<int>.

=cut

*/

static const char*
parse_int(const char* str, int* intP)
{
    char* end;

    *intP = strtol(str, &end, 0);

    return end;
}

/*

=item C<static const char*
parse_string(Interp *interpreter,
             const char* str, STRING** strP)>

Parse a double-quoted string out of a C string and return a pointer to
just after the string. The parsed string is converted to a Parrot
C<STRING>.

=cut

*/

static const char*
parse_string(Interp *interpreter,
             const char* str, STRING** strP)
{
    const char* string;

    if (*str != '"')
        return NULL;
    str++;
    string = str;
    while (*str && *str != '"') {
        if (*str == '\\' && str[1])
            str += 2;
        else
            str++;
    }

    *strP = string_make(interpreter, string, str - string, NULL, 0);

    if (*str)
        str++;
    return str;
}

/*

=item C<static const char*
parse_key(Interp *interpreter, const char* str, PMC** keyP)>

Parse an aggregate key out of a string and return a pointer to just
after the key. Currently only string and integer keys are allowed.

=cut

*/

static const char*
parse_key(Interp *interpreter, const char* str, PMC** keyP)
{
    *keyP = NULL;
    if (*str != '[')
        return NULL;
    str++; /* Skip [ */
    if (*str == '"') {
        STRING* string;
        str = parse_string(interpreter, str, &string);
        *keyP = key_new_string(interpreter, string);
    }
    else if (isdigit((int) *str)) {
        int value;
        str = parse_int(str, &value);
        *keyP = key_new_integer(interpreter, (INTVAL) value);
    }
    else {
        return NULL;
    }

    if (*str != ']')
        return NULL;
    return ++str;
}

/*

=item C<static const char*
parse_command(const char* command, unsigned long* cmdP)>

Convert the command at the beginning of a string into a numeric value
that can be used as a switch key for fast lookup.

=cut

*/

static const char*
parse_command(const char* command, unsigned long* cmdP)
{
    int i;
    unsigned long c = 0;

    if (*command == '\0') {
        *cmdP = c;
        return 0;
    }

    for (i = 0; *command && isalpha((int) *command); command++, i++)
        c += (tolower((int) *command) + (i + 1)) * ((i + 1) * 255);

    /* Nonempty and did not start with a letter */
    if (c == 0)
        c = -1;

    *cmdP = c;

    return command;
}

/*

=item C<void PDB_get_command(Interp *interpreter)>

Get a command from the user input to execute.

It saves the last command executed (in C<< pdb->last_command >>), so it
first frees the old one and updates it with the current one.

Also prints the next line to run if the program is still active.

The user input can't be longer than 255 characters.

The input is saved in C<< pdb->cur_command >>.

=cut

*/

void
PDB_get_command(Interp *interpreter)
{
    unsigned int i;
    char *c;
    PDB_t *pdb = interpreter->pdb;
    PDB_line_t *line;
    int ch;

    /* flush the buffered data */
    fflush(stdout);

    /* not used any more */
    if (pdb->last_command && *pdb->cur_command) {
        mem_sys_free(pdb->last_command);
    pdb->last_command = NULL;
    }

    /* update the last command */
    if (pdb->cur_command && *pdb->cur_command)
        pdb->last_command = pdb->cur_command;

    /* if the program is stopped and running show the next line to run */
    if ((pdb->state & PDB_STOPPED) && (pdb->state & PDB_RUNNING)) {
        line = pdb->file->line;

        while (pdb->cur_opcode != line->opcode)
            line = line->next;

        PIO_eprintf(interpreter, "\n%li  ", line->number);
        c = pdb->file->source + line->source_offset;
        while (*c != '\n'  && c)
            PIO_eprintf(interpreter, "%c", *(c++));
        PIO_eprintf(interpreter, "\n");
    }

    i = 0;

    c = (char *)mem_sys_allocate(255);

    PIO_eprintf(interpreter, "\n(pdb) ");

    /* skip leading whitespace */
    do {
        ch = fgetc(stdin);
    } while (isspace(ch) && ch != '\n');

    /* generate string (no more than 255 chars) */
     while (ch != EOF && ch != '\n' && (i < 255)) {
        c[i++] = ch;
        ch = fgetc(stdin);
    }

    c[i] = '\0';

    if (ch == -1) strcpy(c, "quit");
    pdb->cur_command = c;
}

/*

=item C<void
PDB_run_command(Interp *interpreter, const char *command)>

Run a command.

Hash the command to make a simple switch calling the correct handler.

=cut

*/

void
PDB_run_command(Interp *interpreter, const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    unsigned long c;
    const char* temp;

    /* keep a pointer to the command, in case we need to report an error */
    temp = command;

    /* get a number from what the user typed */
    command = parse_command(command, &c);

    if (command) na(command);

    switch (c) {
        case c_disassemble:
            PDB_disassemble(interpreter, command);
            break;
        case c_load:
            PDB_load_source(interpreter, command);
            break;
        case c_l:
        case c_list:
            PDB_list(interpreter, command);
            break;
        case c_b:
        case c_break:
            PDB_set_break(interpreter, command);
            break;
        case c_w:
        case c_watch:
            PDB_watchpoint(interpreter, command);
            break;
        case c_d:
        case c_delete:
            PDB_delete_breakpoint(interpreter, command);
            break;
        case c_disable:
            PDB_disable_breakpoint(interpreter, command);
            break;
        case c_enable:
            PDB_enable_breakpoint(interpreter, command);
            break;
        case c_r:
        case c_run:
            PDB_init(interpreter, command);
            PDB_continue(interpreter, NULL);
            break;
        case c_c:
        case c_continue:
            PDB_continue(interpreter, command);
            break;
        case c_p:
        case c_print:
            /* PDB_print(interpreter, command);  XXX */
            break;
        case c_n:
        case c_next:
            PDB_next(interpreter, command);
            break;
        case c_t:
        case c_trace:
            PDB_trace(interpreter, command);
            break;
        case c_e:
        case c_eval:
            PDB_eval(interpreter, command);
            break;
        case c_info:
            PDB_info(interpreter);
            break;
        case c_h:
        case c_help:
            PDB_help(interpreter, command);
            break;
        case c_q:
        case c_quit:
            pdb->state |= PDB_EXIT;
            break;
        case 0:
            if (pdb->last_command)
                PDB_run_command(interpreter,pdb->last_command);
            break;
        default:
            PIO_eprintf(interpreter,
                        "Undefined command: \"%s\".  Try \"help\".",
                        temp);
            break;
    }
}

/*

=item C<void
PDB_next(Interp *interpreter, const char *command)>

Execute the next N operation(s).

Inits the program if needed, runs the next N >= 1 operations and stops.

=cut

*/

void
PDB_next(Interp *interpreter, const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    unsigned long n = 1;

    /* Init the program if it's not running */
    if (!(pdb->state & PDB_RUNNING))
        PDB_init(interpreter, command);

    /* Get the number of operations to execute if any */
    if (command && isdigit((int) *command))
        n = atol(command);

    /* Erase the stopped flag */
    pdb->state &= ~PDB_STOPPED;

    /* Execute */
    for ( ; n && pdb->cur_opcode; n--)
        DO_OP(pdb->cur_opcode,interpreter);

    /* Set the stopped flag */
    pdb->state |= PDB_STOPPED;

    /* If program ended */

    /*
     * FIXME this doesn't handle resume opcodes
     */
    if (!pdb->cur_opcode)
        (void)PDB_program_end(interpreter);
}

/*

=item C<void
PDB_trace(Interp *interpreter,
          const char *command)>

Execute the next N operations; if no number is specified, it defaults to
1.

=cut

*/

void
PDB_trace(Interp *interpreter,
          const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    unsigned long n = 1;

    if (!(pdb->state & PDB_RUNNING))
    {
        PDB_init(interpreter, command);
    }

    if (command && isdigit((int) *command))
        n = atol(command);

    pdb->state &= ~PDB_STOPPED;

    for ( ; n && pdb->cur_opcode; n--) {
        trace_op(interpreter,
                interpreter->code->base.data,
                interpreter->code->base.data +
                interpreter->code->base.size,
                interpreter->pdb->cur_opcode);
        DO_OP(pdb->cur_opcode,interpreter);
    }

    pdb->state |= PDB_STOPPED;

    /* If program ended */
    if (!pdb->cur_opcode)
        (void)PDB_program_end(interpreter);
}

/*

=item C<PDB_condition_t *
PDB_cond(Interp *interpreter, const char *command)>

Analyzes a condition from the user input.

=cut

*/

PDB_condition_t *
PDB_cond(Interp *interpreter, const char *command)
{
    PDB_condition_t *condition;
    int i, reg_number;
    char str[255];

    /* Return if no more arguments */
    if (!(command && *command)) {
        PIO_eprintf(interpreter, "No condition specified\n");
        return NULL;
    }

    /* Allocate new condition */
    condition = (PDB_condition_t *)mem_sys_allocate(sizeof(PDB_condition_t));

    switch (*command) {
        case 'i':
        case 'I':
            condition->type = PDB_cond_int;
            break;
        case 'n':
        case 'N':
            condition->type = PDB_cond_num;
            break;
        case 's':
        case 'S':
            condition->type = PDB_cond_str;
            break;
        case 'p':
        case 'P':
            condition->type = PDB_cond_pmc;
            break;
        default:
            PIO_eprintf(interpreter, "First argument must be a register\n");
            mem_sys_free(condition);
            return NULL;
    }

    /* get the register number */
    condition->reg = atoi(++command);
    if (condition->reg >= NUM_REGISTERS ) {
        PIO_eprintf(interpreter, "Out-of-bounds register\n");
        mem_sys_free(condition);
        return NULL;
    }

    /* the next argument might have no spaces between the register and the
     * condition. */
    command++;

    if (condition->reg > 9)
        command++;

    if (*command == ' ')
        na(command);

    /* Now the condition */
    switch (*command) {
        case '>':
            if (*(command + 1) == '=')
                condition->type |= PDB_cond_ge;
            else if (*(command + 1) == ' ')
                condition->type |= PDB_cond_gt;
            else
                goto INV_COND;
            break;
        case '<':
            if (*(command + 1) == '=')
                condition->type |= PDB_cond_le;
            else if (*(command + 1) == ' ')
                condition->type |= PDB_cond_lt;
            else
                goto INV_COND;
            break;
        case '=':
            if (*(command + 1) == '=')
                condition->type |= PDB_cond_eq;
            else
                goto INV_COND;
            break;
        case '!':
            if (*(command + 1) == '=')
                condition->type |= PDB_cond_ne;
            else
                goto INV_COND;
            break;
        default:
INV_COND:   PIO_eprintf(interpreter, "Invalid condition\n");
            mem_sys_free(condition);
            return NULL;
    }

    if (*(command + 1) == '=')
        command += 2;
    else
        command ++;

    if (*command == ' ')
        na(command);

    /* return if no more arguments */
    if (!(command && *command)) {
        PIO_eprintf(interpreter, "Can't compare a register with nothing\n");
        mem_sys_free(condition);
        return NULL;
    }

    if (isalpha((int)*command)) {
        /* It's a register - we first check that it's the correct type */
        switch (*command) {
            case 'i':
            case 'I':
                if (!(condition->type & PDB_cond_int))
                    goto WRONG_REG;
                break;
            case 'n':
            case 'N':
                if (!(condition->type & PDB_cond_num))
                    goto WRONG_REG;
                break;
            case 's':
            case 'S':
                if (!(condition->type & PDB_cond_str))
                    goto WRONG_REG;
                break;
            case 'p':
            case 'P':
                if (!(condition->type & PDB_cond_pmc))
                    goto WRONG_REG;
                break;
            default:
WRONG_REG:      PIO_eprintf(interpreter, "Register types don't agree\n");
                mem_sys_free(condition);
                return NULL;
        }
        /* Now we check and store the register number */
        reg_number = (int)atoi(++command);
        if (reg_number >= (int) NUM_REGISTERS || reg_number < 0) {
            PIO_eprintf(interpreter, "Out-of-bounds register\n");
            mem_sys_free(condition);
            return NULL;
        }
        condition->value = (void *)mem_sys_allocate(sizeof(int));
        *(int *)condition->value = reg_number;
    }
    /* If the first argument was an integer */
    else if (condition->type & PDB_cond_int) {
        /* This must be either an integer constant or register */
        condition->value = (void *)mem_sys_allocate(sizeof(INTVAL));
        *(INTVAL *)condition->value = (INTVAL)atoi(command);
        condition->type |= PDB_cond_const;
    }
    else if (condition->type & PDB_cond_num) {
        condition->value = (void *)mem_sys_allocate(sizeof(FLOATVAL));
        *(FLOATVAL *)condition->value = (FLOATVAL)atof(command);
        condition->type |= PDB_cond_const;
    }
    else if (condition->type & PDB_cond_str) {
        for (i = 1; ((command[i] != '"') && (i < 255)); i++)
            str[i - 1] = command[i];
        str[i - 1] = '\0';
        condition->value = string_make(interpreter,
            str, i - 1, NULL, PObj_external_FLAG);
        condition->type |= PDB_cond_const;
    }
    else if (condition->type & PDB_cond_pmc) {
        /* XXX Need to figure out what to do in this case.
         * For the time being, we just bail. */
        PIO_eprintf(interpreter, "Can't compare PMC with constant\n");
        mem_sys_free(condition);
        return NULL;
    }

    /* We're not part of a list yet */
    condition->next = NULL;

    return condition;
}

/*

=item C<void
PDB_watchpoint(Interp *interpreter, const char *command)>

Set a watchpoint.

=cut

*/

void
PDB_watchpoint(Interp *interpreter, const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    PDB_condition_t *condition;

    if (!(condition = PDB_cond(interpreter, command)))
        return;

    /* Add it to the head of the list */
    if (pdb->watchpoint)
        condition->next = pdb->watchpoint;

    pdb->watchpoint = condition;
}

/*

=item C<void
PDB_set_break(Interp *interpreter, const char *command)>

Set a break point, the source code file must be loaded.

=cut

*/

void
PDB_set_break(Interp *interpreter, const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    PDB_breakpoint_t *newbreak = NULL, *sbreak;
    PDB_condition_t *condition;
    PDB_line_t *line;
    long ln,i;

    /* If no line number was specified, set it at the current line */
    if (command && *command) {
        ln = atol(command);

        /* Move to the line where we will set the break point */
        line = pdb->file->line;
        for (i = 1; ((i < ln) && (line->next)); i++)
            line = line->next;

        /* Abort if the line number provided doesn't exist */
        if (!line->next) {
            PIO_eprintf(interpreter,
                        "Can't set a breakpoint at line number %li\n",ln);
            return;
        }
    }
    else {
        /* Get the line to set it */
        line = pdb->file->line;
        while (line->opcode != pdb->cur_opcode) {
            line = line->next;
            if (!line) {
                PIO_eprintf(interpreter,
                   "No current line found and no line number specified\n");
                return;
            }
        }
    }

    /* Skip lines that are not related to an opcode */
    while (!line->opcode)
        line = line->next;

    /* Allocate the new break point */
    newbreak = (PDB_breakpoint_t *)mem_sys_allocate(sizeof(PDB_breakpoint_t));

    na(command);
    condition = NULL;

    /* if there is another argument to break, besides the line number,
     * it should be an 'if', so we call another handler. */
    if (command && *command) {
        na(command);
        if ((condition = PDB_cond(interpreter, command))) {
            newbreak->condition = condition;
        }
    }

    /* If there are no other arguments, or if there isn't a valid condition,
       then condition will be NULL */
    if (!condition) {
        newbreak->condition = NULL;
    }

    /* Set the address where to stop */
    newbreak->pc = line->opcode;
    /* No next breakpoint */
    newbreak->next = NULL;
    /* Don't skip (at least initially) */
    newbreak->skip = 0;

    /* Add the breakpoint to the end of the list */
    i = 0;
    sbreak = pdb->breakpoint;
    if (sbreak) {
        while (sbreak->next) {
            sbreak = sbreak->next;
        }
        newbreak->prev = sbreak;
        sbreak->next = newbreak;
        i = sbreak->next->id = sbreak->id + 1;
    }
    else {
        newbreak->prev = NULL;
        pdb->breakpoint = newbreak;
        i = pdb->breakpoint->id = 0;
    }

    PIO_eprintf(interpreter, "Breakpoint %li at line %li\n",i,line->number);
}

/*

=item C<void
PDB_init(Interp *interpreter, const char *command)>

Init the program.

=cut

*/

extern void imcc_init(Parrot_Interp interpreter);

void
PDB_init(Interp *interpreter, const char *command)
{
    PMC *userargv;
    char c[256];
    STRING *arg;
    unsigned long i;
    PDB_t *pdb = interpreter->pdb;

#if 0
    struct PackFile *code;
    void* stacktop = interpreter->lo_var_ptr;

    /* XXX this causes reuse of structures of the old interpreter
     * the new interpreter isn't returned nor setup properly
     * -leo
     */
    /* The bytecode is readonly, right? */
    code = interpreter->code;
    /* Destroy the old interpreter FIXME */
    free(interpreter);
    /* Get a new interpreter */
    interpreter = make_interpreter(interpreter, NO_FLAGS);
    interpreter->code = code;
    interpreter->pdb = pdb;
    interpreter->lo_var_ptr = stacktop;
#else
    Parrot_clear_i(interpreter);
    Parrot_clear_n(interpreter);
    Parrot_clear_s(interpreter);
    Parrot_clear_p(interpreter);
#endif

    /* setup PASM compiler */
    imcc_init(interpreter);

    /* set the user arguments */
    userargv = pmc_new(interpreter, enum_class_ResizableStringArray);
    REG_PMC(5) = userargv;

    while (command && *command) {
        i = 0;
        while (command[i] && !isspace((int) command[i])) {
            c[i] = command[i];
            i++;
        }
        c[i] = '\0';
        na(command);

        arg = string_make(interpreter, c, i, NULL, 0);
        VTABLE_push_string(interpreter, userargv, arg);
    }

    /* Restart if we are already running */
    if (pdb->state & PDB_RUNNING)
        PIO_eprintf(interpreter, "Restarting\n");

    /* Get the bytecode start */
    pdb->cur_opcode = interpreter->code->base.data;
    /* Add the RUNNING state */
    pdb->state |= PDB_RUNNING;
}

/*

=item C<void
PDB_continue(Interp *interpreter,
             const char *command)>

Continue running the program. If a number is specified, skip that many
breakpoints.

=cut

*/

void
PDB_continue(Interp *interpreter,
             const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    long ln;

    /* Skip any breakpoint? */
    if (command && *command) {
        if (!pdb->breakpoint) {
            PIO_eprintf(interpreter, "No breakpoints to skip\n");
            return;
        }
        ln = atol(command);
        PDB_skip_breakpoint(interpreter,ln);
    }
    /* Run while no break point is reached */
    while (!PDB_break(interpreter))
        DO_OP(pdb->cur_opcode,interpreter);
}


/* PDB_find_breakpoint
 *
 * Find breakpoint number N; returns NULL if the breakpoint doesn't
 * exist or if no breakpoint was specified.
 *
 */
/*

=item C<PDB_breakpoint_t *
PDB_find_breakpoint(Interp *interpreter,
                      const char *command)>

Find breakpoint number N; returns C<NULL> if the breakpoint doesn't
exist or if no breakpoint was specified.

=cut

*/

PDB_breakpoint_t *
PDB_find_breakpoint(Interp *interpreter,
                      const char *command)
{
    PDB_breakpoint_t *breakpoint;
    long n;

    if (isdigit((int) *command)) {
        n = atol(command);
        breakpoint = interpreter->pdb->breakpoint;
        while (breakpoint && breakpoint->id != n)
            breakpoint = breakpoint->next;
        if (!breakpoint) {
            PIO_eprintf(interpreter, "No breakpoint number %ld", n);
            return NULL;
        }
        return breakpoint;
    }
    else {
        /* Report an appropriate error */
        if (*command) {
            PIO_eprintf(interpreter, "Not a valid breakpoint");
        }
        else {
            PIO_eprintf(interpreter, "No breakpoint specified");
        }
        return NULL;
    }
}

/*

=item C<void
PDB_disable_breakpoint(Interp *interpreter,
                       const char *command)>

Disable a breakpoint; it can be reenabled with the enable command.

=cut

*/

void
PDB_disable_breakpoint(Interp *interpreter,
                       const char *command)
{
    PDB_breakpoint_t *breakpoint;

    breakpoint = PDB_find_breakpoint(interpreter, command);

    if (breakpoint) {
        breakpoint->skip = -1;
    }

    return;
}

/*

=item C<void
PDB_enable_breakpoint(Interp *interpreter,
                      const char *command)>

Reenable a disabled breakpoint; if the breakpoint was not disabled, has
no effect.

=cut

*/

void
PDB_enable_breakpoint(Interp *interpreter,
                      const char *command)
{
    PDB_breakpoint_t *breakpoint;

    breakpoint = PDB_find_breakpoint(interpreter, command);
    if (breakpoint && breakpoint->skip == -1) {
        breakpoint->skip = 0;
    }
    return;
}

/*

=item C<void
PDB_delete_breakpoint(Interp *interpreter,
                      const char *command)>

Delete a breakpoint.

=cut

*/

void
PDB_delete_breakpoint(Interp *interpreter,
                      const char *command)
{
    PDB_breakpoint_t *breakpoint;
    PDB_line_t *line;

    breakpoint = PDB_find_breakpoint(interpreter, command);
    if (breakpoint) {
        line = interpreter->pdb->file->line;
        while (line->opcode != breakpoint->pc)
            line = line->next;

        /* Delete the condition structure, if there is one */
        if (breakpoint->condition) {
            PDB_delete_condition(interpreter, breakpoint);
            breakpoint->condition = NULL;
        }

        /* Remove the breakpoint from the list */
        if (breakpoint->prev && breakpoint->next) {
            breakpoint->prev->next = breakpoint->next;
            breakpoint->next->prev = breakpoint->prev;
        }
        else if (breakpoint->prev && !breakpoint->next) {
            breakpoint->prev->next = NULL;
        }
        else if (!breakpoint->prev && breakpoint->next) {
            breakpoint->next->prev = NULL;
            interpreter->pdb->breakpoint = breakpoint->next;
        }
        else {
            interpreter->pdb->breakpoint = NULL;
        }
        /* Kill the breakpoint */
        mem_sys_free(breakpoint);
    }
}

/*

=item C<void
PDB_delete_condition(Interp *interpreter,
                     PDB_breakpoint_t *breakpoint)>

Delete a condition associated with a breakpoint.

=cut

*/

void
PDB_delete_condition(Interp *interpreter,
                     PDB_breakpoint_t *breakpoint)
{
    if (breakpoint->condition->value) {
        if (breakpoint->condition->type & PDB_cond_str) {
            /* 'value' is a string, so we need to be careful */
            PObj_external_CLEAR((STRING*)breakpoint->condition->value);
            PObj_on_free_list_SET((STRING*)breakpoint->condition->value);
            /* it should now be properly garbage collected after
               we destroy the condition */
        }
        else {
            /* 'value' is a float or an int, so we can just free it */
            mem_sys_free(breakpoint->condition->value);
        breakpoint->condition->value = NULL;
        }
    }
    mem_sys_free(breakpoint->condition);
    breakpoint->condition = NULL;
}

/*

=item C<void
PDB_skip_breakpoint(Interp *interpreter, long i)>

Skip C<i> times all breakpoints.

=cut

*/

void
PDB_skip_breakpoint(Interp *interpreter, long i)
{
    if (i == 0) {
        interpreter->pdb->breakpoint_skip = i;
    }
    else {
        interpreter->pdb->breakpoint_skip = i - 1;
    }
}

/*

=item C<char
PDB_program_end(Interp *interpreter)>

End the program.

=cut

*/

char
PDB_program_end(Interp *interpreter)
{
    PDB_t *pdb = interpreter->pdb;

    /* Remove the RUNNING state */
    pdb->state &= ~PDB_RUNNING;
    PIO_eprintf(interpreter, "Program exited.\n");
    return 1;
}

/*

=item C<char
PDB_check_condition(Interp *interpreter,
    PDB_condition_t *condition)>

Returns true if the condition was met.

=cut

*/

char
PDB_check_condition(Interp *interpreter,
    PDB_condition_t *condition)
{
    INTVAL i,j;
    FLOATVAL k, l;
    STRING *m, *n;

    if (condition->type & PDB_cond_int) {
        i = REG_INT(condition->reg);
        if (condition->type & PDB_cond_const)
            j = *(INTVAL *)condition->value;
        else
            j = REG_INT(*(int *)condition->value);
        if (((condition->type & PDB_cond_gt) && (i >  j)) ||
            ((condition->type & PDB_cond_ge) && (i >= j)) ||
            ((condition->type & PDB_cond_eq) && (i == j)) ||
            ((condition->type & PDB_cond_ne) && (i != j)) ||
            ((condition->type & PDB_cond_le) && (i <= j)) ||
            ((condition->type & PDB_cond_lt) && (i <  j)))
                return 1;
        return 0;
    }
    else if (condition->type & PDB_cond_num) {
        k = REG_NUM(condition->reg);
        if (condition->type & PDB_cond_const)
            l = *(FLOATVAL *)condition->value;
        else
            l = REG_NUM(*(int *)condition->value);
        if (((condition->type & PDB_cond_gt) && (k >  l)) ||
            ((condition->type & PDB_cond_ge) && (k >= l)) ||
            ((condition->type & PDB_cond_eq) && (k == l)) ||
            ((condition->type & PDB_cond_ne) && (k != l)) ||
            ((condition->type & PDB_cond_le) && (k <= l)) ||
            ((condition->type & PDB_cond_lt) && (k <  l)))
                return 1;
        return 0;
    }
    else if (condition->type & PDB_cond_str) {
        m = REG_STR(condition->reg);
        if (condition->type & PDB_cond_const)
            n = (STRING *)condition->value;
        else
            n = REG_STR(*(int *)condition->value);
        if (((condition->type & PDB_cond_gt) &&
                (string_compare(interpreter, m, n) >  0)) ||
            ((condition->type & PDB_cond_ge) &&
                (string_compare(interpreter, m, n) >= 0)) ||
            ((condition->type & PDB_cond_eq) &&
                (string_compare(interpreter, m, n) == 0)) ||
            ((condition->type & PDB_cond_ne) &&
                (string_compare(interpreter, m, n) != 0)) ||
            ((condition->type & PDB_cond_le) &&
                (string_compare(interpreter, m, n) <= 0)) ||
            ((condition->type & PDB_cond_lt) &&
                (string_compare(interpreter, m, n) <  0)))
                    return 1;
        return 0;
    }
    return 0;
}

/*

=item C<char PDB_break(Interp *interpreter)>

Returns true if we have to stop running.

=cut

*/

char
PDB_break(Interp *interpreter)
{
    PDB_t *pdb = interpreter->pdb;
    PDB_breakpoint_t *breakpoint = pdb->breakpoint;
    PDB_condition_t *watchpoint = pdb->watchpoint;

    /* Check the watchpoints first. */
    while (watchpoint) {
        if (PDB_check_condition(interpreter, watchpoint)) {
            pdb->state |= PDB_STOPPED;
            return 1;
        }
        watchpoint = watchpoint->next;
    }

    /* If program ended */
    if (!pdb->cur_opcode)
        return PDB_program_end(interpreter);

    /* If the program is STOPPED allow it to continue */
    if (pdb->state & PDB_STOPPED) {
        pdb->state &= ~PDB_STOPPED;
        return 0;
    }

    /* If we have to skip breakpoints, do so. */
    if (pdb->breakpoint_skip) {
        pdb->breakpoint_skip--;
        return 0;
    }

    while (breakpoint) {
        /* if we are in a break point */
        if (pdb->cur_opcode == breakpoint->pc) {
            if (breakpoint->skip < 0)
                return 0;

            /* Check if there is a condition for this breakpoint */
            if ((breakpoint->condition) &&
                (!PDB_check_condition(interpreter, breakpoint->condition)))
                    return 0;

            /* Add the STOPPED state and stop */
            pdb->state |= PDB_STOPPED;
            return 1;
        }
        breakpoint = breakpoint->next;
    }

    return 0;
}

/*

=item C<char * PDB_escape(const char *string, INTVAL length)>

Escapes C<">, C<\r>, C<\n>, C<\t>, C<\a> and C<\\>.

=cut

*/

char *
PDB_escape(const char *string, INTVAL length)
{
    const char *end;
    char *new,*fill;

    length = length > 20 ? 20 : length;
    end = string + length;

    /* Return if there is no string to escape*/
    if (!string)
        return NULL;

    fill = new = (char *)mem_sys_allocate(length * 2 + 1);

    for ( ; string < end; string++) {
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
                *(fill++) = *string;
                break;
        }
    }
    *fill = '\0';
    return new;
}

/*

=item C<int PDB_unescape(char *string)>

Do inplace unescape of C<\r>, C<\n>, C<\t>, C<\a> and C<\\>.

=cut

*/

int
PDB_unescape(char *string)
{
    char *fill;
    int i, l = 0;

    for ( ; *string; string++) {
        l++;
        if (*string == '\\') {
            switch (string[1]) {
                case 'n':
                    *string = '\n';
                    break;
                case 'r':
                    *string = '\r';
                    break;
                case 't':
                    *string = '\t';
                    break;
                case 'a':
                    *string = '\a';
                    break;
                case '\\':
                    *string = '\\';
                    break;
                default:
                    continue;
            }
            fill = string;
            for (i = 1; fill[i + 1]; i++)
                fill[i] = fill[i + 1];
            fill[i] = '\0';
        }
    }
    return l;
}

/*

=item C<size_t
PDB_disassemble_op(Interp *interpreter, char* dest, int space,
                   op_info_t* info, opcode_t* op,
                   PDB_file_t *file, opcode_t* code_start, int full_name)>

Disassembles C<op>.

=cut

*/

size_t
PDB_disassemble_op(Interp *interpreter, char* dest, int space,
                   op_info_t* info, opcode_t* op,
                   PDB_file_t *file, opcode_t* code_start, int full_name)
{
    int size = 0;
    int j;
    const char *p;

    /* Write the opcode name */
    p = full_name ? info->full_name : info->name;
    strcpy(dest, p);
    size += strlen(p);

    dest[size++] = ' ';

    /* Concat the arguments */
    for (j = 1; j < info->arg_count; j++) {
        char buf[256];
        INTVAL i = 0;
        FLOATVAL f;
        PMC* k;

        assert(size + 2 < space);
        switch (info->types[j]) {
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
            if ((j == info->arg_count - 1) &&
                (info->jump & PARROT_JUMP_RELATIVE))
            {
                if (file) {
                    dest[size++] = 'L';
                    i = PDB_add_label(file, op, op[j]);
                }
                else if (code_start) {
                    dest[size++] = 'O';
                    dest[size++] = 'P';
                    i = op[j] + (op - code_start);
                }
                else {
                    if (op[j] > 0) dest[size++] = '+';
                    i = op[j];
                }
            }

            /* Convert the integer to a string */
            INTEGER:
            if (i == 0) i = (INTVAL) op[j];
            assert(size + 20 < space);
            sprintf(&dest[size], INTVAL_FMT, i);
            size += strlen(&dest[size]);
            break;
        case PARROT_ARG_NC:
            /* Convert the float to a string */
            f = interpreter->code->const_table->constants[op[j]]->u.number;
            Parrot_snprintf(interpreter, buf, sizeof(buf), FLOATVAL_FMT, f);
            strcpy(&dest[size], buf);
            size += strlen(buf);
            break;
        case PARROT_ARG_SC:
            dest[size++] = '"';
            if (interpreter->code->const_table->constants[op[j]]->
                    u.string->strlen)
            {
                char* escaped = PDB_escape(interpreter->code->const_table->
                           constants[op[j]]->u.string->strstart,
                           interpreter->code->const_table->
                           constants[op[j]]->u.string->strlen);
                if (escaped) {
                    strcpy(&dest[size],escaped);
                    size += strlen(escaped);
                    mem_sys_free(escaped);
                }
            }
            dest[size++] = '"';
            break;
        case PARROT_ARG_PC:
            Parrot_snprintf(interpreter, buf, sizeof(buf),
                            "PMC_CONST(%d)", op[j]);
            strcpy(&dest[size], buf);
            size += strlen(buf);
            break;

        case PARROT_ARG_K:
            dest[size-1] = '[';
            Parrot_snprintf(interpreter, buf, sizeof(buf),
                            "P" INTVAL_FMT, op[j]);
            strcpy(&dest[size], buf);
            size += strlen(buf);
            dest[size++] = ']';
            break;
        case PARROT_ARG_KC:
            dest[size-1] = '[';
            k = interpreter->code->const_table->constants[op[j]]->u.key;
            while (k) {
                switch (PObj_get_FLAGS(k)) {
                case 0:
                    break;
                case KEY_integer_FLAG:
                    Parrot_snprintf(interpreter, buf, sizeof(buf),
                                    INTVAL_FMT, PMC_int_val(k));
                    strcpy(&dest[size], buf);
                    size += strlen(buf);
                    break;
                case KEY_number_FLAG:
                    Parrot_snprintf(interpreter, buf, sizeof(buf),
                                    FLOATVAL_FMT, PMC_num_val(k));
                    strcpy(&dest[size], buf);
                    size += strlen(buf);
                    break;
                case KEY_string_FLAG:
                    dest[size++] = '"';
                    {
                        char *temp = string_to_cstring(interpreter,
                                                       PMC_str_val(k));
                        strcpy(&dest[size], temp);
                        string_cstring_free(temp);
                    }
                    size += string_length(interpreter, PMC_str_val(k));
                    dest[size++] = '"';
                    break;
                case KEY_integer_FLAG|KEY_register_FLAG:
                    Parrot_snprintf(interpreter, buf, sizeof(buf),
                                    "I" INTVAL_FMT, PMC_int_val(k));
                    strcpy(&dest[size], buf);
                    size += strlen(buf);
                    break;
                case KEY_number_FLAG|KEY_register_FLAG:
                    Parrot_snprintf(interpreter, buf, sizeof(buf),
                                    "N" INTVAL_FMT, PMC_int_val(k));
                    strcpy(&dest[size], buf);
                    size += strlen(buf);
                    break;
                case KEY_string_FLAG|KEY_register_FLAG:
                    Parrot_snprintf(interpreter, buf, sizeof(buf),
                                    "S" INTVAL_FMT, PMC_int_val(k));
                    strcpy(&dest[size], buf);
                    size += strlen(buf);
                    break;
                case KEY_pmc_FLAG|KEY_register_FLAG:
                    Parrot_snprintf(interpreter, buf, sizeof(buf),
                                    "P" INTVAL_FMT, PMC_int_val(k));
                    strcpy(&dest[size], buf);
                    size += strlen(buf);
                    break;
                default:
                    dest[size++] = '?';
                    break;
                }
                k = PMC_data(k);
                if (k) dest[size++] = ';';
            }
            dest[size++] = ']';
            break;
        case PARROT_ARG_KI:
            dest[size - 1] = '[';
            Parrot_snprintf(interpreter, buf, sizeof(buf),
                            "I" INTVAL_FMT, op[j]);
            strcpy(&dest[size], buf);
            size += strlen(buf);
            dest[size++] = ']';
            break;
        case PARROT_ARG_KIC:
            dest[size - 1] = '[';
            Parrot_snprintf(interpreter, buf, sizeof(buf),
                            INTVAL_FMT, op[j]);
            strcpy(&dest[size], buf);
            size += strlen(buf);
            dest[size++] = ']';
            break;
        default:
            internal_exception(1, "Unknown opcode type");
        }

        if (j != info->arg_count - 1)
            dest[size++] = ',';
    }

    dest[size] = '\0';
    return ++size;
}

/*

=item C<void
PDB_disassemble(Interp *interpreter, const char *command)>

Disassemble the bytecode.

=cut

*/

void
PDB_disassemble(Interp *interpreter, const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    PDB_file_t *pfile;
    PDB_line_t *pline,*newline;
    PDB_label_t *label;
    opcode_t *code_end,*pc = interpreter->code->base.data;

    const unsigned int default_size = 32768;
    size_t space;  /* How much space do we have? */
    size_t size, alloced;

    pfile = (PDB_file_t *)mem_sys_allocate(sizeof(PDB_file_t));
    pline = (PDB_line_t *)mem_sys_allocate(sizeof(PDB_line_t));

    /* If we already got a source, free it */
    if (pdb->file)
        PDB_free_file(interpreter);

    pfile->source = (char *)mem_sys_allocate(default_size);
    alloced = space = default_size;
    pfile->line = pline;
    pfile->label = NULL;
    pfile->size = 0;
    pline->number = 1;
    pline->source_offset = 0;
    pline->label = NULL;

    code_end = pc + interpreter->code->base.size;
    while (pc != code_end) {
        /* Grow it early*/
        if (space < default_size) {
            alloced += default_size;
            space += default_size;
            pfile->source = mem_sys_realloc(pfile->source, alloced);
        }

        size = PDB_disassemble_op(interpreter, pfile->source + pfile->size,
                space, &interpreter->op_info_table[*pc], pc, pfile, NULL, 1);
        space -= size;
        pfile->size += size;
        pfile->source[pfile->size - 1] = '\n';

        /* Store the opcode of this line */
        pline->opcode = pc;
        pc += interpreter->op_info_table[*pc].arg_count;
        /* Prepare for next line */
        newline = (PDB_line_t *)mem_sys_allocate(sizeof(PDB_line_t));
        newline->number = pline->number + 1;
        newline->label  = NULL;
        newline->next   = NULL;
        pline->next = newline;
        pline = newline;
        pline->source_offset = pfile->size;
    }

    /* Add labels to the lines they belong to */
    label = pfile->label;
    while (label) {
        /* Get the line to apply the label */
        pline = pfile->line;
        while (pline && pline->opcode != label->opcode)
            pline = pline->next;

        if (!(pline)) {
            PIO_eprintf(interpreter,
                        "Label number %li out of bounds.\n", label->number);
            return;
        }

        pline->label = label;

        label = label->next;
    }

    pdb->state |= PDB_SRC_LOADED;
    pdb->file = pfile;
}

/*

=item C<long
PDB_add_label(PDB_file_t *file, opcode_t *cur_opcode, opcode_t offset)>

Add a label to the label list.

=cut

*/

long
PDB_add_label(PDB_file_t *file, opcode_t *cur_opcode, opcode_t offset)
{
    PDB_label_t *new, *label = file->label;

    /* See if there is already a label at this line */
    while (label) {
        if (label->opcode == cur_opcode + offset)
            return label->number;
        label = label->next;
    }
    /* Allocate a new label */
    label = file->label;
    new = (PDB_label_t *)mem_sys_allocate(sizeof(PDB_label_t));
    new->opcode = cur_opcode + offset;
    new->next   = NULL;
    if (label) {
        while (label->next)
            label = label->next;
        new->number = label->number + 1;
        label->next = new;
    }
    else {
        file->label = new;
        new->number = 1;
    }
    return new->number;
}

/*

=item C<void PDB_free_file(Interp *interpreter)>

Frees any allocated source files.

=cut

*/

void
PDB_free_file(Interp *interpreter)
{
    PDB_line_t *nline, *line;
    PDB_label_t *nlabel, *label;
    PDB_file_t *nfile, *file = interpreter->pdb->file;

    while (file) {
        /* Free all of the allocated line structures */
        line = file->line;
        while (line) {
            nline = line->next;
            mem_sys_free(line);
            line = nline;
        }

        /* Free all of the allocated label structures */
        label = file->label;
        while (label) {
            nlabel = label->next;
            mem_sys_free(label);
            label = nlabel;
        }

        /* Free the remaining allocated portions of the file structure */
        if (file->sourcefilename)
            mem_sys_free(file->sourcefilename);
        if (file->source)
            mem_sys_free(file->source);
        nfile = file->next;
        mem_sys_free(file);
        file = nfile;
    }

    /* Make sure we don't end up pointing at garbage memory */
    interpreter->pdb->file = NULL;
}

/*

=item C<void
PDB_load_source(Interp *interpreter, const char *command)>

Load a source code file.

=cut

*/

void
PDB_load_source(Interp *interpreter, const char *command)
{
    FILE *file;
    char f[255];
    int i, c;
    unsigned long size = 0;
    PDB_t *pdb = interpreter->pdb;
    PDB_file_t *pfile;
    PDB_line_t *pline,*newline;
    opcode_t *pc = pdb->cur_opcode;

    /* If there was a file already loaded or the bytecode was
       disassembled, free it */
    if (pdb->file)
        PDB_free_file(interpreter);
    /* Get the name of the file */
    for (i = 0; command[i]; i++)
        f[i] = command[i];

    f[i] = '\0';
    /* open the file */
    file = fopen(f,"r");

    /* abort if fopen failed */
    if (!file) {
        PIO_eprintf(interpreter, "Unable to load %s\n", f);
        return;
    }

    pfile = (PDB_file_t *)mem_sys_allocate_zeroed(sizeof(PDB_file_t));
    pline = (PDB_line_t *)mem_sys_allocate_zeroed(sizeof(PDB_line_t));

    pfile->source = (char *)mem_sys_allocate(1024);
    pfile->line = pline;
    pline->number = 1;

    while ((c = fgetc(file)) != EOF) {
        /* Grow it */
        if (++size == 1024) {
            pfile->source = mem_sys_realloc(pfile->source,
                                            (size_t)pfile->size + 1024);
            size = 0;
        }
        pfile->source[pfile->size] = (char)c;

        pfile->size++;

        if (c == '\n') {
            /* If the line has an opcode move to the next one,
               otherwise leave it with NULL to skip it. */
            if (PDB_hasinstruction(pfile->source + pline->source_offset)) {
                pline->opcode = pc;
                pc += interpreter->op_info_table[*pc].arg_count;
            }
            newline =
                    (PDB_line_t *)mem_sys_allocate_zeroed(sizeof(PDB_line_t));
            newline->number = pline->number + 1;
            pline->next = newline;
            pline = newline;
            pline->source_offset = pfile->size;
            pline->opcode = NULL;
            pline->label = NULL;
        }
    }

    pdb->state |= PDB_SRC_LOADED;
    pdb->file = pfile;
}

/*

=item C<char PDB_hasinstruction(char *c)>

Return true if the line has an instruction.

XXX TODO:

=over 4

=item * This should take the line, get an instruction, get the opcode for
that instruction and check that is the correct one.

=item * Decide what to do with macros if anything.

=back

=cut

*/

char
PDB_hasinstruction(char *c)
{
    char h = 0;

    while (*c && *c != '#' && *c != '\n') {
        if (isalnum((int) *c) || *c == '"')
            h = 1;
        else if (*c == ':')
            h = 0;
        c++;
    }

    return h;
}

/*

=item C<void
PDB_list(Interp *interpreter, const char *command)>

Show lines from the source code file.

=cut

*/

void
PDB_list(Interp *interpreter, const char *command)
{
    char *c;
    long line_number;
    unsigned long i,n = 10;
    PDB_t *pdb = interpreter->pdb;
    PDB_line_t *line;

    if (!pdb->file) {
        PIO_eprintf(interpreter, "No source file loaded\n");
        return;
    }

    /* set the list line if provided */
    if (isdigit((int) *command)) {
        line_number = atol(command) - 1;
        if (line_number < 0) {
            pdb->file->list_line = 0;
        }
        else {
            pdb->file->list_line = (unsigned long) line_number;
        }
        na(command);
    }
    else {
        pdb->file->list_line = 0;
    }

    /* set the number of lines to print */
    if (isdigit((int) *command)) {
        n = atol(command);
        na(command);
    }

    /* if n is zero, we simply return, as we don't have to print anything */
    if (n == 0) return;

    line = pdb->file->line;

    for (i = 0; i < pdb->file->list_line && line->next; i++)
        line = line->next;

    i = 1;
    while (line->next) {
        PIO_eprintf(interpreter, "%li  ",pdb->file->list_line + i);
        /* If it has a label print it */
        if (line->label)
            PIO_eprintf(interpreter, "L%li:\t",line->label->number);
        c = pdb->file->source + line->source_offset;
        while (*c != '\n')
            PIO_eprintf(interpreter, "%c",*(c++));
        PIO_eprintf(interpreter, "\n");
        line = line->next;
        if (i++ == n)
            break;
    }

    if (--i != n)
        pdb->file->list_line = 0;
    else
        pdb->file->list_line += n;
}

/*

=item C<void
PDB_eval(Interp *interpreter, const char *command)>

C<eval>s an instruction.

=cut

*/

void
PDB_eval(Interp *interpreter, const char *command)
{
    opcode_t *run;
    struct PackFile *eval_pf;
    struct PackFile_ByteCode *old_cs;

    eval_pf = PDB_compile(interpreter, command);

    if (eval_pf) {
        old_cs = Parrot_switch_to_cs(interpreter, eval_pf->cur_cs, 1);
        run = eval_pf->cur_cs->base.data;
        DO_OP(run,interpreter);
        Parrot_switch_to_cs(interpreter, old_cs, 1);
       /* TODO destroy packfile */
    }
}

/*

=item C<struct PackFile *
PDB_compile(Interp *interpreter, const char *command)>

Compiles instructions with the PASM compiler.

Appends an C<end> op.

This may be called from C<PDB_eval> above or from the compile opcode
which generates a malloced string.

=cut

*/

struct PackFile *
PDB_compile(Interp *interpreter, const char *command)
{
    STRING *buf;
    const char *end = "\nend\n";
    PMC * compiler, *code;
    STRING *key = const_string(interpreter, "PASM");
    PMC *compreg_hash = VTABLE_get_pmc_keyed_int(interpreter,
            interpreter->iglobals, IGLOBALS_COMPREG_HASH);

    compiler = VTABLE_get_pmc_keyed_str(interpreter, compreg_hash, key);
    if (!VTABLE_defined(interpreter, compiler)) {
        fprintf(stderr, "Couldn't find PASM compiler");
        return NULL;
    }
    buf = Parrot_sprintf_c(interpreter, "%s%s", command, end);

    code = VTABLE_invoke(interpreter, compiler, buf);
    return PMC_struct_val(code);
}

/*

=item C<int
PDB_extend_const_table(Interp *interpreter)>

Extend the constant table.

=cut

*/

int
PDB_extend_const_table(Interp *interpreter)
{
    int k;

    /* Update the constant count and reallocate */
    k = ++interpreter->code->const_table->const_count;
    if (interpreter->code->const_table->constants) {
        interpreter->code->const_table->constants =
            mem_sys_realloc(interpreter->code->const_table->constants,
                            k * sizeof(struct PackFile_Constant *));
    } else {
        interpreter->code->const_table->constants =
            mem_sys_allocate(k * sizeof(struct PackFile_Constant *));
    }

    /* Allocate a new constant */
    interpreter->code->const_table->constants[--k] =
        PackFile_Constant_new(interpreter);
    return k;
}


/*

=item C<static void
dump_string(Interp *interpreter, STRING* s)>

Dumps the buflen, flags, bufused, strlen, offset associated
with a string and the string itself.

=cut

*/

static void
dump_string(Interp *interpreter, STRING* s)
{
    if (s) {
        PIO_eprintf(interpreter, "\tBuflen  =\t%12ld\n",PObj_buflen(s));
        PIO_eprintf(interpreter, "\tFlags   =\t%12ld\n", PObj_get_FLAGS(s));
        PIO_eprintf(interpreter, "\tBufused =\t%12ld\n",s->bufused);
        PIO_eprintf(interpreter, "\tStrlen  =\t%12ld\n",s->strlen);
        PIO_eprintf(interpreter, "\tOffset  =\t%12d\n",
                    (char*) s->strstart - (char*) PObj_bufstart(s));
        PIO_eprintf(interpreter, "\tString  =\t%S\n", s);
    }
}

/*

=item C<void
PDB_print_user_stack(Interp *interpreter, const char *command)>

Print an entry from the user stack.

=cut

*/

void
PDB_print_user_stack(Interp *interpreter, const char *command)
{
    long depth = 0;
    Stack_Chunk_t *chunk = CONTEXT(interpreter->ctx)->user_stack;
    Stack_Entry_t *entry;

    if (*command) {
        depth = atol(command);
    }

    entry = stack_entry(interpreter, chunk, (INTVAL)depth);

    if (!entry) {
        PIO_eprintf(interpreter, "No such entry on stack\n");
        return;
    }

    switch (entry->entry_type) {
        case STACK_ENTRY_INT:
            PIO_eprintf(interpreter, "Integer\t=\t%8vi\n",
                        UVal_int(entry->entry));
            break;
        case STACK_ENTRY_FLOAT:
            PIO_eprintf(interpreter, "Float\t=\t%8.4vf\n",
                        UVal_num(entry->entry));
            break;
        case STACK_ENTRY_STRING:
            PIO_eprintf(interpreter, "String =\n");
            dump_string(interpreter, UVal_str(entry->entry));
            break;
        case STACK_ENTRY_PMC:
            PIO_eprintf(interpreter, "PMC =\n%PS\n", UVal_ptr(entry->entry));
            break;
        case STACK_ENTRY_POINTER:
            PIO_eprintf(interpreter, "POINTER\n");
            break;
        case STACK_ENTRY_DESTINATION:
            PIO_eprintf(interpreter, "DESTINATION\n");
            break;
        default:
            PIO_eprintf(interpreter, "Invalid stack_entry_type!\n");
            break;
    }
}

/*

=item C<void
PDB_print(Interp *interpreter, const char *command)>

Print interpreter registers.

=cut

*/

#if 0
/* XXX TODO */
void
PDB_print(Interp *interpreter, const char *command)
{
    unsigned long c = 0;
    PMC* key = NULL;
    int regnum = -1;

    command = skip_ws(command);
    command = parse_command(command, &c);
    if (command == NULL) {
        PDB_print_int(interpreter, &interpreter->int_reg, -1);
        PDB_print_num(interpreter, &interpreter->num_reg, -1);
        PDB_print_string(interpreter, &interpreter->string_reg, -1);
        PDB_print_pmc(interpreter, &interpreter->pmc_reg, -1, NULL);
        return;
    }

    command = skip_ws(command);

    if (isdigit((int) *command)) {
        command = parse_int(command, &regnum);
        command = skip_ws(command);
    }


    if (*command == '[') {
        command = parse_key(interpreter, command, &key);
    }

    switch (c) {
        case c_i:
        case c_int:
            PDB_print_int(interpreter, &interpreter->int_reg, regnum);
            break;
        case c_n:
        case c_num:
            PDB_print_num(interpreter, &interpreter->num_reg, regnum);
            break;
        case c_s:
        case c_str:
            PDB_print_string(interpreter,&interpreter->string_reg, regnum);
            break;
        case c_p:
        case c_pmc:
            PDB_print_pmc(interpreter,&interpreter->pmc_reg, regnum, key);
            break;
        default:
            PIO_eprintf(interpreter, "Unrecognized print option: "
                        "must be 'int', 'num', 'str', 'pmc', or a register\n");
    }

}

/*

=item C<void
PDB_print_int(Interp *interpreter, struct IReg *int_reg,
              int regnum)>

Print the whole or a specific value of a integer register structure.

=cut

*/

void
PDB_print_int(Interp *interpreter, struct IReg *int_reg,
              int regnum)
{
    int i,j = 0, k = NUM_REGISTERS;

    if (regnum >= NUM_REGISTERS || regnum < -1) {
        PIO_eprintf(interpreter, "No such register I%d", regnum);
        return;
    }
    else if (regnum != -1) {
        j = regnum;
        k = regnum + 1;
    }
    else {
        PIO_eprintf(interpreter, "Integer Registers:\n");
    }

    for (i = j; i < k; i++) {
        PIO_eprintf(interpreter, "I%i =\t",i);
        PIO_eprintf(interpreter, "%11vi\n",int_reg->registers[i]);
    }
}

/*

=item C<void
PDB_print_int_frame(Interp *interpreter,
                    struct IRegFrame *int_reg, int regnum)>

Print the whole or a specific value of a integer register frame
structure.

=cut

*/

void
PDB_print_int_frame(Interp *interpreter,
                    struct IRegFrame *int_reg, int regnum)
{
    int i,j = 0, k = NUM_REGISTERS/2;

    if (regnum >= NUM_REGISTERS/2 || regnum < -1) {
        PIO_eprintf(interpreter, "No such register I%d", regnum);
        return;
    }
    else if (regnum != -1) {
        j = regnum;
        k = regnum + 1;
    }
    else {
        PIO_eprintf(interpreter, "Integer Registers:\n");
    }

    for (i = j; i < k; i++) {
        PIO_eprintf(interpreter, "I%i =\t",i);
        PIO_eprintf(interpreter, "%11vi\n",int_reg->registers[i]);
    }
}

/*

=item C<void
PDB_print_num(Interp *interpreter, struct NReg *num_reg,
              int regnum)>

Print the whole or a specific value of a float register structure.

=cut

*/

void
PDB_print_num(Interp *interpreter, struct NReg *num_reg,
              int regnum)
{
    int i,j = 0, k = NUM_REGISTERS;

    if (regnum >= NUM_REGISTERS || regnum < -1) {
        PIO_eprintf(interpreter, "No such register N%d", regnum);
        return;
    }
    else if (regnum != -1) {
        j = regnum;
        k = regnum + 1;
    }
    else {
        PIO_eprintf(interpreter, "Float Registers:\n");
    }

    for (i = j; i < k; i++) {
        PIO_eprintf(interpreter, "N%i =\t",i);
        PIO_eprintf(interpreter, "%20.4f\n",num_reg->registers[i]);
    }
}

/* PDB_print_num_frame
 * print the whole or a specific value of a float register frame structure.
 */
/*

=item C<void
PDB_print_num_frame(Interp *interpreter,
                    struct NRegFrame *num_reg, int regnum)>

Print the whole or a specific value of a float register frame structure.

=cut

*/

void
PDB_print_num_frame(Interp *interpreter,
                    struct NRegFrame *num_reg, int regnum)
{
    int i,j = 0, k = NUM_REGISTERS/2;

    if (regnum >= NUM_REGISTERS/2 || regnum < -1) {
        PIO_eprintf(interpreter, "No such register N%d", regnum);
        return;
    }
    else if (regnum != -1) {
        j = regnum;
        k = regnum + 1;
    }
    else {
        PIO_eprintf(interpreter, "Float Registers:\n");
    }

    for (i = j; i < k; i++) {
        PIO_eprintf(interpreter, "N%i =\t",i);
        PIO_eprintf(interpreter, "%20.4f\n",num_reg->registers[i]);
    }
}

/*

=item C<void
PDB_print_string(Interp *interpreter, struct SReg *string_reg,
                 int regnum)>

Print the whole or a specific value of a string register structure.

=cut

*/

void
PDB_print_string(Interp *interpreter, struct SReg *string_reg,
                 int regnum)
{
    int i,j = 0, k = NUM_REGISTERS;

    if (regnum >= NUM_REGISTERS || regnum < -1) {
        PIO_eprintf(interpreter, "No such register S%d", regnum);
        return;
    }
    else if (regnum != -1) {
        j = regnum;
        k = regnum + 1;
    }
    else {
        PIO_eprintf(interpreter, "String Registers:\n");
    }

    for (i = j; i < k; i++) {
        PIO_eprintf(interpreter, "S%i =\n",i);
        dump_string(interpreter, string_reg->registers[i]);
    }
}

/*

=item C<void
PDB_print_string_frame(Interp *interpreter,
                       struct SRegFrame *string_reg, int regnum)>

Print the whole or a specific value of a string register frame structure.

=cut

*/

void
PDB_print_string_frame(Interp *interpreter,
                       struct SRegFrame *string_reg, int regnum)
{
    int i,j = 0, k = NUM_REGISTERS/2;

    if (regnum >= NUM_REGISTERS/2 || regnum < -1) {
        PIO_eprintf(interpreter, "No such register S%d", regnum);
        return;
    }
    else if (regnum != -1) {
        j = regnum;
        k = regnum + 1;
    }
    else {
        PIO_eprintf(interpreter, "String Registers:\n");
    }

    for (i = j; i < k; i++) {
        PIO_eprintf(interpreter, "S%i =\n",i);
        dump_string(interpreter, string_reg->registers[i]);
    }
}

/*

=item C<static void
print_pmc(Interp *interpreter, PMC* pmc)>

Prints out a human-readable description of C<pmc>.

=cut

*/

static void
print_pmc(Interp *interpreter, PMC* pmc)
{
    if (pmc && pmc->vtable) {
        STRING* s = VTABLE_name(interpreter, pmc);
        if (s) {
            PIO_eprintf(interpreter, " [%S]\n", s);
        }
        PIO_eprintf(interpreter, "Stringified: %PS\n",
                    VTABLE_get_string(interpreter, pmc));
    }
    else {
        PIO_eprintf(interpreter, "<null pmc>\n");
    }
}

/*

=item C<void
PDB_print_pmc(Interp *interpreter, struct PReg *pmc_reg,
              int regnum, PMC* key)>

Print the whole or a specific value of a PMC register structure.

=cut

*/

void
PDB_print_pmc(Interp *interpreter, struct PReg *pmc_reg,
              int regnum, PMC* key)
{
    int i,j = 0, k = NUM_REGISTERS;

    if (regnum >= NUM_REGISTERS || regnum < -1) {
        PIO_eprintf(interpreter, "No such register P%d", regnum);
        return;
    }
    else if (regnum != -1) {
        j = regnum;
        k = regnum + 1;
    }
    else {
        PIO_eprintf(interpreter, "PMC Registers:\n");
    }

    for (i = j; i < k; i++) {
        PMC* pmc = pmc_reg->registers[i];

        PIO_eprintf(interpreter, "P%i", i);
        if (key) trace_key_dump(interpreter, key);
        PIO_eprintf(interpreter, " =");

        if (key) pmc = VTABLE_get_pmc_keyed(interpreter, pmc, key);
        print_pmc(interpreter, pmc);
    }
}

/*

=item C<void
PDB_print_pmc_frame(Interp *interpreter,
                    struct PRegFrame *pmc_reg, int regnum, PMC* key)>

Print the whole or a specific value of a PMC register frame structure.

=cut

*/

void
PDB_print_pmc_frame(Interp *interpreter,
                    struct PRegFrame *pmc_reg, int regnum, PMC* key)
{
    int i,j = 0, k = NUM_REGISTERS/2;

    if (regnum >= NUM_REGISTERS/2 || regnum < -1) {
        PIO_eprintf(interpreter, "No such register P%d", regnum);
        return;
    }
    else if (regnum != -1) {
        j = regnum;
        k = regnum + 1;
    }
    else {
        PIO_eprintf(interpreter, "PMC Registers:\n");
    }

    for (i = j; i < k; i++) {
        PMC* pmc = pmc_reg->registers[i];

        PIO_eprintf(interpreter, "P%i", i);
        if (key) trace_key_dump(interpreter, key);
        PIO_eprintf(interpreter, " =");

        if (key) pmc = VTABLE_get_pmc_keyed(interpreter, pmc, key);
        print_pmc(interpreter, pmc);
    }
}

#endif  /* PDB_print stuff */

/*

=item C<void PDB_info(Interp *interpreter)>

Print the interpreter info.

=cut

*/

void
PDB_info(Interp *interpreter)
{
    PIO_eprintf(interpreter, "Total memory allocated = %d\n",
            interpinfo(interpreter, TOTAL_MEM_ALLOC));
    PIO_eprintf(interpreter, "DOD runs = %d\n",
            interpinfo(interpreter, DOD_RUNS));
    PIO_eprintf(interpreter, "Lazy DOD runs = %d\n",
            interpinfo(interpreter, LAZY_DOD_RUNS));
    PIO_eprintf(interpreter, "Collect runs = %d\n",
            interpinfo(interpreter, COLLECT_RUNS));
    PIO_eprintf(interpreter, "Collect memory = %d\n",
            interpinfo(interpreter, TOTAL_COPIED));
    PIO_eprintf(interpreter, "Active PMCs = %d\n",
            interpinfo(interpreter, ACTIVE_PMCS));
    PIO_eprintf(interpreter, "Extended PMCs = %d\n",
            interpinfo(interpreter, EXTENDED_PMCS));
    PIO_eprintf(interpreter, "Timely DOD PMCs = %d\n",
            interpinfo(interpreter, IMPATIENT_PMCS));
    PIO_eprintf(interpreter, "Total PMCs = %d\n",
            interpinfo(interpreter, TOTAL_PMCS));
    PIO_eprintf(interpreter, "Active buffers = %d\n",
            interpinfo(interpreter, ACTIVE_BUFFERS));
    PIO_eprintf(interpreter, "Total buffers = %d\n",
            interpinfo(interpreter, TOTAL_BUFFERS));
    PIO_eprintf(interpreter, "Header allocations since last collect = %d\n",
            interpinfo(interpreter, HEADER_ALLOCS_SINCE_COLLECT));
    PIO_eprintf(interpreter, "Memory allocations since last collect = %d\n",
            interpinfo(interpreter, MEM_ALLOCS_SINCE_COLLECT));
}

/*

=item C<void
PDB_help(Interp *interpreter, const char *command)>

Print the help text. "Help" with no arguments prints a list of commands.
"Help xxx" prints information on command xxx.

=cut

*/

void
PDB_help(Interp *interpreter, const char *command)
{
    unsigned long c;
    const char* temp;

    temp = command;
    command = parse_command(command, &c);

    switch (c) {
        case c_disassemble:
            PIO_eprintf(interpreter,"No documentation yet");
            break;
        case c_load:
            PIO_eprintf(interpreter,"No documentation yet");
            break;
        case c_list:
            PIO_eprintf(interpreter,
            "List the source code.\n\n\
Optionally specify the line number to begin the listing from and the number\n\
of lines to display.\n");
            break;
        case c_run:
            PIO_eprintf(interpreter,
            "Run (or restart) the program being debugged.\n\n\
Arguments specified after \"run\" are passed as command line arguments to\n\
the program.\n");
            break;
        case c_break:
            PIO_eprintf(interpreter,
"Set a breakpoint at a given line number (which must be specified).\n\n\
Optionally, specify a condition, in which case the breakpoint will only\n\
activate if the condition is met. Conditions take the form:\n\n\
           if [REGISTER] [COMPARISON] [REGISTER or CONSTANT]\n\n\
\
For example:\n\n\
           break 10 if I4 > I3\n\n\
           break 45 if S1 == \"foo\"\n\n\
The command returns a number which is the breakpoint identifier.");
            break;
        case c_watch:
            PIO_eprintf(interpreter,"No documentation yet");
            break;
        case c_delete:
            PIO_eprintf(interpreter,
"Delete a breakpoint.\n\n\
The breakpoint to delete must be specified by its breakpoint number.\n\
Deleted breakpoints are gone completely. If instead you want to\n\
temporarily disable a breakpoint, use \"disable\".\n");
            break;
        case c_disable:
            PIO_eprintf(interpreter,
"Disable a breakpoint.\n\n\
The breakpoint to disable must be specified by its breakpoint number.\n\
Disabled breakpoints are not forgotten, but have no effect until re-enabled\n\
with the \"enable\" command.\n");
            break;
        case c_enable:
            PIO_eprintf(interpreter,"Re-enable a disabled breakpoint.\n");
            break;
        case c_continue:
            PIO_eprintf(interpreter,
"Continue the program execution.\n\n\
Without arguments, the program runs until a breakpoint is found\n\
(or until the program terminates for some other reason).\n\n\
If a number is specified, then skip that many breakpoints.\n\n\
If the program has terminated, then \"continue\" will do nothing;\n\
use \"run\" to re-run the program.\n");
            break;
        case c_next:
            PIO_eprintf(interpreter,
"Execute a specified number of instructions.\n\n\
If a number is specified with the command (e.g. \"next 5\"), then\n\
execute that number of instructions, unless the program reaches a\n\
breakpoint, or stops for some other reason.\n\n\
If no number is specified, it defaults to 1.\n");
            break;
        case c_eval:
            PIO_eprintf(interpreter,"No documentation yet");
            break;
        case c_trace:
            PIO_eprintf(interpreter,
"Similar to \"next\", but prints additional trace information.\n\
This is the same as the information you get when running Parrot with\n\
the -t option.\n");
            break;
        case c_print:
            PIO_eprintf(interpreter,"No documentation yet");
            break;
        case c_info:
            PIO_eprintf(interpreter,
                    "Print information about the current interpreter\n");
            break;
        case c_quit:
            PIO_eprintf(interpreter, "Exit the debugger.\n");
            break;
        case c_help:
            PIO_eprintf(interpreter, "Print a list of available commands.\n");
            break;
        case 0:
            PIO_eprintf(interpreter, "\
List of commands:\n\
    disassemble -- disassemble the bytecode\n\
    load -- load a source code file\n\
    list (l) -- list the source code file\n\
    run (r) -- run the program\n\
    break (b) -- add a breakpoint\n\
    watch (w) -- add a watchpoint\n\
    delete (d) -- delete a breakpoint\n\
    disable -- disable a breakpoint\n\
    enable  -- reenable a disabled breakpoint\n\
    continue (c) -- continue the program execution\n\
    next (n) -- run the next instruction\n\
    eval (e) -- run an instruction\n\
    trace (t) -- trace the next instruction\n\
    print (p) -- print the interpreter registers\n\
    stack (s) -- examine the stack\n\
    info -- print interpreter information\n\
    quit (q) -- exit the debugger\n\
    help (h) -- print this help\n\n\
Type \"help\" followed by a command name for full documentation.\n\n");
            break;
        default:
            PIO_eprintf(interpreter, "Unknown command: \"%s\".", temp);
            break;
    }
}

/*

=item C<void
PDB_backtrace(Interp *interpreter)>

Prints a backtrace of the interpreter's call chain.

=cut

*/

void
PDB_backtrace(Interp *interpreter)
{
    STRING *str;
    PMC *sub;
    PMC *old = PMCNULL;
    int rec_level = 0;
    parrot_context_t *ctx;

    /* information about the current sub */
    sub = interpinfo_p(interpreter, CURRENT_SUB);
    ctx = CONTEXT(interpreter->ctx);
    if (!PMC_IS_NULL(sub)) {
        str = Parrot_Context_infostr(interpreter, ctx);
        if (str)
            PIO_eprintf(interpreter, "%Ss", str);
    }

    /* backtrace: follow the continuation chain */
    while (1) {
        sub = ctx->current_cont;
        if (!sub)
            break;
        str = Parrot_Context_infostr(interpreter,
            PMC_cont(sub)->to_ctx);
        if (!str)
            break;
        
        /* recursion detection */
        if (!PMC_IS_NULL(old) && PMC_cont(old) &&
            PMC_cont(old)->to_ctx->current_pc ==
            PMC_cont(sub)->to_ctx->current_pc &&
            PMC_cont(old)->to_ctx->current_sub ==
            PMC_cont(sub)->to_ctx->current_sub) {
                ++rec_level;
        } else if (rec_level != 0) {
            PIO_eprintf(interpreter, "... call repeated %d times\n", rec_level);
            rec_level = 0;
        }

        /* print the context description */
        if (rec_level == 0)
            PIO_eprintf(interpreter, "%Ss", str);

        /* get the next Continuation */
        ctx = PMC_cont(sub)->to_ctx;
        old = sub;
        if (!ctx || !ctx->prev)
            break;
    }
    if (rec_level != 0) {
        PIO_eprintf(interpreter, "... call repeated %d times\n", rec_level);
    }
}

/*

=back

=head1 SEE ALSO

F<include/parrot/debug.h>, F<src/pdb.c> and F<ops/debug.ops>.

=head1 HISTORY

Initial version by Daniel Grunblatt on 2002.5.19.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
