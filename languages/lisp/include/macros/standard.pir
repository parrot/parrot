# $Id$

=head1 NAME

include/macros/standard.pir - miscellaneous macros

=head1 DESCRITPTION

This file contains miscellaneous macros.

=head1 Macros

=head2 .NIL(R)

Sets R to the empty list (the NIL symbol).

=cut

.macro NIL (R)
  find_global .R, "SYMBOLS", "NIL"
.endm

=head2 .TRUE(R)

Sets R to true (the TRUE symbol).

=cut

.macro TRUE (R)
  find_global .R, "SYMBOLS", "T"
.endm

.macro CONSTANT (P)
  .local Boolean _const

  _const = new 'Boolean'
  _const = 1

  setprop .P, "constant", _const
.endm

.macro CONSTANTP (R,P)
  .local pmc _const

  getprop .R, "constant", .P
.endm

.macro SPECIAL_FORM (S,P,N,L)
  .local pmc _specialformp
  # VALID_IN_PARROT_0_2_0 .local pmc _funcp
  .local pmc _namep

  # VALID_IN_PARROT_0_2_0 newsub _funcp, .Sub, .L

  _specialformp = new "LispSpecialForm"
  # VALID_IN_PARROT_0_2_0 _specialformp._set_body(.L)
  .const 'Sub' _special_func = .L
  _specialformp.'_set_body'(_special_func)

  _namep = new "LispString"
  _namep = .N
  _specialformp.'_set_name'(_namep)

  .S = .P.'_intern_symbol'(.N)
  .S.'_set_function'(_specialformp)
  .S.'_set_package'(.P)
.endm

.macro DEFUN (S,P,N,L)
  .local pmc _functionp
  .local pmc _namep

  .FUNCTION(_functionp, .L)

  _namep = new "LispString"
  _namep = .N
  _functionp.'_set_name'(_namep)

  .S = .P.'_intern_symbol'(.N)
  .S.'_set_function'(_functionp)
  .S.'_set_package'(.P)
.endm

.macro DEFMACRO (S,P,N,L)
  .local pmc _macrop
  .local pmc _namep

  .MACRO(_macrop, .L)

  _namep = new "LispString"
  _namep = .N
  _macrop.'_set_name'(_namep)

  .S = .P.'_intern_symbol'(.N)
  .S.'_set_function'(_macrop)
  .S.'_set_package'(.P)
.endm

.macro DEFVAR (S,P,N,V)
    .local pmc _specialp

    .TRUE(_specialp)

    .S = .P.'_intern_symbol'(.N)
    .S.'_set_value'(.V)
    .S.'_set_package'(.P)
    .S.'_set_special'(_specialp)
.endm

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
