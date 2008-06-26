# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_wddx.pir - PHP wddx  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int wddx_add_vars(int packet_id,  mixed var_names [, mixed ...])>

Serializes given variables and adds them to packet given by packet_id

NOT IMPLEMENTED.

=cut

.sub 'wddx_add_vars'
    not_implemented()
.end

=item C<mixed wddx_deserialize(mixed packet)>

Deserializes given packet and returns a PHP value

NOT IMPLEMENTED.

=cut

.sub 'wddx_deserialize'
    not_implemented()
.end

=item C<string wddx_packet_end(int packet_id)>

Ends specified WDDX packet and returns the string containing the packet

NOT IMPLEMENTED.

=cut

.sub 'wddx_packet_end'
    not_implemented()
.end

=item C<int wddx_packet_start([string comment])>

Starts a WDDX packet with optional comment and returns the packet id

NOT IMPLEMENTED.

=cut

.sub 'wddx_packet_start'
    not_implemented()
.end

=item C<string wddx_serialize_value(mixed var [, string comment])>

Creates a new packet and serializes the given value

NOT IMPLEMENTED.

=cut

.sub 'wddx_serialize_value'
    not_implemented()
.end

=item C<string wddx_serialize_vars(mixed var_name [, mixed ...])>

Creates a new packet and serializes given variables into a struct

NOT IMPLEMENTED.

=cut

.sub 'wddx_serialize_vars'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
