# $Id$

=head1 NAME

include/macros/error.pir - macros for reporting errors

=head1 Macros

=cut

.macro ERROR_0(T,M)
  _error(.T, .M)
.endm

.macro ERROR_1(T,M,A)
  .local string _errmsgs
  .local pmc _errargp

  _errargp = new 'Array'
  _errargp = 1
  _errargp[0] = .A

  sprintf _errmsgs, .M, _errargp
  _error(.T, _errmsgs)
.endm

.macro ERROR_2(T,M,A,B)
  .local string _errmsgs
  .local pmc _errargp

  _errargp = new 'Array'
  _errargp = 2
  _errargp[0] = .A
  _errargp[1] = .B

  sprintf _errmsgs, .M, _errargp
  _error(.T, _errmsgs)
.endm

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
