/*
 * optimizer.c
 *
 * pre_optimizer  run before CFG
 * optimizer      after CFG is built
 * post_optimizer after register allocation
 *
 */
#include <string.h>
#include "imc.h"
#include "optimizer.h"


/*
 * current default optimization is -O1 (s. imcc.y)
 *
 *
 * pre_optimizer
 * -------------
 *
 * runs before CFG is built
 *
 * if_branch ... converts if/branch/label like so:
 *
 *      if x, L1          unless x, L2
 *      branch L2         ---
 *    L1:               L2:
 *    ...
 *    L2:
 *
 * unused_label ... deletes them (as L1 above)
 *
 * stages currently not needed by ocde from perl6:
 * jump optimization (jumps to jumps ...)
 *
 *
 * optimizer
 * ---------
 *
 * TODO e.g. constant_propagation
 *
 *
 *  post_optimizer
 *  ---------------
 *
 *  runs after register alloocation
 *
 *  e.g. eliminate new Px .PerlUndef
 *  because Px where different before
 *
 */
static void if_branch(void);
static void branch_branch(void);
static void unused_label(void);
static int used_once(void);
static int loop_optimization(void);
static int clone_remove(void);

void pre_optimize() {
    if (*optimizer_opt != '0') {      /* XXX */
        if_branch();
        branch_branch();
        /* XXX cfg / loop detection breaks e.g. in t/compiler/5_3 */
        unused_label();
    }
}

int optimize() {

    if (*optimizer_opt > '1') {      /* XXX */
        /* constant_propagation(); N/Y */
        if (clone_remove())
            return 1;
        if (used_once())
            return 1;
        if (loop_optimization())
            return 1;
    }
    return 0;
}

/* get negated opterator for op */
static char * get_neg_op(char *op, int *nargs)
{
    static struct br_pairs {
        char *op;
        char *nop;
        int nargs;
    } br_pairs[] = {
    { "if", "unless", 2 },
    { "eq", "ne", 3 },
    { "gt", "le", 3 },
    { "ge", "lt", 3 },
    };
    int i;
    for (i = 0; i < sizeof(br_pairs)/sizeof(br_pairs[0]); i++) {
        *nargs = br_pairs[i].nargs;
        if (strcmp(op, br_pairs[i].op) == 0)
            return br_pairs[i].nop;
        if (strcmp(op, br_pairs[i].nop) == 0)
            return br_pairs[i].op;
    }
    return 0;
}


/* if cond L1        => unless cond L2
 * branch L2            ---
 * L1:                  L2:
 */
static void if_branch()
{
    Instruction *ins, *last;
    int reg;

    /* reset statistic globals */
    ostat.if_branch = 0;

    last = instructions;
    if (!last->next)
        return;
    for (ins = last->next; ins; ) {
        if ((last->type & ITBRANCH) &&          /* if ...Lx */
                (ins->type & IF_goto) &&        /* branch Ly*/
                (reg = get_branch_regno(last)) >= 0) {
            SymReg * br_dest = last->r[reg];
            if (ins->next &&
                    (ins->next->type & ITLABEL) &&    /* Lx */
                    ins->next->r[0] == br_dest) {
                char * neg_op;
                SymReg * go = get_branch_reg(ins);
                int args;

                debug(1,"if_branch %s ... %s\n", last->op, br_dest->name);
                /* find the negated op (e.g if->unless, ne->eq ... */
                if ((neg_op = get_neg_op(last->op, &args)) != 0) {
                    Instruction * tmp;
                    last->r[reg] = go;
                    tmp = INS(neg_op, "", last->r, args, 0, 0);
                    last->opnum = tmp->opnum;
                    last->opsize = tmp->opsize;
                    free(last->op);
                    last->op = strdup(neg_op);
                    free_ins(tmp);

                    /* delete branch */
                    ostat.deleted_ins++;
                    ins = delete_ins(ins, 1);
                    ostat.if_branch++;
                }
            } /* label found */
        } /* branch detected */
        last = ins;
        ins = ins->next;
    }
}

/*
 * branch L1
 * branch L2  <- not reached
 */
static void branch_branch()
{
    Instruction *ins, *last;

    /* reset statistic globals */
    ostat.branch_branch = 0;

    last = instructions;
    if (!last->next)
        return;
    for (ins = last->next; ins; ) {
        if ((last->type & IF_goto) &&           /* branch Lx */
                (ins->type & IF_goto)) {        /* branch Ly*/
            ostat.deleted_ins++;
            ins = delete_ins(ins, 1);
            ostat.branch_branch++;
        }
        last = ins;
        ins = ins->next;
    }
}

static void unused_label()
{
    Instruction *ins, *ins2, *last;
    SymReg * addr;
    int used;

    for (last = 0, ins = instructions; ins; ins = ins->next) {
        if (ins->type & ITLABEL) {
            SymReg * lab = ins->r[0];
            used = 0;
            for (ins2 = instructions; ins2; ins2 = ins2->next) {
                if ((addr = get_branch_reg(ins2)) != 0) {
                    if (addr == lab && addr->type == VTADDRESS) {
                        used = 1;
                        break;
                    }
                }
            }
            if (!used && last) {
                ostat.deleted_labels++;
                debug(1, "label %s deleted\n", lab->name);
                ostat.deleted_ins++;
                delete_ins(ins, 1);
                last = ins;
                continue;
            }

        }
        last = ins;
    }
}

static int used_once()
{
    Instruction *ins;
    SymReg * r;
    int opt = 0;

    for (ins = instructions; ins; ins = ins->next) {
        if (!ins->r)
            continue;
        r = ins->r[0];
        if (!r)
            continue;
        if (r->use_count == 1 && r->lhs_use_count == 1) {
            delete_ins(ins, 1);
            ostat.deleted_ins++;
            ostat.used_once++;
            opt++;
        }
    }
    return opt;
}

static int
max_loop_depth()
{
    int i, d;
    d = 0;
    for (i = 0; i < n_basic_blocks; i++)
        if (bb_list[i]->loop_depth > d)
            d = bb_list[i]->loop_depth;
    return d;
}

static int reason;
enum check_t { CHK_INV_NEW, CHK_INV_SET, CHK_CLONE };

static int
_is_ins_save(Instruction *check_ins, SymReg *r, int what)
{
    Instruction *ins;
    int bb;
    int use_count, lhs_use_count;
    int i, in_use;
    int new_bl=-1, set_bl=-1;

    /* now check all instructions where r is used */

    /* we give up fast ;-) */
    switch (what) {
        case CHK_INV_NEW:
        case CHK_INV_SET:
            if (r->set == 'P' && r->lhs_use_count != 2)
                return reason=1,0;
            if (r->set != 'P' && r->lhs_use_count != 1)
                return reason=2,0;
            break;
        case CHK_CLONE:
            if (r->set == 'P' && r->lhs_use_count != 2)
                return reason=1,0;
            break;
    }

    use_count = r->use_count;
    lhs_use_count = r->lhs_use_count;
    for (bb = 0; bb < n_basic_blocks; bb++) {
        Life_range *lr = r->life_info[bb];

        for (ins = lr->first_ins; ins; ins = ins->next) {
            int nregs;
            /* finished with this range */
            if (!lr->last_ins->next || ins == lr->last_ins->next)
                break;
            for (i = in_use = 0; ins->r[i]; i++)
                if (ins->r[i] == r) {
                    in_use++;
                }
            nregs = i;
            if (!in_use)
                continue;

            /* var is in use in this ins */
            use_count--;
            if (instruction_writes(ins, r)) {
                lhs_use_count--;
                if (!strcmp(ins->op, "new"))
                    new_bl=bb;
                if (!strcmp(ins->op, ""))
                    set_bl=bb;
            }
            /* this is the instruction, to check, it's save */
            if (check_ins == ins)
                continue;

            /* now look for dangerous ops */
            if (!strcmp(ins->op, "find_global"))
                return reason=4,0;
            if (!strcmp(ins->op, "store_global"))
                return reason=4,0;
            if (!strcmp(ins->op, "push"))
                return reason=4,0;
            if (!strcmp(ins->op, "pop"))
                return reason=4,0;
            if (!strcmp(ins->op, "clone"))
                return reason=4,0;
            /* indexed set/get ??? XXX, as index is ok */
            if (0 && ! strcmp(ins->op, "set") && nregs != 2)
                return reason=5,0;
            /*
             * set P, P  - dangerous?
             */
            if (ins->type & ITALIAS)
                return reason=6,0;
            /* we saw all occurencies of reg, so fine */
            if (lhs_use_count == 0 && use_count == 0) {
                if (what == CHK_INV_SET && new_bl != set_bl)
                    return 0;
                return 1;
            }
        }
        /* we have finished this life range */
    } /* for bb */
    return what == CHK_CLONE ? 1 : (reason=10,0);
}

static int is_ins_save(Instruction *ins, SymReg *r, int what) {
    int save;

    reason = 0;
    save = _is_ins_save(ins, r, what);
    if (!save && reason)
        debug(2, "ins not save var %s reason %d %s\n",
                r->name, reason, ins_string(ins));
    return save;
}

static int
is_invariant(Instruction *ins)
{
    int ok = 0;
    int what;
    if (! strcmp(ins->op, "new") &&
            !strcmp(ins->r[1]->name, "PerlUndef")) {
        ok = 1;
        what = CHK_INV_NEW;
    }
    /* only, if once assigned and not changed */
    else if (! strcmp(ins->op, "set") &&
            !(ins->r[0]->usage & U_KEYED) &&
            ins->r[1]->type & VTCONST) {
        ok = 1;
        what = CHK_INV_SET;
    }
    if (ok)
        return is_ins_save(ins, ins->r[0], what);
    return 0;
}

Basic_block *
find_outer(Basic_block * blk)
{
    int bb = blk->index;
    int i;

    /* loops are sorted depth last */
    for (i = n_loops-1; i >= 0; i--)
        if (set_contains(loop_info[i]->loop, bb))
            if (loop_info[i]->entry >= 0)
                return bb_list[loop_info[i]->entry];
    return 0;
}

/* move the instruction ins before loop in bb */
static int
move_ins_out(Instruction **ins, Basic_block *bb)
{
    Basic_block *pred;
    Instruction * next, *out;

    /* check loop_info, where this loop started
     * actually, this moves instruction to block 0 */

    pred = bb_list[0]; /* find_outer(bb); */
    if (!pred) {
        debug(1, "outer loop not found (CFG?)\n");
        return 0;
    }
    out = pred->end->prev;
    next = (*ins)->next;
    (*ins)->bbindex = pred->index;
    debug(2, "inserting it in blk %d after %s\n", pred->index,
            ins_string(out));
    *ins = move_ins(*ins, out);
    if (IMCC_DEBUG>1) {
        char buf[256];
        SymReg * regs[IMCC_MAX_REGS];
        Instruction * tmp;

        regs[0] = 0;
        sprintf(buf, "# Invar moved: %s",ins_string(out->next));
        tmp = INS("", buf, regs, 0, 0, 0);
        insert_ins((*ins)->prev, tmp);
    }
    ostat.invariants_moved++;
    /* XXX CFG is changed here, which also means
     * that the life_info is wrong now
     * so, currently we calc CFG and life again */
    return 1;
}

static int
loop_one(int bnr)
{
    Basic_block *bb = bb_list[bnr];
    Instruction *ins;
    int changed = 0;

    if (bnr == 0) {
        warning("loop_one", "wrong loop depth in block 0\n");
        return 0;
    }
    debug(2, "loop_one blk %d\n", bnr);
    for (ins = bb->start ; ins ; ins = ins->next) {
        reason = 0;
        if (is_invariant(ins)) {
            debug(2, "found invariant %s\n", ins_string(ins));
            if (move_ins_out(&ins, bb)) {
                changed++;
                ins = ins->prev;
            }
        }
        if (ins == bb->end)
            break;
    }
    return changed;

}

int
loop_optimization()
{
    int l, bb, loop_depth;
    int changed = 0;
    static int prev_depth;

    loop_depth = prev_depth ? prev_depth : max_loop_depth();
    /* work from inside out */
    debug(1, "loop_optimization\n");
    for (l = loop_depth; l > 0; l--) {
        debug(2, "loop_depth %d\n", l);
        for (bb = 0; bb < n_basic_blocks; bb++)
            if (bb_list[bb]->loop_depth == l) {
                changed |= loop_one(bb);
            }
        /* currently e.g. mandel.p6 breaks, if not only the most
         * inner loop is changed, but outer loops to */
        if (changed) {
            prev_depth = l-1;
            debug(2,"after loop_opt\n");
            if (IMCC_DEBUG>1)
                dump_instructions();
            return changed;
        }
    }
    prev_depth = 0;
    return 0;
}

static int check_clone(Instruction *ins)
{
    SymReg * rl = ins->r[0];
    SymReg * rr = ins->r[1];
    if (0 && is_ins_save(ins, rl, CHK_CLONE) &&
        is_ins_save(ins, rr, CHK_CLONE)) {
        debug(1, "clone %s removed\n", ins_string(ins));
        free(ins->op);
        ins->op = strdup("set");
        return 1;
    }
    return 0;
}

static int
clone_remove()
{
    Instruction *ins;
    int changes = 0;
    debug(1, "clone_remove\n");
    for (ins = instructions; ins; ins = ins->next)
        if (!strcmp(ins->op, "clone"))
            changes |= check_clone(ins);
    return changes;
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
