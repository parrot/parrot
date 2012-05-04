/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

pbc_info - PackFile demo

=head1 SYNOPSIS

 pbc_info file.pbc

=head1 DESCRIPTION

Sample program for dumping PackFile segment names by iterating
over the main directory.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/*
=item C<static INTVAL iter(PARROT_INTERP, PackFile_Segment *seg, void
*user_data)>

=item C<static INTVAL iter(PARROT_INTERP, PackFile_Segment *seg, void *user_data)>

This function is passed the callback to PackFile_map_segments() to print out
the name of each segment in the directory.

=cut

*/

static INTVAL
iter(PARROT_INTERP, PackFile_Segment *seg, void *user_data)
{
    long ident = (long)user_data;
    int length = ident;
    printf("%*.0s%s\n", length, "", seg->name);
    if (seg->type == PF_DIR_SEG)
        PackFile_map_segments(interp, (PackFile_Directory*)seg,
                iter, (void*)(ident+2));
    return 0;
}

/*

=item C<int main(int argc, char *argv[])>

Reads the PBC from argv[1], adds a few extra sections, and then iterates over
the directory using PackFile_map_segments() and iter().

=cut

*/

int
main(SHIM(int argc), char *argv[])
{
    PackFile *pf;
    Interp *interp;
    PackFile_Segment *seg;

    interp = Parrot_new(NULL);

    pf = Parrot_pbc_read(interp, argv[1], PFOPT_UTILS);

    /*
     * add some more segments
     */
    seg = PackFile_Segment_new_seg(interp,
                    &pf->directory, PF_DIR_SEG, "dir2", 1);
    seg = PackFile_Segment_new_seg(interp,
                    (PackFile_Directory*)seg, PF_BYTEC_SEG, "code", 1);
    seg = PackFile_Segment_new_seg(interp,
                    &pf->directory, PF_DIR_SEG, "dir3", 1);

    /*
     * show these
     */
    printf("%s\n", pf->directory.base.name);
    PackFile_map_segments(interp, &pf->directory, iter, (void*)2);

    Parrot_x_exit(interp, 0);
}

/*

=back

=head1 SEE ALSO

F<src/packfile.c>, F<include/parrot/packfile.h>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

