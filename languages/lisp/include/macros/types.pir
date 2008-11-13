# $Id$

=head1 NAME

include/macros/types.pir

=head1 Macros

=head2 .CONS(R,A,B)

Creates a new cons with car A and cdr B, placing the result in R.

=cut

.macro CONS (R,A,B)
  .local pmc _consp


   _consp = new "LispCons"

   _consp[0] = .A
   _consp[1] = .B

  .R = _consp
.endm

=head2 .STRING(R,S)

Creates a new string with value S, placing the result in R.

=cut

.macro STRING (R,S)
  .R = new "LispString"
  .R = .S
.endm

=head2 .STREAM(R,S)

Create a new stream object from ParrotIO object S, placing the result in R.

=cut

.macro STREAM(R,S)
  .R = new "LispStream"
  .R.'_set_io'(.S)
.endm

=head2 .READTABLE(R)

Create a new readtable object and places it in R.

=cut

.macro READTABLE(R)
  .R = new "LispReadtable"
.endm

=head2 .FLOAT(R,F)

Creates a new float with value F, placing the result in R.

=cut

.macro FLOAT (R,F)
  .R = new "LispFloat"
  .R = .F
.endm

=head2 .INTEGER(R,I)

Creates a new integer with value I, placing the result in R.

=cut

.macro INTEGER (R,I)
  .R = new "LispInteger"
  .R = .I
.endm

=head2 .HASH(R)

Creates a new hash table, placing the result in R.

=cut

.macro HASH (R)
  .R = new "LispHash"
.endm

=head2 .PACKAGE(P,N)

Create a new package with name N, placing the result in P.

=cut

.macro PACKAGE (P,N)
    .local string _ucname
    .local pmc _packagesp
    .local pmc _name

    .P = new "LispPackage"

    _ucname = .N
    upcase _ucname, _ucname
    .STRING(_name, _ucname)

    setattribute .P, "name", _name
.endm

=head2 .FUNCTION(F,L)

Create a new function object with label L, placing the result in F.

=cut

.macro FUNCTION(F,L)

    .F = new "LispFunction"
    # VALID_IN_PARROT_0_2_0 newsub _func, .Sub, .L
    # VALID_IN_PARROT_0_2_0 setattribute .F, "LispFunction\0body", .L

    .local pmc _func
    .const 'Sub' _func = .L
    setattribute .F, "body", _func

.endm

=head2 .MACRO(F,L)

Create a new macro object with label L, placing the result in F.

=cut

.macro MACRO(F,L)
  .local pmc _func

   .F = new "LispMacro"
   newsub _func, .Sub, .L

   # VALID_IN_PARROT_0_2_0 setattribute .F, "LispMacro\0body", _func
   setattribute .F, "body", _func
.endm


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
