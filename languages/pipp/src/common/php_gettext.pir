# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_gettext.pir - PHP gettext  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string bind_textdomain_codeset(string domain, string codeset)>

Specify the character encoding in which the messages from the DOMAIN message catalog will be returned.

NOT IMPLEMENTED.

=cut

.sub 'bind_textdomain_codeset'
    not_implemented()
.end

=item C<string bindtextdomain(string domain_name, string dir)>

Bind to the text domain domain_name, looking for translations in dir. Returns the current domain

NOT IMPLEMENTED.

=cut

.sub 'bindtextdomain'
    not_implemented()
.end

=item C<string dcgettext(string domain_name, string msgid, long category)>

Return the translation of msgid for domain_name and category, or msgid unaltered if a translation does not exist

NOT IMPLEMENTED.

=cut

.sub 'dcgettext'
    not_implemented()
.end

=item C<string dcngettext(string domain, string msgid1, string msgid2, int n, int category)>

Plural version of dcgettext()

NOT IMPLEMENTED.

=cut

.sub 'dcngettext'
    not_implemented()
.end

=item C<string dgettext(string domain_name, string msgid)>

Return the translation of msgid for domain_name, or msgid unaltered if a translation does not exist

NOT IMPLEMENTED.

=cut

.sub 'dgettext'
    not_implemented()
.end

=item C<string dngettext(string domain, string msgid1, string msgid2, int count)>

Plural version of dgettext()

NOT IMPLEMENTED.

=cut

.sub 'dngettext'
    not_implemented()
.end

=item C<string gettext(string msgid)>

Return the translation of msgid for the current domain, or msgid unaltered if a translation does not exist

NOT IMPLEMENTED.

=cut

.sub 'gettext'
    not_implemented()
.end

=item C<string ngettext(string MSGID1, string MSGID2, int N)>

Plural version of gettext()

NOT IMPLEMENTED.

=cut

.sub 'ngettext'
    not_implemented()
.end

=item C<string textdomain(string domain)>

Set the textdomain to "domain". Returns the current domain

NOT IMPLEMENTED.

=cut

.sub 'textdomain'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
