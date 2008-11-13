# $Id$

=head1 NAME

read.pir - lexing and parsing, reader macros

=head1 DESCRIPTION

The Lisp reader is implemented here.
See CLtL section 23.1 .

=head1 SUBROUTINES

=cut

=head2 _read

The function that implements the Lisp reader CLtL 2.2.

=cut

.sub _read
    .param pmc args

    .local pmc readmacros
    .local pmc readtable
    .local pmc readcase
    .local pmc readobj
    .local pmc symbol
    .local pmc istream
    .local pmc stream
    .local string token
    .local pmc retv
    .local int nretv

    .ASSERT_LENGTH(args,1,ERROR_NARGS)  # We should have received one argument -
                                        # the input stream to read from.

    .CAR(istream, args)
    stream = istream.'_get_io'()

    symbol = _LOOKUP_GLOBAL("SYSTEM", "*READER-MACROS*")
    readmacros = symbol.'_get_value'()

    symbol = _LOOKUP_GLOBAL("COMMON-LISP", "*READTABLE*")
    readobj = symbol.'_get_value'()

    readtable = readobj.'_get_table'()
    readcase  = readobj.'_get_case'()

    .local string char
    .local int ordv
    .local int type

STEP_1:
    read char, stream, 1                    # Read a character from the stream
    if char == "" goto EOF

    ord ordv, char                          # Figure out what kind of character
    type = readtable[ordv]                  # it represents

    if type == INVALID_CHAR     goto READER_ERROR
    if type == WHITESPACE_CHAR  goto STEP_1
    if type == TERM_MACRO_CHAR  goto STEP_4
    if type == NTERM_MACRO_CHAR goto STEP_4
    if type == SESCAPE_CHAR     goto STEP_5
    if type == MESCAPE_CHAR     goto STEP_6
    if type == CONSTITUENT_CHAR goto STEP_7
    goto READER_ERROR

STEP_4:
    .local pmc macro
    .local pmc margs
    .local pmc mchar

     macro = readmacros[char]                # Get the readmacro we're calling

    .STRING(mchar, char)

    .LIST_2(margs, istream, mchar)           # Create a list of args to pass in
     # VALID_IN_PARROT_0_2_0 retv = _FUNCTION_CALL(macro, margs)         # Call the readmacro

     null retv
     retv = _FUNCTION_CALL(macro, margs)         # Call the readmacro
     # VALID_IN_PARROT_0_2_0 if argcP == 0 goto STEP_1
     if_null retv, STEP_1
     goto DONE

STEP_5:
    read char, stream, 1
    if char == "" goto EOF

    token = char

    goto STEP_9

STEP_6:
    token = ""
    goto STEP_9

STEP_7:
    token = char

STEP_8:
    peek char, stream                         # A bit of a workaround until a
    ord ordv, char                            # unget opcode is implemented
    type = readtable[ordv]                    # to push chars back on the stream.

    if char == "" goto STEP_10

    if type == WHITESPACE_CHAR  goto STEP_10
    if type == TERM_MACRO_CHAR  goto STEP_10

    read char, stream, 1

    if type == CONSTITUENT_CHAR goto STEP_8a
    if type == NTERM_MACRO_CHAR goto STEP_8a
    if type == SESCAPE_CHAR     goto STEP_8c
    if type == MESCAPE_CHAR     goto STEP_9
    if type == INVALID_CHAR     goto READER_ERROR
    goto READER_ERROR

STEP_8a:
    if readcase == 0 goto STEP_8b
    upcase char

STEP_8b:
    concat token, char
    goto STEP_8

STEP_8c:
    read char, stream, 1
    if char == "" goto EOF

    concat token, char
    goto STEP_8

STEP_9:
    read char, stream, 1
    if char == "" goto EOF

    if type == CONSTITUENT_CHAR goto STEP_9a
    if type == WHITESPACE_CHAR  goto STEP_9a
    if type == TERM_MACRO_CHAR  goto STEP_9a
    if type == NTERM_MACRO_CHAR goto STEP_9a
    if type == SESCAPE_CHAR     goto STEP_9b
    if type == MESCAPE_CHAR     goto STEP_8
    if type == INVALID_CHAR     goto READER_ERROR
    goto READER_ERROR

STEP_9a:
    concat token, char
    goto STEP_9

STEP_9b:
    read char, stream, 1
    if char == "" goto EOF

    concat token, char
    goto STEP_9

STEP_10:
    retv = _VALIDATE_TOKEN(token)
    if_null retv, READER_ERROR

    goto DONE

READER_ERROR:
    .ERROR_0("reader-error", "Invalid character found in input stream.")
    goto DONE

EOF:
    .NIL(retv)
    goto DONE

ERROR_NARGS:
    .ERROR_0("program-error", "wrong number of arguments to READ")
    goto DONE

DONE:
    .return(retv)
.end

.sub _error
  .param string type                    # There's current no way to add more
  .param string mesg                    # than just a message to the exception.

  .local pmc e

  e = new 'Exception'
  e = mesg

  throw e
.end

.sub _read_delimited_list
  .param pmc args

  .local string dchar
  .local string char
  .local pmc readmacros
  .local pmc readtable
  .local pmc readobj
  .local pmc delimit
  .local pmc istream
  .local pmc stream
  .local pmc symbol
  .local pmc tretv
  .local pmc retv
  .local pmc lptr
  .local int ordv
  .local int type

  .ASSERT_LENGTH_BETWEEN(args, 1, 2, ERROR_NARGS)

  .CAR(delimit, args)                     # First arg is the delimit character
  .ASSERT_TYPE_AND_BRANCH(delimit, "string", ERROR_NONSTRING)
   dchar = delimit

  .SECOND(istream, args)                  # Second arg is the input stream
  .NULL(istream, GET_STDIN)               # If we don't have a stream get stdin
   goto DONE_ARGS

GET_STDIN:
   symbol = _LOOKUP_GLOBAL("COMMON-LISP", "*STANDARD-INPUT*")
   istream = symbol.'_get_value'()
   goto DONE_ARGS

DONE_ARGS:
  .ASSERT_TYPE_AND_BRANCH(istream, "stream", ERROR_NONSTREAM)
   stream = istream.'_get_io'()

   symbol = _LOOKUP_GLOBAL("SYSTEM", "*READER-MACROS*")
   readmacros = symbol.'_get_value'()

   symbol = _LOOKUP_GLOBAL("COMMON-LISP", "*READTABLE*")
   readobj = symbol.'_get_value'()

   readtable = readobj.'_get_table'()

  .NIL(retv)                              # Initialize the return to NIL
   lptr = retv

LOOP:
  peek char, stream                       # Read a character from the stream
  if char == "" goto EOF

  ord ordv, char                          # Figure out what kind of character
  type = readtable[ordv]                  # it represents

  if type == INVALID_CHAR     goto READER_ERROR
  if type == WHITESPACE_CHAR  goto WHITESPACE
  if char == dchar            goto DELIMIT_CHAR
  if type == SESCAPE_CHAR     goto READ_OBJECT
  if type == MESCAPE_CHAR     goto READ_OBJECT
  if type == CONSTITUENT_CHAR goto READ_OBJECT
  if type == TERM_MACRO_CHAR  goto CALL_MACRO
  if type == NTERM_MACRO_CHAR goto CALL_MACRO
  goto READER_ERROR

READ_OBJECT:                              # We've found a constituent char -
  .local pmc rargs                        # use _read to read in an object

  .LIST_1(rargs, istream)                 # Create the arg list for _read
  tretv = _read(rargs)                    # Read in the object
  goto APPEND_TO_LIST

APPEND_TO_LIST:
  .APPEND(retv, retv, tretv)
  goto LOOP

WHITESPACE:
  read char, stream, 1                    # Whitespace chars get consumed
  goto LOOP

CALL_MACRO:
  .local pmc macro
  .local pmc margs
  .local pmc mchar

   read char, stream, 1                    # Consume the macro character

   macro = readmacros[char]                # Get the readmacro we're calling

  .STRING(mchar, char)
  .LIST_2(margs, istream, mchar)           # Create a list of args to pass in

   null tretv
   tretv = _FUNCTION_CALL(macro, margs)   # Call the readmacro
   if_null tretv, LOOP

   # VALID_IN_PARROT_0_2_0 if argcP == 0 goto LOOP                # If macro is NULL, start loop again
   # VALID_IN_PARROT_0_2_0 ntretv = tretv
   # VALID_IN_PARROT_0_2_0 if ntretv == 0 goto LOOP               # If macro is NULL, start loop again
   goto APPEND_TO_LIST                    # else add the return value to list

DELIMIT_CHAR:                             # We've hit the delimter char -
  read char, stream, 1                    # consume it, and return the list
  goto DONE

READER_ERROR:
  .ERROR_0("reader-error", "invalid character found in input stream.")
  goto DONE

ERROR_NARGS:
  .ERROR_0("program-error", "wrong number of arguments to READ-DELIMITED-LIST")
  goto DONE

ERROR_NONSTRING:
  .ERROR_1("type-error", "argument %s is not a character", delimit)
  goto DONE

ERROR_NONSTREAM:
  .ERROR_1("type-error", "argument %s is not a stream", istream)
  goto DONE

EOF:
  .ERROR_0("end-of-file", "EOF on input stream reached.")
  goto DONE

DONE:
  .return(retv)
.end

=head2 _left_paren_macro

CLtL section 2.4.1.

=cut

.sub _left_paren_macro
    .param pmc args

    .local pmc stream
    .CAR(stream, args)                    # Get the input stream off the args

    .local pmc delimit
    .STRING(delimit, ")")                 # ')' is the delimiter for this macro

    .local pmc rargs
    .LIST_2(rargs, delimit, stream)       # Package it up for the call

    .local pmc retv
    retv = _read_delimited_list(rargs)   # Read the delimited list in.

    .return(retv)
.end

=head2 _right_paren_macro

As described in CLtL section 2.4.2

=cut

.sub _right_paren_macro
    .param pmc args

    .ERROR_0("reader-error", "An object cannot start with #\\)")
.end

=head2 _single_quote_macro

As described in CLtL section 2.4.3

=cut

.sub _single_quote_macro
    .param pmc args

    .local pmc stream
    .CAR(stream, args)                    # Get the input stream off the args

    .local pmc rargs
    .LIST_1(rargs, stream)                # Package it up for the call to _read

    .local pmc form
    form = _read(rargs)                  # Read in a new object

    .local pmc symbol
    symbol = _LOOKUP_GLOBAL("COMMON-LISP", "QUOTE")

    .local pmc retv
    .LIST_2(retv, symbol, form)           # Create a list equiv to (quote token)

RETURN:
    .return(retv)
.end

=head2 _semicolon_macro

A comment. Skip everything till the end of line
or the end of file.

As described in CLtL section 2.4.4

=cut

.sub _semicolon_macro
    .param pmc args


    .local pmc stream
    .CAR(stream, args)                    # Get the input stream off the args
    .local pmc istream
     istream = stream.'_get_io'()

    .local string char
LOOP:
     read char, istream, 1
     if char == "\n" goto RETURN
     if char == ""   goto RETURN
     goto LOOP

RETURN:
.end

=head2

As described in CLtL section 2.4.5.

=cut

.sub _double_quote_macro
    .param pmc args

    .local pmc stream
    .CAR(stream, args)                    # Get the input stream off the args
    .local pmc istream
    istream = stream.'_get_io'()

    .local pmc symbol
    symbol = _LOOKUP_GLOBAL("COMMON-LISP", "*READTABLE*")
    .local pmc readtable
    readtable = symbol.'_get_value'()
    .local pmc table
    table = readtable.'_get_table'()

    .local string strtok
    strtok = ""

    .local string char
    .local int ordval
    .local int chtype

    goto STEP_1

STEP_1:
    read char, istream, 1
    if char == "" goto EOF_ERROR

    ord ordval, char
    chtype = table[ordval]

    if chtype == SESCAPE_CHAR goto STEP_1a
    if char == "\"" goto RETURN
    goto STEP_1b

STEP_1a:
    read char, istream, 1
    if char == "" goto EOF_ERROR

    goto STEP_1b

STEP_1b:
    concat strtok, char
    goto STEP_1

EOF_ERROR:
    .ERROR_0("end-of-file", "EOF on input stream reached.")
    goto RETURN

RETURN:
    .local pmc token
    .STRING(token, strtok)

    .return(token)
.end

=head2 _backquote_macro

As described in CLtL section 2.4.6

=cut

.sub _backquote_macro

    .ERROR_0("reader-error", "The backquote macro has not yet been implemented.")
.end

=head2 _comma_macro

As described in CLtL section 2.4.7

=cut

.sub _comma_macro

  .ERROR_0("reader-error", "Comma is illegal outside of backquote.")
.end

.sub _sharpsign_macro                   # As described in CLtL section 2.4.8
  .param pmc args

  .local string char
  .local pmc istream
  .local pmc stream
  .local pmc symbol
  .local pmc macros
  .local pmc macro
  .local pmc retv
  .local pmc func

  .CAR(stream,args)
  istream = stream.'_get_io'()

  read char, istream, 1

  symbol = _LOOKUP_GLOBAL("SYSTEM", "*DISPATCHING-MACROS*")
  .ASSERT_TYPE_AND_BRANCH(symbol, "symbol", MACRO_NOT_INITIALIZED)

  macros = symbol.'_get_value'()
  .ASSERT_TYPE_AND_BRANCH(macros, "hash", MACRO_NOT_INITIALIZED)

  macro = macros[char]

  if_null macro, MACRO_NOT_DEFINED

  .ASSERT_TYPE(macro, "function")
  _FUNCTION_CALL(macro,args)

  goto DONE

MACRO_NOT_INITIALIZED:
  .ERROR_0("reader-error","the dispatching macro table has not been created")
  goto DONE

MACRO_NOT_DEFINED:
  .ERROR_1("reader-error","\"%s\" dispatching macro has not been defined",char)
  goto DONE

DONE:
  returncc
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
