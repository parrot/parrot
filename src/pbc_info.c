/* pbc_info.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Sample program dumping PackFile segment names by iterating
 *     over the main directory.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/embed.h"

static INTVAL iter(struct PackFile_Segment *seg, void *user_data)
{
    int ident = (int)user_data;
    printf("%*.0s%s\n", ident, "", seg->name);
    if (seg->type == PF_DIR_SEG)
	PackFile_map_segments((struct PackFile_Directory*)seg,
		iter, (void*)(ident+2));
    return 0;
}

int
main(int argc, char **argv)
{
    struct PackFile *pf;
    struct Parrot_Interp *interpreter;
    struct PackFile_Segment *seg;

    interpreter = make_interpreter(NULL, NO_FLAGS);
    Parrot_init(interpreter);

    pf = Parrot_readbc(interpreter, argv[1]);

    /*
     * add smome more segments
     */
    seg = PackFile_Segment_new_seg(&pf->directory, PF_DIR_SEG, "dir2", 1);
    seg = PackFile_Segment_new_seg((struct PackFile_Directory*)seg,
	    PF_BYTEC_SEG, "code", 1);
    seg = PackFile_Segment_new_seg(&pf->directory, PF_DIR_SEG, "dir3", 1);

    /*
     * show these
     */
    printf("%s\n", pf->directory.base.name);
    PackFile_map_segments(&pf->directory, iter, (void*)2);

    Parrot_exit(0);
    return 0;
}
