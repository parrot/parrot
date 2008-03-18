# $Id$

=head1 NAME

include/macros/list.pir - list processing macros

This file contains various list processing macros.
All macro arguments are assumed to be PMC types unless otherwise noted.

=head1 Macros

=head2 .NULL(L,B)

Branch to B if L is an empty list.

=cut

.macro NULL (L,B)
  .local pmc _nilp

  .NIL(_nilp)
  eq_addr .L, _nilp, .B
.endm

=head2 .CAR(R,A)

Puts the car of A into R.  A is assumed to be a valid list.

=cut

.macro CAR (R,A)
  .NULL(.A, .$IS_NULL)

  .R = .A[0]

  goto .$DONE

.label $IS_NULL:
  .NIL(.R)
  goto .$DONE

.label $DONE:
.endm

=head2 .APPEND(R,A,B)

Appends B to list A, placing the result into R.  A is assumed to be a valid list.

=cut

.macro APPEND (R,A,B)
  .local pmc _listptr1p
  .local pmc _listptr2p
  .local pmc _listtmpp

  .NULL(.A, .$EMPTY_LIST)       # Special case if A is an empty list.

  _listptr1p = .A

.label $APPEND_LOOP:            # Loop until we reach the end of the list.
  .NULL(_listptr1p,.$DONE_LOOP)

  _listptr2p = _listptr1p

  .CDR(_listptr1p,_listptr1p)
  goto .$APPEND_LOOP

.label $DONE_LOOP:              # At the EOL, replace the list end (NIL)
  .LIST_1(_listtmpp, .B)        # with a new cons containing the new element.
  _listptr2p[1] = _listtmpp
  goto .$DONE

.label $EMPTY_LIST:
  .LIST_1(.R,.B)

.label $DONE:
.endm

=head2 .CDR(R,A)

Puts the cdr of A into R.  A is assumed to be a valid list.

=cut

.macro CDR (R,A)

  .NULL(.A, .$IS_NULL)
  .R = .A[1]
  goto .$DONE

.label $IS_NULL:
  .NIL(.R)
  goto .$DONE

.label $DONE:
.endm

=head2 .SECOND(R,A)

Puts the second element of A into R.  A is assumed to be a valid list.

=cut

.macro SECOND (R,A)
  .local pmc _cdrp

  .CDR(_cdrp, .A)
  .CAR(.R, _cdrp)
.endm

=head2 .THIRD(R,A)

Puts the third element of A into R.  A is assumed to be a valid list.

=cut

.macro THIRD (R,A)
  .local pmc _cdrp

  .CDR(_cdrp, .A)
  .CDR(_cdrp, _cdrp)
  .CAR(.R, _cdrp)
.endm

=head2 .FOURTH(R,A)

Puts the fourth element of A into R.  A is assumed to be a valid list.

=cut

.macro FOURTH (R,A)
  .local pmc _cdrp

  .CDR(_cdrp, .A)
  .CDR(_cdrp, _cdrp)
  .CDR(_cdrp, _cdrp)
  .CAR(.R, _cdrp)
.endm

=head2 .LIST_1(R,A)

Creates a one element list containing A, placing the result in R.

=cut

.macro LIST_1 (R,A)
  .local pmc _bp

  .NIL(_bp)
  .CONS(.R, .A, _bp)
.endm


=head2 .LIST_2(R,A,B)

Creates a two element list containing A and B, placing the result in R.

=cut

.macro LIST_2 (R,A,B)
  .local pmc _cp

  .LIST_1(_cp, .B)
  .CONS(.R, .A, _cp)
.endm

.macro LIST_3 (R,A,B,C)
  .local pmc _cp

  .LIST_2(_cp, .B, .C)
  .CONS(.R, .A, _cp)
.endm



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
