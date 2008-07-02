# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_xmlrpc.pir - PHP xmlrpc  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<array xmlrpc_decode(string xml [, string encoding])>

Decodes XML into native PHP types

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_decode'
    not_implemented()
.end

=item C<array xmlrpc_decode_request(string xml, string& method [, string encoding])>

Decodes XML into native PHP types

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_decode_request'
    not_implemented()
.end

=item C<string xmlrpc_encode(mixed value)>

Generates XML for a PHP value

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_encode'
    not_implemented()
.end

=item C<string xmlrpc_encode_request(string method, mixed params)>

Generates XML for a method request

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_encode_request'
    not_implemented()
.end

=item C<string xmlrpc_get_type(mixed value)>

Gets xmlrpc type for a PHP value. Especially useful for base64 and datetime strings

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_get_type'
    not_implemented()
.end

=item C<bool xmlrpc_is_fault(array)>

Determines if an array value represents an XMLRPC fault.

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_is_fault'
    not_implemented()
.end

=item C<array xmlrpc_parse_method_descriptions(string xml)>

Decodes XML into a list of method descriptions

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_parse_method_descriptions'
    not_implemented()
.end

=item C<int xmlrpc_server_add_introspection_data(resource server, array desc)>

Adds introspection documentation

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_server_add_introspection_data'
    not_implemented()
.end

=item C<mixed xmlrpc_server_call_method(resource server, string xml, mixed user_data [, array output_options])>

Parses XML requests and call methods

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_server_call_method'
    not_implemented()
.end

=item C<resource xmlrpc_server_create(void)>

Creates an xmlrpc server

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_server_create'
    not_implemented()
.end

=item C<int xmlrpc_server_destroy(resource server)>

Destroys server resources

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_server_destroy'
    not_implemented()
.end

=item C<bool xmlrpc_server_register_introspection_callback(resource server, string function)>

Register a PHP function to generate documentation

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_server_register_introspection_callback'
    not_implemented()
.end

=item C<bool xmlrpc_server_register_method(resource server, string method_name, string function)>

Register a PHP function to handle method matching method_name

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_server_register_method'
    not_implemented()
.end

=item C<bool xmlrpc_set_type(string value, string type)>

Sets xmlrpc type, base64 or datetime, for a PHP string value

NOT IMPLEMENTED.

=cut

.sub 'xmlrpc_set_type'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
