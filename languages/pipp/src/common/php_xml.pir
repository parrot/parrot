# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_xml.pir - PHP xml  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string utf8_decode(string data)>

Converts a UTF-8 encoded string to ISO-8859-1

NOT IMPLEMENTED.

=cut

.sub 'utf8_decode'
    not_implemented()
.end

=item C<string utf8_encode(string data)>

Encodes an ISO-8859-1 string to UTF-8

NOT IMPLEMENTED.

=cut

.sub 'utf8_encode'
    not_implemented()
.end

=item C<string xml_error_string(int code)>

Get XML parser error string

NOT IMPLEMENTED.

=cut

.sub 'xml_error_string'
    not_implemented()
.end

=item C<int xml_get_current_byte_index(resource parser)>

Get current byte index for an XML parser

NOT IMPLEMENTED.

=cut

.sub 'xml_get_current_byte_index'
    not_implemented()
.end

=item C<int xml_get_current_column_number(resource parser)>

Get current column number for an XML parser

NOT IMPLEMENTED.

=cut

.sub 'xml_get_current_column_number'
    not_implemented()
.end

=item C<int xml_get_current_line_number(resource parser)>

Get current line number for an XML parser

NOT IMPLEMENTED.

=cut

.sub 'xml_get_current_line_number'
    not_implemented()
.end

=item C<int xml_get_error_code(resource parser)>

Get XML parser error code

NOT IMPLEMENTED.

=cut

.sub 'xml_get_error_code'
    not_implemented()
.end

=item C<int xml_parse(resource parser, string data [, int isFinal])>

Start parsing an XML document

NOT IMPLEMENTED.

=cut

.sub 'xml_parse'
    not_implemented()
.end

=item C<int xml_parse_into_struct(resource parser, string data, array &struct, array &index)>

Parsing a XML document

NOT IMPLEMENTED.

=cut

.sub 'xml_parse_into_struct'
    not_implemented()
.end

=item C<resource xml_parser_create([string encoding])>

Create an XML parser

NOT IMPLEMENTED.

=cut

.sub 'xml_parser_create'
    not_implemented()
.end

=item C<resource xml_parser_create_ns([string encoding [, string sep]])>

Create an XML parser

NOT IMPLEMENTED.

=cut

.sub 'xml_parser_create_ns'
    not_implemented()
.end

=item C<int xml_parser_free(resource parser)>

Free an XML parser

NOT IMPLEMENTED.

=cut

.sub 'xml_parser_free'
    not_implemented()
.end

=item C<int xml_parser_get_option(resource parser, int option)>

Get options from an XML parser

NOT IMPLEMENTED.

=cut

.sub 'xml_parser_get_option'
    not_implemented()
.end

=item C<int xml_parser_set_option(resource parser, int option, mixed value)>

Set options in an XML parser

NOT IMPLEMENTED.

=cut

.sub 'xml_parser_set_option'
    not_implemented()
.end

=item C<int xml_set_character_data_handler(resource parser, string hdl)>

Set up character data handler

NOT IMPLEMENTED.

=cut

.sub 'xml_set_character_data_handler'
    not_implemented()
.end

=item C<int xml_set_default_handler(resource parser, string hdl)>

Set up default handler

NOT IMPLEMENTED.

=cut

.sub 'xml_set_default_handler'
    not_implemented()
.end

=item C<int xml_set_element_handler(resource parser, string shdl, string ehdl)>

Set up start and end element handlers

NOT IMPLEMENTED.

=cut

.sub 'xml_set_element_handler'
    not_implemented()
.end

=item C<int xml_set_end_namespace_decl_handler(resource parser, string hdl)>

Set up character data handler

NOT IMPLEMENTED.

=cut

.sub 'xml_set_end_namespace_decl_handler'
    not_implemented()
.end

=item C<int xml_set_external_entity_ref_handler(resource parser, string hdl)>

Set up external entity reference handler

NOT IMPLEMENTED.

=cut

.sub 'xml_set_external_entity_ref_handler'
    not_implemented()
.end

=item C<int xml_set_notation_decl_handler(resource parser, string hdl)>

Set up notation declaration handler

NOT IMPLEMENTED.

=cut

.sub 'xml_set_notation_decl_handler'
    not_implemented()
.end

=item C<int xml_set_object(resource parser, object &obj)>

Set up object which should be used for callbacks

NOT IMPLEMENTED.

=cut

.sub 'xml_set_object'
    not_implemented()
.end

=item C<int xml_set_processing_instruction_handler(resource parser, string hdl)>

Set up processing instruction (PI) handler

NOT IMPLEMENTED.

=cut

.sub 'xml_set_processing_instruction_handler'
    not_implemented()
.end

=item C<int xml_set_start_namespace_decl_handler(resource parser, string hdl)>

Set up character data handler

NOT IMPLEMENTED.

=cut

.sub 'xml_set_start_namespace_decl_handler'
    not_implemented()
.end

=item C<int xml_set_unparsed_entity_decl_handler(resource parser, string hdl)>

Set up unparsed entity declaration handler

NOT IMPLEMENTED.

=cut

.sub 'xml_set_unparsed_entity_decl_handler'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
