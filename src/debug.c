/*
 * debug.c
 *
 * CVS Info
 *    $Id$
 * Overview:
 *    Parrot debugger
 * History:
 *      Initial version by Daniel Grunblatt on 2002.5.19
 * Notes:
 * References:
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

/* nextarg
 *
 * Returns the position just past the current argument in a PASM
 * instruction. This is not the same as na(), above, which is intended
 * for debugger commands. This function is used for eval. */
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

/* skip_ws
 *
 * Returns the pointer past any whitespace */

static const char*
skip_ws(const char* str)
{
    while (*str && isspace((int) *str))
        str++;
    return str;
}

/* skip_command
 *
 * Returns the pointer past the current debugger command. (This is an
 * alternative to the na() macro above.) */

static const char*
skip_command(const char* str)
{
    while (*str && !isspace((int) *str))
        str++;
    while (*str && isspace((int) *str))
        str++;
    return str;
}

/* parse_int
 *
 * Parse an integer out of a string and return a pointer to just after
 * the int. */

static const char*
parse_int(const char* str, int* intP)
{
    char* end;

    *intP = strtol(str, &end, 0);

    return end;
}

/* parse_string
 *
 * Parse a double-quoted string out of a C string and return a pointer
 * to just after the string. The parsed string is converted to a
 * Parrot STRING. */
static const char*
parse_string(struct Parrot_Interp *interpreter,
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

    *strP = string_make(interpreter, string, str - string, NULL, 0, NULL);

    if (*str)
        str++;
    return str;
}

/* parse_key
 *
 * Parse an aggregate key out of a string and return a pointer to just
 * after the key. Currently only string and integer keys are
 * allowed. */
static const char*
parse_key(struct Parrot_Interp *interpreter, const char* str, PMC** keyP)
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

/* parse_command
 *
 * Convert the command at the beginning of a string into a numeric
 * value that can be used as a switch key for fast lookup. */
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

/* PDB_get_command(struct Parrot_Interp *interpreter)
 *
 * Get a command from the user input to execute.
 *
 * It saves the last command executed (in pdb->last_command), so it first
 * frees the old one and updates it with the current one.
 *
 * Also prints the next line to run if the program is still active.
 *
 * The user input can't be longer than 255 characters.
 *
 * The input is saved in pdb->cur_command.
 */
void
PDB_get_command(struct Parrot_Interp *interpreter)
{
    unsigned int i;
    char *c;
    PDB_t *pdb = interpreter->pdb;
    PDB_line_t *line;
    int ch;

    /* flush the buffered data */
    fflush(stdout);

    /* not used any more */
    if (pdb->last_command && *pdb->cur_command)
        mem_sys_free(pdb->last_command);

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

/* PDB_run_command(struct Parrot_Interp *interpreter, const char *command)
 *
 * Run a command.
 *
 * Hash the command to make a simple switch calling the correct handler.
 */
void
PDB_run_command(struct Parrot_Interp *interpreter, const char *command)
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
            PDB_print(interpreter, command);
            break;
        case c_s:
        case c_stack:
            PDB_print_stack(interpreter, command);
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

/* PDB_next(struct Parrot_Interp *interpreter, const char *command)
 *
 * Execute the next N operation(s).
 *
 * Inits the program if needed, runs the next N >= 1 operations and
 * stops.
 *
 */
void
PDB_next(struct Parrot_Interp *interpreter, const char *command)
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
    if (!pdb->cur_opcode)
        (void)PDB_program_end(interpreter);
}

/* PDB_trace
 *
 * Execute the next N operations; if no number is specified, it
 * defaults to 1.
 *
 */
void
PDB_trace(struct Parrot_Interp *interpreter,
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
                interpreter->code->byte_code,
                interpreter->code->byte_code +
                interpreter->code->cur_cs->base.size,
                interpreter->pdb->cur_opcode);
        DO_OP(pdb->cur_opcode,interpreter);
    }

    pdb->state |= PDB_STOPPED;

    /* If program ended */
    if (!pdb->cur_opcode)
        (void)PDB_program_end(interpreter);
}

/*  PDB_cond
 *
 *  Analyzes a condition from the user input.
 */
PDB_condition_t *
PDB_cond(struct Parrot_Interp *interpreter, const char *command)
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
            str, i - 1, NULL, PObj_external_FLAG, NULL);
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

/* PDB_watchpoint
 * set a watchpoint.
 */
void
PDB_watchpoint(struct Parrot_Interp *interpreter, const char *command)
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

/* PDB_set_break
 * set a break point, the source code file must be loaded.
 */
void
PDB_set_break(struct Parrot_Interp *interpreter, const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    PDB_breakpoint_t *newbreak = NULL, *sbreak;
    PDB_condition_t *condition;
    PDB_line_t *line;
    long ln,i;

    /* If no line number was specified set it at the current line */
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

/* PDB_init
 * init the program
 */
void
PDB_init(struct Parrot_Interp *interpreter, const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    PMC *userargv;
    STRING *arg;
    struct PackFile *code;
    unsigned long i;
    char c[256];
    void* stacktop = interpreter->lo_var_ptr;

    /* The bytecode is readonly, right? */
    code = interpreter->code;
    /* Destroy the old interpreter FIXME */
    free(interpreter);
    /* Get a new interpreter */
    interpreter = make_interpreter(interpreter, NO_FLAGS);
    interpreter->code = code;
    interpreter->pdb = pdb;
    interpreter->lo_var_ptr = stacktop;

    /* set the user arguments */
    userargv = pmc_new(interpreter, enum_class_PerlArray);
    interpreter->pmc_reg.registers[5] = userargv;

    while (command && *command) {
        i = 0;
        while (command[i] && !isspace((int) command[i])) {
            c[i] = command[i];
            i++;
        }
        c[i] = '\0';
        na(command);

        arg = string_make(interpreter, c, i, NULL, 0, NULL);
        VTABLE_push_string(interpreter, userargv, arg);
    }

    /* Restart if we are already running */
    if (pdb->state & PDB_RUNNING)
        PIO_eprintf(interpreter, "Restarting\n");

    /* Get the bytecode start */
    pdb->cur_opcode = interpreter->code->byte_code;
    /* Add the RUNNING state */
    pdb->state |= PDB_RUNNING;
}

/* PDB_continue
 *
 * Continue running the program. If a number is specified, skip
 * that many breakpoints.
 *
 */
void
PDB_continue(struct Parrot_Interp *interpreter,
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
 * exist or if no breakpoint was specified
 *
 */
PDB_breakpoint_t *
PDB_find_breakpoint(struct Parrot_Interp *interpreter,
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

/* PDB_disable_breakpoint
 *
 * Disable a breakpoint; it can be reenabled with the enable command
 *
 */
void
PDB_disable_breakpoint(struct Parrot_Interp *interpreter,
                       const char *command)
{
    PDB_breakpoint_t *breakpoint;

    breakpoint = PDB_find_breakpoint(interpreter, command);

    if (breakpoint) {
        breakpoint->skip = -1;
    }

    return;
}

/* PDB_enable_breakpoint
 *
 * Reenable a disabled breakpoint; if the breakpoint was not
 * disabled, has no effect
 *
 */
void
PDB_enable_breakpoint(struct Parrot_Interp *interpreter,
                      const char *command)
{
    PDB_breakpoint_t *breakpoint;

    breakpoint = PDB_find_breakpoint(interpreter, command);
    if (breakpoint && breakpoint->skip == -1) {
        breakpoint->skip = 0;
    }
    return;
}

/* PDB_delete_breakpoint
 * delete a breakpoint
 */
void
PDB_delete_breakpoint(struct Parrot_Interp *interpreter,
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

/* PDB_delete_condition
 * delete a condition associated with a breakpoint
 */
void
PDB_delete_condition(struct Parrot_Interp *interpreter,
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
        }
    }
    mem_sys_free(breakpoint->condition);
}

/* PDB_skip_breakpoint
 * skip i times all breakpoints.
 */
void
PDB_skip_breakpoint(struct Parrot_Interp *interpreter, long i)
{
    if (i == 0) {
        interpreter->pdb->breakpoint_skip = i;
    }
    else {
        interpreter->pdb->breakpoint_skip = i - 1;
    }
}

/* PDB_program_end
 * end the program
 */
char
PDB_program_end(struct Parrot_Interp *interpreter)
{
    PDB_t *pdb = interpreter->pdb;

    /* Remove the RUNNING state */
    pdb->state &= ~PDB_RUNNING;
    PIO_eprintf(interpreter, "Program exited.\n");
    return 1;
}

/* PDB_check_condition
 *
 * Returns TRUE if the condition was met.
 */
char
PDB_check_condition(struct Parrot_Interp *interpreter,
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

/* PDB_break
 * return true if we have to stop running
 */
char
PDB_break(struct Parrot_Interp *interpreter)
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

/* PDB_escape
 * escapes " \r \n \t \a and \\
 */
char *
PDB_escape(const char *string, INTVAL length)
{
    const char *end;
    char *new,*fill;

    length = length > 20 ? 20 : length;
    end = string + length;

    /* Return if there is no string to escape*/
    if (!string || !*string)
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

/* PDB_unescape
 * do inplace unescape of \r \n \t \a and \\
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

size_t
PDB_disassemble_op(struct Parrot_Interp *interpreter, char* dest, int space,
                   op_info_t* info, opcode_t* op,
                   PDB_file_t *file, opcode_t* code_start, int full_name)
{
    int size = 0;
    int j;
    char *p;

    /* Write the opcode name */
    p = file ? &dest[file->size] : dest;
    strcpy(p, full_name ? info->full_name : info->name);
    size += strlen(dest);

    dest[size++] = ' ';

    /* Concat the arguments */
    for (j = 1; j < info->arg_count; j++) {
        char buf[256];
        INTVAL i = 0;
        FLOATVAL f;
        PMC* k;

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
            /* If the opcode jumps and this is the last argument
               means this is a label */
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
                                    INTVAL_FMT, k->cache.int_val);
                    strcpy(&dest[size], buf);
                    size += strlen(buf);
                    break;
                case KEY_number_FLAG:
                    Parrot_snprintf(interpreter, buf, sizeof(buf),
                                    FLOATVAL_FMT, k->cache.num_val);
                    strcpy(&dest[size], buf);
                    size += strlen(buf);
                    break;
                case KEY_string_FLAG:
                    dest[size++] = '"';
                    {
                        char *temp = string_to_cstring(interpreter,
                                                       k->cache.string_val);
                        strcpy(&dest[size], temp);
                        string_cstring_free(temp);
                    }
                    size += string_length(k->cache.string_val);
                    dest[size++] = '"';
                    break;
                case KEY_integer_FLAG|KEY_register_FLAG:
                    Parrot_snprintf(interpreter, buf, sizeof(buf),
                                    "I" INTVAL_FMT, k->cache.int_val);
                    strcpy(&dest[size], buf);
                    size += strlen(buf);
                    break;
                case KEY_number_FLAG|KEY_register_FLAG:
                    Parrot_snprintf(interpreter, buf, sizeof(buf),
                                    "N" INTVAL_FMT, k->cache.int_val);
                    strcpy(&dest[size], buf);
                    size += strlen(buf);
                    break;
                case KEY_string_FLAG|KEY_register_FLAG:
                    Parrot_snprintf(interpreter, buf, sizeof(buf),
                                    "S" INTVAL_FMT, k->cache.int_val);
                    strcpy(&dest[size], buf);
                    size += strlen(buf);
                    break;
                case KEY_pmc_FLAG|KEY_register_FLAG:
                    Parrot_snprintf(interpreter, buf, sizeof(buf),
                                    "P" INTVAL_FMT, k->cache.int_val);
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
            break;
        }

        if (j != info->arg_count - 1)
            dest[size++] = ',';
    }

    dest[size] = '\0';
    return ++size;
}

/* PDB_disassemble
 * Disassemble the bytecode
 */
void
PDB_disassemble(struct Parrot_Interp *interpreter, const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    PDB_file_t *pfile;
    PDB_line_t *pline,*newline;
    PDB_label_t *label;
    opcode_t *code_end,*pc = interpreter->code->byte_code;

    const unsigned int default_size = 32768;
    const unsigned int regrow_size  = 32668;
    int space = 0;  /* How much space do we have? */

    pfile = (PDB_file_t *)mem_sys_allocate(sizeof(PDB_file_t));
    pline = (PDB_line_t *)mem_sys_allocate(sizeof(PDB_line_t));

    /* If we already got a source, free it */
    if (pdb->file)
        PDB_free_file(interpreter);

    pfile->source = (char *)mem_sys_allocate(default_size);
    pfile->line = pline;
    pfile->label = NULL;
    pfile->size = 0;
    pline->number = 1;

    code_end = pc + interpreter->code->cur_cs->base.size;
    while (pc != code_end) {
        /* Grow it early*/
        if (pfile->size % default_size < regrow_size) {
            pfile->source = mem_sys_realloc(pfile->source,
                                            (size_t)pfile->size
                                            + default_size);
            space += default_size;
        }

        pfile->size =
            PDB_disassemble_op(interpreter, pfile->source, space,
                               &interpreter->op_info_table[*pc], pc,
                               pfile, NULL, 1);
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

/* PDB_add_label
 * Add a label to the label list
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

/* PDB_free_file
 * Frees any allocated source files.
 */
void
PDB_free_file(struct Parrot_Interp *interpreter)
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

/* PDB_load_source
 * load a source code file
 */
void
PDB_load_source(struct Parrot_Interp *interpreter, const char *command)
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

/* PDB_hasinstruction
 * return true if the line has an instruction
 * XXX TODO:
 *  1- This should take the line get an instruction, get
 *     the opcode for that instruction and check that is
 *     the correct one.
 *  2- Decide what to do with macros if anything.
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

/* PDB_list
 * show lines from the source code file
 */
void
PDB_list(struct Parrot_Interp *interpreter, const char *command)
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

/* PDB_eval
 * evals an instruction
 */
void
PDB_eval(struct Parrot_Interp *interpreter, const char *command)
{
    opcode_t *run;
    struct PackFile *eval_pf;
    struct PackFile_ByteCode *old_cs;

    eval_pf = PDB_compile(interpreter, command);

    if (eval_pf) {
        old_cs = Parrot_switch_to_cs(interpreter, eval_pf->cur_cs);
        run = eval_pf->cur_cs->base.data;
        DO_OP(run,interpreter);
        Parrot_switch_to_cs(interpreter, old_cs);
       /* TODO destroy packfile */
    }
}

/* PDB_compile
 * compiles instructions with the PASM compiler
 * append an "end" op
 *
 * this may be called from PDB_eval above or from the compile opcode
 * which generates a malloced string
 */
struct PackFile *
PDB_compile(struct Parrot_Interp *interpreter, const char *command)
{
    STRING *buf;
    const char *end = "\nend\n";
    PMC * compiler, *code;
    PMC *key = key_new_cstring(interpreter, "PASM");
    PMC *compreg_hash = VTABLE_get_pmc_keyed_int(interpreter,
            interpreter->iglobals, IGLOBALS_COMPREG_HASH);

    compiler = VTABLE_get_pmc_keyed(interpreter, compreg_hash, key);
    if (!VTABLE_defined(interpreter, compiler)) {
        fprintf(stderr, "Couldn't find PASM compiler");
        return NULL;
    }
    buf = Parrot_sprintf_c(interpreter, "%s%s", command, end);

    code = VTABLE_invoke(interpreter, compiler, buf);
    return code->cache.struct_val;
}

/* PDB_extend_const_table
 * extend the constant table
 */
int
PDB_extend_const_table(struct Parrot_Interp *interpreter)
{
    int k;

    /* Update the constant count and reallocate */
    k = ++interpreter->code->const_table->const_count;
    interpreter->code->const_table->constants =
        mem_sys_realloc(interpreter->code->const_table->constants,
            k * sizeof(struct PackFile_Constant *));

    /* Allocate a new constant */
    interpreter->code->const_table->constants[--k] = PackFile_Constant_new();
    return k;
}

/* PDB_print_stack
 * print entries in the stack
 */
void
PDB_print_stack(struct Parrot_Interp *interpreter, const char *command)
{
    unsigned long c = 0;

    /* Print from the user stack? */
    if (!*command || isdigit((int) *command))
        PDB_print_user_stack(interpreter, command);
    else {
        parse_command(command, &c);

        switch (c) {
            case c_i:
            case c_int:
                na(command);
                PDB_print_stack_int(interpreter, command);
                break;
            case c_n:
            case c_num:
                na(command);
                PDB_print_stack_num(interpreter, command);
                break;
            case c_s:
            case c_str:
                na(command);
                PDB_print_stack_string(interpreter, command);
                break;
            case c_p:
            case c_pmc:
                na(command);
                PDB_print_stack_pmc(interpreter, command);
                break;
            default:
                PIO_eprintf(interpreter,
                            "Unknown argument \"%s\" to 'stack'\n", command);
                break;
        }
    }
}

/* PDB_print_stack_int
 * print the integer register stuck
 */
void
PDB_print_stack_int(struct Parrot_Interp *interpreter, const char *command)
{
    unsigned long depth = 0, i = 0;
    struct IRegChunk *chunk = interpreter->ctx.int_reg_top;

    valid_chunk(chunk, command, depth, FRAMES_PER_INT_REG_CHUNK, i);

    if (!chunk) {
        i = depth / FRAMES_PER_INT_REG_CHUNK;
        PIO_eprintf(interpreter, "There are only %li frames\n",i);
        return;
    }

    PIO_eprintf(interpreter, "Integer stack, frame %li, depth %li\n",
                i, depth);

    na(command);
    PDB_print_int_frame(interpreter, &chunk->IRegFrame[depth],
            atoi(command));
}

/* PDB_print_stack_num
 * print the float register stack
 */
void
PDB_print_stack_num(struct Parrot_Interp *interpreter, const char *command)
{
    unsigned long depth = 0, i = 0;
    struct NRegChunk *chunk = interpreter->ctx.num_reg_top;

    valid_chunk(chunk, command, depth, FRAMES_PER_NUM_REG_CHUNK, i);

    if (!chunk) {
        i = depth / FRAMES_PER_NUM_REG_CHUNK;
        PIO_eprintf(interpreter, "There are only %li frames\n",i);
        return;
    }

    PIO_eprintf(interpreter, "Float stack, frame %li, depth %li\n", i, depth);

    na(command);
    PDB_print_num_frame(interpreter, &chunk->NRegFrame[depth],
            atoi(command));
}

/* PDB_print_stack_string
 * print the string register stack
 */
void
PDB_print_stack_string(struct Parrot_Interp *interpreter, const char *command)
{
    unsigned long depth = 0, i = 0;
    struct SRegChunk *chunk = interpreter->ctx.string_reg_top;

    valid_chunk(chunk, command, depth, FRAMES_PER_STR_REG_CHUNK, i);

    if (!chunk) {
        i = depth / FRAMES_PER_STR_REG_CHUNK;
        PIO_eprintf(interpreter, "There are only %li frames\n",i);
        return;
    }

    PIO_eprintf(interpreter, "String stack, frame %li, depth %li\n",
                i, depth);

    na(command);
    PDB_print_string_frame(interpreter, &chunk->SRegFrame[depth],
            atoi(command));
}

/* PDB_print_stack_pmc
 * print the pmc register stack
 */
void
PDB_print_stack_pmc(struct Parrot_Interp *interpreter, const char *command)
{
    unsigned long depth = 0, i = 0;
    struct PRegChunk *chunk = interpreter->ctx.pmc_reg_top;

    valid_chunk(chunk, command, depth, FRAMES_PER_PMC_REG_CHUNK, i);

    if (!chunk) {
        i = depth / FRAMES_PER_PMC_REG_CHUNK;
        PIO_eprintf(interpreter, "There are only %li frames\n",i);
        return;
    }

    PIO_eprintf(interpreter, "PMC stack, frame %li, depth %li\n", i, depth);

    na(command);
    PDB_print_pmc_frame(interpreter, &chunk->PRegFrame[depth],
            atoi(command), NULL);
}

static void
dump_string(struct Parrot_Interp *interpreter, STRING* s)
{
    if (s) {
        PIO_eprintf(interpreter, "\tBuflen  =\t%12ld\n",s->buflen);
        PIO_eprintf(interpreter, "\tFlags   =\t%12ld\n", PObj_get_FLAGS(s));
        PIO_eprintf(interpreter, "\tBufused =\t%12ld\n",s->bufused);
        PIO_eprintf(interpreter, "\tStrlen  =\t%12ld\n",s->strlen);
        PIO_eprintf(interpreter, "\tOffset  =\t%12d\n",
                    (char*) s->strstart - (char*) s->bufstart);
        PIO_eprintf(interpreter, "\tString  =\t%S\n", s);
    }
}

/* PDB_print_user_stack
 * print an entry from the user stack
 */
void
PDB_print_user_stack(struct Parrot_Interp *interpreter, const char *command)
{
    long depth = 0;
    Stack_Chunk_t *chunk = interpreter->ctx.user_stack;
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
                        entry->entry.int_val);
            break;
        case STACK_ENTRY_FLOAT:
            PIO_eprintf(interpreter, "Float\t=\t%8.4vf\n",
                        entry->entry.num_val);
            break;
        case STACK_ENTRY_STRING:
            PIO_eprintf(interpreter, "String =\n");
            dump_string(interpreter, entry->entry.string_val);
            break;
        case STACK_ENTRY_PMC:
            PIO_eprintf(interpreter, "PMC =\n%PS\n", entry->entry.pmc_val);
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

/* PDB_print
 * print interpreter registers
 */
void
PDB_print(struct Parrot_Interp *interpreter, const char *command)
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

/* PDB_print_int
 * print the whole or a specific value of a integer register structure.
 */
void
PDB_print_int(struct Parrot_Interp *interpreter, struct IReg *int_reg,
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

/* PDB_print_int_frame
 * print the whole or a specific value of a integer register frame structure.
 */
void
PDB_print_int_frame(struct Parrot_Interp *interpreter,
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

/* PDB_print_num
 * print the whole or a specific value of a float register structure.
 */
void
PDB_print_num(struct Parrot_Interp *interpreter, struct NReg *num_reg,
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
void
PDB_print_num_frame(struct Parrot_Interp *interpreter,
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

/* PDB_print_string
 * print the whole or a specific value of a string register structure.
 */
void
PDB_print_string(struct Parrot_Interp *interpreter, struct SReg *string_reg,
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

/* PDB_print_string_frame
 * print the whole or a specific value of a string register frame structure.
 */
void
PDB_print_string_frame(struct Parrot_Interp *interpreter,
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

static void
print_pmc(struct Parrot_Interp *interpreter, PMC* pmc)
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

/* PDB_print_pmc
 * print the whole or a specific value of a PMC register structure.
 */
void
PDB_print_pmc(struct Parrot_Interp *interpreter, struct PReg *pmc_reg,
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

/* PDB_print_pmc_frame
 * print the whole or a specific value of a PMC register frame structure.
 */
void
PDB_print_pmc_frame(struct Parrot_Interp *interpreter,
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

/* PDB_info
 * print the interpreter info.
 */
void
PDB_info(struct Parrot_Interp *interpreter)
{
    PIO_eprintf(interpreter, "Total memory allocated = %d\n",
            interpinfo(interpreter, TOTAL_MEM_ALLOC));
    PIO_eprintf(interpreter, "DOD runs = %d\n",
            interpinfo(interpreter, DOD_RUNS));
    PIO_eprintf(interpreter, "Collect runs = %d\n",
            interpinfo(interpreter, COLLECT_RUNS));
    PIO_eprintf(interpreter, "Collect memory = %d\n",
            interpinfo(interpreter, TOTAL_COPIED));
    PIO_eprintf(interpreter, "Active PMCs = %d\n",
            interpinfo(interpreter, ACTIVE_PMCS));
    PIO_eprintf(interpreter, "Active buffers = %d\n",
            interpinfo(interpreter, ACTIVE_BUFFERS));
    PIO_eprintf(interpreter, "Total PMCs = %d\n",
            interpinfo(interpreter, TOTAL_PMCS));
    PIO_eprintf(interpreter, "Total buffers = %d\n",
            interpinfo(interpreter, TOTAL_BUFFERS));
    PIO_eprintf(interpreter, "Header allocations since last collect = %d\n",
            interpinfo(interpreter, HEADER_ALLOCS_SINCE_COLLECT));
    PIO_eprintf(interpreter, "Memory allocations since last collect = %d\n",
            interpinfo(interpreter, MEM_ALLOCS_SINCE_COLLECT));
}

/* PDB_help
 * Print the help text. "Help" with no arguments prints a list of commands.
 * "Help xxx" prints information on command xxx.
 */
void
PDB_help(struct Parrot_Interp *interpreter, const char *command)
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
        case c_stack:
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
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
