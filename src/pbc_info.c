/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/pbc_info.c - PacFile demo

=head1 SYNOPSIS

    % make pbc_info
    % ./pbc_info file.pbc

=head1 DESCRIPTION

Sample program for dumping PackFile segment names by iterating
over the main directory.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/embed.h"

/*

=item C<static INTVAL iter(Interp*, struct PackFile_Segment *seg, void *user_data)>

This function is passed the callback to C<PackFile_map_segments()> to
print out the name of each segment in the directoty.

=cut

*/

static INTVAL
iter(Interp* interpreter,
		struct PackFile_Segment *seg, void *user_data)
{
    int ident = (int)user_data;
    printf("%*.0s%s\n", ident, "", seg->name);
    if (seg->type == PF_DIR_SEG)
	PackFile_map_segments(interpreter, (struct PackFile_Directory*)seg,
		iter, (void*)(ident+2));
    return 0;
}

/*

=item C<int
main(int argc, char **argv)>

Reads the PBC from C<argv[1]>, adds a few extra sections, and then
iterates over the directory using C<PackFile_map_segments()> and
C<iter()>.

=cut

*/

int
main(int argc, char **argv)
{
    struct PackFile *pf;
    Interp *interpreter;
    struct PackFile_Segment *seg;

    interpreter = make_interpreter(NULL, NO_FLAGS);
    Parrot_init(interpreter);

    pf = Parrot_readbc(interpreter, argv[1]);

    /*
     * add some more segments
     */
    seg = PackFile_Segment_new_seg(interpreter,
		    &pf->directory, PF_DIR_SEG, "dir2", 1);
    seg = PackFile_Segment_new_seg(interpreter,
		    (struct PackFile_Directory*)seg, PF_BYTEC_SEG, "code", 1);
    seg = PackFile_Segment_new_seg(interpreter,
		    &pf->directory, PF_DIR_SEG, "dir3", 1);

    /*
     * show these
     */
    printf("%s\n", pf->directory.base.name);
    PackFile_map_segments(interpreter, &pf->directory, iter, (void*)2);

    Parrot_exit(0);
    return 0;
}

/*

=back

=head1 SEE ALSO

F<src/pbc.c>, F<include/parrot/pbc.h>.

=cut

*/

