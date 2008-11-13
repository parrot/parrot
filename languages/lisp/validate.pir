# $Id$

=head1 NAME

validate.pir - lexing

=cut

.sub _VALIDATE_TOKEN
  .param string token

  .local string pkgname
  .local string symname
  .local pmc package
  .local pmc symbol
  .local pmc retv
  .local int capture
  .local pmc nil

  # VALID_IN_PARROT_0_2_0 flag = _IS_INTEGER(token)
  .local pmc is_integer
  is_integer = get_global 'is_integer'
  capture = is_integer(token)                                   # attempt to parse token as an integer
  if capture goto INTEGER

  # VALID_IN_PARROT_0_2_0 flag = _IS_FLOAT(token)
  .local pmc is_float
  is_float = get_global 'is_float'
  capture = is_float(token)                                     # attempt to parse token as a float
  if capture goto FLOAT

  goto QUALIFIED_SYMBOL                                         # else interpret it as a symbol

INTEGER:
  .INTEGER(retv,token)                                          # create a LispInteger object
  goto DONE

FLOAT:
  .FLOAT(retv,token)                                            # create a ListFloat object
  goto DONE

QUALIFIED_SYMBOL:
  # VALID_IN_PARROT_0_2_0 (flag,pkgname,symname) = _IS_QUALIFIED(token)
  .local pmc is_qualified, capture
  is_qualified = get_global 'is_qualified'
  capture = is_qualified(token)
  unless capture goto SYMBOL

  pkgname = capture[0]
  symname = capture[1]
  retv = _LOOKUP_GLOBAL(pkgname, symname)
  if_null retv, SYMBOL_NOT_FOUND
  goto DONE

SYMBOL:
  symbol = _LOOKUP_GLOBAL("COMMON-LISP", "*PACKAGE*")
  if_null symbol, PACKAGE_NOT_FOUND

  package = symbol.'_get_value'()                 # Get the current package
  if_null package, PACKAGE_NOT_FOUND

  pkgname = package.'_get_name_as_string'()
  symname = token

  retv = _LOOKUP_GLOBAL(pkgname, symname)
  if_null retv, SYMBOL_NOT_FOUND                # If not found, intern a new symbol

  goto DONE

SYMBOL_NOT_FOUND:
  null nil                                      # Intern a new global symbol
  retv = _GLOBAL_SYMBOL(pkgname, symname, nil, nil)

  goto DONE

PACKAGE_NOT_FOUND:
  .ERROR_0("internal-error", "the *PACKAGE* symbol could not be located")
  goto DONE

DONE:
  .return(retv)
.end

# VALID_IN_PARROT_0_2_0 .sub _IS_INTEGER
# VALID_IN_PARROT_0_2_0   .param string token
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   .local int retv
# VALID_IN_PARROT_0_2_0   .local int ndig
# VALID_IN_PARROT_0_2_0   .local int idx
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   ndig = 0
# VALID_IN_PARROT_0_2_0   idx  = 0
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 SIGNS:
# VALID_IN_PARROT_0_2_0   rx_oneof token, idx, '+-', DIGIT      # check for +/- signs (optional)
# VALID_IN_PARROT_0_2_0   goto DIGIT
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 DIGIT:                                  # ensure the rest is all digits
# VALID_IN_PARROT_0_2_0   rx_is_d token, idx, DECIMAL
# VALID_IN_PARROT_0_2_0   ndig = ndig + 1
# VALID_IN_PARROT_0_2_0   goto DIGIT
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 DECIMAL:
# VALID_IN_PARROT_0_2_0   rx_literal token, idx, '.', EOS       # Check for an optional decimal point
# VALID_IN_PARROT_0_2_0   goto EOS
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 EOS:                                    # check to see if we're at string end
# VALID_IN_PARROT_0_2_0   rx_zwa_atend token, idx, FAIL
# VALID_IN_PARROT_0_2_0   goto MATCH
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 MATCH:
# VALID_IN_PARROT_0_2_0   if ndig == 0 goto FAIL                # ensure we had at least one digit
# VALID_IN_PARROT_0_2_0   retv = 1
# VALID_IN_PARROT_0_2_0   goto DONE
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 FAIL:
# VALID_IN_PARROT_0_2_0   retv = 0
# VALID_IN_PARROT_0_2_0   goto DONE
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 DONE:
# VALID_IN_PARROT_0_2_0   .return(retv)
# VALID_IN_PARROT_0_2_0 .end
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 .sub _IS_FLOAT
# VALID_IN_PARROT_0_2_0   .param string token
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   .local int retv
# VALID_IN_PARROT_0_2_0   .local int idx
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   idx  = 0
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 SIGNS:
# VALID_IN_PARROT_0_2_0   rx_oneof token, idx, '+-', PREDIGITS  # check for +/- signs (optional)
# VALID_IN_PARROT_0_2_0   goto PREDIGITS
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 PREDIGITS:                              # check for pre-decimal digits
# VALID_IN_PARROT_0_2_0   rx_is_d token, idx, DECIMAL
# VALID_IN_PARROT_0_2_0   goto PREDIGITS
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 DECIMAL:
# VALID_IN_PARROT_0_2_0   rx_literal token, idx, '.', FAIL      # check for a decimal point
# VALID_IN_PARROT_0_2_0   goto POSTDIGIT
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 POSTDIGIT:
# VALID_IN_PARROT_0_2_0   rx_is_d token, idx, FAIL              # check for at least one required digit
# VALID_IN_PARROT_0_2_0   goto POSTDIGITS
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 POSTDIGITS:                             # check for option post-decimal digits
# VALID_IN_PARROT_0_2_0   rx_is_d token, idx, EOS
# VALID_IN_PARROT_0_2_0   goto POSTDIGITS
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 EOS:                                    # check to see if we're at string end
# VALID_IN_PARROT_0_2_0   rx_zwa_atend token, idx, FAIL
# VALID_IN_PARROT_0_2_0   goto MATCH
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 MATCH:
# VALID_IN_PARROT_0_2_0   retv = 1
# VALID_IN_PARROT_0_2_0   goto DONE
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 FAIL:
# VALID_IN_PARROT_0_2_0   retv = 0
# VALID_IN_PARROT_0_2_0   goto DONE
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 DONE:
# VALID_IN_PARROT_0_2_0   .return(retv)
# VALID_IN_PARROT_0_2_0 .end
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 .sub _IS_QUALIFIED
# VALID_IN_PARROT_0_2_0   .param string token
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   .local string package
# VALID_IN_PARROT_0_2_0   .local string symbol
# VALID_IN_PARROT_0_2_0   .local string vchar
# VALID_IN_PARROT_0_2_0   .local int retv
# VALID_IN_PARROT_0_2_0   .local int idx1
# VALID_IN_PARROT_0_2_0   .local int idx2
# VALID_IN_PARROT_0_2_0   .local int idx3
# VALID_IN_PARROT_0_2_0   .local int type
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   vchar = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!$%&*<=>?@^_~-./+"
# VALID_IN_PARROT_0_2_0   idx1   = 0
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 PACKAGE:
# VALID_IN_PARROT_0_2_0   rx_oneof token, idx1, vchar, COLON
# VALID_IN_PARROT_0_2_0   goto PACKAGE
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 COLON:
# VALID_IN_PARROT_0_2_0   idx2 = idx1                           # Index of last valid symbol character
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   rx_literal token, idx1, ':', FAIL     # If we don't have this -> not qualified
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   idx3 = idx1                           # Start of symbol character
# VALID_IN_PARROT_0_2_0   type = 0                              # External symbol
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   rx_literal token, idx1, ':', SYMBOL   # If we don't have this -> not external
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   idx3 = idx1                           # Start of symbol character
# VALID_IN_PARROT_0_2_0   type = 1                              # Internal symbol
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   goto SYMBOL
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 SYMBOL:
# VALID_IN_PARROT_0_2_0   rx_oneof token, idx1, vchar, EOS
# VALID_IN_PARROT_0_2_0   goto SYMBOL
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 EOS:
# VALID_IN_PARROT_0_2_0   rx_zwa_atend token, idx1, FAIL        # check to see if we're at string end
# VALID_IN_PARROT_0_2_0   goto MATCH
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 KEYWORD:
# VALID_IN_PARROT_0_2_0   package = "KEYWORD"
# VALID_IN_PARROT_0_2_0   goto KEYWORD_RETURN
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 MATCH:
# VALID_IN_PARROT_0_2_0   idx3 = idx3
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 KEYWORD_CHECK1:
# VALID_IN_PARROT_0_2_0   if idx2 != 0 goto NOT_KEYWORD
# VALID_IN_PARROT_0_2_0   if idx3 <= 2 goto KEYWORD
# VALID_IN_PARROT_0_2_0   goto NOT_KEYWORD
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 NOT_KEYWORD:
# VALID_IN_PARROT_0_2_0   substr package, token, 0, idx2
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 KEYWORD_RETURN:
# VALID_IN_PARROT_0_2_0   substr symbol, token, idx3, idx1
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   retv = 1
# VALID_IN_PARROT_0_2_0   goto DONE
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 FAIL:
# VALID_IN_PARROT_0_2_0   package = ""
# VALID_IN_PARROT_0_2_0   symbol = ""
# VALID_IN_PARROT_0_2_0   type = 0
# VALID_IN_PARROT_0_2_0   retv = 0
# VALID_IN_PARROT_0_2_0   goto DONE
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 DONE:
# VALID_IN_PARROT_0_2_0   .return(retv,package,symbol,type)
# VALID_IN_PARROT_0_2_0 .end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
