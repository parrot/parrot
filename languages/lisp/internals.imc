
=head _LOOKUP_GLOBAL(pkgname, symname)

=cut

.sub _LOOKUP_GLOBAL
  .param string pkgname
  .param string symname
  .local pmc package
  .local pmc retv

  upcase pkgname, pkgname			# Convert names to all upcase
  upcase symname, symname

  push_eh PACKAGE_NOT_FOUND			# Set an error handler
  find_global package, "PACKAGES", pkgname	# Look for the package
  clear_eh

  retv = package._lookup_symbol(symname)        # Lookup the symbol

  goto DONE

PACKAGE_NOT_FOUND:
  .ERROR_1("package-error", "there is no package with name \"%s\"", pkgname)
  goto DONE

DONE:
  .return(retv)
.end


=head _LOOKUP_LEXICAL(symname)

=cut

.sub _LOOKUP_LEXICAL
  .param string symname
  .local pmc retv

  push_eh LEXICAL_NOT_FOUND			# Set an error handler
  find_lex retv, symname			# Look for the lexical symbol
  clear_eh

  goto DONE

LEXICAL_NOT_FOUND:				# Return null if not found
  null retv
  goto DONE

DONE:
  .return(retv)
.end


=head _LOOKUP_SYMBOL(symname)

=cut

.sub _LOOKUP_SYMBOL
  .param string symname
  .local string pkgname
  .local pmc package
  .local pmc symbol
  .local pmc retv

LEXICAL_SYMBOL:
  symbol = _LOOKUP_LEXICAL(symname)
  if_null retv, GLOBAL_SYMBOL
  goto DONE

GLOBAL_SYMBOL:
  symbol = _LOOKUP_GLOBAL("COMMON-LISP", "*PACKAGE*")
  if_null symbol, PACKAGE_NOT_FOUND

  package = symbol._get_value()
  if_null package, PACKAGE_NOT_FOUND

  pkgname = package._get_name_as_string()

  retv = _LOOKUP_GLOBAL(pkgname, symname)
  goto DONE

PACKAGE_NOT_FOUND:
  .ERROR_0("internal", "current package not found")
  goto DONE

DONE:
  .return(retv)
.end


=head1 _INTERN_GLOBAL(symbol, pkgname)

=cut

.sub _INTERN_GLOBAL
  .param pmc symbol
  .param string pkgname
  .local string symname

  symname = symbol._get_name_as_string()

  store_global pkgname, symname, symbol
.end


=head1 .INTERN_LEXICAL(symbol)

=cut

.sub _INTERN_LEXICAL
  .param pmc symbol
  .local string symname

  symname = symbol._get_name_as_string()

  store_lex -1, symname, symbol
.end


=head1 _LEXICAL_SYMBOL

=cut

.sub _LEXICAL_SYMBOL
  .param string symname
  .param pmc value
  .local pmc package
  .local pmc symbol
  .local int test

   symbol = _LOOKUP_GLOBAL("COMMON-LISP", "*PACKAGE*")
   package = symbol._get_value()

   symbol = _SYMBOL(symname)			# Create a new symbol
   symbol._set_package(package)			# Set the home package

   defined test, value				# Set a value if provided
   if test == 0 goto DONE

   symbol._set_value(value)
   goto DONE

DONE:
   store_lex -1, symname, symbol

  .return(symbol)
.end


=head1 _SYMBOL

=cut

.sub _SYMBOL
  .param string symname
  .local pmc symbol
  .local pmc name

  symbol = new "LispSymbol"

  name = new "LispString"
  name = symname

  symbol._set_name(name)

  .return(symbol)
.end


=head1 _GLOBAL_SYMBOL

=cut

.sub _GLOBAL_SYMBOL
  .param string pkgname
  .param string symname
  .param pmc value
  .param pmc function
  .local pmc packages
  .local pmc package
  .local pmc symbol
  .local int test

  upcase pkgname, pkgname
  upcase symname, symname

  push_eh PACKAGE_NOT_CREATED
  find_global package, "PACKAGES", pkgname
  clear_eh

  symbol = package._intern_symbol(symname)
  symbol._set_package(package)			# Set the home package

  defined test, value				# Set a value if provided
  if test == 0 goto FUNCTION

  symbol._set_value(value)
  goto FUNCTION

FUNCTION:					# Set a function if provided
  defined test, function
  if test == 0 goto DONE

  function._set_name(symname)
  symbol._set_function(function)
  goto DONE

PACKAGE_NOT_CREATED:
  .ERROR_1("package-error", "there is no package with name \"%s\"", pkgname)
  goto DONE

DONE:
  .return(symbol)
.end

=head1 _FUNCTION_CALL

=cut

.sub _FUNCTION_CALL
  .param pmc function
  .param pmc args
  .local string type
  .local pmc proto
  .local pmc scope
  .local pmc body

  proto = function._get_args()
  body  = function._get_body()

  typeof type, body			# Get the function type

  if type == "Sub" goto COMPILED_FUNCTION
  goto INTERPRETED_FUNCTION

COMPILED_FUNCTION:
  set_args "0", args			# First argument
  goto CALL_FUNCTION

INTERPRETED_FUNCTION:
  scope = function._get_scope()

  					# 1st arg - the code to evaluate
  					# 2nd arg - the arg prototype
  					# 3rd arg - the args to evaluate
  					# The closure
  set_args "0,0,0", body, proto, args
  goto CALL_FUNCTION

CALL_FUNCTION:
  pushtopp				# Save the upper registers
  invokecc				# Call the closure
  poptopp				# Restore the upper registers

  returncc
.end

.sub _IS_SPECIAL
  .param pmc symbol
  .local pmc special
  .local int retv

   retv = 1

   getattribute special, symbol, "LispSymbol\0special"
   if_null special, NOT_SPECIAL

  .NULL(special, NOT_SPECIAL)

   goto DONE

NOT_SPECIAL:
   retv = 0
   goto DONE

DONE:
   .return(retv)
.end

.sub _IS_ORDINARY_LAMBDA_LIST
  .param pmc form
  .local string type
  .local pmc symbol
  .local pmc args
  .local int test
  .local int retv

  .CAR(symbol,form)		# Ensure first element is a LAMBDA
  if symbol != "LAMBDA" goto NON_LAMBDA_LIST

  .SECOND(args,form)		# Ensure second element is a lambda-list
  .ASSERT_TYPE_AND_BRANCH(args, "list", MISSING_LAMBDA_LIST)
  goto LAMBDA_LIST

LAMBDA_LIST:
  retv = 1
  goto DONE

NON_LAMBDA_LIST:
  retv = 0
  goto DONE

MISSING_LAMBDA_LIST:
  _error("invalid-function", "The lambda-list for LAMBDA is missing")
  goto DONE

DONE:
  .return(retv)
.end

.sub _MAKE_LAMBDA
  .param pmc form
  .local pmc closure
  .local pmc symbol
  .local pmc args
  .local pmc body
  .local pmc lptr
  .local pmc retv

  .SECOND(args, form)
  .THIRD(body, form)

   lptr = args

ARG_LOOP:
  .NULL(lptr, SETUP_CLOSURE)

  .CAR(symbol, lptr)				# Ensure all the arguments are
  .ASSERT_TYPE(symbol, "symbol")		# symbol types.

  .CDR(lptr, lptr)
   goto ARG_LOOP

SETUP_CLOSURE:
   closure = new .Closure			# Capture the scope the closure
   set_addr closure, CLOSURE_START		# will later be run in

   retv = new "LispFunction"

   retv._set_args(args)
   retv._set_body(body)
   retv._set_scope(closure)

   goto DONE

CLOSURE_START:
  .local string clsymname
  .local pmc clargsptr
  .local pmc clprotptr
  .local pmc clbody
  .local pmc clprot
  .local pmc clargs
  .local pmc clarg
  .local pmc clval
  .local pmc clsym

   clbody = P5
   clprot = P6
   clargs = P7

   clargsptr = clargs
   clprotptr = clprot

   new_pad -1

   goto CLOSURE_ARGS

CLOSURE_ARGS:
  .NULL(clprotptr, CLOSURE_CHECK_ARGS)
  .NULL(clargsptr, CLOSURE_TOO_FEW_ARGS)

  .CAR(clval, clargsptr)			# The lexical value
  .CAR(clarg, clprotptr)			# The lexical arg prototype

   clsymname = clarg._get_name_as_string()
   clsym = _LEXICAL_SYMBOL(clsymname, clval)	# Create a new lexical symbol

  .CDR(clargsptr, clargsptr)
  .CDR(clprotptr, clprotptr)

   goto CLOSURE_ARGS

CLOSURE_CHECK_ARGS:
  .NULL(clargsptr, CLOSURE_BODY)		# Ensure we didn't have too
   goto CLOSURE_TOO_MANY_ARGS			# many args

CLOSURE_BODY:
  .local pmc clearg
  .local pmc clretv

  .LIST_1(clearg, clbody)
   clretv = _eval(clearg)

   pop_pad

   goto CLOSURE_DONE

CLOSURE_TOO_FEW_ARGS:
   pop_pad

  .ERROR_0("program-error", "Too few arguments given to LAMBDA")
   goto CLOSURE_DONE

CLOSURE_TOO_MANY_ARGS:
   pop_pad

  .ERROR_0("program-error", "Too many arguments given to LAMBDA")
   goto CLOSURE_DONE

CLOSURE_DONE:
   returncc

DONE:
  .return(retv)
.end

.sub _LIST_LENGTH
  .param pmc args
  .param int rlen
  .local pmc lptr
  .local int alen

   lptr = args
   alen = 0
  .sym pmc _nilp

  .NIL(_nilp)

LOOP:
  eq_addr lptr, _nilp, DONE
   inc alen
  .CDR(lptr, lptr)
   goto LOOP

DONE:
  .return(alen)
.end

.sub _IS_TYPE
  .param pmc args
  .param string rtype
  .local string atype
  .local int retv

   typeof atype, args
   retv = 1

   if rtype == "cons"     goto CONS_TYPE
   if rtype == "hash"     goto HASH_TYPE
   if rtype == "integer"  goto INTEGER_TYPE
   if rtype == "float"    goto FLOAT_TYPE
   if rtype == "function" goto FUNCTION_TYPE
   if rtype == "list"     goto LIST_TYPE
   if rtype == "number"   goto NUMBER_TYPE
   if rtype == "package"  goto PACKAGE_TYPE
   if rtype == "stream"   goto STREAM_TYPE
   if rtype == "string"   goto STRING_TYPE
   if rtype == "symbol"   goto SYMBOL_TYPE

   goto WRONG_TYPE

CONS_TYPE:
   if atype != "LispCons" goto WRONG_TYPE
   goto DONE

HASH_TYPE:
   if atype != "LispHash" goto WRONG_TYPE
   goto DONE

INTEGER_TYPE:
   if atype != "LispInteger" goto WRONG_TYPE
   goto DONE

FLOAT_TYPE:
   if atype != "LispFloat" goto WRONG_TYPE
   goto DONE

FUNCTION_TYPE:
   if atype != "LispFunction" goto WRONG_TYPE
   goto DONE

LIST_TYPE:
   if atype != "LispSymbol" goto NONEMPTY_LIST
  .NULL(args, DONE)
NONEMPTY_LIST:
   if atype != "LispCons" goto WRONG_TYPE
   goto DONE

NUMBER_TYPE:
   if atype == "LispInteger" goto DONE
   if atype != "LispFloat"   goto WRONG_TYPE
   goto DONE

PACKAGE_TYPE:
   if atype != "LispPackage" goto WRONG_TYPE
   goto DONE

STREAM_TYPE:
   if atype != "LispStream" goto WRONG_TYPE
   goto DONE

STRING_TYPE:
   if atype != "LispString" goto WRONG_TYPE
   goto DONE

SYMBOL_TYPE:
   if atype != "LispSymbol" goto WRONG_TYPE
   goto DONE

WRONG_TYPE:
   retv = 0
   goto DONE

DONE:
  .return(retv)
.end
