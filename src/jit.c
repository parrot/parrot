/*
** jit.c
**
** $Id$
*/

#include <parrot/parrot.h>
#include "parrot/jit.h"
#include "parrot/jit_struct.h"


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
#ifdef ALPHA
    char *interpreter_registers = ((char *)&interpreter->int_reg.registers[0]) + 0x7fff;
    INTVAL high,low;
#endif


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
    size = START_SIZE;

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
    arena_start = arena = malloc((unsigned int)size);

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
            address = &interpreter->int_reg.registers[pc[v.info[i].number]];
#ifdef SUN4
            address = (INTVAL*)(((char *)address) - (char *)&interpreter->int_reg.registers[0]);
            write_lo_13(&arena[v.info[i].position], (ptrcast_t)address);
#else
#ifdef ALPHA
            address = (INTVAL*)(((char *)address) - interpreter_registers);
#endif
            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
        }
        /* Address of a NUMVAL register */
        v = op_assembly[*pc].floatval_register_address;
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&interpreter->num_reg.registers[pc[v.info[i].number]];
#ifdef SUN4
            address = (INTVAL*)(((char *)address) - (char *)&interpreter->num_reg.registers[0]);
            write_lo_13(&arena[v.info[i].position], (ptrcast_t)address);
#else
#ifdef ALPHA
            address = (INTVAL*)(((char *)address) - interpreter_registers);
#endif
            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
        }

        /* the address where will be a STRING register */

        v = op_assembly[*pc].string_register_address;
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&interpreter->string_reg.registers[pc[v.info[i].number]];
#ifdef SUN4
            address = (INTVAL*)(((char *)address) - (char *)&interpreter->string_reg.registers[0]);
            write_lo_13(&arena[v.info[i].position], (ptrcast_t)address);
#else
#ifdef ALPHA
            address = (INTVAL*)(((char *)address) - interpreter_registers);
#endif
            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
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
#ifdef SUN4
            write_32(&arena[v.info[i].position], (ptrcast_t)address);
#else
#ifdef ALPHA
            calculate_displacement((INTVAL *)arena_start,address,&high,(INTVAL *)&address);
            memcpy(&arena[v.info[i].position - 4],&high,OP_ARGUMENT_SIZE);
#endif
            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
        }
        v = op_assembly[*pc].floatval_constant_address;
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&interpreter->code->const_table->constants[pc[v.info[i].number]]->number;
#ifdef SUN4
            write_32(&arena[v.info[i].position], (ptrcast_t)address);
#else
#ifdef ALPHA
            calculate_displacement((INTVAL *)arena_start,address,&high,(INTVAL *)&address);
            memcpy(&arena[v.info[i].position - 4],&high,OP_ARGUMENT_SIZE);
#endif
            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
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
                        address = (INTVAL *)&s->buflen;
                        break;
                case 3: 
                        address = (INTVAL *)&s->flags;
                        break;
                case 4: 
                        address = (INTVAL *)&s->bufused;
                        break;
                case 5: 
                        address = (INTVAL *)&s->strlen;
                        break;
                case 6: 
                        address = (INTVAL *)&s->encoding;
                        break;
                case 7: 
                        address = (INTVAL *)&s->type;
                        break;
                case 8: 
                        address = &s->language;
                        break;
            }

#ifdef SUN4
            write_32(&arena[sv.info[i].position], (ptrcast_t)address);
#else
#ifdef ALPHA
            calculate_displacement((INTVAL *)arena_start,address,&high,(INTVAL *)&address);
            memcpy(&arena[sv.info[i].position - 4],&high,OP_ARGUMENT_SIZE);
#endif
            memcpy(&arena[sv.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
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
#ifdef ALPHA
            calculate_displacement((INTVAL *)arena_start,address,&high,(INTVAL *)&address);
            memcpy(&arena[tiv.info[i].position - 4],&high,OP_ARGUMENT_SIZE);
#endif
            memcpy(&arena[tiv.info[i].position],&address,OP_ARGUMENT_SIZE);
        }
        v = op_assembly[*pc].temporary_char_address;
        /* temporary char address */
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&temp_char[v.info[i].number];
#ifdef ALPHA
            calculate_displacement((INTVAL *)arena_start,address,&high,(INTVAL *)&address);
            memcpy(&arena[v.info[i].position - 4],&high,OP_ARGUMENT_SIZE);
#endif
            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
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
#ifdef SUN4
            write_32(&arena[v.info[i].position], (ptrcast_t)address);
#else
#ifdef ALPHA
            calculate_displacement((INTVAL *)arena_start,address,&high,(INTVAL *)&address);
            memcpy(&arena[v.info[i].position - 4],&high,OP_ARGUMENT_SIZE);
#endif
            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
        }
 

        v = op_assembly[*pc].constant_floatval_address;
        /* FLOATVAL CONSTANTS */
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&floatval_constants[v.info[i].number];
#ifdef SUN4
            write_32(&arena[v.info[i].position], (ptrcast_t)address);
#else
#ifdef ALPHA
            calculate_displacement((INTVAL *)arena_start,address,&high,(INTVAL *)&address);
            memcpy(&arena[v.info[i].position - 4],&high,OP_ARGUMENT_SIZE);
#endif
            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
        }
        v = op_assembly[*pc].constant_char_address;
        /* CHAR CONSTANTS */
        for (i = 0; i < v.amount; i++)
        {
            address = (INTVAL *)&char_constants[v.info[i].number];
#ifdef ALPHA
            calculate_displacement((INTVAL *)arena_start,address,&high,(INTVAL *)&address);
            memcpy(&arena[v.info[i].position - 4],&high,OP_ARGUMENT_SIZE);
#endif
            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
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

#ifdef SUN4
            address = (INTVAL *)((char *)address - (arena + v.info[i].position - 3));
            write_22(&arena[v.info[i].position], (ptrcast_t)address);
#else
            ivalue = (INTVAL) (arena+v.info[i].position) + 4;

            if (address > (INTVAL *)ivalue) {
                address = (INTVAL *)((char *)address - (char *)ivalue);
            }
            else if (address < (INTVAL *)ivalue) {
                address = (INTVAL *)
                          (-(arena - 
                             (char *)address + 
                             op_assembly[*pc].size));
            }
            else {
                address = 0;
            }
#ifdef ALPHA
            address = (INTVAL *)((INTVAL)address / 4);
            arena[v.info[i].position + 2] |= (*(((char *)&address) + 2) & 0x1f);
#endif
            
            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
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
                        address = (INTVAL *)stack_pop;
                        break;
                case 5: 
                        address = (INTVAL *)stack_push;
                        break;
                case 6: 
                        address = (INTVAL *)interpreter->op_func_table[*pc];
                        break;
            }
#ifdef SUN4
            address = (INTVAL *)((char *)address - (arena + v.info[i].position - 3));
            write_30(&arena[v.info[i].position], (ptrcast_t)address);
#else
#ifdef ALPHA
            calculate_displacement((INTVAL *)arena_start,address,&high,&low);
            memcpy(&arena[v.info[i].position - 12],&high,OP_ARGUMENT_SIZE);
            memcpy(&arena[v.info[i].position - 8],&low,OP_ARGUMENT_SIZE);
#endif

            ivalue = (INTVAL) (arena+v.info[i].position) + 4;

            if (address > (INTVAL *)arena) {
                address = (INTVAL *)((char *)address - (char *)ivalue);
            }
            else {
                address = (INTVAL *)
                          (-(arena - 
                             (char *)address + 
                             v.info[i].position + 4));
            }
#ifdef ALPHA
            address = (INTVAL *)((INTVAL)address / 4);
            arena[v.info[i].position + 2] |= (*(((char *)&address) + 2) & 0x1f);
#endif

            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
        }

        v = op_assembly[*pc].interpreter;
        for (i = 0; i < v.amount; i++)
        {
            switch(v.info[i].number) {
                case 0: 
                        address = (INTVAL *)interpreter; 
                        break;
                case 1: 
                        address = (INTVAL *)interpreter->control_stack; 
                        break;
            }
#ifdef SUN4
            write_32(&arena[v.info[i].position], (ptrcast_t)address);
#else
#ifdef ALPHA
            calculate_displacement((INTVAL *)arena_start,address,&high,(INTVAL *)&address);
            memcpy(&arena[v.info[i].position - 4],&high,OP_ARGUMENT_SIZE);
#endif
            memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
        }

        v = op_assembly[*pc].cur_opcode;;
        /* cur_opcode */
        for (i = 0; i < v.amount; i++)
        {
            if (v.info[i].number)
            {
                ivalue = (INTVAL)(pc - code_start) + v.info[i].number - 1;
                memcpy(&arena[v.info[i].position],&ivalue,sizeof(ivalue));
            }
            else {
                address = (INTVAL *)pc;
#ifdef SUN4
            write_32(&arena[v.info[i].position], (ptrcast_t)address);
#else
#ifdef ALPHA
                calculate_displacement((INTVAL *)arena_start,address,&high,(INTVAL *)&address);
                memcpy(&arena[v.info[i].position - 4],&high,OP_ARGUMENT_SIZE);
#endif
                memcpy(&arena[v.info[i].position],&address,OP_ARGUMENT_SIZE);
#endif
            }
        }
 
        /* Keep it pointing to "where the code goes" */
        arena += op_assembly[*pc].size;

        ivalue = op_assembly[*pc].nargop;
        /* Replace the op number in the bytecode with a pointer to
           the start of jitted code for that opcode */
        *pc = op_real_address[bytecode_position]; 
        bytecode_position += ivalue;
        pc += ivalue;
    }

    return (jit_f)arena_start;
}

#ifdef ALPHA
/* calculates the proper values for the displacement 
   from src_address to dest_address.
   returned values should be interpreted as:
   dest_address = src_address + *high * 65536 + *low  
*/
void
calculate_displacement(INTVAL *src_address, INTVAL *dest_address, INTVAL *high, INTVAL *low)
{
    char *displacement = (char *)((char *)dest_address - (char *)src_address);

    *high = (INTVAL)displacement / 65536;
    *low = (INTVAL)displacement % 65536;
    if (*low > 32767) {
        *high += 1;
        *low -= 65536; 
    }
    else if (*low < -32767) {
        *high -= 1;
        *low += 65536; 
    }
}
#endif

#ifdef SUN4

/* Write 13 bit immediate value into an instruction */
static void write_lo_13(char *instr_end, ptrcast_t value){
    value &= 0x1fff;
    *instr_end = (char)(value & 0xff);
    *(instr_end-1) |= (char)(value >> 8);
}

/* Write 22 bit immediate value into sethi instructions */
static void write_hi_22(char *instr_end, ptrcast_t value){
    value >>= 10;
    *(instr_end-4) = (char)(value & 0xff);
    value >>= 8;
    *(instr_end-5) = (char)(value & 0xff);
    value >>= 8;
    *(instr_end-6) |= (char)(value & 0x3f); /* This is really just 6 bits */
}

/* Write 22 bit immediate value into PC relative branches */
static void write_22(char *instr_end, ptrcast_t value){
    value /= 4; /* divide displacement by 4 */
    *(instr_end--) = (char)(value & 0xff);
    value >>= 8;
    *(instr_end--) = (char)(value & 0xff);
    value >>= 8;
    *instr_end |= (char)(value & 0x3f); /* This is really just 6 bits */
}

/* Write 30 bit value into PC relative call instruction */
static void write_30(char *instr_end, ptrcast_t value){
    value /= 4;
    *(instr_end--) = (char)(value & 0xff);
    value >>= 8;
    *(instr_end--) = (char)(value & 0xff);
    value >>= 8;
    *(instr_end--) = (char)(value & 0xff);
    value >>= 8;
    *instr_end |= (char)(value & 0x3f);
}

/* Write a 32 bit value into a sethi instruction followed by an instruction 
 * with a 13 bit immediate */ 
static void write_32(char *instr_end, ptrcast_t value){
    write_lo_13(instr_end, value & 0x3ff);
    write_hi_22(instr_end, value);
}

#endif


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
