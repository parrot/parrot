# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_formatted_print.pir - PHP formatted_print Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int fprintf(resource stream, string format [, mixed arg1 [, mixed ...]])>

Output a formatted string into a stream

NOT IMPLEMENTED.

=cut

.sub 'fprintf'
    not_implemented()
.end

=item C<int printf(string format [, mixed arg1 [, mixed ...]])>

Output a formatted string

NOT IMPLEMENTED.

=cut

.sub 'printf'
    not_implemented()
.end

=item C<string sprintf(string format [, mixed arg1 [, mixed ...]])>

Return a formatted string

NOT IMPLEMENTED.

=cut

.sub 'sprintf'
    not_implemented()
.end

=item C<int vfprintf(resource stream, string format, array args)>

Output a formatted string into a stream

NOT IMPLEMENTED.

=cut

.sub 'vfprintf'
    not_implemented()
.end

=item C<int vprintf(string format, array args)>

Output a formatted string

NOT IMPLEMENTED.

=cut

.sub 'vprintf'
    not_implemented()
.end

=item C<string vsprintf(string format, array args)>

Return a formatted string

NOT IMPLEMENTED.

=cut

.sub 'vsprintf'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
