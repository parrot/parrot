=head1 ASSERT_TYPE(A,T)

Asserts that A is of type T, throwing a error of type "type-error" on failure

=cut

.macro ASSERT_TYPE(A,T)
  .sym string _atypes
  .sym int _testi

   _testi = _IS_TYPE(.A, .T)
   if _testi == 1 goto .$DONE
   goto .$WRONG_TYPE

.local $WRONG_TYPE:
  .ERROR_2("type-error", "%s is not of type %s", .A, .T)
  goto .$DONE

.local $DONE:
.endm

=head1 ASSERT_TYPE_AND_BRANCH(A,T,B)

Asserts that A is of type T, branching to B on failure.

=cut

.macro ASSERT_TYPE_AND_BRANCH(A,T,B)
  .sym string _atypes
  .sym int _testi

   _testi = _IS_TYPE(.A, .T)
   if _testi == 1 goto .$DONE
   goto .B

.local $DONE:
.endm

=head1 ASSERT_LENGTH(A,L,B)

Asserts that list A is of length L, branching to B on failure.

=cut

.macro ASSERT_LENGTH(A,L,B)
  .sym int _leni

   _leni = _LIST_LENGTH(.A)			# Get the length of the lsit
   if _leni == .L goto .$DONE			# Branch on success
   goto .B					# Branch on failure

.local $DONE:
.endm

=head1 ASSERT_MINIMUM_LENGTH(A,L,B)

Asserts that list A is at least of length L, branching to B on failure.

=cut

.macro ASSERT_MINIMUM_LENGTH(A,L,B)
  .sym int _leni

   _leni = _LIST_LENGTH(.A)			# Get the length of the lsit
   if _leni >= .L goto .$DONE			# Branch on success
   goto .B					# Branch on failure

.local $DONE:
.endm

=head1 ASSERT_LENGTH_BETWEEN(A,L,M,B)

Asserts that list A is at least of length L and at most of length M, branching to B on failure.

=cut

.macro ASSERT_LENGTH_BETWEEN(A,L,M,B)
  .sym int _leni

   _leni = _LIST_LENGTH(.A)			# Get the length of the lsit
   if _leni >= .L goto .$DONE			# Branch on success (min bound)
   if _leni <= .M goto .$DONE			# Branch on success (max bound)
   goto .B					# Branch on failure

.local $DONE:
.endm

=head1 ASSERT_EVEN_LENGTH(A,B)

Asserts that list A is composed of an even number of elements, branching to B on failure.

=cut

.macro ASSERT_EVEN_LENGTH(A,B)
  .sym int _leni
  .sym int _modi

   _leni = _LIST_LENGTH(.A)			# Get the length of the lsit
   mod _modi, _leni, 2
   if _modi == 0 goto .$DONE			# Branch on success
   goto .B					# Branch on failure

.local $DONE:
.endm
