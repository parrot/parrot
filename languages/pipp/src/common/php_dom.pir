# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_dom.pir - PHP dom  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<void DOMAttr::__construct(string name, [string value])>



NOT IMPLEMENTED.

=cut

.sub 'DOMAttr::__construct'
    not_implemented()
.end

=item C<void DOMCdataSection::__construct(string value)>



NOT IMPLEMENTED.

=cut

.sub 'DOMCdataSection::__construct'
    not_implemented()
.end

=item C<void DOMComment::__construct([string value])>



NOT IMPLEMENTED.

=cut

.sub 'DOMComment::__construct'
    not_implemented()
.end

=item C<void DOMDocument::__construct([string version], [string encoding])>



NOT IMPLEMENTED.

=cut

.sub 'DOMDocument::__construct'
    not_implemented()
.end

=item C<boolean DOMDocument::registerNodeClass(string baseclass, string extendedclass)>

Register extended class used to create base node type

NOT IMPLEMENTED.

=cut

.sub 'DOMDocument::registerNodeClass'
    not_implemented()
.end

=item C<void DOMDocumentFragment::__construct()>



NOT IMPLEMENTED.

=cut

.sub 'DOMDocumentFragment::__construct'
    not_implemented()
.end

=item C<void DOMDocumentFragment::appendXML(string data)>



NOT IMPLEMENTED.

=cut

.sub 'DOMDocumentFragment::appendXML'
    not_implemented()
.end

=item C<void DOMElement::__construct(string name, [string value], [string uri])>



NOT IMPLEMENTED.

=cut

.sub 'DOMElement::__construct'
    not_implemented()
.end

=item C<void DOMEntityReference::__construct(string name)>



NOT IMPLEMENTED.

=cut

.sub 'DOMEntityReference::__construct'
    not_implemented()
.end

=item C<string DOMNode::C14N([bool exclusive [, bool with_comments [, array xpath [, array ns_prefixes]]]])>

Canonicalize nodes to a string

NOT IMPLEMENTED.

=cut

.sub 'DOMNode::C14N'
    not_implemented()
.end

=item C<int DOMNode::C14NFile(string uri [, bool exclusive [, bool with_comments [, array xpath [, array ns_prefixes]]]])>

Canonicalize nodes to a file

NOT IMPLEMENTED.

=cut

.sub 'DOMNode::C14NFile'
    not_implemented()
.end

=item C<int DOMNode::getNodePath()>

Gets an xpath for a node

NOT IMPLEMENTED.

=cut

.sub 'DOMNode::getNodePath'
    not_implemented()
.end

=item C<void DOMProcessingInstruction::__construct(string name, [string value])>



NOT IMPLEMENTED.

=cut

.sub 'DOMProcessingInstruction::__construct'
    not_implemented()
.end

=item C<void DOMText::__construct([string value])>



NOT IMPLEMENTED.

=cut

.sub 'DOMText::__construct'
    not_implemented()
.end

=item C<void DOMXPath::__construct(DOMDocument doc)>



NOT IMPLEMENTED.

=cut

.sub 'DOMXPath::__construct'
    not_implemented()
.end

=item C<boolean dom_attr_is_id()>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#Attr-isId
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_attr_is_id'
    not_implemented()
.end

=item C<void dom_characterdata_append_data(string arg)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-32791A2F
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_characterdata_append_data'
    not_implemented()
.end

=item C<void dom_characterdata_delete_data(int offset, int count)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-7C603781
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_characterdata_delete_data'
    not_implemented()
.end

=item C<void dom_characterdata_insert_data(int offset, string arg)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-3EDB695F
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_characterdata_insert_data'
    not_implemented()
.end

=item C<void dom_characterdata_replace_data(int offset, int count, string arg)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-E5CBA7FB
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_characterdata_replace_data'
    not_implemented()
.end

=item C<string dom_characterdata_substring_data(int offset, int count)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-6531BCCF
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_characterdata_substring_data'
    not_implemented()
.end

=item C<DOMNode dom_document_adopt_node(DOMNode source)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-Document3-adoptNode
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_document_adopt_node'
    not_implemented()
.end

=item C<DOMAttr dom_document_create_attribute(string name)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-1084891198
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_document_create_attribute'
    not_implemented()
.end

=item C<DOMAttr dom_document_create_attribute_ns(string namespaceURI, string qualifiedName)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-DocCrAttrNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_document_create_attribute_ns'
    not_implemented()
.end

=item C<DOMCdataSection dom_document_create_cdatasection(string data)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-D26C0AF8
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_document_create_cdatasection'
    not_implemented()
.end

=item C<DOMComment dom_document_create_comment(string data)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-1334481328
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_document_create_comment'
    not_implemented()
.end

=item C<DOMDocumentFragment dom_document_create_document_fragment()>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-35CB04B5
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_document_create_document_fragment'
    not_implemented()
.end

=item C<DOMElement dom_document_create_element(string tagName [, string value])>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-2141741547
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_document_create_element'
    not_implemented()
.end

=item C<DOMElement dom_document_create_element_ns(string namespaceURI, string qualifiedName [,string value])>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-DocCrElNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_document_create_element_ns'
    not_implemented()
.end

=item C<DOMEntityReference dom_document_create_entity_reference(string name)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-392B75AE
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_document_create_entity_reference'
    not_implemented()
.end

=item C<DOMProcessingInstruction dom_document_create_processing_instruction(string target, string data)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-135944439
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_document_create_processing_instruction'
    not_implemented()
.end

=item C<DOMText dom_document_create_text_node(string data)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-1975348127
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_document_create_text_node'
    not_implemented()
.end

=item C<DOMElement dom_document_get_element_by_id(string elementId)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-getElBId
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_document_get_element_by_id'
    not_implemented()
.end

=item C<DOMNodeList dom_document_get_elements_by_tag_name(string tagname)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-A6C9094
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_document_get_elements_by_tag_name'
    not_implemented()
.end

=item C<DOMNodeList dom_document_get_elements_by_tag_name_ns(string namespaceURI, string localName)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-getElBTNNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_document_get_elements_by_tag_name_ns'
    not_implemented()
.end

=item C<DOMNode dom_document_import_node(DOMNode importedNode, boolean deep)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#Core-Document-importNode
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_document_import_node'
    not_implemented()
.end

=item C<DOMNode dom_document_load(string source [, int options])>

URL: http://www.w3.org/TR/DOM-Level-3-LS/load-save.html#LS-DocumentLS-load
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_document_load'
    not_implemented()
.end

=item C<DOMNode dom_document_load_html(string source)>

Since: DOM extended


NOT IMPLEMENTED.

=cut

.sub 'dom_document_load_html'
    not_implemented()
.end

=item C<DOMNode dom_document_load_html_file(string source)>

Since: DOM extended


NOT IMPLEMENTED.

=cut

.sub 'dom_document_load_html_file'
    not_implemented()
.end

=item C<DOMNode dom_document_loadxml(string source [, int options])>

URL: http://www.w3.org/TR/DOM-Level-3-LS/load-save.html#LS-DocumentLS-loadXML
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_document_loadxml'
    not_implemented()
.end

=item C<void dom_document_normalize_document()>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-Document3-normalizeDocument
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_document_normalize_document'
    not_implemented()
.end

=item C<boolean dom_document_relaxNG_validate_file(string filename)>



NOT IMPLEMENTED.

=cut

.sub 'dom_document_relaxNG_validate_file'
    not_implemented()
.end

=item C<boolean dom_document_relaxNG_validate_xml(string source)>



NOT IMPLEMENTED.

=cut

.sub 'dom_document_relaxNG_validate_xml'
    not_implemented()
.end

=item C<DOMNode dom_document_rename_node(node n, string namespaceURI, string qualifiedName)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-Document3-renameNode
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_document_rename_node'
    not_implemented()
.end

=item C<int dom_document_save(string file)>

Convenience method to save to file


NOT IMPLEMENTED.

=cut

.sub 'dom_document_save'
    not_implemented()
.end

=item C<string dom_document_save_html()>

Convenience method to output as html


NOT IMPLEMENTED.

=cut

.sub 'dom_document_save_html'
    not_implemented()
.end

=item C<int dom_document_save_html_file(string file)>

Convenience method to save to file as html


NOT IMPLEMENTED.

=cut

.sub 'dom_document_save_html_file'
    not_implemented()
.end

=item C<string dom_document_savexml([node n])>

URL: http://www.w3.org/TR/DOM-Level-3-LS/load-save.html#LS-DocumentLS-saveXML
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_document_savexml'
    not_implemented()
.end

=item C<boolean dom_document_schema_validate(string source)>



NOT IMPLEMENTED.

=cut

.sub 'dom_document_schema_validate'
    not_implemented()
.end

=item C<boolean dom_document_schema_validate_file(string filename)>



NOT IMPLEMENTED.

=cut

.sub 'dom_document_schema_validate_file'
    not_implemented()
.end

=item C<boolean dom_document_validate()>

Since: DOM extended


NOT IMPLEMENTED.

=cut

.sub 'dom_document_validate'
    not_implemented()
.end

=item C<int dom_document_xinclude([int options])>

Substitutues xincludes in a DomDocument

NOT IMPLEMENTED.

=cut

.sub 'dom_document_xinclude'
    not_implemented()
.end

=item C<boolean dom_domconfiguration_can_set_parameter(string name, domuserdata value)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#DOMConfiguration-canSetParameter
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_domconfiguration_can_set_parameter'
    not_implemented()
.end

=item C<domdomuserdata dom_domconfiguration_get_parameter(string name)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#DOMConfiguration-getParameter
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_domconfiguration_get_parameter'
    not_implemented()
.end

=item C<dom_void dom_domconfiguration_set_parameter(string name, domuserdata value)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#DOMConfiguration-property
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_domconfiguration_set_parameter'
    not_implemented()
.end

=item C<dom_boolean dom_domerrorhandler_handle_error(domerror error)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#ID-ERRORS-DOMErrorHandler-handleError
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_domerrorhandler_handle_error'
    not_implemented()
.end

=item C<DOMDocument dom_domimplementation_create_document(string namespaceURI, string qualifiedName, DOMDocumentType doctype)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#Level-2-Core-DOM-createDocument
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_domimplementation_create_document'
    not_implemented()
.end

=item C<DOMDocumentType dom_domimplementation_create_document_type(string qualifiedName, string publicId, string systemId)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#Level-2-Core-DOM-createDocType
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_domimplementation_create_document_type'
    not_implemented()
.end

=item C<DOMNode dom_domimplementation_get_feature(string feature, string version)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#DOMImplementation3-getFeature
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_domimplementation_get_feature'
    not_implemented()
.end

=item C<boolean dom_domimplementation_has_feature(string feature, string version)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#ID-5CED94D7
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_domimplementation_has_feature'
    not_implemented()
.end

=item C<domdomimplementation dom_domimplementationlist_item(int index)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#DOMImplementationList-item
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_domimplementationlist_item'
    not_implemented()
.end

=item C<domdomimplementation dom_domimplementationsource_get_domimplementation(string features)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#ID-getDOMImpl
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_domimplementationsource_get_domimplementation'
    not_implemented()
.end

=item C<domimplementationlist dom_domimplementationsource_get_domimplementations(string features)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#ID-getDOMImpls
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_domimplementationsource_get_domimplementations'
    not_implemented()
.end

=item C<domstring dom_domstringlist_item(int index)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#DOMStringList-item
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_domstringlist_item'
    not_implemented()
.end

=item C<string dom_element_get_attribute(string name)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-666EE0F9
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_element_get_attribute'
    not_implemented()
.end

=item C<DOMAttr dom_element_get_attribute_node(string name)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-217A91B8
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_element_get_attribute_node'
    not_implemented()
.end

=item C<DOMAttr dom_element_get_attribute_node_ns(string namespaceURI, string localName)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-ElGetAtNodeNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_element_get_attribute_node_ns'
    not_implemented()
.end

=item C<string dom_element_get_attribute_ns(string namespaceURI, string localName)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-ElGetAttrNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_element_get_attribute_ns'
    not_implemented()
.end

=item C<DOMNodeList dom_element_get_elements_by_tag_name(string name)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-1938918D
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_element_get_elements_by_tag_name'
    not_implemented()
.end

=item C<DOMNodeList dom_element_get_elements_by_tag_name_ns(string namespaceURI, string localName)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-A6C90942
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_element_get_elements_by_tag_name_ns'
    not_implemented()
.end

=item C<boolean dom_element_has_attribute(string name)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-ElHasAttr
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_element_has_attribute'
    not_implemented()
.end

=item C<boolean dom_element_has_attribute_ns(string namespaceURI, string localName)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-ElHasAttrNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_element_has_attribute_ns'
    not_implemented()
.end

=item C<void dom_element_remove_attribute(string name)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-6D6AC0F9
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_element_remove_attribute'
    not_implemented()
.end

=item C<DOMAttr dom_element_remove_attribute_node(DOMAttr oldAttr)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-D589198
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_element_remove_attribute_node'
    not_implemented()
.end

=item C<void dom_element_remove_attribute_ns(string namespaceURI, string localName)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-ElRemAtNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_element_remove_attribute_ns'
    not_implemented()
.end

=item C<void dom_element_set_attribute(string name, string value)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-F68F082
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_element_set_attribute'
    not_implemented()
.end

=item C<DOMAttr dom_element_set_attribute_node(DOMAttr newAttr)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-887236154
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_element_set_attribute_node'
    not_implemented()
.end

=item C<DOMAttr dom_element_set_attribute_node_ns(DOMAttr newAttr)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-ElSetAtNodeNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_element_set_attribute_node_ns'
    not_implemented()
.end

=item C<void dom_element_set_attribute_ns(string namespaceURI, string qualifiedName, string value)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-ElSetAttrNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_element_set_attribute_ns'
    not_implemented()
.end

=item C<void dom_element_set_id_attribute(string name, boolean isId)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-ElSetIdAttr
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_element_set_id_attribute'
    not_implemented()
.end

=item C<void dom_element_set_id_attribute_node(attr idAttr, boolean isId)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-ElSetIdAttrNode
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_element_set_id_attribute_node'
    not_implemented()
.end

=item C<void dom_element_set_id_attribute_ns(string namespaceURI, string localName, boolean isId)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-ElSetIdAttrNS
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_element_set_id_attribute_ns'
    not_implemented()
.end

=item C<somNode dom_import_simplexml(sxeobject node)>

Get a simplexml_element object from dom to allow for processing

NOT IMPLEMENTED.

=cut

.sub 'dom_import_simplexml'
    not_implemented()
.end

=item C<DOMNode dom_namednodemap_get_named_item(string name)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-1074577549
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_namednodemap_get_named_item'
    not_implemented()
.end

=item C<DOMNode dom_namednodemap_get_named_item_ns(string namespaceURI, string localName)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-getNamedItemNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_namednodemap_get_named_item_ns'
    not_implemented()
.end

=item C<DOMNode dom_namednodemap_item(int index)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-349467F9
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_namednodemap_item'
    not_implemented()
.end

=item C<DOMNode dom_namednodemap_remove_named_item(string name)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-D58B193
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_namednodemap_remove_named_item'
    not_implemented()
.end

=item C<DOMNode dom_namednodemap_remove_named_item_ns(string namespaceURI, string localName)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-removeNamedItemNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_namednodemap_remove_named_item_ns'
    not_implemented()
.end

=item C<DOMNode dom_namednodemap_set_named_item(DOMNode arg)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-1025163788
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_namednodemap_set_named_item'
    not_implemented()
.end

=item C<DOMNode dom_namednodemap_set_named_item_ns(DOMNode arg)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-setNamedItemNS
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_namednodemap_set_named_item_ns'
    not_implemented()
.end

=item C<string dom_namelist_get_name(int index)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#NameList-getName
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_namelist_get_name'
    not_implemented()
.end

=item C<string dom_namelist_get_namespace_uri(int index)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#NameList-getNamespaceURI
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_namelist_get_namespace_uri'
    not_implemented()
.end

=item C<DomNode dom_node_append_child(DomNode newChild)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-184E7107
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_node_append_child'
    not_implemented()
.end

=item C<DomNode dom_node_clone_node(boolean deep)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-3A0ED0A4
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_node_clone_node'
    not_implemented()
.end

=item C<short dom_node_compare_document_position(DomNode other)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#Node3-compareDocumentPosition
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_node_compare_document_position'
    not_implemented()
.end

=item C<DomNode dom_node_get_feature(string feature, string version)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#Node3-getFeature
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_node_get_feature'
    not_implemented()
.end

=item C<DomUserData dom_node_get_user_data(string key)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#Node3-getUserData
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_node_get_user_data'
    not_implemented()
.end

=item C<boolean dom_node_has_attributes()>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-NodeHasAttrs
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_node_has_attributes'
    not_implemented()
.end

=item C<boolean dom_node_has_child_nodes()>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-810594187
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_node_has_child_nodes'
    not_implemented()
.end

=item C<domnode dom_node_insert_before(DomNode newChild, DomNode refChild)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-952280727
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_node_insert_before'
    not_implemented()
.end

=item C<boolean dom_node_is_default_namespace(string namespaceURI)>

URL: http://www.w3.org/TR/DOM-Level-3-Core/core.html#Node3-isDefaultNamespace
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_node_is_default_namespace'
    not_implemented()
.end

=item C<boolean dom_node_is_equal_node(DomNode arg)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#Node3-isEqualNode
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_node_is_equal_node'
    not_implemented()
.end

=item C<boolean dom_node_is_same_node(DomNode other)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#Node3-isSameNode
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_node_is_same_node'
    not_implemented()
.end

=item C<boolean dom_node_is_supported(string feature, string version)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-Level-2-Core-Node-supports
Since: DOM Level 2


NOT IMPLEMENTED.

=cut

.sub 'dom_node_is_supported'
    not_implemented()
.end

=item C<string dom_node_lookup_namespace_uri(string prefix)>

URL: http://www.w3.org/TR/DOM-Level-3-Core/core.html#Node3-lookupNamespaceURI
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_node_lookup_namespace_uri'
    not_implemented()
.end

=item C<string dom_node_lookup_prefix(string namespaceURI)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#Node3-lookupNamespacePrefix
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_node_lookup_prefix'
    not_implemented()
.end

=item C<void dom_node_normalize()>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-normalize
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_node_normalize'
    not_implemented()
.end

=item C<DomNode dom_node_remove_child(DomNode oldChild)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-1734834066
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_node_remove_child'
    not_implemented()
.end

=item C<DomNode dom_node_replace_child(DomNode newChild, DomNode oldChild)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-785887307
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_node_replace_child'
    not_implemented()
.end

=item C<DomUserData dom_node_set_user_data(string key, DomUserData data, userdatahandler handler)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#Node3-setUserData
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_node_set_user_data'
    not_implemented()
.end

=item C<DOMNode dom_nodelist_item(int index)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#ID-844377136
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_nodelist_item'
    not_implemented()
.end

=item C<int dom_string_extend_find_offset16(int offset32)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#i18n-methods-StringExtend-findOffset16
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_string_extend_find_offset16'
    not_implemented()
.end

=item C<int dom_string_extend_find_offset32(int offset16)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#i18n-methods-StringExtend-findOffset32
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_string_extend_find_offset32'
    not_implemented()
.end

=item C<boolean dom_text_is_whitespace_in_element_content()>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-Text3-isWhitespaceInElementContent
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_text_is_whitespace_in_element_content'
    not_implemented()
.end

=item C<DOMText dom_text_replace_whole_text(string content)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-Text3-replaceWholeText
Since: DOM Level 3


NOT IMPLEMENTED.

=cut

.sub 'dom_text_replace_whole_text'
    not_implemented()
.end

=item C<DOMText dom_text_split_text(int offset)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#core-ID-38853C1D
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_text_split_text'
    not_implemented()
.end

=item C<dom_void dom_userdatahandler_handle(short operation, string key, domobject data, node src, node dst)>

URL: http://www.w3.org/TR/2003/WD-DOM-Level-3-Core-20030226/DOM3-Core.html#ID-handleUserDataEvent
Since:


NOT IMPLEMENTED.

=cut

.sub 'dom_userdatahandler_handle'
    not_implemented()
.end

=item C<mixed dom_xpath_evaluate(string expr [,DOMNode context])>



NOT IMPLEMENTED.

=cut

.sub 'dom_xpath_evaluate'
    not_implemented()
.end

=item C<DOMNodeList dom_xpath_query(string expr [,DOMNode context])>



NOT IMPLEMENTED.

=cut

.sub 'dom_xpath_query'
    not_implemented()
.end

=item C<boolean dom_xpath_register_ns(string prefix, string uri)>



NOT IMPLEMENTED.

=cut

.sub 'dom_xpath_register_ns'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
