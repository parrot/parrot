# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_sysvmsg.pir - PHP sysvmsg  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<resource msg_get_queue(int key [, int perms])>

Attach to a message queue

NOT IMPLEMENTED.

=cut

.sub 'msg_get_queue'
    not_implemented()
.end

=item C<mixed msg_receive(resource queue, int desiredmsgtype, int &msgtype, int maxsize, mixed message [, bool unserialize=true [, int flags=0 [, int errorcode]]])>

Send a message of type msgtype (must be > 0) to a message queue

NOT IMPLEMENTED.

=cut

.sub 'msg_receive'
    not_implemented()
.end

=item C<bool msg_remove_queue(resource queue)>

Destroy the queue

NOT IMPLEMENTED.

=cut

.sub 'msg_remove_queue'
    not_implemented()
.end

=item C<bool msg_send(resource queue, int msgtype, mixed message [, bool serialize=true [, bool blocking=true [, int errorcode]]])>

Send a message of type msgtype (must be > 0) to a message queue

NOT IMPLEMENTED.

=cut

.sub 'msg_send'
    not_implemented()
.end

=item C<bool msg_set_queue(resource queue, array data)>

Set information for a message queue

NOT IMPLEMENTED.

=cut

.sub 'msg_set_queue'
    not_implemented()
.end

=item C<array msg_stat_queue(resource queue)>

Returns information about a message queue

NOT IMPLEMENTED.

=cut

.sub 'msg_stat_queue'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
