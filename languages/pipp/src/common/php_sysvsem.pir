# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_sysvsem.pir - PHP sysvsem  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool sem_acquire(resource id)>

Acquires the semaphore with the given id, blocking if necessary

NOT IMPLEMENTED.

=cut

.sub 'sem_acquire'
    not_implemented()
.end

=item C<resource sem_get(int key [, int max_acquire [, int perm [, int auto_release]])>

Return an id for the semaphore with the given key, and allow max_acquire (default 1) processes to acquire it simultaneously

NOT IMPLEMENTED.

=cut

.sub 'sem_get'
    not_implemented()
.end

=item C<bool sem_release(resource id)>

Releases the semaphore with the given id

NOT IMPLEMENTED.

=cut

.sub 'sem_release'
    not_implemented()
.end

=item C<bool sem_remove(resource id)>

Removes semaphore from Unix systems

NOT IMPLEMENTED.

=cut

.sub 'sem_remove'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
