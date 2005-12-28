
=head1 .CONS(R,A,B) 

Creates a new cons with car A and cdr B, placing the result in R.

=cut

.macro CONS (R,A,B)
  .sym pmc _consp


   _consp = new "LispCons"

   _consp[0] = .A
   _consp[1] = .B

  .R = _consp
.endm

=head1 .STRING(R,S) 

Creates a new string with value S, placing the result in R.

=cut

.macro STRING (R,S)
  .R = new "LispString"
  .R = .S
.endm

=head1 .STREAM(R,S)

Create a new stream object from ParrotIO object S, placing the result in R.

=cut

.macro STREAM(R,S)
  .R = new "LispStream"
  .R._set_io(.S)
.endm

=head1 .READTABLE(R)

Create a new readtable object and places it in R.

=cut

.macro READTABLE(R)
  .R = new "LispReadtable"
.endm

=head1 .FLOAT(R,F) 

Creates a new float with value F, placing the result in R.

=cut

.macro FLOAT (R,F)
  .R = new "LispFloat"
  .R = .F
.endm

=head1 .INTEGER(R,I) 

Creates a new integer with value I, placing the result in R.

=cut

.macro INTEGER (R,I)
  .R = new "LispInteger"
  .R = .I
.endm

=head1 .HASH(R) 

Creates a new hash table, placing the result in R.

=cut

.macro HASH (R)
  .R = new "LispHash"
.endm

=head1 .PACKAGE(P,N)

Create a new package with name N, placing the result in P.

=cut

.macro PACKAGE (P,N)
  .sym string _ucname
  .sym pmc _packagesp
  .sym pmc _name

  .P = new "LispPackage"

   _ucname = .N
  upcase _ucname, _ucname
  .STRING(_name, _ucname)

  setattribute .P, "LispPackage\0name", _name
.endm

=head1 .FUNCTION(F,L)

Create a new function object with label L, placing the result in F.

=cut

.macro FUNCTION(F,L)
  .sym pmc _func

   .F = new "LispFunction"
   newsub _func, .Sub, .L

   setattribute .F, "LispFunction\0body", _func
.endm

=head1 .MACRO(F,L)

Create a new macro object with label L, placing the result in F.

=cut

.macro MACRO(F,L)
  .sym pmc _func

   .F = new "LispMacro"
   newsub _func, .Sub, .L

   setattribute .F, "LispMacro\0body", _func
.endm

