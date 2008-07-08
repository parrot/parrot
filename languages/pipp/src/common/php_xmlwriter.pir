# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_xmlwriter.pir - PHP xmlwriter  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool xmlwriter_end_attribute(resource xmlwriter)>

End attribute - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_end_attribute'
    not_implemented()
.end

=item C<bool xmlwriter_end_cdata(resource xmlwriter)>

End current CDATA - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_end_cdata'
    not_implemented()
.end

=item C<bool xmlwriter_end_comment(resource xmlwriter)>

Create end comment - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_end_comment'
    not_implemented()
.end

=item C<bool xmlwriter_end_document(resource xmlwriter)>

End current document - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_end_document'
    not_implemented()
.end

=item C<bool xmlwriter_end_dtd(resource xmlwriter)>

End current DTD - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_end_dtd'
    not_implemented()
.end

=item C<bool xmlwriter_end_dtd_attlist(resource xmlwriter)>

End current DTD AttList - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_end_dtd_attlist'
    not_implemented()
.end

=item C<bool xmlwriter_end_dtd_element(resource xmlwriter)>

End current DTD element - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_end_dtd_element'
    not_implemented()
.end

=item C<bool xmlwriter_end_dtd_entity(resource xmlwriter)>

End current DTD Entity - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_end_dtd_entity'
    not_implemented()
.end

=item C<bool xmlwriter_end_element(resource xmlwriter)>

End current element - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_end_element'
    not_implemented()
.end

=item C<bool xmlwriter_end_pi(resource xmlwriter)>

End current PI - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_end_pi'
    not_implemented()
.end

=item C<mixed xmlwriter_flush(resource xmlwriter [,bool empty])>

Output current buffer

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_flush'
    not_implemented()
.end

=item C<bool xmlwriter_full_end_element(resource xmlwriter)>

End current element - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_full_end_element'
    not_implemented()
.end

=item C<resource xmlwriter_open_memory()>

Create new xmlwriter using memory for string output

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_open_memory'
    not_implemented()
.end

=item C<resource xmlwriter_open_uri(resource xmlwriter, string source)>

Create new xmlwriter using source uri for output

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_open_uri'
    not_implemented()
.end

=item C<string xmlwriter_output_memory(resource xmlwriter [,bool flush])>

Output current buffer as string

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_output_memory'
    not_implemented()
.end

=item C<bool xmlwriter_set_indent(resource xmlwriter, bool indent)>

Toggle indentation on/off - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_set_indent'
    not_implemented()
.end

=item C<bool xmlwriter_set_indent_string(resource xmlwriter, string indentString)>

Set string used for indenting - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_set_indent_string'
    not_implemented()
.end

=item C<bool xmlwriter_start_attribute(resource xmlwriter, string name)>

Create start attribute - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_attribute'
    not_implemented()
.end

=item C<bool xmlwriter_start_attribute_ns(resource xmlwriter, string prefix, string name, string uri)>

Create start namespaced attribute - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_attribute_ns'
    not_implemented()
.end

=item C<bool xmlwriter_start_cdata(resource xmlwriter)>

Create start CDATA tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_cdata'
    not_implemented()
.end

=item C<bool xmlwriter_start_comment(resource xmlwriter)>

Create start comment - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_comment'
    not_implemented()
.end

=item C<bool xmlwriter_start_document(resource xmlwriter, string version, string encoding, string standalone)>

Create document tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_document'
    not_implemented()
.end

=item C<bool xmlwriter_start_dtd(resource xmlwriter, string name, string pubid, string sysid)>

Create start DTD tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_dtd'
    not_implemented()
.end

=item C<bool xmlwriter_start_dtd_attlist(resource xmlwriter, string name)>

Create start DTD AttList - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_dtd_attlist'
    not_implemented()
.end

=item C<bool xmlwriter_start_dtd_element(resource xmlwriter, string name)>

Create start DTD element - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_dtd_element'
    not_implemented()
.end

=item C<bool xmlwriter_start_dtd_entity(resource xmlwriter, string name, bool isparam)>

Create start DTD Entity - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_dtd_entity'
    not_implemented()
.end

=item C<bool xmlwriter_start_element(resource xmlwriter, string name)>

Create start element tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_element'
    not_implemented()
.end

=item C<bool xmlwriter_start_element_ns(resource xmlwriter, string prefix, string name, string uri)>

Create start namespaced element tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_element_ns'
    not_implemented()
.end

=item C<bool xmlwriter_start_pi(resource xmlwriter, string target)>

Create start PI tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_start_pi'
    not_implemented()
.end

=item C<bool xmlwriter_text(resource xmlwriter, string content)>

Write text - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_text'
    not_implemented()
.end

=item C<bool xmlwriter_write_attribute(resource xmlwriter, string name, string content)>

Write full attribute - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_attribute'
    not_implemented()
.end

=item C<bool xmlwriter_write_attribute_ns(resource xmlwriter, string prefix, string name, string uri, string content)>

Write full namespaced attribute - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_attribute_ns'
    not_implemented()
.end

=item C<bool xmlwriter_write_cdata(resource xmlwriter, string content)>

Write full CDATA tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_cdata'
    not_implemented()
.end

=item C<bool xmlwriter_write_comment(resource xmlwriter, string content)>

Write full comment tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_comment'
    not_implemented()
.end

=item C<bool xmlwriter_write_dtd(resource xmlwriter, string name, string pubid, string sysid, string subset)>

Write full DTD tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_dtd'
    not_implemented()
.end

=item C<bool xmlwriter_write_dtd_attlist(resource xmlwriter, string name, string content)>

Write full DTD AttList tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_dtd_attlist'
    not_implemented()
.end

=item C<bool xmlwriter_write_dtd_element(resource xmlwriter, string name, string content)>

Write full DTD element tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_dtd_element'
    not_implemented()
.end

=item C<bool xmlwriter_write_dtd_entity(resource xmlwriter, string name, string content [, int pe [, string pubid [, string sysid [, string ndataid]]]])>

Write full DTD Entity tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_dtd_entity'
    not_implemented()
.end

=item C<bool xmlwriter_write_element(resource xmlwriter, string name[, string content])>

Write full element tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_element'
    not_implemented()
.end

=item C<bool xmlwriter_write_element_ns(resource xmlwriter, string prefix, string name, string uri[, string content])>

Write full namesapced element tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_element_ns'
    not_implemented()
.end

=item C<bool xmlwriter_write_pi(resource xmlwriter, string target, string content)>

Write full PI tag - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_pi'
    not_implemented()
.end

=item C<bool xmlwriter_write_raw(resource xmlwriter, string content)>

Write text - returns FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'xmlwriter_write_raw'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
