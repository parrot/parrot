# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_sysvshm.pir - PHP sysvshm  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int shm_attach(int key [, int memsize [, int perm]])>

Creates or open a shared memory segment

NOT IMPLEMENTED.

=cut

.sub 'shm_attach'
    not_implemented()
.end

=item C<bool shm_detach(int shm_identifier)>

Disconnects from shared memory segment

NOT IMPLEMENTED.

=cut

.sub 'shm_detach'
    not_implemented()
.end

=item C<mixed shm_get_var(int id, int variable_key)>

Returns a variable from shared memory

NOT IMPLEMENTED.

=cut

.sub 'shm_get_var'
    not_implemented()
.end

=item C<bool shm_put_var(int shm_identifier, int variable_key, mixed variable)>

Inserts or updates a variable in shared memory

NOT IMPLEMENTED.

=cut

.sub 'shm_put_var'
    not_implemented()
.end

=item C<bool shm_remove(int shm_identifier)>

Removes shared memory from Unix systems

NOT IMPLEMENTED.

=cut

.sub 'shm_remove'
    not_implemented()
.end

=item C<bool shm_remove_var(int id, int variable_key)>

Removes variable from shared memory

NOT IMPLEMENTED.

=cut

.sub 'shm_remove_var'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
