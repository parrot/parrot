/*
** jit.c
**
** $Id$
*/

#include <parrot/parrot.h>
#include "parrot/jit.h"

#ifdef ARM
#ifdef __linux
#include <asm/unistd.h>
#endif
#endif

/*
** optimize_jit()
** XXX Don't pay much attention to this yet.
*/

Parrot_jit_optimizer_t *
optimize_jit(struct Parrot_Interp *interpreter, opcode_t *pc, 
             opcode_t *code_start, opcode_t *code_end)
{
    Parrot_jit_optimizer_t *optimizer;
    Parrot_jit_register_count_t int_reg_usage_count[NUM_REGISTERS];
    Parrot_jit_optimizer_section_ptr prev_section,cur_section,next_section;
    opcode_t section_begin, section_end;
    op_info_t *op_info;
    char *branches;
    int argn;

    optimizer = (Parrot_jit_optimizer_t *)mem_sys_allocate(sizeof(Parrot_jit_optimizer_t));
    branches = (char *)mem_sys_allocate((size_t)(code_end - code_start));
    memset(branches, 0, (size_t)(code_end - code_start));

    while (pc < code_end)
    {
        /* Depending on where the op continues we may:
           0  = Do nothing, the op doesn't jumps.
           1  = The op jumps to an address relative to the current position,
                thus we mark the branch target and the branch source.
           2  = The op jumps to an absolute address,
                thus we mark the branch target.
           4  = The op pops the address to jump to,
                thus we don't mark the branch target,
                anyway it may probably use expr(NEXT)
           8  = The op does something with expr(NEXT),
                XXX I'll assume that it stores it in the 
                    control stack for later returning since
                    that's the only way it's used now but 
                    this should go away by the time we add
                    some metadata to the ops.
                So we will mark the branch target.
           16 = Means the op jumps and also might goto(NEXT)
           32 = The branch target is unpredictable.
         */
        op_info = &interpreter->op_info_table[*pc];

        if (op_info->jump)
            branches[pc - code_start] = JIT_BRANCH_SOURCE;
        if (op_info->jump & PARROT_JUMP_RELATIVE)
            branches[pc - code_start + pc[op_info->arg_count - 1]] = JIT_BRANCH_TARGET;
        if (op_info->jump & PARROT_JUMP_ADDRESS)
            branches[pc[op_info->arg_count - 1]] = JIT_BRANCH_TARGET; 
        if (op_info->jump & PARROT_JUMP_ENEXT)
            branches[pc - code_start + op_jit[*pc].nargop] = JIT_BRANCH_TARGET;
        if (op_info->jump & PARROT_JUMP_GNEXT)
        {
        }
        pc += op_jit[*pc].nargop;
    }

    /* ok, let's loop again and generate the sections */

    cur_section = optimizer->sections = (Parrot_jit_optimizer_section_t *) mem_sys_allocate(sizeof(Parrot_jit_optimizer_section_t));
    memset(cur_section->int_reg_count, 0, NUM_REGISTERS * sizeof(INTVAL));
    cur_section->prev=NULL;
    cur_section->next=NULL;
    cur_section->begin=0;
    cur_section->has_jit_op = 1;
    
    /* Reset the register usage for the first section */

    pc = code_start;
    while (pc < code_end)
    {
        opcode_t *nextpc = pc + op_jit[*pc].nargop;
        
        op_info = &interpreter->op_info_table[*pc];

        for (argn = 0; argn < op_info->arg_count - 1; argn++)
            if (op_info->types[argn] == PARROT_ARG_I)
                cur_section->int_reg_count[*(pc + argn)]++;

        if ((branches[pc - code_start] == JIT_BRANCH_SOURCE) ||
            (nextpc < code_end &&
             branches[nextpc - code_start] == JIT_BRANCH_TARGET))
        {
            /* cur_section->int_reg_map = registers_tomap(&cur_section->int_reg_count) */
            cur_section->end = (pc - code_start);
            /* If it's not the last op allocate a new section */
            if (nextpc < code_end)
            {
                next_section = (Parrot_jit_optimizer_section_t *) mem_sys_allocate(sizeof(Parrot_jit_optimizer_section_t));
                cur_section->next = next_section;
                next_section->prev = cur_section;
                cur_section = next_section; 
                cur_section->begin = nextpc - code_start;
                memset(cur_section->int_reg_count, 0, NUM_REGISTERS * sizeof(INTVAL));
                cur_section->next=NULL;
                cur_section->has_jit_op = 1;
            }
        } 

        if ((op_jit[*pc].fn != Parrot_jit_normal_op) && 
            (op_jit[*pc].fn != Parrot_jit_cpcf_op))
            cur_section->has_jit_op = 0;
        
        pc = nextpc;
    }
    cur_section->end = (pc - code_start);

    cur_section = optimizer->sections;
/*
    while (cur_section)
    {
        if (cur_section->has_jit_op)
        {   
            cur_section->int_reg_usage     
        }
        cur_section = cur_section->next;
*/
    return optimizer;
}

#ifdef ARM
static void
arm_sync_d_i_cache (void *start, void *end) {
/* Strictly this is only needed for StrongARM and later (not sure about ARM8)
   because earlier cores don't have separate D and I caches.
   However there aren't that many ARM7 or earlier devices around that we'll be
   running on.  */
#ifdef __linux
#ifdef __GNUC__
    int result;
    /* swi call based on code snippet from Russell King.  Description
       verbatim:  */
    /*
     * Flush a region from virtual address 'r0' to virtual address 'r1'
     * _inclusive_.  There is no alignment requirement on either address;   
     * user space does not need to know the hardware cache layout.
     *
     * r2 contains flags.  It should ALWAYS be passed as ZERO until it
     * is defined to be something else.  For now we ignore it, but may
     * the fires of hell burn in your belly if you break this rule. ;)
     *
     * (at a later date, we may want to allow this call to not flush
     * various aspects of the cache.  Passing '0' will guarantee that
     * everything necessary gets flushed to maintain consistency in
     * the specified region).
     */

    /* The value of the SWI is actually available by in
       __ARM_NR_cacheflush defined in <asm/unistd.h>, but quite how to
       get that to interpolate as a number into the ASM string is beyond
       me.  */
    /* I'm actually passing in exclusive end address, so subtract 1 from
       it inside the assembler.  */
    __asm__ __volatile__ (
        "mov     r0, %1\n"
        "sub     r1, %2, #1\n"
        "mov     r2, #0\n"
        "swi     " __sys1(__ARM_NR_cacheflush) "\n"
        "mov     %0, r0\n"
        : "=r" (result)
        : "r" ((long)start), "r" ((long)end)
        : "r0","r1","r2");

    if (result < 0) {
        internal_exception(JIT_ERROR,
                           "Synchronising I and D caches failed with errno=%d\n",
                           -result);
    }
#else
#error "ARM needs to sync D and I caches, and I don't know how to embed assmbler on this C compiler"
#endif
#else
/* Not strictly true - on RISC OS it's OS_SynchroniseCodeAreas  */
#error "ARM needs to sync D and I caches, and I don't know how to on this OS"
#endif
}
#endif

/*
** build_asm()
*/

jit_f
build_asm(struct Parrot_Interp *interpreter,opcode_t *pc, 
          opcode_t *code_start, opcode_t *code_end)
{
    UINTVAL i;
    char *new_arena;
    void *prev_address;
    Parrot_jit_info jit_info;
    opcode_t cur_opcode_byte;

    jit_info.optimizer = optimize_jit(interpreter,pc,code_start,code_end); 
    /* Byte code size in opcode_t's */
    jit_info.map_size = (code_end - code_start);
    jit_info.op_map = (Parrot_jit_opmap *)mem_sys_allocate(
                            jit_info.map_size * sizeof(*(jit_info.op_map)) );
    
    /* This memory MUST be zeroed for conversion of offsets to pointers to 
     * work later
     */
    memset(jit_info.op_map, 0, jit_info.map_size * sizeof(*(jit_info.op_map)));

    jit_info.arena_size = 1024;
    jit_info.native_ptr = jit_info.arena_start =
        mem_sys_allocate((size_t)jit_info.arena_size);

    jit_info.op_i = 0;
    jit_info.cur_op = pc;
    jit_info.fixups = NULL;

    /* 
     *   op_map holds the offset from arena_start 
     *   of the parrot op at the given opcode index
     *
     *  bytecode:       56  1   1   56  1   1
     *  op_map:         3   0   0   15  0   0
     */

    Parrot_jit_begin(&jit_info, interpreter);
    jit_info.op_map[jit_info.op_i].offset = 
                                    jit_info.native_ptr - jit_info.arena_start;
    while (jit_info.cur_op < code_end)
    {
        /* Grow the arena early */ 
        if(jit_info.arena_size < (jit_info.op_map[jit_info.op_i].offset + 100)){
            new_arena = mem_sys_realloc(jit_info.arena_start,
                                        (size_t)jit_info.arena_size * 2);
            jit_info.arena_size *= 2;
            jit_info.native_ptr = new_arena +
                                (jit_info.native_ptr - jit_info.arena_start);
            jit_info.arena_start = new_arena;
        }

        /* Generate native code for current op */
        cur_opcode_byte = *jit_info.cur_op;
        (op_jit[cur_opcode_byte].fn)(&jit_info, interpreter);

        /* update op_i and cur_op accordingly */ 
        jit_info.op_i += op_jit[cur_opcode_byte].nargop;
        jit_info.cur_op += op_jit[cur_opcode_byte].nargop;

        if (jit_info.cur_op < code_end){
            jit_info.op_map[jit_info.op_i].offset =
                jit_info.native_ptr - jit_info.arena_start;
        }
    }

    /* Do fixups before converting offsets */
    Parrot_jit_dofixup(&jit_info, interpreter);

    /* Convert offsets to pointers */
    for(i = 0; i < jit_info.map_size; i++){

        /* Assuming native code chunks contain some initialization code, 
         * the first op (and every other op) is at an offset > 0
         */
        if(jit_info.op_map[i].offset){
            jit_info.op_map[i].ptr = (char *)jit_info.arena_start +
                                                jit_info.op_map[i].offset; 
        }
    }

#ifdef ARM
    arm_sync_d_i_cache (jit_info.arena_start, jit_info.native_ptr);
#endif
    return (jit_f)jit_info.arena_start;
}

/* Remember the current position in the native code for later update */

void Parrot_jit_newfixup(Parrot_jit_info *jit_info){
    Parrot_jit_fixup *fixup;

    fixup = mem_sys_allocate(sizeof(*fixup));
    if(fixup == NULL){
        internal_exception(ALLOCATION_ERROR,
                            "System memory allocation failed\n"); 
    }

    /* Insert fixup at the head of the list */
    fixup->next = jit_info->fixups;
    jit_info->fixups = fixup;

    /* Fill in the native code offset */
    fixup->native_offset =
            (ptrdiff_t)(jit_info->native_ptr - jit_info->arena_start);
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
