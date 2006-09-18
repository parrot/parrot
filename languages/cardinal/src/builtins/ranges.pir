## $Id: cmp.pir 13897 2006-08-07 15:21:04Z tewk $

=head1 NAME

src/builtins/ranges.pir - Ruby range constructors

=head1 Functions

=over 4

=cut

.HLL 'Ruby', 'ruby_group'
.namespace

.sub 'infix:..'
    .param pmc a
    .param pmc b
    $I0 = a
    $I1 = b
    $I1 += 1
    $P0 = new .Slice [$I0 .. $I1]
    #$P0 = new .RubyRange [10 .. 20]
    .return ($P0)
.end


.sub 'infix:...'
    .param pmc a
    .param pmc b
    $I0 = a
    $I1 = b
    $P0 = new .Slice [$I0 .. $I1]
    #$P0 = new .Slice [10 .. 20]
    .return ($P0)
.end


=back

=cut


## vim: expandtab sw=4
