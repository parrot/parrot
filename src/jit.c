/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/jit.c - JIT

=head1 DESCRIPTION

JIT (Just In Time) compilation converts bytecode to native machine code
instructions and executes the generated instruction sequence directly.

Actually it's not really just in time, it's just before this piece of code is
used and not per subroutine or even opcode, it works per bytecode segment.

=head2 Functions

=over 4

=cut

*/

#include <parrot/parrot.h>
#include <assert.h>
#if PARROT_EXEC_CAPABLE
#  include "parrot/exec.h"
#endif
#include "parrot/jit.h"
#define JIT_EMIT 0
#include "parrot/jit_emit.h"
#include "parrot/packfile.h"

extern int jit_op_count(void);
/*
 * s. jit/$jitcpuarch/jit_emit.h for the meaning of these defs
 */

#ifndef INT_REGISTERS_TO_MAP
#  define INT_REGISTERS_TO_MAP 0
  char *intval_map = 0;
#endif

#ifndef FLOAT_REGISTERS_TO_MAP
#  define FLOAT_REGISTERS_TO_MAP 0
  char *floatval_map = 0;
#endif

#ifndef ALLOCATE_REGISTERS_PER_SECTION
#  define ALLOCATE_REGISTERS_PER_SECTION 1
#endif

#ifndef PRESERVED_INT_REGS
#  define PRESERVED_INT_REGS 0
#endif

#ifndef PRESERVED_FLOAT_REGS
#  define PRESERVED_FLOAT_REGS 0
#endif

#if defined __GNUC__ || defined __IBMC__
void Parrot_jit_debug(Interp* interpreter);
#endif

char **Parrot_exec_rel_addr;
int Parrot_exec_rel_count;

/*

=item C<static void
insert_fixup_targets(Interp* interpreter, char *branch,
        size_t limit)>

Look at fixups, mark all fixup entries as branch target.

TODO: actually this is wrong: fixups belong only to one code segment.
The code below doesn't check, for which segments the fixups are
inserted.

=cut

*/

static void
insert_fixup_targets(Interp* interpreter, char *branch,
        size_t limit)
{
    struct PackFile_FixupTable *ft = interpreter->code->fixups;
    int i;

    if (!ft)
        return;
    for (i = 0; i < ft->fixup_count; i++) {
        switch (ft->fixups[i]->type) {
            case enum_fixup_label:
                if ((size_t)ft->fixups[i]->offset < limit)
                    branch[ft->fixups[i]->offset] |= JIT_BRANCH_TARGET;
                break;
        }
    }
}

/*

=item C<static void
make_branch_list(Interp *interpreter,
        Parrot_jit_optimizer_t * optimizer,
        opcode_t *cur_op, opcode_t *code_start, opcode_t *code_end)>

C<< optimizer->map_branch >> parallels the opcodes with a list of
branch information and register mapping information

=over 4

=item branch instructions have C<JIT_BRANCH_SOURCE>

=item opcodes jumped to have C<JIT_BRANCH_TARGET>

=item mapped arguments have register type + 1 and finally

=item after register allocation these have the processor register that
got mapped

=back

=cut

*/

static void
make_branch_list(Interp *interpreter,
        Parrot_jit_optimizer_t * optimizer,
        opcode_t *cur_op, opcode_t *code_start, opcode_t *code_end)
{
    op_info_t *op_info;
    char *branch;

    /* Allocate space for the branch information and register map */
    optimizer->map_branch = branch =
        (char *)mem_sys_allocate_zeroed((size_t)(code_end - code_start + 1));

    /* Allocate space for the branch list */
    optimizer->branch_list = (opcode_t **)
        mem_sys_allocate_zeroed(
                (size_t)(code_end - code_start) * sizeof(opcode_t *));

    /* If the opcode jumps we may:
     *
     * PARROT_JUMP_RELATIVE:
     *      The op jumps to an address relative to the current position,
     *      thus we mark the branch target and the branch source.
     *
     * PARROT_JUMP_ADDRESS:
     *      The op jumps to an absolute address,thus we mark the branch
     *      target.
     *
     * PARROT_JUMP_POP:
     *      The op pops the address to jump to,thus we don't mark the
     *      branch target, anyway it may probably use expr(NEXT)
     *
     * PARROT_JUMP_ENEXT:
     *      The op does something with expr(NEXT),
     *      XXX I'll assume that it's stored in the control stack for
     *          later returning since that's the only way it's used now
     *          but this should go away by the time we add some metadata
     *          to the ops.
     *      So we will mark the branch target.
     *
     * PARROT_JUMP_GNEXT:
     *      Means the opcode does some other kind of jump, and also
     *      might goto(NEXT)
     *
     * PARROT_JUMP_UNPREDICTABLE:
     *      The branch target is unpredictable.
     *      Things get a little tricky since it's not 100% true that the
     *      target is unpredictable because of the set_addr opcode, we
     *      need to find a solution for this, in the mean time, we will
     *      make each section have its own arena and try to avoid
     *      going in and out from them as much as posible.
     *
     *  PARROT_JUMP_RESTART
     *      If the parrot program counter is zero, fall out of the
     *      run loop.
     *
     */

    while (cur_op < code_end) {
        opcode_t op = *cur_op;
        int i, n;
        size_t rel_offset;

        /*
         * for all opcodes that are dynamically loaded, we can't have
         * a JITted version, so we execute the function incarnation
         * via the wrapper opcode, which just runs one opcode
         * see ops/core.ops for more
         */
        if (*cur_op >= jit_op_count())
           op = CORE_OPS_wrapper__;

        /* Predereference the opcode information table for this opcode
         * early since it's going to be used many times */
        op_info = &interpreter->op_info_table[op];

        /* if op_info->jump is not 0 this opcode may jump,
         * so mark this opcode as a branch source */
        rel_offset = cur_op - code_start;
        if (op_info->jump)
            branch[rel_offset] |= JIT_BRANCH_SOURCE;

        n = op_info->arg_count;

        for (i = 1; i < n; ++i) {
            /* If it's not a constant, no joy */
            if (op_info->types[i] == PARROT_ARG_IC && op_info->labels[i]) {
                /* The branch target is relative,
                 * the offset is in the i argument
                 */
                if (op_info->jump & PARROT_JUMP_RELATIVE) {
                    /* Set the branch target */
                    optimizer->branch_list[rel_offset] = cur_op + cur_op[i];
                    branch[rel_offset + cur_op[i]] |= JIT_BRANCH_TARGET;
                }
                /* The branch target is absolute,
                 * the address is in the i argument
                 */
                else if (op_info->jump & PARROT_JUMP_ADDRESS) {
                    /* Set the branch target */
                    optimizer->branch_list[rel_offset] = cur_op + cur_op[i];
                    branch[cur_op[i]] |= JIT_BRANCH_TARGET;
                }
                /* the labels of set_addr and newsub are branch targets too
                 * this is needed e.g. for JIT_CGP
                 */
                else {
                    branch[rel_offset + cur_op[i]] |= JIT_BRANCH_TARGET;
                }
            }
        }
        /* The address of the next opcode */
        if ((op_info->jump & PARROT_JUMP_ENEXT) ||
            (op_info->jump & PARROT_JUMP_GNEXT))
            branch[rel_offset + n] |= JIT_BRANCH_TARGET;
        if (op_info->jump & PARROT_JUMP_UNPREDICTABLE) {
            /*
             * TODO
             *   this flag is currently not used or set
             *   and: if we have a branch that isn't going to a constant
             *   target like a calculated branch used by rx_ opcodes
             *   we are totally lost WRT register preservation.
             *   If we don't know, that the code is a branch target, inside
             *   a JITted code section, mapped registers might be
             *   not up to date WRT Parrot registers.
             */
            optimizer->has_unpredictable_jump = 1;
        }
        /* Move to the next opcode */
        cur_op += n;
    }
    insert_fixup_targets(interpreter, branch, code_end - code_start);
}

/*

=item C<static void
set_register_usage(Interp *interpreter,
        Parrot_jit_optimizer_t * optimizer,
        Parrot_jit_optimizer_section_ptr cur_section,
        op_info_t *op_info, opcode_t *cur_op, opcode_t *code_start)>

Sets the register usage counts.

=cut

*/

static void
set_register_usage(Interp *interpreter,
        Parrot_jit_optimizer_t * optimizer,
        Parrot_jit_optimizer_section_ptr cur_section,
        op_info_t *op_info, opcode_t *cur_op, opcode_t *code_start)
{
    int argn;
    int typ;
    Parrot_jit_register_usage_t *ru = cur_section->ru;
    char *map = optimizer->map_branch;

    /* For each argument that has the opcode increment the usage count,
     * We move from the end since we need to check if the first opcode
     * using the register will read or write it.
     *
     * registers are set per their type [IPSN]
     * */
    for (argn = op_info->arg_count - 1; argn > 0; argn--) {
        int idx = *(cur_op + argn);
        switch (op_info->types[argn]) {
            case PARROT_ARG_I:
            case PARROT_ARG_KI:
                typ = 0;
                /*
                 * if the register number is negative, the register mapping
                 * was done by imcc/jit.c, which used negative numbers
                 * for allocated CPU registers. That's currently not
                 * functional because of changed register allocation
                 * strategy inside imcc.
                 * The code is still here and should probably be reactivated
                 * later, when things are stable: imcc has all the
                 * necessary information like basic blocks and loop depth
                 * calculated already. A lot is duplicated here to regain this
                 * information.
                 */
                if (idx < 0)
                    idx = -1 - idx;
                break;
            case PARROT_ARG_P:
            case PARROT_ARG_K:
                /*
                 * P and S regs aren't currently used at all. That's not
                 * really optimal. If we have plenty of mappable registers
                 * and if we can call vtables or MMD functions directly
                 * we should finally allocate P and S regs too.
                 */
                typ = 1;
                break;
            case PARROT_ARG_S:
                typ = 2;
                break;
            case PARROT_ARG_N:
                if (idx < 0)
                    idx = -1 - idx;
                typ = 3;
                break;
            default:
                typ = -1;
                break;
        }
        if (typ >= 0) {
            /* remember the register typ (+1) for this op argument
             * for register allocation */
            map[cur_op + argn - code_start] = typ + 1;
            if ((!ru[typ].reg_count[idx]++) &&
                (op_info->dirs[argn] & PARROT_ARGDIR_IN))
                ru[typ].reg_dir[idx] |= PARROT_ARGDIR_IN;
            if (op_info->dirs[argn] & PARROT_ARGDIR_OUT) {
                ru[typ].reg_dir[idx] |= PARROT_ARGDIR_OUT;
            }
        }
        /* key constants may have register keys */
        else if (op_info->types[argn] == PARROT_ARG_KC) {
            PMC *key = interpreter->code->const_table->constants[idx]->u.key;
            while (key) {
                UINTVAL flags = PObj_get_FLAGS(key);
                if (flags & KEY_register_FLAG) {
                    INTVAL n = PMC_int_val(key);
                    if (flags & KEY_integer_FLAG) {
                        typ = 0;
                        if (n < 0)
                            n = -1 - n;
                    }
                    else if (flags & KEY_pmc_FLAG)
                        typ = 1;
                    else if (flags & KEY_string_FLAG)
                        typ = 2;

                    if (!ru[typ].reg_count[n]++)
                        ru[typ].reg_dir[n] |= PARROT_ARGDIR_IN;
                }
                key = key_next(interpreter, key);
            }
        }
    }
}

/*

=item C<static void
make_sections(Interp *interpreter,
        Parrot_jit_optimizer_t * optimizer,
        opcode_t *cur_op, opcode_t *code_start, opcode_t *code_end)>

I386 has JITed vtables, which have the vtable# in extcall.

This C<Parrot_jit_vtable_n_op()> does use register mappings.

=cut

*/

#ifndef EXTCALL
#  define EXTCALL(op) (op_jit[*(op)].extcall >= 1)
#  define CALLS_C_CODE(op) (op_func[op].extcall == -1)
#endif

static void
make_sections(Interp *interpreter,
        Parrot_jit_optimizer_t * optimizer,
        opcode_t *cur_op, opcode_t *code_start, opcode_t *code_end)
{
    Parrot_jit_optimizer_section_ptr cur_section, t_section, prev_section;
    opcode_t *next_op;
    op_info_t *op_info;
    char *branch;
    int branched, start_new;

    branch = optimizer->map_branch;

    /* Allocate the first section */
    cur_section = optimizer->sections = (Parrot_jit_optimizer_section_t *)
        mem_sys_allocate_zeroed(sizeof(Parrot_jit_optimizer_section_t));
    cur_section->begin = code_start;
    prev_section = cur_section;

    cur_op = code_start;
    while (cur_section) {
        opcode_t op = *cur_op;
        if (*cur_op >= jit_op_count())
           op = CORE_OPS_wrapper__;
        branched = start_new = 0;
        /* Predereference the opcode information for this opcode
         * early since it's going to be used many times */
        op_info = &interpreter->op_info_table[op];

        /* Calculate the next pc */
        next_op = cur_op + op_info->arg_count;

        /* Update op_count */
        cur_section->op_count++;

        /* set register usage for this section */
        set_register_usage(interpreter, optimizer, cur_section,
                op_info, cur_op, code_start);

        /*
         * End a section:
         * If this opcode is jitted and next is a C function */
        if (!EXTCALL(cur_op)) {
            cur_section->jit_op_count++;

            if (next_op < code_end && EXTCALL(next_op))
                start_new = 1;
        }
        else
            /* or if current section is not jitted, and the next opcode
             * is. */
            if (next_op < code_end && !EXTCALL(next_op))
                start_new = 1;

        /* or when the current opcode is a branch source,
         * in other words if the opcode jumps, or if the next opcode is
         * a branch target, allocate a new section only if it's not the
         * last opcode */
        if ((branch[cur_op - code_start] & JIT_BRANCH_SOURCE)
                || (next_op < code_end &&
                    (branch[next_op - code_start] & JIT_BRANCH_TARGET))
                || (next_op >= code_end)) {
            /* remember to start a new block */
            branched = 1;
            start_new = 1;
        }

        if (start_new) {
            /* Set the type, depending on whether the current
             * instruction is external or jitted. */
            cur_section->isjit = !EXTCALL(cur_op);

            /* Save the address where the section ends */
            cur_section->end = cur_op;

            if (next_op < code_end) {
                /* Allocate a new section */
                t_section = (Parrot_jit_optimizer_section_t *)
                    mem_sys_allocate_zeroed(
                            sizeof(Parrot_jit_optimizer_section_t));
                /* Add it to the double linked list */
                cur_section->next = t_section;
                t_section->prev = cur_section;
                /* Make the new section be the current one */
                cur_section = t_section;

                /* registers get either allocated per section or
                 * per basic block (i.e. one or more sections divided
                 * by branches. When allocation per block is done
                 * all sections in one block have the same block number
                 */
                if (ALLOCATE_REGISTERS_PER_SECTION || branched) {
                    cur_section->block = prev_section->block + 1;
                    prev_section = cur_section;
                }
                else
                    cur_section->block = prev_section->block;
                /* Save the address where the section begins */
                cur_section->begin = next_op;
            }
            else {
                cur_section = NULL;
            }
        }

        /* Move to the next opcode */
        cur_op = next_op;
    }
}

/*

=item C<static void
make_branch_targets(Interp *interpreter,
        Parrot_jit_optimizer_t *optimizer, opcode_t * code_start)>

Makes the branch targets.

=cut

*/

static void
make_branch_targets(Interp *interpreter,
        Parrot_jit_optimizer_t *optimizer, opcode_t * code_start)
{
    Parrot_jit_optimizer_section_ptr cur_section, t_section;
    /* Set the branch target of this section, that is the section where
     * the program execution continues, if it ends in a branch source we
     * use the branch target and not the next section. */
    cur_section = optimizer->sections;
    while (cur_section) {
        if (optimizer->branch_list[cur_section->end - code_start]) {
            /* If the branch target is to a section before the current one
             * move from the start, otherwise from the current section */
            if (optimizer->branch_list[cur_section->end - code_start] <
                    cur_section->begin)
                t_section = optimizer->sections;
            else
                t_section = cur_section;

            while (t_section) {
                /* If we find the section attach it to the current one. */
                if (t_section->begin ==
                        optimizer->branch_list[cur_section->end - code_start]) {
                    cur_section->branch_target = t_section;
                    break;
                }
                /* If not move to the next. */
                t_section = t_section->next;
            }

        }
        /* Move to the next section */
        cur_section = cur_section->next;
    }
}

/*

=item C<static void
sort_registers(Interp *interpreter,
        Parrot_jit_optimizer_t *optimizer, opcode_t * code_start)>

Sorts the Parrot registers prior to mapping them to actual hardware registers.

=cut

*/

static void
sort_registers(Interp *interpreter,
        Parrot_jit_optimizer_t *optimizer, opcode_t * code_start)
{
    Parrot_jit_optimizer_section_ptr cur_section, next, prev;
    int i, any, k, typ;
    int max_count, max_i = 0;
    int to_map[] = { INT_REGISTERS_TO_MAP, 0, 0, FLOAT_REGISTERS_TO_MAP };

    /* Start from the first section */
    cur_section = optimizer->sections;

    while (cur_section) {
        Parrot_jit_register_usage_t *ru = cur_section->ru;
        /* sum up register usage for one block, don't change
         * reg_dir. If allocation is done per section, block numbers
         * are different, so this is a nop
         */
        next = cur_section->next;
        while (next && next->block == cur_section->block) {
            Parrot_jit_register_usage_t *nru = next->ru;
            for (typ = 0; typ < 4; typ++)
                for (i = 0; i < NUM_REGISTERS; i++)
                    ru[typ].reg_count[i] += nru[typ].reg_count[i];
            next = next->next;
        }

        /* now sort registers by their usage count */
        for (typ = 0; typ < 4; typ++) {
            /* find most used register */
            for (i = max_count = 0; i < NUM_REGISTERS; i++) {
                if (cur_section->ru[typ].reg_count[i] > max_count) {
                    max_count = cur_section->ru[typ].reg_count[i];
                    max_i = i;
                }
            }
            /* start from this register and set usage */
            k = ru[typ].registers_used = 0;
            /* no usage, go on with next type */
            if (max_count == 0 || !to_map[typ])
                continue;
            /* as long as we map registers for this typ */
            while (1) {
                if (max_i >= 0)
                    ru[typ].reg_usage[k++] = max_i;
                /* all mapped? */
                if (k == to_map[typ])
                    break;
                /* now check for equal usage starting after maxi */
                for (any = 0, i = max_i + 1; i < NUM_REGISTERS; i++) {
                    if (ru[typ].reg_count[i] == max_count) {
                        max_i = i;
                        any = 1;
                        break;
                    }
                }
                /* if same usage not found, look for lower usage */
                if (any == 0) {
                    if (max_count > 1) {
                        max_count--;
                        max_i = -1;
                        continue;
                    }
                    break;
                }
            }
            ru[typ].registers_used = k;
        }
        next = cur_section->next;
        prev = cur_section;
        /* duplicate usage to all sections of block */
        while (next && next->block == cur_section->block) {
            Parrot_jit_register_usage_t *nru = next->ru;
            for (typ = 0; typ < 4; typ++) {
                for (i = 0; i < ru[typ].registers_used; i++) {
                    nru[typ].reg_count[i] = ru[typ].reg_count[i];
                    nru[typ].reg_usage[i] = ru[typ].reg_usage[i];
                }
                nru[typ].registers_used = ru[typ].registers_used;
            }
            prev = next;
            next = next->next;
        }
        /* Move to the next section */
        cur_section = next;
    }
}

/*

=item C<static void
assign_registers(Interp *interpreter,
        Parrot_jit_optimizer_t *optimizer,
        Parrot_jit_optimizer_section_ptr cur_section,
        opcode_t * code_start, int from_imcc)>

Called by C<map_registers()> to actually assign the Parrot registers to
hardware registers.

TODO

Before actually assigning registers, we should optimize a bit:

1) calculate max use count of register types for all sections

2) calculate costs for register preserving and restoring
   for two different allocation strategies:

   a) allocate non-volatiles first
      overhead for jit_begin, jit_end:
      - 2 * max_used_non_volatile registers
      overhead for register preserving around non-jitted sections:
      - only used IN arguments are saved
      - only OUT non-volatile arguments are restored
   b) allocate volatiles first
      no overhead for jit_begin, jit_end
      overhead per JITed op that calls a C function:
      - 2 * n_used_volatiles_to_preserve for each call
      overhead for register preserving around non-jitted sections:
      - all volatiles are saved and restored around non-jitted sections

NB for all cost estimations size does matter: a 64bit double counts as
   two 32bit ints. Opcode count is assumed to be just one.

3) depending on costs from 2) use one of the strategies
   That does still not account for any usage patterns. Imcc has loop
   nesting depth, but that's not available here. OTOH smaller code tends
   to perform better because of better cache usage.

Usage analysis could show that a mixture of both strategies is best, e.g:
allocate 2-4 non-volatiles and the rest from volatiles. But that would
complicate the allocation code a bit.

=cut

*/

static void
assign_registers(Interp *interpreter,
        Parrot_jit_optimizer_t *optimizer,
        Parrot_jit_optimizer_section_ptr cur_section,
        opcode_t * code_start, int from_imcc)
{
    char *map;
    op_info_t *op_info;
    int i, op_arg, typ;
    opcode_t * cur_op;
    char * maps[] = {0, 0, 0, 0};
    maps[0] = intval_map;
    maps[3] = floatval_map;

    map = optimizer->map_branch;
    /* For each opcode in this section */
    cur_op = cur_section->begin;
    while (cur_op <= cur_section->end) {
        opcode_t op = *cur_op;
        if (*cur_op >= jit_op_count())
           op = CORE_OPS_wrapper__;
        op_info = &interpreter->op_info_table[op];
        /* For each argument of the current opcode */
        for (op_arg = 1; op_arg < op_info->arg_count; op_arg++) {
            /* get the register typ */
            typ = map[cur_op + op_arg - code_start];
            /* clear the register typ/map */
            map[cur_op + op_arg - code_start] = 0;
            /* if not JITted, don't map */
            if (!cur_section->isjit)
                continue;
            if (typ > 0) {
                typ--;  /* types are + 1 */
                if (!maps[typ])
                    continue;
                /* If the argument is in most used list for this typ */
                for (i = 0; i < cur_section->ru[typ].registers_used; i++) {
                    opcode_t idx = cur_op[op_arg];
                    if (from_imcc)
                        idx = -1 - idx;
                    if (idx == (opcode_t)cur_section->ru[typ].reg_usage[i]) {
                        map[cur_op + op_arg - code_start] = maps[typ][i];
                        cur_section->maps++;
                        break;
                    }
                }
            }
        }

        /* Move to the next opcode */
        cur_op += op_info->arg_count;
    }
}

/*

=item C<static void
map_registers(Interp *interpreter,
        Parrot_jit_optimizer_t *optimizer, opcode_t * code_start)>

Maps the most used Parrot registers to hardware registers.

=cut

*/

static void
map_registers(Interp *interpreter,
        Parrot_jit_optimizer_t *optimizer, opcode_t * code_start)
{
    Parrot_jit_optimizer_section_ptr cur_section;

    /* Start from the first section */
    cur_section = optimizer->sections;

    /* While there is section */
    while (cur_section) {

        assign_registers(interpreter, optimizer, cur_section, code_start, 0);

        /* Move to the next section */
        cur_section = cur_section->next;
    }
}


#define JIT_DEBUG 0

#if JIT_DEBUG
/*

=item C<static void
debug_sections(Interp *interpreter,
        Parrot_jit_optimizer_t *optimizer, opcode_t * code_start)>

Prints out debugging info.

=cut

*/

static void
debug_sections(Interp *interpreter,
        Parrot_jit_optimizer_t *optimizer, opcode_t * code_start)
{
    Parrot_jit_optimizer_section_ptr cur_section;
    op_info_t *op_info;
    opcode_t * cur_op;
#  if JIT_DEBUG > 1
    char * map = optimizer->map_branch;
#  endif
    int i, typ;
    unsigned int j;
    const char *types = "IPSN";
    int types_to_list[] = {0,3};

    cur_section = optimizer->sections;
    while (cur_section) {
        Parrot_jit_register_usage_t *ru = cur_section->ru;

        PIO_eprintf(interpreter, "\nSection:\n");
        PIO_eprintf(interpreter, "%s block %d\n",
                (cur_section->isjit) ? "JITTED" : "NOT JITTED",
                cur_section->block);
        for (cur_op = cur_section->begin; cur_op <= cur_section->end;) {
            char instr[256];
            opcode_t op = *cur_op;
            if (*cur_op >= jit_op_count())
                op = CORE_OPS_wrapper__;
            op_info = &interpreter->op_info_table[op];
            PDB_disassemble_op(interpreter, instr, sizeof(instr),
                    op_info, cur_op, NULL, code_start, 0);
            PIO_eprintf(interpreter, "\t\tOP%vu: ext %3d\t%s\n",
                    cur_op - code_start, op_jit[*cur_op].extcall, instr);
#  if JIT_DEBUG > 1
            PIO_eprintf(interpreter, "\t\t\tmap_branch: ");
            for (i = 0; i < op_info->arg_count; i++)
                PIO_eprintf(interpreter, "%02x ", map[cur_op-code_start+i]);
            PIO_eprintf(interpreter, "\n");
#  endif

            cur_op += op_info->arg_count;
        }
        PIO_eprintf(interpreter, "\tbegin:\t%#p\t(%Ou)\n",
                cur_section->begin, *cur_section->begin);
        PIO_eprintf(interpreter, "\tend:\t%#p\t(%Ou)\n",
                cur_section->end, *cur_section->end);

        for (j = 0; j < sizeof(types_to_list)/sizeof(int); j++) {
            char t;
            typ = types_to_list[j];
            t = types[typ];
            PIO_eprintf(interpreter, "\t%c registers used:\t%i\n",
                    t, ru[typ].registers_used);
            if (ru[typ].registers_used) {
                PIO_eprintf(interpreter, "\t%c register count:\t", t);
                for (i = 0; i < NUM_REGISTERS; i++)
                    PIO_eprintf(interpreter, "%i ", ru[typ].reg_count[i]);
                PIO_eprintf(interpreter, "\n\t%c register usage:\t", t);
                for (i = 0; i < NUM_REGISTERS; i++)
                    PIO_eprintf(interpreter, "%i ", ru[typ].reg_usage[i]);
                PIO_eprintf(interpreter, "\n\t%c register direction:\t", t);
                for (i = 0; i < NUM_REGISTERS; i++)
                    PIO_eprintf(interpreter, "%i ", (int)ru[typ].reg_dir[i]);
                PIO_eprintf(interpreter, "\n");
            }
        }
        PIO_eprintf(interpreter, "\tJit opcodes:\t%u\n",
                cur_section->jit_op_count);
        PIO_eprintf(interpreter, "\tTotal opcodes:\t%u\n",
                cur_section->op_count);
        if (cur_section->branch_target)
            PIO_eprintf(interpreter, "\tBranch target:\tOP%u\n",
                    cur_section->branch_target->begin - code_start);

        cur_section = cur_section->next;
    }
}
#endif

/*

=item C<static Parrot_jit_optimizer_t *
optimize_jit(Interp *interpreter, opcode_t *cur_op,
             opcode_t *code_start, opcode_t *code_end)>

Called by C<build_asm()> to run the optimizer.

=cut

*/

static Parrot_jit_optimizer_t *
optimize_jit(Interp *interpreter, opcode_t *cur_op,
             opcode_t *code_start, opcode_t *code_end)
{
    Parrot_jit_optimizer_t *optimizer;

    /* Allocate space for the optimizer */
    optimizer = (Parrot_jit_optimizer_t *)
        mem_sys_allocate_zeroed(sizeof(Parrot_jit_optimizer_t));

    /* Look, which opcodes might branch */
    make_branch_list(interpreter, optimizer, cur_op, code_start, code_end);

    /* ok, let's loop again and generate the sections */
    make_sections(interpreter, optimizer, cur_op, code_start, code_end);

    /* look where a section jumps to */
    make_branch_targets(interpreter, optimizer, code_start);

    /* This is where we start deciding which Parrot registers get
     * mapped to a hardware one in each different section. */

#if JIT_DEBUG > 2
    debug_sections(interpreter, optimizer, code_start);
#endif
    sort_registers(interpreter, optimizer, code_start);
    map_registers(interpreter, optimizer, code_start);

#if JIT_DEBUG
    debug_sections(interpreter, optimizer, code_start);
#endif

    return optimizer;
}

/*

=item C<static Parrot_jit_optimizer_t *
optimize_imcc_jit(Interp *interpreter, opcode_t *cur_op,
             opcode_t *code_start, opcode_t *code_end,
             struct PackFile_Segment *jit_seg)>

Generate optimizer stuff from the C<_JIT> section in the packfile.

=cut

*/

static Parrot_jit_optimizer_t *
optimize_imcc_jit(Interp *interpreter, opcode_t *cur_op,
             opcode_t *code_start, opcode_t *code_end,
             struct PackFile_Segment *jit_seg)
{
    Parrot_jit_optimizer_t *optimizer;
    size_t size, i, typ;
    int j;
    opcode_t *ptr, offs;
    Parrot_jit_optimizer_section_ptr section, prev;
    char *branch;
    op_info_t *op_info;

    /* Allocate space for the optimizer */
    optimizer = (Parrot_jit_optimizer_t *)
        mem_sys_allocate_zeroed(sizeof(Parrot_jit_optimizer_t));
    /*
     * TODO: pass the whole map_branch in the PBC
     *       this would save two runs through all the opcode
     */
    optimizer->map_branch = branch =
        (char *)mem_sys_allocate_zeroed((size_t)(code_end - code_start));
    ptr = jit_seg->data;
    size = jit_seg->size;
    assert(jit_seg->itype == 0);
    assert((size % 6) == 0);
    cur_op = code_start;
    for (prev = NULL, i = 0; i < size/6; i++, prev = section) {
        section = (Parrot_jit_optimizer_section_t *)
            mem_sys_allocate_zeroed(sizeof(Parrot_jit_optimizer_section_t));
        if (prev)
            prev->next = section;
        else
            optimizer->sections = section;
        section->prev = prev;
        section->block = i;
        offs = *ptr++;
        if (offs & 0x80000000) {
            offs &= ~0x80000000;
            branch[offs] = JIT_BRANCH_TARGET;
        }
        section->begin = code_start + offs;
        section->end = code_start + *ptr++;
        section->isjit = 1;
        for (typ = 0; typ < 4; typ++) {
            section->ru[typ].registers_used = *ptr++;
            for (j = 0; j < section->ru[typ].registers_used; j++)
                section->ru[typ].reg_usage[j] = j;

        }
        while (cur_op <= section->end) {
            opcode_t op = *cur_op;
            if (*cur_op >= jit_op_count())
                op = CORE_OPS_wrapper__;
            op_info = &interpreter->op_info_table[op];
            set_register_usage(interpreter, optimizer, section,
                    op_info, cur_op, code_start);
            section->op_count++;
            cur_op += op_info->arg_count;
        }
        assign_registers(interpreter, optimizer, section, code_start, 1);
    }
    insert_fixup_targets(interpreter, branch, code_end - code_start);
#if JIT_DEBUG
    debug_sections(interpreter, optimizer, code_start);
#endif
    return optimizer;
}

/*

=item C<static char *
reg_addr(Interp * interpreter, int typ, int i)>

=item C<size_t
reg_offs(Interp * interpreter, int typ, int i)>

Returns the offset of register C<typ[i]>.

The latter is used if F<jit_emit.h> defines C<Parrot_jit_emit_get_base_reg_no>.

=cut

*/

#if defined(Parrot_jit_emit_get_base_reg_no)
#  define JIT_USE_OFFS 1
#else
#  define JIT_USE_OFFS 0
#endif

#if JIT_USE_OFFS

static size_t
reg_offs(Interp * interpreter, int typ, int i)
{
    switch (typ) {
        case 0:
            return REG_OFFS_INT(i);
        case 3:
            return REG_OFFS_NUM(i);
    }
    return 0;
}
#else
static char *
reg_addr(Interp * interpreter, int typ, int i)
{
        switch (typ) {
            case 0:
                return (char*)&REG_INT(i);
            case 3:
                return (char*)&REG_NUM(i);
            default:
                return 0;   /* not currently */
        }
}
#endif

/*

=item C<static void
Parrot_jit_load_registers(Parrot_jit_info_t *jit_info,
                          Interp * interpreter, int volatiles)>

Load registers for the current section from parrot to processor registers.
If C<volatiles> is true, this code is used to restore these registers in
JITted code that calls out to Parrot.

=cut

*/

static void
Parrot_jit_load_registers(Parrot_jit_info_t *jit_info,
                          Interp * interpreter, int volatiles)
{
    Parrot_jit_optimizer_section_t *sect = jit_info->optimizer->cur_section;
    Parrot_jit_register_usage_t *ru = sect->ru;
    int i, typ;
#if JIT_USE_OFFS
    void (*mov_f[4])(Interp *, int, int, size_t)
        = { Parrot_jit_emit_mov_rm_offs, 0, 0, Parrot_jit_emit_mov_rm_n_offs};
    size_t offs;
    int base_reg = 0;   /* -O3 warning */
#else
    void (*mov_f[4])(Interp *, int, char *)
        = { Parrot_jit_emit_mov_rm, 0, 0, Parrot_jit_emit_mov_rm_n};
    char *m;
#endif
    int lasts[] = { PRESERVED_INT_REGS, 0,0,  PRESERVED_FLOAT_REGS };
    char * maps[] = {0, 0, 0, 0};
    int first = 1;

    maps[0] = jit_info->intval_map;
    maps[3] = jit_info->floatval_map;

    for (typ = 0; typ < 4; typ++) {
        if (maps[typ]) {
            for (i = ru[typ].registers_used-1; i >= 0; --i) {
                int us = ru[typ].reg_usage[i];
                int is_used = i >= lasts[typ] && ru[typ].reg_dir[us];
                if ((is_used && volatiles) ||
                    (!volatiles &&
                         ((ru[typ].reg_dir[us] & PARROT_ARGDIR_IN)))) {
#if JIT_USE_OFFS
                    if (first) {
                        base_reg = Parrot_jit_emit_get_base_reg_no(
                                jit_info->native_ptr);
                        first = 0;
                    }
                    offs = reg_offs(interpreter, typ, us);
                    (mov_f[typ])(interpreter, maps[typ][i], base_reg, offs);
#else
                    m = reg_addr(interpreter, typ, us);
                    (mov_f[typ])(interpreter, maps[typ][i], m);
#endif
                }
            }
        }
    }

    /* The total size of the loads. This is used for branches to
     * the same section - these skip the load asm bytes */
    sect->load_size = jit_info->native_ptr -
        (jit_info->arena.start +
         jit_info->arena.op_map[jit_info->op_i].offset);
}

/*

=item C<static void
Parrot_jit_save_registers(Parrot_jit_info_t *jit_info,
                          Interp * interpreter, int volatiles)>

Save registers for the current section.
If C<volatiles> is true, this code is used to preserve these registers in
JITted code that calls out to Parrot.

=cut

*/

static void
Parrot_jit_save_registers(Parrot_jit_info_t *jit_info,
                          Interp * interpreter, int volatiles)
{
    Parrot_jit_optimizer_section_t *sect = jit_info->optimizer->cur_section;
    Parrot_jit_register_usage_t *ru = sect->ru;
    int i, typ;
#if JIT_USE_OFFS
    void (*mov_f[4])(Interp * ,int, size_t, int)
        = { Parrot_jit_emit_mov_mr_offs, 0, 0, Parrot_jit_emit_mov_mr_n_offs};
    size_t offs;
    int base_reg = 0; /* -O3 warning */
#else
    void (*mov_f[4])(Interp * , char *, int)
        = { Parrot_jit_emit_mov_mr, 0, 0, Parrot_jit_emit_mov_mr_n};
    char *m;
#endif
    int lasts[] = { PRESERVED_INT_REGS, 0,0,  PRESERVED_FLOAT_REGS };
    char * maps[] = {0, 0, 0, 0};
    int first = 1;

    maps[0] = jit_info->intval_map;
    maps[3] = jit_info->floatval_map;
    for (typ = 0; typ < 4; typ++) {
        if (maps[typ])
            for (i = 0; i < ru[typ].registers_used; ++i) {
                int us = ru[typ].reg_usage[i];
                int is_used = i >= lasts[typ] && ru[typ].reg_dir[us];
                if ((is_used && volatiles) ||
                    (!volatiles &&
                     (ru[typ].reg_dir[us] & PARROT_ARGDIR_OUT))) {
#if JIT_USE_OFFS
                    if (first) {
                        base_reg = Parrot_jit_emit_get_base_reg_no(
                                jit_info->native_ptr);
                        first = 0;
                    }

                    offs = reg_offs(interpreter, typ, us);
                    (mov_f[typ])(interpreter, base_reg, offs, maps[typ][i]);
#else
                    m = reg_addr(interpreter, typ, us);
                    (mov_f[typ])(interpreter, m, maps[typ][i]);
#endif
                }
            }
    }
}

/*

=item C<void
Parrot_destroy_jit(void *ptr)>

Frees the memory used by the JIT subsystem.

=cut

*/

void
Parrot_destroy_jit(void *ptr)
{
    Parrot_jit_optimizer_t *optimizer;
    Parrot_jit_optimizer_section_ptr cur_section, next;
    Parrot_jit_fixup_t *fixup, *next_f;
    Parrot_jit_info_t *jit_info = (Parrot_jit_info_t *)ptr;

    if (!jit_info)
        return;
    /* delete sections */
    optimizer = jit_info->optimizer;
    cur_section = optimizer->sections;
    while (cur_section) {
        next = cur_section->next;
        free(cur_section);
        cur_section = next;
    }
    /* arena stuff */
    free(jit_info->arena.op_map);
    mem_free_executable(jit_info->arena.start);
    fixup = jit_info->arena.fixups;
    while (fixup) {
        next_f = fixup->next;
        free(fixup);
        fixup = next_f;
    }
    /* optimizer stuff */
    free(optimizer->map_branch);
    free(optimizer->branch_list);
    free(optimizer);

    free(jit_info);
}

/*

=item C<jit_f
build_asm(Interp *interpreter, opcode_t *pc,
          opcode_t *code_start, opcode_t *code_end,
          void *objfile)>

This is the main function of the JIT code generator.

It loops over the bytecode, calling the code generating routines for
each opcode.

The information obtained is used to perform certain types of fixups on
native code, as well as by the native code itself to convert bytecode
program counters values to hardware program counter values.

Finally this code here is used to generate native executables (or better
object files that are linked to executables), if EXEC_CAPABLE is defined.
This functionality is triggered by

  parrot -o foo.o foo.imc

which uses the JIT engine to translate to native code inside the object
file.

=cut

*/

jit_f
build_asm(Interp *interpreter, opcode_t *pc,
          opcode_t *code_start, opcode_t *code_end,
          void *objfile)
{
    UINTVAL i;
    char *new_arena;
    Parrot_jit_info_t *jit_info = NULL;
    opcode_t cur_opcode_byte, *cur_op;
    Parrot_jit_optimizer_section_ptr cur_section;
    struct PackFile_Segment *jit_seg;
    char *name;
    char *map;
    Parrot_jit_fn_info_t *op_func;
#if EXEC_CAPABLE
    Parrot_exec_objfile_t *obj = (Parrot_exec_objfile_t *)objfile;
#endif

    /* XXX assume, we restart */
    if (interpreter->code->jit_info) {
        jit_info = interpreter->code->jit_info;
        return (jit_f)D2FPTR(jit_info->arena.start);
    }
    else {
        jit_info = interpreter->code->jit_info =
            mem_sys_allocate(sizeof(Parrot_jit_info_t));
    }
    jit_info->objfile = NULL;
#if EXEC_CAPABLE
    if (objfile) {
        op_func = op_exec;
        jit_info->objfile = obj;
    }
    else
#endif
        op_func = op_jit;

    /*
     * check if IMCC did all he work. If yes, we got a PF segment with
     * register allocation information inside.
     * See imcc/jit.c for more
     */
    name = mem_sys_allocate(strlen(interpreter->code->base.name) + 5);
    sprintf(name, "%s_JIT", interpreter->code->base.name);
    jit_seg = PackFile_find_segment(interpreter,
            interpreter->code->base.dir, name, 0);
    mem_sys_free(name);
    if (jit_seg)
        jit_info->optimizer =
            optimize_imcc_jit(interpreter, pc, code_start, code_end, jit_seg);
    else
        jit_info->optimizer =
            optimize_jit(interpreter, pc, code_start, code_end);

    /* Attach the register map to the jit_info structure */
    jit_info->intval_map = intval_map;
    jit_info->floatval_map = floatval_map;

    /* Byte code size in opcode_t's */
    jit_info->arena.map_size = (code_end - code_start) + 1;
    jit_info->arena.op_map =
        (Parrot_jit_opmap_t *)mem_sys_allocate_zeroed(
            jit_info->arena.map_size * sizeof(* (jit_info->arena.op_map)));

#if REQUIRES_CONSTANT_POOL
    Parrot_jit_init_arenas(jit_info);
#else
    jit_info->arena.size = 1024;
    /* estimate size needed
     * 10 times pbc code size seems to be enough for i386
     */
    if ((size_t)jit_info->arena.map_size * 10 > (size_t)jit_info->arena.size)
        jit_info->arena.size = jit_info->arena.map_size * 10;
    jit_info->native_ptr = jit_info->arena.start =
        mem_alloc_executable((size_t)jit_info->arena.size);
#  if EXEC_CAPABLE
    if (obj)
        jit_info->objfile->text.code = jit_info->arena.start;
#  endif
#endif

    jit_info->op_i = 0;
    jit_info->arena.fixups = NULL;

    /*
     * from C's ABI all the emitted code here is one (probably big)
     * function. So we have to generate an appropriate function
     * prologue, that makes all this look like a normal function ;)
     */
    Parrot_jit_begin(jit_info, interpreter);
    /*
     * the function epilog can basically be anywhere, that's done
     * by the Parrot_end opcode somewhere in core.jit
     */

    /*
     *   op_map holds the offset from arena.start
     *   of the parrot op at the given opcode index
     *
     * Set the offset of the first opcode
     */
    jit_info->arena.op_map[jit_info->op_i].offset =
        jit_info->native_ptr - jit_info->arena.start;

    /* The first section */
    cur_section = jit_info->optimizer->cur_section =
        jit_info->optimizer->sections;
    map = jit_info->optimizer->map_branch;

    while (jit_info->optimizer->cur_section) {
        /* the code emitting functions need cur_op and cur_section
         * so these vars are in jit_info too
         */

        /* The first opcode for this section */
        cur_op = jit_info->cur_op = cur_section->begin;

        /* Load mapped registers for this section, if JIT */
        if (!jit_seg && cur_section->isjit) {
            Parrot_jit_load_registers(jit_info, interpreter, 0);
        }

        /* The first opcode of each section doesn't have a previous one since
         * it's impossible to be sure which was it */
        jit_info->prev_op = NULL;

        while (cur_op <= cur_section->end) {
            /* Grow the arena early */
            if (jit_info->arena.size <
                    (jit_info->arena.op_map[jit_info->op_i].offset + 200)) {
#if REQUIRES_CONSTANT_POOL
                Parrot_jit_extend_arena(jit_info);
#else
                new_arena = mem_realloc_executable(jit_info->arena.start,
                        (size_t)jit_info->arena.size * 2);
                jit_info->arena.size *= 2;
                jit_info->native_ptr = new_arena +
                    (jit_info->native_ptr - jit_info->arena.start);
                jit_info->arena.start = new_arena;
#  if EXEC_CAPABLE
                if (obj)
                    obj->text.code = new_arena;
#  endif
#endif
            }

            cur_opcode_byte = *cur_op;

            /* Need to save the registers if there is a branch and is not to
             * the same section, I admit I don't like this, and it should be
             * really checking if the target section has the same registers
             * mapped too.
             *
             * Yep so: TODO
             * during register allocation try to use the same registers, if
             * its a loop or a plain branch and if register usage doesn't
             * differ too much. This could save a lot of register reloads.
             *
             * --
             *
             * save also, if we have a jitted sections and encounter
             * an "end" opcode, e.g. in evaled code
             */
            if ((((map[cur_op - code_start] == JIT_BRANCH_SOURCE) &&
                            (cur_section->branch_target != cur_section)) ||
                        !cur_opcode_byte) &&
                    cur_section->isjit &&
                    !jit_seg) {
                Parrot_jit_save_registers(jit_info, interpreter, 0);
            }
            else if (CALLS_C_CODE(cur_opcode_byte)) {
                /*
                 * a JITted function with a function call, we have to
                 * save volatile registers but
                 * TODO not if the previous opcode was also one
                 *      that called C code
                 */
                Parrot_jit_save_registers(jit_info, interpreter, 1);
            }

            /* Generate native code for current op */
            if (cur_opcode_byte >= jit_op_count()) {
                cur_opcode_byte = CORE_OPS_wrapper__;
            }
            (op_func[cur_opcode_byte].fn) (jit_info, interpreter);

            if (CALLS_C_CODE(cur_opcode_byte)) {
                /*
                 * restore volatiles only - and TODO only if next
                 *      wouldn't load registers anyway
                 */
                Parrot_jit_load_registers(jit_info, interpreter, 1);
            }
            /* Update the previous opcode */
            jit_info->prev_op = cur_op;

            /* update op_i and cur_op accordingly */
            jit_info->op_i +=
                interpreter->op_info_table[cur_opcode_byte].arg_count;
            jit_info->cur_op +=
                interpreter->op_info_table[cur_opcode_byte].arg_count;
            cur_op = jit_info->cur_op;

            /* if this is a branch target, align it */
#ifdef jit_emit_noop
#  if JUMP_ALIGN
            if (((!cur_section->next && cur_op <= cur_section->end) ||
                        cur_section->next) &&
                    map[cur_op - code_start] == JIT_BRANCH_TARGET) {
                while ((long)jit_info->native_ptr & ((1<<JUMP_ALIGN) - 1))
                    jit_emit_noop(jit_info->native_ptr);
            }
#  endif
#endif

            /* set the offset */
            jit_info->arena.op_map[jit_info->op_i].offset =
                jit_info->native_ptr - jit_info->arena.start;
        }

        /* Save mapped registers back to the Parrot registers */
        if (!jit_seg && cur_section->isjit)
            Parrot_jit_save_registers(jit_info, interpreter, 0);

        /* update the offset for saved registers */
        jit_info->arena.op_map[jit_info->op_i].offset =
            jit_info->native_ptr - jit_info->arena.start;

        /* Move to the next section */
        cur_section = jit_info->optimizer->cur_section =
            cur_section->next;
    }

    /* Do fixups before converting offsets */
    Parrot_jit_dofixup(jit_info, interpreter);

    /* Convert offsets to pointers */
    if (!objfile)
        for (i = 0; i < jit_info->arena.map_size; i++) {

            /* Assuming native code chunks contain some initialization code,
             * the first op (and every other op) is at an offset > 0
             */
            if (jit_info->arena.op_map[i].offset) {
                jit_info->arena.op_map[i].ptr = (char *)jit_info->arena.start +
                    jit_info->arena.op_map[i].offset;
            }
        }

    jit_info->arena.size =
        (ptrdiff_t)(jit_info->native_ptr - jit_info->arena.start);
#if JIT_DEBUG
    PIO_eprintf(interpreter, "\nTotal size %u bytes\n",
            (unsigned int)(jit_info->native_ptr - jit_info->arena.start));
#endif

/*
 * TODO just call a sync function, which the architecture defines
 *      or not if not
 *
 *      This should be generalized and go along with the executable
 *      allocation functions as e.g. mem_close_executable()
 */

#ifdef PARROT_ARM
    arm_sync_d_i_cache(jit_info->arena.start, jit_info->native_ptr);
#endif
#ifdef PARROT_PPC
    ppc_sync_cache(jit_info->arena.start, jit_info->native_ptr);
#endif
#ifdef PARROT_HPPA
    hppa_sync_cache(jit_info->arena.start, jit_info->native_ptr);
#endif
#ifdef PARROT_IA64
    ia64_sync_cache(jit_info->arena.start, jit_info->native_ptr);
    return (jit_f)D2FPTR(&(jit_info->arena.start));
#endif


    /* assume gdb is available: generate symbol information  */
#if defined __GNUC__ || defined __IBMC__
    if (Interp_debug_TEST(interpreter, PARROT_JIT_DEBUG_FLAG)) {
        /*
         * TODO same like above here e.g. create ASM listing of code
         *      if real debug support isn't available
         */
        Parrot_jit_debug(interpreter);
    }
#endif

    return (jit_f)D2FPTR(jit_info->arena.start);
}

/*

=item C<void
Parrot_jit_newfixup(Parrot_jit_info_t *jit_info)>

Remember the current position in the native code for later update.

=cut

*/

void
Parrot_jit_newfixup(Parrot_jit_info_t *jit_info)
{
    Parrot_jit_fixup_t *fixup;

    fixup = mem_sys_allocate_zeroed(sizeof(*fixup));

    /* Insert fixup at the head of the list */
    fixup->next = jit_info->arena.fixups;
    jit_info->arena.fixups = fixup;

    /* Fill in the native code offset */
    fixup->native_offset =
        (ptrdiff_t)(jit_info->native_ptr - jit_info->arena.start);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/jit.h>, F<docs/jit.pod>,d F<src/jit_debug.c>,
F<jit/$jitcpuarch/jit_emit.h>, F<jit/$jitcpuarch/core.jit>.

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
