# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_tidy.pir - PHP tidy  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<tidyNode tidyNode::getParent()>

Returns the parent node if available or NULL

=cut

.sub 'tidyNode::getParent'
    not_implemented()
.end

=item C<boolean tidyNode::hasChildren()>

Returns true if this node has children

=cut

.sub 'tidyNode::hasChildren'
    not_implemented()
.end

=item C<boolean tidyNode::hasSiblings()>

Returns true if this node has siblings

=cut

.sub 'tidyNode::hasSiblings'
    not_implemented()
.end

=item C<boolean tidyNode::isAsp()>

Returns true if this node is ASP

=cut

.sub 'tidyNode::isAsp'
    not_implemented()
.end

=item C<boolean tidyNode::isComment()>

Returns true if this node represents a comment

=cut

.sub 'tidyNode::isComment'
    not_implemented()
.end

=item C<boolean tidyNode::isHtml()>

Returns true if this node is part of a HTML document

=cut

.sub 'tidyNode::isHtml'
    not_implemented()
.end

=item C<boolean tidyNode::isJste()>

Returns true if this node is JSTE

=cut

.sub 'tidyNode::isJste'
    not_implemented()
.end

=item C<boolean tidyNode::isPhp()>

Returns true if this node is PHP

=cut

.sub 'tidyNode::isPhp'
    not_implemented()
.end

=item C<boolean tidyNode::isText()>

Returns true if this node represents text (no markup)

=cut

.sub 'tidyNode::isText'
    not_implemented()
.end

=item C<int tidy_access_count()>

Returns the Number of Tidy accessibility warnings encountered for specified document.

=cut

.sub 'tidy_access_count'
    not_implemented()
.end

=item C<boolean tidy_clean_repair()>

Execute configured cleanup and repair operations on parsed markup

=cut

.sub 'tidy_clean_repair'
    not_implemented()
.end

=item C<int tidy_config_count()>

Returns the Number of Tidy configuration errors encountered for specified document.

=cut

.sub 'tidy_config_count'
    not_implemented()
.end

=item C<boolean tidy_diagnose()>

Run configured diagnostics on parsed and repaired markup.

=cut

.sub 'tidy_diagnose'
    not_implemented()
.end

=item C<int tidy_error_count()>

Returns the Number of Tidy errors encountered for specified document.

=cut

.sub 'tidy_error_count'
    not_implemented()
.end

=item C<TidyNode tidy_get_body(resource tidy)>

Returns a TidyNode Object starting from the <BODY> tag of the tidy parse tree

=cut

.sub 'tidy_get_body'
    not_implemented()
.end

=item C<array tidy_get_config()>

Get current Tidy configuarion

=cut

.sub 'tidy_get_config'
    not_implemented()
.end

=item C<string tidy_get_error_buffer([boolean detailed])>

Return warnings and errors which occured parsing the specified document

=cut

.sub 'tidy_get_error_buffer'
    not_implemented()
.end

=item C<TidyNode tidy_get_head()>

Returns a TidyNode Object starting from the <HEAD> tag of the tidy parse tree

=cut

.sub 'tidy_get_head'
    not_implemented()
.end

=item C<TidyNode tidy_get_html()>

Returns a TidyNode Object starting from the <HTML> tag of the tidy parse tree

=cut

.sub 'tidy_get_html'
    not_implemented()
.end

=item C<int tidy_get_html_ver()>

Get the Detected HTML version for the specified document.

=cut

.sub 'tidy_get_html_ver'
    not_implemented()
.end

=item C<string tidy_get_opt_doc(tidy resource, string optname)>

Returns the documentation for the given option name

=cut

.sub 'tidy_get_opt_doc'
    not_implemented()
.end

=item C<string tidy_get_output()>

Return a string representing the parsed tidy markup

=cut

.sub 'tidy_get_output'
    not_implemented()
.end

=item C<string tidy_get_release()>

Get release date (version) for Tidy library

=cut

.sub 'tidy_get_release'
    not_implemented()
.end

=item C<TidyNode tidy_get_root()>

Returns a TidyNode Object representing the root of the tidy parse tree

=cut

.sub 'tidy_get_root'
    not_implemented()
.end

=item C<int tidy_get_status()>

Get status of specfied document.

=cut

.sub 'tidy_get_status'
    not_implemented()
.end

=item C<mixed tidy_getopt(string option)>

Returns the value of the specified configuration option for the tidy document.

=cut

.sub 'tidy_getopt'
    not_implemented()
.end

=item C<boolean tidy_is_xhtml()>

Indicates if the document is a XHTML document.

=cut

.sub 'tidy_is_xhtml'
    not_implemented()
.end

=item C<boolean tidy_is_xml()>

Indicates if the document is a generic (non HTML/XHTML) XML document.

=cut

.sub 'tidy_is_xml'
    not_implemented()
.end

=item C<boolean tidy_parse_file(string file [, mixed config_options [, string encoding [, bool use_include_path]]])>

Parse markup in file or URI

=cut

.sub 'tidy_parse_file'
    not_implemented()
.end

=item C<bool tidy_parse_string(string input [, mixed config_options [, string encoding]])>

Parse a document stored in a string

=cut

.sub 'tidy_parse_string'
    not_implemented()
.end

=item C<boolean tidy_repair_file(string filename [, mixed config_file [, string encoding [, bool use_include_path]]])>

Repair a file using an optionally provided configuration file

=cut

.sub 'tidy_repair_file'
    not_implemented()
.end

=item C<boolean tidy_repair_string(string data [, mixed config_file [, string encoding]])>

Repair a string using an optionally provided configuration file

=cut

.sub 'tidy_repair_string'
    not_implemented()
.end

=item C<int tidy_warning_count()>

Returns the Number of Tidy warnings encountered for specified document.

=cut

.sub 'tidy_warning_count'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
