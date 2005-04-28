
=head1 MISCELLANEOUS MACROS

This file contains miscellaneous macros.

=head1 .NIL(R) 

Sets R to the empty list (the NIL symbol).

=cut

.macro NIL (R)
  find_global .R, "SYMBOLS", "NIL"
.endm

=head1 .TRUE(R) 

Sets R to true (the TRUE symbol).

=cut

.macro TRUE (R)
  find_global .R, "SYMBOLS", "T"
.endm

.macro CONSTANT (P)
  .sym Boolean _const

  _const = new Boolean
  _const = 1

  setprop .P, "constant", _const
.endm

.macro CONSTANTP (R,P)
  .sym pmc _const

  getprop .R, "constant", .P
.endm

.macro SPECIAL_FORM (S,P,N,L)
  .sym pmc _specialformp
  .sym pmc _funcp
  .sym pmc _namep

  newsub _funcp, .Sub, .L

  _specialformp = new "LispSpecialForm"
  _specialformp._set_body(_funcp)

  _namep = new "LispString"
  _namep = .N
  _specialformp._set_name(_namep)

  .S = .P._intern_symbol(.N)
  .S._set_function(_specialformp)
  .S._set_package(.P)
.endm

.macro DEFUN (S,P,N,L)
  .sym pmc _functionp
  .sym pmc _namep

  .FUNCTION(_functionp, .L)

  _namep = new "LispString"
  _namep = .N
  _functionp._set_name(_namep)

  .S = .P._intern_symbol(.N)
  .S._set_function(_functionp)
  .S._set_package(.P)
.endm

.macro DEFMACRO (S,P,N,L)
  .sym pmc _macrop
  .sym pmc _namep

  .MACRO(_macrop, .L)

  _namep = new "LispString"
  _namep = .N
  _macrop._set_name(_namep)

  .S = .P._intern_symbol(.N)
  .S._set_function(_macrop)
  .S._set_package(.P)
.endm

.macro DEFVAR (S,P,N,V)
  .sym pmc _specialp

  .TRUE(_specialp)

  .S = .P._intern_symbol(.N)
  .S._set_value(.V)
  .S._set_package(.P)
  .S._set_special(_specialp)
.endm
