## $Id$

=head1 NAME

src/builtins/io.pir - Cardinal builtins for I/O

=head1 Functions

=over 4

=cut

.HLL 'Ruby', ''
.namespace

.sub 'puts'
    .param pmc list            :slurpy
    .local pmc iter

    iter = new .Iterator, list
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    print "\n"
    goto iter_loop
  iter_end:
    .return (1)
.end


.sub 'print'
    .param pmc list            :slurpy
    .local pmc iter

    iter = new .Iterator, list
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop
  iter_end:
    .return (1)
.end


.sub 'say'
    .param pmc list            :slurpy
    'print'(list :flat)
    print "\n"
    .return (1)
.end


=back

=cut


## vim: expandtab sw=4
