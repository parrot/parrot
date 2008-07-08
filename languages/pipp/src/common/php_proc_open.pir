# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_proc_open.pir - PHP proc_open Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int proc_close(resource process)>

close a process opened by proc_open

NOT IMPLEMENTED.

=cut

.sub 'proc_close'
    not_implemented()
.end

=item C<array proc_get_status(resource process)>

get information about a process opened by proc_open

NOT IMPLEMENTED.

=cut

.sub 'proc_get_status'
    not_implemented()
.end

=item C<resource proc_open(string command, array descriptorspec, array &pipes [, string cwd [, array env [, array other_options]]])>

Run a process with more control over it's file descriptors

NOT IMPLEMENTED.

=cut

.sub 'proc_open'
    not_implemented()
.end

=item C<bool proc_terminate(resource process [, long signal])>

kill a process opened by proc_open

NOT IMPLEMENTED.

=cut

.sub 'proc_terminate'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
