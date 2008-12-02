/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include <assert.h>

int numconstants = 0;

/*

Helper function for printing ok messages.

*/
static void
ok(int i) {
    fprintf(stderr, "ok %d\n", i);
}


/*

Add a constant to the table.

*/
static int
add_const_table(PARROT_INTERP)
{
    size_t oldcount;
    size_t newcount;

    fprintf(stderr, "add const table %d\n", interp->code->const_table->const_count);

    assert(interp->code->const_table);
    oldcount = interp->code->const_table->const_count;
    newcount = oldcount + 1;

    /* Allocate a new constant */
    {
        PackFile_Constant *new_constant = PackFile_Constant_new(interp);

        /* Update the constant count and reallocate */
        if (interp->code->const_table->constants)
            interp->code->const_table->constants =
                mem_realloc_n_typed(interp->code->const_table->constants,
                    newcount, PackFile_Constant *);
        else
            interp->code->const_table->constants =
                mem_allocate_n_typed(newcount, PackFile_Constant *);

        interp->code->const_table->constants[oldcount] = new_constant;
        interp->code->const_table->const_count         = newcount;
    }

    numconstants++;
    fprintf(stderr, "created %dth constant\n", numconstants);
    return oldcount;
}

/*

Add a PMC constant

*/
static int
add_const_table_pmc(PARROT_INTERP, PMC *pmc)
{
    int newitem = add_const_table(interp);

    interp->code->const_table->constants[newitem]->type  = PFC_PMC;
    interp->code->const_table->constants[newitem]->u.key = pmc;

    return newitem;
}

/*

Add a string constant.

*/
static int
add_const_str(PARROT_INTERP, char * string)
{
    const int      k = add_const_table(interp);
    STRING * const s = string_make(interp, string, strlen(string), "ascii", PObj_constant_FLAG);

    interp->code->const_table->constants[k]->type     = PFC_STRING;
    interp->code->const_table->constants[k]->u.string = s;

    return k;
}

/*

Helper function to report error and bail out.

*/
void
err(char * message) {
    fprintf(stderr, "%s", message);
    exit(1);
}

/*

Bytecode generation test framework.

*/
int
main(int argc, char **argv) {
    Interp            *interp = Parrot_new(NULL);
    PackFile          *pf     = PackFile_new(interp, 0);
    PackFile_ByteCode *bc;
    int                bytes;
    PMC               *self;
    Parrot_sub        *sub;
    op_info_t         *op_info;
    int                op;
    opcode_t          *pc;
    size_t code_size;
    int str_index;


    Parrot_loadbc(interp, pf);

    interp->code = PF_create_default_segs(interp, "test.pir", 1);

    self = VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_INTERPRETER);
    (void) add_const_table_pmc(interp, self);

    ok(1);

    bytes = 4 * 3; /* 4 bytes per instruction; 3 = 2 instructions + 1 argument */
    interp->code->base.data
           = (opcode_t *) mem_sys_realloc(interp->code->base.data, bytes);


    interp->code->pic_index->data
           = (opcode_t *) mem_sys_realloc(interp->code->pic_index->data, bytes / 2);

    code_size = 3;
    interp->code->pic_index->size = (0 + code_size) / 2;

    pc = (opcode_t *)interp->code->base.data;

    /* add PIC idx */ /* I don't have a clue what this PIC is; is it still necessary? It's
      * not well described in pdd13-bytecode. :-( */
    /*
    if (parrot_PIC_op_is_cached(op)) {
        const size_t offs = pc - interp->code->base.data;

        interp->code->pic_index->data[offs / 2] = 2;
    }
    */

    /*
      the PASM that we want to compile is:
      ===========
      print_ic 42
      end
      ===========
      which is equal to:
      ==================
      .sub main :main
        print 42
      .end
      ==================
    */


    /* get the opcode for print_ic and store it in the area pointed to by pc. */
    op = interp->op_lib->op_code("print_ic", 1);
    *pc++ = op;
    /* add the argument, which is the integer 42. */
    *pc++ = 42;

    ok(2);

    /* get the opcode for end, and store it. */
    op    = interp->op_lib->op_code("end", 1);
    *pc++ = op;

    interp->code->base.size = code_size; /* this line added by tewk++ */


    ok(3);


    {  /* store the Sub PMC for "main".
          all of this code is from imcc/pbc.c.
       */
       const int            k    = add_const_table(interp);
       const int       subid_idx = add_const_str(interp, "main");
       PackFile_ConstTable *ct   = interp->code->const_table;
       PackFile_Constant   *pfc  = ct->constants[k];
       PMC *sub_pmc              = pmc_new(interp, enum_class_Sub);
       sub                       = PMC_sub(sub_pmc);

       sub->start_offs           = 0;
       sub->end_offs             = 3;
       sub->namespace_name       = NULL;
       sub->HLL_id               = CONTEXT(interp)->current_HLL;

       sub->lex_info             = NULL;
       sub->outer_sub            = NULL;
       sub->vtable_index         = -1;
       sub->multi_signature      = NULL;

       str_index                 = add_const_str(interp, "main");
       sub->name                 = ct->constants[str_index]->u.string;
       sub->ns_entry_name        = ct->constants[str_index]->u.string; /* added by tewk++ */
       sub->subid                = ct->constants[subid_idx]->u.string;


       { /* clear registers. Not sure if needed; comes from pbc.c. */
           int i;
           for (i = 0; i < 4; ++i)
               sub->n_regs_used[i] = 0;
       }

       Parrot_store_sub_in_namespace(interp, sub_pmc);
       /* pfc is a pointer to a PackFile_Constant, in ct->constants[k]
        * set the constant type and store the sub here.
        */
       pfc->type     = PFC_PMC;
       pfc->u.key    = sub_pmc;

       /* don't know what this does.
       */
       PackFile_FixupTable_new_entry(interp, "main", enum_fixup_sub, k);
    }
    ok(4);

    /* write the pbcfile; this seems to work fine. */
    {
        size_t    size;
        opcode_t *packed;
        FILE     *fp;
        char     *output_file = "test.pbc";


        assert(interp->code->base.pf);
        fprintf(stderr, "pf: %d\n", interp->code->base.pf);
        size = PackFile_pack_size(interp, interp->code->base.pf) * sizeof (opcode_t);
        fprintf(stderr, "size: %d\n", size);

        ok(5);
        packed = (opcode_t*) mem_sys_allocate(size);

        ok(6);
        PackFile_pack(interp, interp->code->base.pf, packed);

        ok(7);
        if ((fp = fopen(output_file, "wb")) == 0)
            fprintf(stderr, "Couldn't open %s\n", output_file);

        if ((1 != fwrite(packed, size, 1, fp)))
            fprintf(stderr, "Couldn't write %s\n", output_file);

        fclose(fp);

    }

    { /* load bytecode and run; apparently something's wrong here, because no output seen. */

      /* the example in docs/embed.pod doesn't seem to work either .. */

      /* running parrot test.pbc does work, however */

        PackFile *pf = Parrot_readbc(interp, "test.pbc");
        if (!pf)
            err("no packfile");

        Parrot_loadbc(interp, pf);

        PackFile_fixup_subs(interp, PBC_IMMEDIATE, NULL);

        Parrot_runcode(interp, argc, argv); /* doesn't actually seem to run... */

        Parrot_destroy(interp);

        ok(8);
    }


    return 0;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
