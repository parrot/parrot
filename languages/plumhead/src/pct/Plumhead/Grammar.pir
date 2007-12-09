# $Id$

=head1 NAME

Plumhead::Grammar - override some methods inherite from PGE::Grammar

=head1 DESCRIPTION

Use the implementation from PGE::Match.

=cut

=head1 Methods

=item C<get_scalar()>

Returns the scalar value of this match -- the "result object"
if there is one, otherwise the substring matched by this match
object.

=cut

.sub 'get_scalar' :method
    .return self.'result_object'()
.end


=item C<result_object([pmc obj])>

Returns or sets the "result object" for the match object.

=cut

.sub 'result_object' :method
    .param pmc obj             :optional
    .param int has_obj         :opt_flag
    if has_obj == 0 goto get_obj
    setattribute self, '$!result', obj
    goto ret_obj
  get_obj:
    obj = getattribute self, '$!result'
  ret_obj:
    if null obj goto ret_null
    .return (obj)
  ret_null:
    .return self.'text'()
.end

=over 4

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
