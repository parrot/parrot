# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_api.pir - PHP API Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut


=item C<error>

=cut

.sub 'error'
    .param string msg
    printerr msg
.end


=item C<get_module_version>

DUMMY IMPLEMENTATION.

=cut

.sub 'get_module_version'
    .param string ext
    .return ('')
.end


=item C<parse_parameters>

DUMMY IMPLEMENTATION.

=cut

.sub 'parse_parameters'
   .param string fmt
   .param pmc args :slurpy
   .return (1, args :flat)
.end


=item C<wrong_param_count>

=cut

.sub 'wrong_param_count'
    .local string msg
    msg = 'Wrong parameter count for '
    error(msg)
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
