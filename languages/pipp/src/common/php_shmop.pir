# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_shmop.pir - PHP shmop  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<void shmop_close(int shmid)>

closes a shared memory segment

NOT IMPLEMENTED.

=cut

.sub 'shmop_close'
    not_implemented()
.end

=item C<bool shmop_delete(int shmid)>

mark segment for deletion

NOT IMPLEMENTED.

=cut

.sub 'shmop_delete'
    not_implemented()
.end

=item C<int shmop_open(int key, string flags, int mode, int size)>

gets and attaches a shared memory segment

NOT IMPLEMENTED.

=cut

.sub 'shmop_open'
    not_implemented()
.end

=item C<string shmop_read(int shmid, int start, int count)>

reads from a shm segment

NOT IMPLEMENTED.

=cut

.sub 'shmop_read'
    not_implemented()
.end

=item C<int shmop_size(int shmid)>

returns the shm size

NOT IMPLEMENTED.

=cut

.sub 'shmop_size'
    not_implemented()
.end

=item C<int shmop_write(int shmid, string data, int offset)>

writes to a shared memory segment

NOT IMPLEMENTED.

=cut

.sub 'shmop_write'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
