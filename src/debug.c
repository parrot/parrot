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

#include "parrot/parrot.h"
#include "parrot/interp_guts.h"
#include "parrot/trace.h"
#include "parrot/debug.h"
#include <stdio.h>
#include <stdlib.h>

/* PDB_get_command
 * get a command from stdin to execute
 */
void
PDB_get_command(struct Parrot_Interp *interpreter)
{
    unsigned int i = 0;
    char *c;
    PDB_t *pdb = interpreter->pdb;
    PDB_line_t *line; 

    /* flush the buffered data */
    fflush(stdout);

    /* not used any more */ 
    if (pdb->last_command && *pdb->cur_command)
        mem_sys_free(pdb->last_command);

    /* update the last command */
    if (pdb->cur_command && *pdb->cur_command)
        pdb->last_command = pdb->cur_command;

    /* if the program is stopped and running show the next line to run */
    if ((pdb->state & PDB_STOPPED) && (pdb->state & PDB_RUNNING))
    {
        line = pdb->file->line;

        while (pdb->cur_opcode != line->opcode)
            line = line->next;
        
        fprintf(stderr,"\n%li  ",line->number); 
        c = pdb->file->source + line->source_offset;
        while (*c != '\n'  && c)
            fprintf(stderr,"%c",*(c++));
        fprintf(stderr,"\n");
    }

    i = 1;

    c = (char *)mem_sys_allocate(255);

    fprintf(stderr,"\n(pdb) ");

    *c = fgetc(stdin);

    while((c[i - 1] !=  '\n') && (i < 255))
        c[i++] = fgetc(stdin);

    c[--i] = '\0';
    
    pdb->cur_command = c;
}
        
/* PDB_run_command
 * run a command
 */
void
PDB_run_command(struct Parrot_Interp *interpreter,
                const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    int i;
    unsigned long c = 0;

    /* get a number from what the user typed */
    for (i = 0; ((command[i] != 32) && command[i]) ; i++)
        c += (command[i] + (i + 1)) * ((i + 1) * 255);

    switch(c) {
        case c_disassemble:
            na(command);
            PDB_disassemble(interpreter,command);
            break;
        case c_load:
            na(command);
            PDB_load_source(interpreter,command);
            break;
        case c_l:
        case c_list:
            na(command);
            PDB_list(interpreter,command);
            break;
        case c_b:
        case c_break:
            na(command);
            PDB_set_break(interpreter,command);
            break;
        case c_d:
        case c_delete:
            na(command);
            PDB_delete_breakpoint(interpreter,command);
            break;
        case c_r:
        case c_run:
            na(command);
            PDB_run(interpreter,command);
            break;
        case c_c:
        case c_continue:
            na(command);
            PDB_continue(interpreter,command);
            break;
        case c_p:
        case c_print:
            na(command);
            PDB_print(interpreter,command);
            break;
        case c_s:
        case c_stack:
            na(command);
            PDB_print_stack(interpreter,command);
            break;
        case c_n:
        case c_next:
            na(command);
            PDB_next(interpreter,command);
            break;
        case c_t:
        case c_trace:
            na(command);
            PDB_trace(interpreter,command);
            break;
        case c_h:
        case c_help:
            na(command);
            PDB_help(command);
            break;
        case c_q:
        case c_quit:
            pdb->state |= PDB_EXIT;
            break;
        case 0:
            PDB_run_command(interpreter,pdb->last_command);
            break;
        default:
            fprintf(stderr,"Undefined command: \"%s\".  Try \"help\".",
                                                                 command);
            break;
    }
}

/* PDB_next
 * execute the next instruction
 */
void
PDB_next(struct Parrot_Interp *interpreter,
         const char *command)
{
    unsigned long n = 1;

    if (!(interpreter->pdb->state & PDB_RUNNING))
    {
        fprintf(stderr,"The program is not being run.\n");
        return;
    }
    
    if (command && isdigit(*command))
        n = atol(command);

    for ( ; n && interpreter->pdb->cur_opcode; n--)
        DO_OP(interpreter->pdb->cur_opcode,interpreter);

    /* If program ended */
    if (!interpreter->pdb->cur_opcode)
        PDB_program_end(interpreter);
}

/* PDB_trace
 * execute the next instruction
 */
void
PDB_trace(struct Parrot_Interp *interpreter,
          const char *command)
{
    unsigned long n = 1;
 
    if (!(interpreter->pdb->state & PDB_RUNNING))
    {
        fprintf(stderr,"The program is not being run\n");
        return;
    }
   
    if (command && isdigit(*command))
        n = atol(command);

    for ( ; n && interpreter->pdb->cur_opcode; n--)
    {
        trace_op(interpreter, 
                interpreter->code->byte_code,
                interpreter->code->byte_code + 
                interpreter->code->byte_code_size / sizeof(opcode_t),
                interpreter->pdb->cur_opcode);
        DO_OP(interpreter->pdb->cur_opcode,interpreter);
    }

    /* If program ended */
    if (!interpreter->pdb->cur_opcode)
        PDB_program_end(interpreter);
}

/* PDB_set_break
 * set a break point, the source code file must be loaded.
 */
void
PDB_set_break(struct Parrot_Interp *interpreter,
              const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    PDB_breakpoint_t *newbreak,*sbreak;
    PDB_line_t *line;
    long ln,i;

    /* If the source is not loaded (or disassembled) return */
    if (!(pdb->state & PDB_SRC_LOADED))
    {
        fprintf(stderr,"Source not loaded. Try \"help\".");
        return;
    }
    /* If no line number was specified set it at the current line */
    if (command && *command)
    {
        ln = atol(command);
        /* Move to the line where we will set the break point */
        line = pdb->file->line;
        for (i = 1; ((i < ln) && (line->next)); i++)
            line = line->next;
    }
    else {
        /* Update cur_line */
        line = pdb->file->line;
        while (line->opcode != pdb->cur_opcode)
            line = line->next;
    }
   
    /* Abort if the line number provided doesn't exists */
    if (!line->next)
    {
        fprintf(stderr,"Can't set a breakpoint at line number %li\n",ln);
        return;
    }
        
    /* Skip lines that are not related to an opcode */
    while (!line->opcode)
        line = line->next;

    /* Search if we got a breakpoint at that line  */
    i = 0;
    sbreak = pdb->breakpoint; 
    while(sbreak && sbreak->pc != line->opcode)
    {
        sbreak = sbreak->next;
        i++;
    }

    /* Revive the breakpoint if was deleted */
    if (sbreak && sbreak->skip == -1)
    { 
        fprintf(stderr,"Breakpoint %li at line %li\n",i,line->number);
        sbreak->skip = 0;
        return;
    }
    /* Don't do anything if there is already a breakpoint at this line */
    if (sbreak)
    {
        fprintf(stderr,"Breakpoint %li already at line %li\n",i,line->number);
        return;
    }
        
    /* Allocate the new break point */
    newbreak = (PDB_breakpoint_t *)mem_sys_allocate(sizeof(PDB_breakpoint_t));

    /* Set the address where to stop */
    newbreak->pc = line->opcode;
    /* No next breakpoint */
    newbreak->next = NULL;

    /* Add the breakpoint to the end of the list */
    i = 0;
    sbreak = pdb->breakpoint;
    if (sbreak)
    {
        i++;
        while(sbreak->next)
        {
            sbreak = sbreak->next;
            i++;
        }
        sbreak->next = newbreak;
    }
    else {
        pdb->breakpoint = newbreak;
    }

    fprintf(stderr,"Breakpoint %li at line %li\n",i,line->number);
}

/* PDB_run
 * run the program
 */
void
PDB_run(struct Parrot_Interp *interpreter,
        const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    PMC *userargv;
    KEY key;
    STRING *arg;
    struct PackFile *code;
    unsigned long i,j = 1;
    char c[256];
    
    /* The bytecode is readonly, right? */
    code = interpreter->code;
    /* Destroy the old interpreter FIXME */
    free(interpreter);
    /* Get a new interpreter */
    interpreter = make_interpreter(NO_FLAGS);
    interpreter->code = code;
    interpreter->pdb = pdb;

    /* set the user arguments */
    userargv = pmc_new(interpreter, enum_class_PerlArray);
    interpreter->pmc_reg.registers[0] = userargv;

    key.atom.type = enum_key_int;
    key.next = NULL;

    while (*command)
    {
        i = 0;
        while (command[i] && !isspace(command[i]))
            c[i] = command[i++];
        c[i] = '\0';
        na(command);

        arg = string_make(interpreter, c, i, NULL, 
                          BUFFER_external_FLAG, NULL);
        key.atom.val.int_val = j++;
        userargv->vtable->set_string_keyed(interpreter, userargv, &key, arg);
    }

    /* Restart if we are already running */
    if (pdb->state & PDB_RUNNING)
        fprintf(stderr,"Restating\n");

    /* Get the bytecode start */
    pdb->cur_opcode = interpreter->code->byte_code;
    /* Add the RUNNING state */
    pdb->state |= PDB_RUNNING;

    /* run */
    PDB_continue(interpreter, command);
}

/* PDB_continue
 * continue running the program
 */
void
PDB_continue(struct Parrot_Interp *interpreter,
             const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    long ln;

    /* Skip any breakpoint? */
    if (*command)
    {
        if (!pdb->breakpoint)
        {
            fprintf(stderr,"No breakpoints to skip\n");
            return;
        }
        ln = atol(command);
        PDB_skip_breakpoint(interpreter,ln);
    }
    /* Run while no break point is reached */
    while(!PDB_break(interpreter))     
        DO_OP(pdb->cur_opcode,interpreter);
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
    long n;

    if (isdigit(*command))
    {
        n = atol(command);
        breakpoint = interpreter->pdb->breakpoint;
        while(breakpoint && n--)
            breakpoint = breakpoint->next;
        line = interpreter->pdb->file->line;
        while(line->opcode != breakpoint->pc)
            line = line->next;

        breakpoint->skip = -1;
    }
}

/* PDB_skip_breakpoint
 * skip i times the current breakpoint.
 */
void
PDB_skip_breakpoint(struct Parrot_Interp *interpreter,
                    long i)
{
    PDB_t *pdb = interpreter->pdb;
    PDB_breakpoint_t *cur_breakpoint;

    cur_breakpoint = pdb->breakpoint;
    /* If we're here meens we are STOPPED on a break point */
    while(cur_breakpoint->pc != pdb->cur_opcode)
        cur_breakpoint = pdb->breakpoint->next;
        
    /* Skip the next i - 1 runs of this break point */
    cur_breakpoint->skip = i - 1;
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
    fprintf(stderr,"Program exited.\n");
    return 1;
}

/* PDB_break
 * return true if we have to stop running
 */
char
PDB_break(struct Parrot_Interp *interpreter)
{
    PDB_t *pdb = interpreter->pdb;
    PDB_breakpoint_t *breakpoint = pdb->breakpoint;

    /* If program ended */
    if (!pdb->cur_opcode)
        return PDB_program_end(interpreter);

    /* If the program is STOPPED allow it to continue */
    if (pdb->state & PDB_STOPPED)
    {
        pdb->state &= ~PDB_STOPPED;
        return 0;
    }

    while(breakpoint)
    {
        /* if we are in a break point */
        if (pdb->cur_opcode == breakpoint->pc)
        {
            /* if we must skip it */
            if (breakpoint->skip > 0)
            {
                /* update the skip counter */
                breakpoint->skip--;
                return 0;
            }
            if (breakpoint->skip < 0)
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
 * escapes \r \n \t \a and \\
 */
char *
PDB_escape(const char *string)
{
    char *new,*fill;

    fill = new = (char *)mem_sys_allocate(strlen(string) * 2);

    for ( ; *string; string++)
    {
        switch (*string)
        {
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
            default:
                *(fill++) = *string;
                break;
        }
    }
    *fill = '\0';
    return new;
}
                
/* PDB_disassemble
 * Disassemble the bytecode
 */
void
PDB_disassemble(struct Parrot_Interp *interpreter,
                const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    PDB_file_t *pfile;
    PDB_line_t *pline,*newline;
    PDB_label_t *label;
    opcode_t *code_end,*pc = interpreter->code->byte_code;
    STRING *s;
    FLOATVAL f;
    unsigned long size = 0, label_count = 0;
    char buf[256];
    char *ptr,*escaped;
    int neg = 0, j;
    long i;

    pfile = (PDB_file_t *)mem_sys_allocate(sizeof(PDB_file_t));
    pline = (PDB_line_t *)mem_sys_allocate(sizeof(PDB_line_t));
    
    /* If we already got a source, free it */
    if (pfile->source)
        mem_sys_free(pfile->source);
        
    pfile->source = (char *)mem_sys_allocate(32768);
    pfile->line = pline;
    pline->number = 1;

    code_end = pc + interpreter->code->byte_code_size / sizeof(opcode_t);
    while(pc != code_end)
    {
        /* Grow it early*/
        if (pfile->size % 32768 < 100 )
        {
            pfile->source = mem_sys_realloc(pfile->source,
                                            (size_t)pfile->size + 32768);
        }
 
        /* Write the full opcode name */
        strcpy(&pfile->source[pfile->size],
               interpreter->op_info_table[*pc].full_name);
        pfile->size += strlen(interpreter->op_info_table[*pc].full_name);

        pfile->source[pfile->size++] = ' ';
        /* Concat the arguments */
        for(j = 1; j < interpreter->op_info_table[*pc].arg_count; j++)
        {
            neg = i = 0;
            switch(interpreter->op_info_table[*pc].types[j])
            {
                /* If the argument is a register
                   or an integer constant */ 
                case PARROT_ARG_I:
                    pfile->source[pfile->size++] = 'I';
                    goto INTEGER;
                case PARROT_ARG_N:
                    pfile->source[pfile->size++] = 'N';
                    goto INTEGER;
                case PARROT_ARG_S:
                    pfile->source[pfile->size++] = 'S';
                    goto INTEGER;
                case PARROT_ARG_P:
                    pfile->source[pfile->size++] = 'P';
                    goto INTEGER;
                case PARROT_ARG_IC:
                    /* If the opcode jumps and this is the last argument
                       means this is a label */
                    if ((j == interpreter->op_info_table[*pc].arg_count - 1) &&
                       (interpreter->op_info_table[*pc].jump &
                        PARROT_JUMP_RELATIVE))
                    {
                        i = PDB_add_label(pfile,pc,pc[j]);
                        pfile->source[pfile->size++] = 'L';
                    }
                    /* Stolen from string.c */
                    /* Convert the integer to a string */
                INTEGER:
                    if (i == 0)
                        i = (long)pc[j];
                    ptr = &buf[255];
                    if(i < 0) {
                        neg = 1;
                        i = -i;
                    }
                    do {
                        *--ptr = (char)('0' + i % 10);
                    } while(i /= 10);
                    if(neg)
                        *--ptr = '-';
                    strncpy(&pfile->source[pfile->size],ptr,
                            (size_t)(255 - (ptr - buf)));
                    pfile->size += 255 - (ptr - buf);
                    break;
                case PARROT_ARG_NC:
                    /* Convert the float to a string */
                    f=interpreter->code->const_table->constants[pc[j]]->number;
#ifdef HAS_SNPRINTF
                    snprintf(buf, sizeof(buf), FLOATVAL_FMT, f);
#else
                    sprintf(buf, FLOATVAL_FMT, f);  /* XXX buffer overflow! */
#endif
                    strcpy(&pfile->source[pfile->size],buf);
                    pfile->size += strlen(buf);
                    break;
                case PARROT_ARG_SC:
                    pfile->source[pfile->size++] = '"';
                    if (interpreter->code->const_table->
                        constants[pc[j]]->string->strlen)
                    {
                        escaped = PDB_escape(interpreter->code->const_table->
                                         constants[pc[j]]->string->bufstart);
                        strcpy(&pfile->source[pfile->size],escaped);
                        pfile->size += strlen(escaped);
                        mem_sys_free(escaped);
                    }
                    pfile->source[pfile->size++] = '"';
                    break;
                default:
                    break;
            }
            pfile->source[pfile->size++] = ',';
        }
        pfile->source[pfile->size - 1] = '\n';

        /* Store the opcode of this line */
        pline->opcode = pc;
        pc += interpreter->op_info_table[*pc].arg_count;
        /* Prepare for next line */
        newline = (PDB_line_t *)mem_sys_allocate(sizeof(PDB_line_t));
        newline->number = pline->number + 1;
        pline->next = newline;
        pline = newline;
        pline->source_offset = pfile->size; 
    }

    /* Add labels to the lines they belong to */
    label = pfile->label;
    while(label)
    {
        /* Get the line to apply the label */
        pline = pfile->line;
        while(pline && pline->opcode != label->opcode)
            pline = pline->next;

        if (!(pline))
        {
            fprintf(stderr,"Label number %li out of bounds.\n",label->number);
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
PDB_add_label(PDB_file_t *file,
              opcode_t *cur_opcode,
              opcode_t offset)
{
    PDB_label_t *new, *label = file->label;

    /* See if there is already a label at this line */
    if (label)
    {
        while(label)
        {
            if (label->opcode == cur_opcode + offset)
                return label->number;
            label = label->next;
        }
    }
    /* Allocate a new label */
    label = file->label;
    new = (PDB_label_t *)mem_sys_allocate(sizeof(PDB_label_t));
    new->opcode = cur_opcode + offset;
    if (label) {
        while(label->next)
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

/* PDB_load_source
 * load a source code file
 */
void
PDB_load_source(struct Parrot_Interp *interpreter,
                const char *command)
{
    FILE *file; 
    char f[255],c;
    int i;
    unsigned long size = 0;
    PDB_t *pdb = interpreter->pdb;
    PDB_file_t *pfile;
    PDB_line_t *pline,*newline;
    opcode_t *pc = pdb->cur_opcode;

    /* Get the name of the file*/
    for (i = 0; command[i]; i++)
        f[i] = command[i];

    f[i] = '\0';
    /* open the file */
    file = fopen(f,"r");

    /* abort if fopen failed */
    if (!file)
    {
        fprintf(stderr,"Unable to load %s\n", f);
        return;
    }

    pfile = (PDB_file_t *)mem_sys_allocate(sizeof(PDB_file_t));
    pline = (PDB_line_t *)mem_sys_allocate(sizeof(PDB_line_t));
    
    pfile->source = (char *)mem_sys_allocate(1024);
    pfile->line = pline;
    pline->number = 1;

    while (!feof(file))
    {
        c = fgetc(file);
        /* Grow it */
        if (++size == 1024)
        {
            pfile->source = mem_sys_realloc(pfile->source,
                                            (size_t)pfile->size + 1024);
            size = 0;
        }
        pfile->source[pfile->size] = c;

        pfile->size++;

        if (c == '\n')
        {
            /* If the line has an opcode move to the next one,
               otherwise leave it with NULL to skip it. */
            if (PDB_hasinstruction(pfile->source + pline->source_offset))
            {
                pline->opcode = pc;
                pc += interpreter->op_info_table[*pc].arg_count;
            }
            newline = (PDB_line_t *)mem_sys_allocate(sizeof(PDB_line_t));
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
 * TODO do it properly
 */
char
PDB_hasinstruction(char *c)
{
    char h = 0;

    while (*c && *c != '#' && *c != '\n') {
        if (isalnum(*c) || *c == '"')
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
PDB_list(struct Parrot_Interp *interpreter,
         const char *command)
{
    char *c;
    unsigned long i,n = 10;
    PDB_t *pdb = interpreter->pdb;
    PDB_line_t *line;

    /* set the list line if provided */
    if (isdigit(*command))
    {
        pdb->file->list_line = atol(command) - 1;
        na(command);
    }

    /* set the number of lines to print */
    if (isdigit(*command))
    {
        n = atol(command);
        na(command);
    }

    line = pdb->file->line;

    for (i = 0; i < pdb->file->list_line; i++)
        line = line->next;

    i = 1;
    while (line->next)
    {
        fprintf(stderr,"%li  ",pdb->file->list_line + i); 
        /* If it has a label print it */
        if (line->label)
            fprintf(stderr,"L%li:\t",line->label->number);
        c = pdb->file->source + line->source_offset;
        while (*c != '\n')
            fprintf(stderr,"%c",*(c++));
        fprintf(stderr,"\n");
        line = line->next;
        if (i++ == n)
            break;
    }

    if (--i != n)
        pdb->file->list_line = 0;
    else 
        pdb->file->list_line += n;
}

/* PDB_print_stack
 * print entries in the stack
 */
void
PDB_print_stack(struct Parrot_Interp *interpreter,
                const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    int i;
    unsigned long c = 0;

    /* Print from the user stack? */
    if (!*command || isdigit(*command))
        PDB_print_user_stack(interpreter,command);
    else
    {
        for (i = 0; ((command[i] != 32) && command[i]) ; i++)
            c += (command[i] + (i + 1)) * ((i + 1) * 255);

        switch(c) {
            case c_i:
            case c_int:
                na(command);
                PDB_print_stack_int(interpreter,command);
                break;
            case c_n:
            case c_next:
                na(command);
                PDB_print_stack_num(interpreter,command);
                break;
            case c_s:
            case c_str:
                na(command);
                PDB_print_stack_string(interpreter,command);
                break;
            case c_p:
            case c_pmc:
                na(command);
                PDB_print_stack_pmc(interpreter,command);
                break;
            default:
                fprintf(stderr,"Unknown argument \"%s\" to 'stack'\n",command);
                break;
        }
    }
}

/* PDB_print_stack_int
 * print the integer register stuck
 */
void
PDB_print_stack_int(struct Parrot_Interp *interpreter,
                    const char *command)
{
    unsigned long depth = 0, i = 0;
    struct IRegChunk *chunk = interpreter->int_reg_top;

    valid_chunk(chunk, command, depth, FRAMES_PER_INT_REG_CHUNK, i);

    if (!chunk)
    {
        i = depth / FRAMES_PER_INT_REG_CHUNK;
        fprintf(stderr,"There are only %li frames\n",i);
        return;
    }
    
    fprintf(stderr,"Integer stack, frame %li, depth %li\n", i, depth);

    na(command);
    PDB_print_int(&chunk->IReg[depth],command);
}

/* PDB_print_stack_num
 * print the float register stack
 */
void
PDB_print_stack_num(struct Parrot_Interp *interpreter,
                    const char *command)
{
    unsigned long depth = 0, i = 0;
    struct NRegChunk *chunk = interpreter->num_reg_top;

    valid_chunk(chunk, command, depth, FRAMES_PER_NUM_REG_CHUNK, i);

    if (!chunk)
    {
        i = depth / FRAMES_PER_NUM_REG_CHUNK;
        fprintf(stderr,"There are only %li frames\n",i);
        return;
    }
    
    fprintf(stderr,"Float stack, frame %li, depth %li\n", i, depth);

    na(command);
    PDB_print_num(&chunk->NReg[depth],command);
}

/* PDB_print_stack_string
 * print the string register stack
 */
void
PDB_print_stack_string(struct Parrot_Interp *interpreter,
                       const char *command)
{
    unsigned long depth = 0, i = 0;
    struct SRegChunk *chunk = interpreter->string_reg_top;

    valid_chunk(chunk, command, depth, FRAMES_PER_STR_REG_CHUNK, i);

    if (!chunk)
    {
        i = depth / FRAMES_PER_STR_REG_CHUNK;
        fprintf(stderr,"There are only %li frames\n",i);
        return;
    }
    
    fprintf(stderr,"String stack, frame %li, depth %li\n", i, depth);

    na(command);
    PDB_print_string(interpreter,&chunk->SReg[depth],command);
}

/* PDB_print_stack_pmc
 * print the pmc register stack
 */
void
PDB_print_stack_pmc(struct Parrot_Interp *interpreter,
                    const char *command)
{
    unsigned long depth = 0, i = 0;
    struct PRegChunk *chunk = interpreter->pmc_reg_top;

    valid_chunk(chunk, command, depth, FRAMES_PER_PMC_REG_CHUNK, i);

    if (!chunk)
    {
        i = depth / FRAMES_PER_PMC_REG_CHUNK;
        fprintf(stderr,"There are only %li frames\n",i);
        return;
    }
    
    fprintf(stderr,"PMC stack, frame %li, depth %li\n", i, depth);

    na(command);
    PDB_print_pmc(interpreter,&chunk->PReg[depth],command);
} 

/* PDB_print_user_stack
 * print an entry from the user stack
 */
void
PDB_print_user_stack(struct Parrot_Interp *interpreter,
                     const char *command)
{
    unsigned long depth = 0,i;
    Stack_chunk *chunk = interpreter->user_stack;
    Stack_entry *entry;
    STRING *s;

    valid_chunk(chunk, command, depth, STACK_CHUNK_DEPTH, i);
    
    entry = &chunk->entry[depth];

    switch (entry->entry_type) {
        case STACK_ENTRY_INT:
            fprintf(stderr,"Integer\t=\t%8li\n",entry->entry.int_val);
            break;
        case STACK_ENTRY_FLOAT:
            fprintf(stderr,"Float\t=\t%8.4f\n",entry->entry.num_val);
            break;
        case STACK_ENTRY_STRING:
            s = entry->entry.string_val;
            fprintf(stderr,"String =\n");
            fprintf(stderr,"\tBuflen  =\t%8ld\n",s->buflen);
            fprintf(stderr,"\tFlags   =\t%8ld\n",s->flags);
            fprintf(stderr,"\tBufused =\t%8ld\n",s->bufused);
            fprintf(stderr,"\tStrlen  =\t%8ld\n",s->strlen);
            fprintf(stderr,"\tString  =\t%s\n",
                    string_to_cstring(interpreter, s));
            break;
        case STACK_ENTRY_PMC:
            fprintf(stderr,"PMC =\n");
            s = (entry->entry.pmc_val->vtable->get_string(
                 interpreter, entry->entry.pmc_val));

            if (s) {
                fprintf(stderr,"%s\n", string_to_cstring(interpreter, (s)));
            }
            break;
        case STACK_ENTRY_POINTER:
            fprintf(stderr,"POINTER\n");
            break;
        case STACK_ENTRY_DESTINATION:
            fprintf(stderr,"DESTINATION\n");
            break;
        default:
            fprintf(stderr,"Invalid stack_entry_type!\n");
            break;
    }
}
  

/* PDB_print
 * print interpreter registers
 */
void
PDB_print(struct Parrot_Interp *interpreter,
          const char *command)
{
    PDB_t *pdb = interpreter->pdb;
    int i;
    unsigned long c = 0;

    for (i = 0; ((command[i] != 32) && command[i]) ; i++)
        c += (command[i] + (i + 1)) * ((i + 1) * 255);

    switch(c) {
        case c_i:
        case c_int:
            na(command);
            PDB_print_int(&interpreter->int_reg,command);
            break;
        case c_n:
        case c_num:
            na(command);
            PDB_print_num(&interpreter->num_reg,command);
            break;
        case c_s:
        case c_str:
            na(command);
            PDB_print_string(interpreter,&interpreter->string_reg,command);
            break;
        case c_p:
        case c_pmc:
            na(command);
            PDB_print_pmc(interpreter,&interpreter->pmc_reg,command);
            break;
    }
}

/* PDB_print_int
 * print the whole or a specific value of a integer register structure.
 */
void
PDB_print_int(struct IReg *int_reg,
              const char *command)
{
    int i,j = 0, k = NUM_REGISTERS;

    if (command && *command)
    {
        j = atoi(command);
        k = j + 1;
    }

    fprintf(stderr,"Integer Registers:\n");
    for (i = j; i < k; i++)
    {
        fprintf(stderr,"%2i =\t",i);
        fprintf(stderr,"%11li\n",int_reg->registers[i]);
    }
}

/* PDB_print_num
 * print the whole or a specific value of a float register structure.
 */
void
PDB_print_num(struct NReg *num_reg,
              const char *command)
{
    int i,j = 0, k = NUM_REGISTERS;

    if (command && *command)
    {
        j = atoi(command);
        k = j + 1;
    }

    fprintf(stderr,"Float Registers:\n");
    for (i = j; i < k; i++)
    {
        fprintf(stderr,"%2i =\t",i);
        fprintf(stderr,"%20.4f\n",num_reg->registers[i]);
    }
}

/* PDB_print_string
 * print the whole or a specific value of a string register structure.
 */
void
PDB_print_string(struct Parrot_Interp *interpreter,
                 struct SReg *string_reg,
                 const char *command)
{
    int i,j = 0, k = NUM_REGISTERS;
    STRING *s;

    if (command && *command)
    {
        j = atoi(command);
        k = j + 1;
    }
        
    fprintf(stderr,"String Registers:\n");
    for (i = j; i < k; i++)
    {
        fprintf(stderr,"%2i =\n",i);
        s = string_reg->registers[i];
        if (s)
        {
            fprintf(stderr,"\tBuflen  =\t%12ld\n",s->buflen);
            fprintf(stderr,"\tFlags   =\t%12ld\n",s->flags);
            fprintf(stderr,"\tBufused =\t%12ld\n",s->bufused);
            fprintf(stderr,"\tStrlen  =\t%12ld\n",s->strlen);
            fprintf(stderr,"\tString  =\t%s\n",
                            string_to_cstring(interpreter, s));
        }
    }
}

/* PDB_print_pmc
 * print the whole or a specific value of a pmc register structure.
 */
void
PDB_print_pmc(struct Parrot_Interp *interpreter,
              struct PReg *pmc_reg,
              const char *command)
{
    int i,j = 0, k = NUM_REGISTERS;
    STRING *s;

    if (command && *command)
    {
        j = atoi(command);
        k = j + 1;
    }

    fprintf(stderr,"PMC Registers:\n");
    for (i = j; i < k; i++)
    {
        fprintf(stderr,"%2i =\n",i);
        if (pmc_reg->registers[i] && pmc_reg->registers[i]->vtable) {
            s = (pmc_reg->registers[i]->vtable->get_string(
                 interpreter, pmc_reg->registers[i]));

            if (s) {
                fprintf(stderr,"%s\n", string_to_cstring(interpreter, (s)));
            }
        }
    }
}

/* PDB_help
 * print the help
 * TODO complete me.
 */
void
PDB_help(const char *command)
{
    fprintf(stderr,"List of commands:\n");
    fprintf(stderr,"\tdisassemble -- disassemble the bytecode\n");
    fprintf(stderr,"\tload -- load a source code file\n");
    fprintf(stderr,"\tlist (l) -- list the source code file\n");
    fprintf(stderr,"\trun (r) -- run the programm\n");
    fprintf(stderr,"\tbreak (b) -- add a breakpoint\n");
    fprintf(stderr,"\tdelete (d) -- delete a breakpoint\n");
    fprintf(stderr,"\tcontinue (c) -- continue the program execution\n");
    fprintf(stderr,"\tnext (n) -- run the next instruction\n");
    fprintf(stderr,"\ttrace (t) -- trace the next instruction\n");
    fprintf(stderr,"\tprint (p) -- print the interpreter registers\n");
    fprintf(stderr,"\tstack (s) -- examine the stack\n");
    fprintf(stderr,"\tquit (q) -- exit the debugger\n");
    fprintf(stderr,"\thelp (h) -- print this help\n\n");
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
