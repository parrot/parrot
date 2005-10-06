
.sub _init_system
  .local pmc function
  .local pmc package
  .local pmc symbol
  .local pmc value

  .PACKAGE(package, "SYSTEM")

   store_global "PACKAGES", "SYSTEM", package
   store_global "PACKAGES", "SYS", package

  .HASH(value)

  .FUNCTION(function, _left_paren_macro)
   value["("] = function

  .FUNCTION(function, _right_paren_macro)
   value[")"] = function

  .FUNCTION(function, _single_quote_macro)
   value["'"] = function

  .FUNCTION(function, _semicolon_macro)
   value[";"] = function

  .FUNCTION(function, _double_quote_macro)
   value["\""] = function

  .FUNCTION(function, _backquote_macro)
   value["`"] = function

  .FUNCTION(function, _comma_macro)
   value[","] = function

  .FUNCTION(function, _sharpsign_macro)
   value["#"] = function

  .DEFVAR(symbol, package, "*READER-MACROS*", value)

  .NIL(value)
  .DEFVAR(symbol, package, "*INSIDE-BACKQUOTE*", value)

  .DEFVAR(symbol, package, "*INSIDE-BACKQUOTE-LIST*", value)

  .DEFUN(symbol, package, "%GET-OBJECT-ATTRIBUTE", _get_object_attr)

  .DEFUN(symbol, package, "%SET-OBJECT-ATTRIBUTE", _set_object_attr)

  .DEFUN(symbol, package, "%MAKE-HASH-TABLE", _make_hash)

  .DEFUN(symbol, package, "%SET-HASH", _set_hash)

  .DEFUN(symbol, package, "%GET-HASH", _get_hash)

  .DEFUN(symbol, package, "%ALIAS-PACKAGE", _alias_package)

  .DEFUN(symbol, package, "%FIND-PACKAGE", _find_package)

  .DEFUN(symbol, package, "%MAKE-PACKAGE", _make_package)

  .DEFUN(symbol, package, "%USE-PACKAGE", _use_package)

  .DEFUN(symbol, package, "%EXPORT", _export)

  .DEFUN(symbol, package, "%OPEN-FILE", _open_file)

  .DEFUN(symbol, package, "%PEEK", _peek)

  .DEFUN(symbol, package, "%CLOSE", _close)

  .DEFUN(symbol, package, "%STRING-EQUAL", _string_equal)

  .DEFUN(symbol, package, "%MAKE-MACRO", _make_macro)

  # XXX - THESE SHOULD BE REMOVED AND CONVERTED TO PROPER LISP FUNCTIONS
  .DEFUN(symbol, package, "ERROR", _raise_error)
  .DEFUN(symbol, package, "LOAD", _load)

  .return(1)
.end

.sub _set_hash
  .param pmc args
  .local string keys
  .local pmc hash
  .local pmc key
  .local pmc val

  .ASSERT_LENGTH(args,3,ERROR_NARGS)

  .CAR(hash,args)
  .SECOND(key,args)
  .THIRD(val,args)

  .ASSERT_TYPE(hash, "hash")
  .ASSERT_TYPE(key, "string")

   keys = key
   hash[keys] = val

   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %SET-HASH")
   goto DONE

DONE:
  .return(val)
.end

.sub _get_hash
  .param pmc args
  .local string keys
  .local string type
  .local pmc hash
  .local pmc key
  .local pmc val

  .ASSERT_LENGTH(args,2,ERROR_NARGS)

  .CAR(hash,args)
  .SECOND(key,args)

  .ASSERT_TYPE(hash, "hash")
  .ASSERT_TYPE(key, "string")

   keys = key					# Convert the key to a string
   val = hash[keys]

   typeof type, val
   if type == "None" goto NO_VALUE_SET

   goto DONE

NO_VALUE_SET:
  .NIL(val)
   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %GET-HASH")
   goto DONE

DONE:
  .return(val)
.end

.sub _find_package
  .param pmc args
  .local string pkgnames
  .local pmc pkgname
  .local pmc retv

  .ASSERT_LENGTH(args, 1, ERROR_NARGS)

  .CAR(pkgname, args)
  .ASSERT_TYPE(pkgname, "string")

   pkgnames = pkgname
   upcase pkgnames, pkgnames

   push_eh PACKAGE_NOT_FOUND
   find_global retv, "PACKAGES", pkgnames
   clear_eh

   goto DONE

PACKAGE_NOT_FOUND:
  .ERROR_1("internal", "there is no package with the name \"%s\"", pkgname)
   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %FIND-PACKAGE")
   goto DONE

DONE:
  .return(retv)
.end

.sub _alias_package
  .param pmc args
  .local string pkgnames
  .local pmc package
  .local pmc pkgname
  .local pmc retv

  .ASSERT_LENGTH(args, 2, ERROR_NARGS)

  .CAR(package, args)
  .ASSERT_TYPE(package, "package")

  .SECOND(pkgname, args)
  .ASSERT_TYPE(pkgname, "string")

   pkgnames = pkgname

   store_global "PACKAGES", pkgnames, package

  .TRUE(retv)
   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %ALIAS-PACKAGE")
   goto DONE

DONE:
  .return(retv)
.end

.sub _make_package
  .param pmc args
  .local string pkgnames
  .local pmc packages
  .local pmc package
  .local pmc pkgname
  .local pmc symbol

  .ASSERT_LENGTH(args, 1, ERROR_NARGS)

  .CAR(pkgname, args)
  .ASSERT_TYPE(pkgname, "string")

  .PACKAGE(package, pkgname)

   pkgnames = pkgname
   upcase pkgnames, pkgnames

   store_global "PACKAGES", pkgnames, package

   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %MAKE-PACKAGE")
   goto DONE

DONE:
  .return(package)
.end

.sub _use_package
  .param pmc args
  .local string symnames
  .local pmc frompkg
  .local pmc intopkg
  .local pmc exports
  .local pmc symname
  .local pmc symbol
  .local pmc retv
  .local pmc i

  .ASSERT_LENGTH(args, 2, ERROR_NARGS)

  .CAR(intopkg, args)
  .SECOND(frompkg, args)

  .ASSERT_TYPE(intopkg, "package")
  .ASSERT_TYPE(frompkg, "package")

   exports = frompkg._get_exports()

   iter i, exports

   push_eh DONE

LOOP:
   shift symname, i
   symnames = symname

   symbol = frompkg._lookup_symbol(symnames)
   intopkg._import_symbol(symbol)

   goto LOOP

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %USE-PACKAGE")
   goto DONE

DONE:
  .TRUE(retv)
  .return(retv)
.end

.sub _export
  .param pmc args
  .local string symname
  .local pmc package
  .local pmc symbols
  .local pmc symbol
  .local pmc retv

  .ASSERT_MINIMUM_LENGTH(args, 1, ERROR_NARGS)

  .CAR(package, args)
  .CDR(symbols, args)

  .ASSERT_TYPE(package, "package")

LOOP:
  .NULL(symbols, DONE)

  .CAR(symbol, symbols)
  .ASSERT_TYPE(symbol, "string")

   symname = symbol
   package._export_symbol(symname)

  .CDR(symbols, symbols)
   goto LOOP

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %EXPORT")
   goto DONE

DONE:
  .TRUE(retv)
  .return(retv)
.end

.sub _make_hash
  .param pmc args
  .local pmc retv

  .ASSERT_LENGTH(args,0,ERROR_NARGS)

  .HASH(retv)
   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %MAKE-HASH")
   goto DONE

DONE:
  .return(retv)
.end

.sub _raise_error
  .param pmc args
  .local string types
  .local string mesgs
  .local pmc type
  .local pmc mesg
  .local pmc retv

  .ASSERT_LENGTH(args,2,ERROR_NARGS)

  .CAR(type,args)
  .SECOND(mesg,args)

  .NIL(retv)

   types = type
   mesgs = mesg

  .ERROR_0(types, mesgs)

   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %ERROR")
   goto DONE

DONE:
  .return(retv)
.end

.sub _load
  .param pmc args
  .local string fname1
  .local pmc stream
  .local pmc fname2
  .local pmc farg
  .local pmc rretv
  .local pmc eretv
  .local pmc retv
  .local pmc fd

  .ASSERT_LENGTH(args, 1,ERROR_NARGS)

  .CAR(fname2,args)
   fname1 = fname2

   open fd, fname1, "<"
   unless fd, OPEN_FAILED

  .STREAM(stream, fd)
  .TRUE(retv)

LOAD_LOOP:
  .LIST_1(farg,stream)
   rretv = _read(farg)

  .NULL(rretv, CLEANUP)

  .LIST_1(farg,rretv)
   eretv = _eval(farg)

   goto LOAD_LOOP

OPEN_FAILED:
  .NIL(retv)
   goto DONE

CLEANUP:
   close fd
  .TRUE(retv)
   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %LOAD")
   goto DONE

DONE:
  .return(retv)
.end

.sub _get_object_attr
  .param pmc args
  .local string attr
  .local string objt
  .local pmc symbol
  .local pmc objstr
  .local pmc attrib
  .local pmc retv

  .ASSERT_LENGTH(args,3,ERROR_NARGS)

  .CAR(symbol,args)
  .SECOND(objstr,args)
  .THIRD(attrib,args)

  .NIL(retv)

  .ASSERT_TYPE(objstr, "string")
  .ASSERT_TYPE(attrib, "string")

   attr = attrib
   objt = objstr

   concat objt, objt, "\0"
   concat attr, objt, attr

   getattribute retv, symbol, attr
   if_null retv, NO_VALUE
   goto DONE

NO_VALUE:
  .NIL(retv)
  goto DONE

ERROR_NARGS:
  .ERROR_0("program-error","wrong number of arguments to %GET-OBJECT-ATTRIBUTE")
   goto DONE

DONE:
  .return(retv)
.end

.sub _set_object_attr
  .param pmc args
  .local string attr
  .local string objt
  .local pmc symbol
  .local pmc objstr
  .local pmc attrib
  .local pmc value

  .ASSERT_LENGTH(args,4,ERROR_NARGS)

  .CAR(symbol,args)
  .SECOND(objstr,args)
  .THIRD(attrib,args)
  .FOURTH(value,args)

  .ASSERT_TYPE(objstr, "string")
  .ASSERT_TYPE(attrib, "string")

   attr = attrib
   objt = objstr

   concat objt, objt, "\0"
   concat attr, objt, attr

   setattribute symbol, attr, value
   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error","wrong number of arguments to %SET-SYMBOL-ATTRIBUTE")
   goto DONE

DONE:
  .return(value)
.end

.sub _open_file
  .param pmc args
  .local string modes
  .local string names
  .local pmc stream
  .local pmc name
  .local pmc mode
  .local pmc retv
  .local int test

  .ASSERT_LENGTH(args,2,ERROR_NARGS)

  .CAR(name, args)
  .SECOND(mode, args)

  .ASSERT_TYPE(name, "string")
  .ASSERT_TYPE(mode, "string")

   names = name
   modes = mode

   open stream, names, modes

   defined test, stream
   if test != 1 goto FILE_NOT_FOUND

  .STREAM(retv, stream)

   goto DONE

FILE_NOT_FOUND:
  .ERROR_1("file-error", "error opening file %s", name)
  goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %OPEN-FILE")
  goto DONE

DONE:
  .return(retv)
.end

.sub _peek
  .param pmc args
  .local string char
  .local pmc stream
  .local pmc retv
  .local pmc io

  .ASSERT_LENGTH(args, 1, ERROR_NARGS)

  .CAR(stream, args)
  .ASSERT_TYPE(stream, "stream")

   io = stream._get_io()

   peek char, io
   if char == "" goto ERROR_EOF

  .STRING(retv, char)

   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %PEEK")
   goto DONE

ERROR_EOF:
  .ERROR_0("end-of-file", "EOF on input stream reached.")
  goto DONE

DONE:
  .return(retv)
.end

.sub _close
  .param pmc args
  .local pmc stream
  .local pmc retv
  .local pmc io

  .ASSERT_LENGTH(args, 1, ERROR_NARGS)

  .CAR(stream, args)
  .ASSERT_TYPE(stream, "stream")

   io = stream._get_io()
   close io

  .TRUE(retv)

   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %CLOSE")
   goto DONE

DONE:
  .return(retv)
.end

.sub _string_equal
  .param pmc args
  .local string val1
  .local string val2
  .local pmc str1
  .local pmc str2
  .local pmc retv

  .ASSERT_LENGTH(args, 2, ERROR_NARGS)

  .CAR(str1, args)
  .SECOND(str2, args)

  .ASSERT_TYPE(str1, "string")
  .ASSERT_TYPE(str2, "string")

   val1 = str1
   val2 = str2

   if val1 == val2 goto STRING_EQUAL

  .NIL(retv)
   goto DONE

STRING_EQUAL:
  .TRUE(retv)
   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %STRING-EQUAL")
   goto DONE

DONE:
  .return(retv)
.end

.sub _make_macro
  .param pmc args
  .local int type
  .local pmc macro
  .local pmc val
  .local pmc form
  .local pmc retv

  .ASSERT_LENGTH(args, 1, ERROR_NARGS)

  .CAR(form, args)

   # XXX - This is pretty hackish - should probably use the __morph method

   macro = new "LispMacro"

   val = form._get_args()
   macro._set_args(val)

   val = form._get_scope()
   macro._set_scope(val)

   val = form._get_body()
   macro._set_body(val)

   goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to %MAKE-MACRO")
   goto DONE

DONE:
  .return(macro)
.end
