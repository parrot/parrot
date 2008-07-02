# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_simplexml.pir - PHP simplexml  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C< SimpleXMLElement::__construct(string data [, int options [, bool data_is_url [, string ns [, bool is_prefix]]]])>

SimpleXMLElement constructor

NOT IMPLEMENTED.

=cut

.sub 'SimpleXMLElement::__construct'
    not_implemented()
.end

=item C<void SimpleXMLElement::addAttribute(string qName, string value [,string ns])>

Add Attribute with optional namespace information

NOT IMPLEMENTED.

=cut

.sub 'SimpleXMLElement::addAttribute'
    not_implemented()
.end

=item C<void SimpleXMLElement::addChild(string qName [, string value [, string ns]])>

Add Element with optional namespace information

NOT IMPLEMENTED.

=cut

.sub 'SimpleXMLElement::addChild'
    not_implemented()
.end

=item C<string SimpleXMLElement::asXML([string filename])>

Return a well-formed XML string based on SimpleXML element

NOT IMPLEMENTED.

=cut

.sub 'SimpleXMLElement::asXML'
    not_implemented()
.end

=item C<array SimpleXMLElement::attributes([string ns [, bool is_prefix]])>

Identifies an element's attributes

NOT IMPLEMENTED.

=cut

.sub 'SimpleXMLElement::attributes'
    not_implemented()
.end

=item C<object SimpleXMLElement::children([string ns [, bool is_prefix]])>

Finds children of given node

NOT IMPLEMENTED.

=cut

.sub 'SimpleXMLElement::children'
    not_implemented()
.end

=item C<string SimpleXMLElement::getDocNamespaces([bool recursive])>

Return all namespaces registered with document

NOT IMPLEMENTED.

=cut

.sub 'SimpleXMLElement::getDocNamespaces'
    not_implemented()
.end

=item C<object SimpleXMLElement::getName()>

Finds children of given node

NOT IMPLEMENTED.

=cut

.sub 'SimpleXMLElement::getName'
    not_implemented()
.end

=item C<string SimpleXMLElement::getNamespaces([bool recursve])>

Return all namespaces in use

NOT IMPLEMENTED.

=cut

.sub 'SimpleXMLElement::getNamespaces'
    not_implemented()
.end

=item C<bool SimpleXMLElement::registerXPathNamespace(string prefix, string ns)>

Creates a prefix/ns context for the next XPath query

NOT IMPLEMENTED.

=cut

.sub 'SimpleXMLElement::registerXPathNamespace'
    not_implemented()
.end

=item C<array SimpleXMLElement::xpath(string path)>

Runs XPath query on the XML data

NOT IMPLEMENTED.

=cut

.sub 'SimpleXMLElement::xpath'
    not_implemented()
.end

=item C<simplemxml_element simplexml_import_dom(domNode node [, string class_name])>

Get a simplexml_element object from dom to allow for processing

NOT IMPLEMENTED.

=cut

.sub 'simplexml_import_dom'
    not_implemented()
.end

=item C<simplemxml_element simplexml_load_file(string filename [, string class_name [, int options [, string ns [, bool is_prefix]]]])>

Load a filename and return a simplexml_element object to allow for processing

NOT IMPLEMENTED.

=cut

.sub 'simplexml_load_file'
    not_implemented()
.end

=item C<simplemxml_element simplexml_load_string(string data [, string class_name [, int options [, string ns [, bool is_prefix]]]])>

Load a string and return a simplexml_element object to allow for processing

NOT IMPLEMENTED.

=cut

.sub 'simplexml_load_string'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
