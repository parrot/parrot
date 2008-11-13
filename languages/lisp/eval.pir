# $Id$

=head1 NAME

eval.pir - evaluate forms

=cut

.sub _eval
  .param pmc args

  .ASSERT_LENGTH(args, 1, ERROR_NARGS)

  .local string symname
  .local string type
  .local pmc symbol
  .local int found
  .local pmc body
  .local pmc retv

  # switch based on the type of the first arg
  .local pmc form
  .CAR(form, args)
  type = typeof form
  if type == "LispSymbol"  goto SYMBOL
  if type == "LispCons"    goto FUNCTION_FORM
  if type == "LispInteger" goto SELF_EVALUATING_OBJECT
  if type == "LispString"  goto SELF_EVALUATING_OBJECT
  if type == "LispFloat"   goto SELF_EVALUATING_OBJECT

  .ERROR_1("internal", "Unknown object type in eval: %s", type)


FUNCTION_FORM:
  .local pmc function
  .local pmc funcargs
  .local pmc funcptr
  .local pmc funcarg
  .local pmc test

  .CAR(symbol, form)
  .CDR(body, form)

  .ASSERT_TYPE_AND_BRANCH(symbol, "symbol", FUNCTION_NOT_FOUND)

  # Retrieve the function from the symbol.
  function = symbol.'_get_function'()

  # If the function wasn't set for the symbol, throw an error.
  defined found, function
  unless found goto FUNCTION_NOT_FOUND

  # Check to see if the function is a special form (which aren't subject to
  # normal function evaluation rules).
  type = typeof function
  if type == "LispSpecialForm" goto SPECIAL_FORMS
  if type == "LispMacro" goto MACRO_FORM

  # Normal function - evaluate all arguments being passed into the function.
  .NIL(funcargs)

  funcptr = body

FUNCTION_LOOP:
  .NULL(funcptr, FUNCTION_CALL)         # Call the function if no args left.

  .CAR(funcarg, funcptr)                # Pop the next arg off the list.

  .local pmc evalarg                    # Evaluate the argument.
  .LIST_1(evalarg, funcarg)
  funcarg = _eval(evalarg)

  .APPEND(funcargs,funcargs,funcarg)    # Add the result to the args list.

  .CDR(funcptr,funcptr)                 # Move to the next arg in the list.

  goto FUNCTION_LOOP

FUNCTION_CALL:
  .tailcall _FUNCTION_CALL(function,funcargs)
  # VALID_IN_PARROT_0_2_0 goto DONE

FUNCTION_NOT_FOUND:
  .ERROR_1("undefined-function", "%s is not a function name", symbol)
  # VALID_IN_PARROT_0_2_0 goto DONE
  .return(retv)

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to EVAL")
  # VALID_IN_PARROT_0_2_0 goto DONE
  .return(retv)

SPECIAL_FORMS:
  # Special forms aren't subject to normal evaluation rules - keep the
  # arguments as is and call the function.
  funcargs = body
  goto FUNCTION_CALL

MACRO_FORM:
  .local pmc macroexp
  .local pmc macrosym
  .local pmc macroenv
  .local pmc macroarg

   macrosym = _LOOKUP_SYMBOL("*MACROEXPAND-HOOK*")
   if_null macrosym, MACRO_NOT_INITIALIZED

   macroexp = macrosym.'_get_value'()             # Get the expander function
  .ASSERT_TYPE_AND_BRANCH(macroexp, "function", MACRO_NOT_INITIALIZED)

   # VALID_IN_PARROT_0_2_0  peek_pad macroenv                           # Get current lexical scope

  .LIST_3(funcargs, symbol, body, macroenv)
   retv = _FUNCTION_CALL(macroexp, funcargs)    # Call the macroexpand hook

  .LIST_1(macroarg, retv)
  _eval(macroarg)

  # VALID_IN_PARROT_0_2_0 goto DONE
  .return(retv)

SYMBOL:
  symbol = form
  symname = symbol.'_get_name_as_string'()

  .local int is_special
  is_special = _IS_SPECIAL(symbol)                 # Check if we're a dynamic
  unless is_special goto LEXICAL_SYMBOL            # variable
  goto DYNAMIC_SYMBOL

DYNAMIC_SYMBOL:
  .local pmc package
  .local string pkgname
  package = symbol.'_get_package'()
  pkgname = package.'_get_name_as_string'()

  symbol = _LOOKUP_GLOBAL(pkgname, symname)
  goto CHECK_VALUE

LEXICAL_SYMBOL:
  retv = _LOOKUP_LEXICAL(symname)               # Check for a lexical shadow
  if_null retv, CHECK_VALUE                     # If not found, assume global
  symbol = retv                                 # Use the lexical value
  goto CHECK_VALUE

CHECK_VALUE:
  retv = symbol.'_get_value'()                    # Check for symbol's value

  defined found, retv
  unless found goto SYMBOL_NOT_FOUND

DONE_SYMBOL:
  # VALID_IN_PARROT_0_2_0 argcP = 1                                # One value returned
  # VALID_IN_PARROT_0_2_0 P5 = retv                                # Return value
  # VALID_IN_PARROT_0_2_0
  # VALID_IN_PARROT_0_2_0 goto DONE
  .return(retv)

SYMBOL_NOT_FOUND:
  .ERROR_1("unbound-variable", "variable %s has no value", form)
  # VALID_IN_PARROT_0_2_0 goto DONE
  .return(retv)

SELF_EVALUATING_OBJECT:
  # Object is a primitive type (ie. a string, integer or float).
  # VALID_IN_PARROT_0_2_0 argcP = 1                                # One value returned
  # VALID_IN_PARROT_0_2_0 P5 = retv                                # Return value

  # VALID_IN_PARROT_0_2_0 goto DONE
  .return(form)

MACRO_NOT_INITIALIZED:
  .ERROR_0("internal","the macro system has not been initialized")
# VALID_IN_PARROT_0_2_0   goto DONE
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0 DONE:
# VALID_IN_PARROT_0_2_0   is_prototyped = 0                        # Nonprototyped return
# VALID_IN_PARROT_0_2_0   argcI = 0                                # No integer values returned
# VALID_IN_PARROT_0_2_0   argcN = 0                                # No float values returned
# VALID_IN_PARROT_0_2_0   argcS = 0                                # No string values returned
# VALID_IN_PARROT_0_2_0
# VALID_IN_PARROT_0_2_0   returncc                                 # Call the return continuation

  .return()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
