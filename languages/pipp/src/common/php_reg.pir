# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_reg.pir - PHP reg Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int ereg(string pattern, string string [, array registers])>

Regular expression match

NOT IMPLEMENTED.

=cut

.sub 'ereg'
    not_implemented()
.end

=item C<string ereg_replace(string pattern, string replacement, string string)>

Replace regular expression

NOT IMPLEMENTED.

=cut

.sub 'ereg_replace'
    not_implemented()
.end

=item C<int eregi(string pattern, string string [, array registers])>

Case-insensitive regular expression match

NOT IMPLEMENTED.

=cut

.sub 'eregi'
    not_implemented()
.end

=item C<string eregi_replace(string pattern, string replacement, string string)>

Case insensitive replace regular expression

NOT IMPLEMENTED.

=cut

.sub 'eregi_replace'
    not_implemented()
.end

=item C<array split(string pattern, string string [, int limit])>

Split string into array by regular expression

NOT IMPLEMENTED.

=cut

.sub 'split'
    not_implemented()
.end

=item C<array spliti(string pattern, string string [, int limit])>

Split string into array by regular expression case-insensitive

NOT IMPLEMENTED.

=cut

.sub 'spliti'
    not_implemented()
.end

=item C<string sql_regcase(string string)>

Make regular expression for case insensitive match

NOT IMPLEMENTED.

=cut

.sub 'sql_regcase'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
