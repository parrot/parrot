# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_pcre.pir - PHP pcre  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<array preg_grep(string regex, array input [, int flags])>

Searches array and returns entries which match regex

=cut

.sub 'preg_grep'
    not_implemented()
.end

=item C<int preg_last_error()>

Returns the error code of the last regexp execution.

=cut

.sub 'preg_last_error'
    not_implemented()
.end

=item C<int preg_match(string pattern, string subject [, array subpatterns [, int flags [, int offset]]])>

Perform a Perl-style regular expression match

=cut

.sub 'preg_match'
    not_implemented()
.end

=item C<int preg_match_all(string pattern, string subject, array subpatterns [, int flags [, int offset]])>

Perform a Perl-style global regular expression match

=cut

.sub 'preg_match_all'
    not_implemented()
.end

=item C<string preg_quote(string str [, string delim_char])>

Quote regular expression characters plus an optional character

=cut

.sub 'preg_quote'
    not_implemented()
.end

=item C<string preg_replace(mixed regex, mixed replace, mixed subject [, int limit [, count]])>

Perform Perl-style regular expression replacement.

=cut

.sub 'preg_replace'
    not_implemented()
.end

=item C<string preg_replace_callback(mixed regex, mixed callback, mixed subject [, int limit [, count]])>

Perform Perl-style regular expression replacement using replacement callback.

=cut

.sub 'preg_replace_callback'
    not_implemented()
.end

=item C<array preg_split(string pattern, string subject [, int limit [, int flags]])>

Split string into an array using a perl-style regular expression as a delimiter

=cut

.sub 'preg_split'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
