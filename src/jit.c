/*
** jit.c
**
** $Id$
*/

#include <parrot/parrot.h>
#include "parrot/jit.h"

opcode_assembly_t op_assembly[458]= {
#include "parrot/jit_struct.h"
};


/* Don't ever count on any info here */

INTVAL temp_intval[10];
char temp_char[100];


/* Constants */

INTVAL const_intval[3]         = { (INTVAL)0,(INTVAL)0,(INTVAL)0 };
FLOATVAL floatval_constants[1] = { 1000000.0 };
char char_constants[] = "%f";

INTVAL *op_real_address; 

/*
** build_asm()
*/

jit_f
build_asm(struct Parrot_Interp *interpreter,opcode_t *pc, opcode_t *code_start, opcode_t *code_end)
{
    char *arena, *arena_start;
    INTVAL *address,ivalue,size,i,k;
    INTVAL *op_address, prev_address, bytecode_position;

    /* temporary variables */

    substitution_t v;
    string_substitution_t sv;
    temp_int_substitution_t tiv;
    STRING *s;

    /* how should I allocate memory? */
    op_address = (INTVAL *)malloc((code_end - code_start + START_SIZE + 3) * sizeof(INTVAL)); 

    op_real_address = (INTVAL *)malloc((code_end - code_start + START_SIZE + 3) * sizeof(INTVAL)); 

    /* intval constants */
    const_intval[0] = (INTVAL)stdout;
    const_intval[1] = (INTVAL)STACK_ENTRY_DESTINATION;
    const_intval[2] = (INTVAL)op_real_address;

    k = 0;

    /* The size in bytes that the whole program will have */
    size = 0;

    /* 
        op_address holds the displacement from arena_start 
        and the start of each parrot op 
        at the same position in the parrot bytecode:

        bytecode:       56  1   1   56  1   1
        op_address:     3   0   0   15  0   0
    */
        
    op_address[k] = START_SIZE;
    prev_address = START_SIZE;
    while (pc < code_end)
    {
        k += op_assembly[*pc].nargop;
        prev_address = op_address[k] = prev_address + op_assembly[*pc].size;
        size += op_assembly[*pc].size;
        pc += op_assembly[*pc].nargop;
    }

    bytecode_position = 0;
    arena_start = arena = malloc(size);

    pc = code_start;
        
    /* Make the arena look like a subroutine */
    memcpy(arena,&START,START_SIZE);
    arena += START_SIZE;

    /* 
        Loop again over all the opcodes.
        Concatenate the position independent code 
        of each parrot opcode and place 
        the correct addresses in the correct place 
        this is done using the opcode_assembly_t structure
        where we have all the information we need 
        about how many register and of which type 
        the opcode requires.
    */

    while (pc < code_end)
    {
        memcpy(arena,op_assembly[*pc].assembly,op_assembly[*pc].size);
        op_real_address[bytecode_position] = (INTVAL)arena_start + op_address[bytecode_position];

        /* Address of a INTVAL register */
        v = op_assembly[*pc].intval_register_address; 
        for (i = 0; i < v.amount; i++)
        {
            address = &interpreter->int_reg->registers[pc[v.info[i].number]];
            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }
        /* Address of a NUMVAL register */
        v = op_assembly[*pc].floatval_register_address;
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&interpreter->num_reg->registers[pc[v.info[i].number]];
            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }

        /* the address where will be a STRING register */

        v = op_assembly[*pc].string_register_address;
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&interpreter->string_reg->registers[pc[v.info[i].number]];
            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }

        v = op_assembly[*pc].intval_constant_value;
        for (i = 0; i < v.amount; i++)
        {
            ivalue = pc[v.info[i].number];
            memcpy(&arena[v.info[i].position],&ivalue,sizeof(ivalue));
        }
        v = op_assembly[*pc].intval_constant_address;
        for (i = 0; i < v.amount; i++)
        {
            address = &pc[v.info[i].number];
            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }
        v = op_assembly[*pc].floatval_constant_address;
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&interpreter->code->const_table->constants[pc[v.info[i].number]]->number;
            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }

        /* Address of a STRING constant or one of it's elements */
        /* &SC */
        sv = op_assembly[*pc].string_constant_address;
        for (i = 0; i < sv.amount; i++)
        {
            s = interpreter->code->const_table->constants[pc[sv.info[i].number]]->string;
            switch (sv.info[i].flag) {
                case 0: 
                        address = (INTVAL *)s;
                        break;
                case 1: 
                        address = (INTVAL *)s->bufstart;
                        break;
                case 2: 
                        address = &s->buflen;
                        break;
                case 3: 
                        address = &s->flags;
                        break;
                case 4: 
                        address = &s->bufused;
                        break;
                case 5: 
                        address = &s->strlen;
                        break;
                case 6: 
                        address = (INTVAL *)s->encoding;
                        break;
                case 7: 
                        address = (INTVAL *)s->type;
                        break;
                case 8: 
                        address = &s->language;
                        break;
            }

            memcpy(&arena[sv.info[i].position],&address,sizeof(address));
        }

        /* value of string constant or one of the elements */
        /* *SC */
        sv = op_assembly[*pc].string_constant_value;
        for (i = 0; i < sv.amount; i++)
        {
            s =  interpreter->code->const_table->constants[pc[sv.info[i].number]]->string;
            switch (sv.info[i].flag) {
               /* case 1: 
                        ivalue = *interpreter->code->const_table->constants[pc[op_assembly[*pc].string_constant_value.variable[i].number]]->string->bufstart;
                        break;
             */ case 2: 
                        ivalue = s->buflen;
                        break;
                case 3: 
                        ivalue = s->flags;
                        break;
                case 4: 
                        ivalue = s->bufused;
                        break;
                case 5: 
                        ivalue = s->strlen;
                        break;
              /*  case 6: 
                        ivalue = (INTVAL)interpreter->code->const_table->constants[pc[op_assembly[*pc].string_constant_value.variable[i].number]]->string->encoding;
                        break;
                case 7: 
                        ivalue = (INTVAL)interpreter->code->const_table->constants[pc[op_assembly[*pc].string_constant_value.variable[i].number]]->string->type;
                        break; */
                case 8: 
                        ivalue = s->language;
                        break;
            }

            memcpy(&arena[sv.info[i].position],&ivalue,sizeof(ivalue));
        }

        tiv = op_assembly[*pc].temporary_intval_address;
        for (i = 0; i < tiv.amount; i++)
        {
            address = &temp_intval[tiv.info[i].number];
            memcpy(&arena[tiv.info[i].position],&address,sizeof(address));
        }
        v = op_assembly[*pc].temporary_char_address;
        /* temporary char address */
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&temp_char[v.info[i].number];
            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }

        v = op_assembly[*pc].constant_intval_value;
        /* constant_intval_value */
        for (i = 0; i < v.amount; i++)
        {
            ivalue = const_intval[v.info[i].number];
            memcpy(&arena[v.info[i].position],&ivalue,sizeof(ivalue));
        }

        v = op_assembly[*pc].constant_intval_address;
        /* constant_intval_address */
        for (i = 0; i < v.amount; i++)
        {
            address = &const_intval[v.info[i].number];
            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }
 

        v = op_assembly[*pc].constant_floatval_address;
        /* FLOATVAL CONSTANTS */
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&floatval_constants[v.info[i].number];
            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }
        v = op_assembly[*pc].constant_char_address;
        /* CHAR CONSTANTS */
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&char_constants[v.info[i].number];
            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }

        /* BRANCHES */
        v = op_assembly[*pc].jump_int_const;
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)
                      (arena_start + 
                       op_address[
                                  bytecode_position + 
                                  pc[v.info[i].number]
                                 ]
                      ); 
            ivalue = (INTVAL) (arena+v.info[i].position) + 4;

            if (address > (INTVAL *)ivalue) {
                address = (INTVAL *)((char *)address - (char *)ivalue);
            } else if (address < (INTVAL *)ivalue) {
                address = (INTVAL *)
                          (-(arena - 
                             (char *)address + 
                             op_assembly[*pc].size));
            } else {
                address = 0;
            }
            
            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }
        
        /* XXX the idea is to write all this functions in asm */
        v = op_assembly[*pc].libc_c;
        for (i = 0; i < v.amount; i++)
        {
            switch(v.info[i].number) {
                case 0: 
                        address = (INTVAL *)printf; 
                        break;
                case 1: 
                        address = (INTVAL *)fflush; 
                        break;
                case 2: 
                        address = (INTVAL *)string_copy; 
                        break;
                case 3: 
                        address = (INTVAL *)string_compare; 
                        break;
                case 4: 
                        address = (INTVAL *)pop_generic_entry; 
                        break;
                case 5: 
                        address = (INTVAL *)push_generic_entry; 
                        break;
            }

            ivalue = (INTVAL) (arena+v.info[i].position) + 4;

            if (address > (INTVAL *)arena) {
                address = (INTVAL *)((char *)address - (char *)ivalue);
            } else {
                address = (INTVAL *)
                          (-(arena - 
                             (char *)address + 
                             v.info[i].position + 4));
            }

            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }

        v = op_assembly[*pc].interpreter;
        for (i = 0; i < v.amount; i++)
        {
            switch(v.info[i].number) {
                case 0: 
                        address = (INTVAL *)&interpreter; 
                        break;
                case 1: 
                        address = (INTVAL *)&interpreter->control_stack_top; 
                        break;
            }

            memcpy(&arena[v.info[i].position],&address,sizeof(address));
        }

        v = op_assembly[*pc].cur_opcode;;
        /* cur_opcode */
        for (i = 0; i < v.amount; i++)
        {
            ivalue = (INTVAL)(pc - code_start) + v.info[i].number;
            memcpy(&arena[v.info[i].position],&ivalue,sizeof(ivalue));
        }
 
        /* Keep it pointing to "where the code goes" */
        arena += op_assembly[*pc].size;

        bytecode_position += op_assembly[*pc].nargop;
        pc += op_assembly[*pc].nargop;
    }

    return (jit_f)arena_start;
}

