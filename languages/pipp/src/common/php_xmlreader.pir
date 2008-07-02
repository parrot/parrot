# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_xmlreader.pir - PHP xmlreader  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<boolean XMLReader::XML(string source [, string encoding [, int options]])>

Sets the string that the the XMLReader will parse.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::XML'
    not_implemented()
.end

=item C<boolean XMLReader::close()>

Closes xmlreader - current frees resources until xmlTextReaderClose is fixed in libxml

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::close'
    not_implemented()
.end

=item C<boolean XMLReader::expand()>

Moves the position of the current instance to the next node in the stream.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::expand'
    not_implemented()
.end

=item C<string XMLReader::getAttribute(string name)>

Get value of an attribute from current element

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::getAttribute'
    not_implemented()
.end

=item C<string XMLReader::getAttributeNo(int index)>

Get value of an attribute at index from current element

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::getAttributeNo'
    not_implemented()
.end

=item C<string XMLReader::getAttributeNs(string name, string namespaceURI)>

Get value of a attribute via name and namespace from current element

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::getAttributeNs'
    not_implemented()
.end

=item C<boolean XMLReader::getParserProperty(int property)>

Indicates whether given property (one of the parser option constants) is set or not on parser

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::getParserProperty'
    not_implemented()
.end

=item C<boolean XMLReader::isValid()>

Returns boolean indicating if parsed document is valid or not.
Must set XMLREADER_LOADDTD or XMLREADER_VALIDATE parser option prior to the first call to read
or this method will always return FALSE

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::isValid'
    not_implemented()
.end

=item C<string XMLReader::lookupNamespace(string prefix)>

Return namespaceURI for associated prefix on current node

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::lookupNamespace'
    not_implemented()
.end

=item C<boolean XMLReader::moveToAttribute(string name)>

Positions reader at specified attribute - Returns TRUE on success and FALSE on failure

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::moveToAttribute'
    not_implemented()
.end

=item C<boolean XMLReader::moveToAttributeNo(int index)>

Positions reader at attribute at spcecified index.
Returns TRUE on success and FALSE on failure

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::moveToAttributeNo'
    not_implemented()
.end

=item C<boolean XMLReader::moveToAttributeNs(string name, string namespaceURI)>

Positions reader at attribute spcified by name and namespaceURI.
Returns TRUE on success and FALSE on failure

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::moveToAttributeNs'
    not_implemented()
.end

=item C<boolean XMLReader::moveToElement()>

Moves the position of the current instance to the node that contains the current Attribute node.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::moveToElement'
    not_implemented()
.end

=item C<boolean XMLReader::moveToFirstAttribute()>

Moves the position of the current instance to the first attribute associated with the current node.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::moveToFirstAttribute'
    not_implemented()
.end

=item C<boolean XMLReader::moveToNextAttribute()>

Moves the position of the current instance to the next attribute associated with the current node.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::moveToNextAttribute'
    not_implemented()
.end

=item C<boolean XMLReader::next([string localname])>

Moves the position of the current instance to the next node in the stream.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::next'
    not_implemented()
.end

=item C<boolean XMLReader::open(string URI [, string encoding [, int options]])>

Sets the URI that the the XMLReader will parse.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::open'
    not_implemented()
.end

=item C<boolean XMLReader::read()>

Moves the position of the current instance to the next node in the stream.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::read'
    not_implemented()
.end

=item C<boolean XMLReader::readInnerXml()>

Reads the contents of the current node, including child nodes and markup.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::readInnerXml'
    not_implemented()
.end

=item C<boolean XMLReader::readOuterXml()>

Reads the contents of the current node, including child nodes and markup.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::readOuterXml'
    not_implemented()
.end

=item C<boolean XMLReader::readString()>

Reads the contents of an element or a text node as a string.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::readString'
    not_implemented()
.end

=item C<boolean XMLReader::setParserProperty(int property, boolean value)>

Sets parser property (one of the parser option constants).
Properties must be set after open() or XML() and before the first read() is called

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::setParserProperty'
    not_implemented()
.end

=item C<boolean XMLReader::setRelaxNGSchema(string filename)>

Sets the string that the the XMLReader will parse.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::setRelaxNGSchema'
    not_implemented()
.end

=item C<boolean XMLReader::setRelaxNGSchemaSource(string source)>

Sets the string that the the XMLReader will parse.

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::setRelaxNGSchemaSource'
    not_implemented()
.end

=item C<boolean XMLReader::setSchema(string filename)>

Use W3C XSD schema to validate the document as it is processed. Activation is only possible before the first Read().

NOT IMPLEMENTED.

=cut

.sub 'XMLReader::setSchema'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
