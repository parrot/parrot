# $Id$

=head1 NAME

types.pir - Lisp data types

=head1 subs

=cut

=head2 _init_types

Set up the types.

=cut

.sub _init_types :init

    .local pmc class

     class = subclass "FixedPMCArray", "LispCons"

     class = subclass "Float", "LispFloat"

     class = newclass "LispFunction"
     addattribute class, "documentation"
     addattribute class, "args"
     addattribute class, "body"
     addattribute class, "name"
     addattribute class, "scope"

     class = subclass "LispFunction", "LispMacro"

     class = subclass "LispFunction", "LispSpecialForm"

     class = subclass "Hash", "LispHash"

     class = subclass "Integer", "LispInteger"

     class = newclass "LispPackage"
     addattribute class, "external"
     addattribute class, "internal"
     addattribute class, "name"

     class = subclass "Rational", "LispRational"

     class = newclass "LispReadtable"
     addattribute class, "table"
     addattribute class, "case"

     class = newclass "LispStream"
     addattribute class, "stream"

     class = subclass "String", "LispString"

     class = newclass "LispSymbol"
     addattribute class, "documentation"
     addattribute class, "function"
     addattribute class, "name"
     addattribute class, "package"
     addattribute class, "special"
     addattribute class, "value"

     .return ()
.end

.namespace ["LispCons"]

.sub __init :method
     self = 2      # a cons cell has two fields, car and cdr
.end

.sub __get_string :method

    .local pmc retv
    retv = new 'String'
    retv = "("

    .local string car
    car  = self[0]
    concat retv, retv, car

    concat retv, retv, " . "

    .local string cdr
    cdr  = self[1]
    concat retv, retv, cdr

    concat retv, retv, ")"

   .return(retv)
.end

.namespace ["LispFunction"]

.sub _get_args :method
    .local pmc retv
    retv = getattribute self, "args"

    .return(retv)
.end

.sub _set_args :method
    .param pmc args

    setattribute self, "args", args

   .return(args)
.end

.sub _get_body :method
    .local pmc retv
     retv =  getattribute self, "body"

    .return(retv)
.end

.sub _set_body :method
  .param pmc body

   setattribute self, "body", body

  .return(body)
.end

.sub _get_name :method
    .local pmc retv
    retv = getattribute self, "name"

    .return(retv)
.end

.sub _set_name :method
    .param pmc name

    setattribute self, "name", name

    .return(name)
.end

.sub _get_scope :method
    .local pmc retv

    retv = getattribute self, "scope"

    .return(retv)
.end

.sub _set_scope :method
    .param pmc scope

     setattribute self, "scope", scope

    .return(scope)
.end

.sub __get_string :method
    .local pmc retv
    .local pmc tmps

    .local pmc name
    name = self.'_get_name'()

    .local int test
    defined test, name
    if test goto NAMED_FUNCTION

    name = new 'String'
    name = "ANONYMOUS"

NAMED_FUNCTION:
    retv = new 'String'
    retv = "#<FUNCTION "

    concat retv, retv, name

    tmps = new 'String'
    tmps = ">"
    concat retv, retv, tmps

   .return(retv)
.end

.namespace ["LispHash"]

.sub __get_string :method
    .local pmc name

     name = new 'String'
     name = "#S(HASH-TABLE)"

    .return(name)
.end

.namespace ["LispMacro"]

.sub __get_string :method
    .local pmc tmps

    .local pmc retv
    retv = new "LispString"
    retv = "#<MACRO>"

    .return(retv)
.end

.namespace ["LispPackage"]

.sub __init :method
    .local pmc value

    value = new 'Hash'
    setattribute self, "external", value

    value = new 'Hash'
    setattribute self, "internal", value
.end

.sub _lookup_symbol :method
    .param string name

    .local pmc symbol

    .local pmc hash
    hash = getattribute self,  "internal"

    .local pmc stack
    stack = hash[name]
    if_null stack, SYMBOL_NOT_FOUND

    symbol = stack[-1]
    goto DONE

SYMBOL_NOT_FOUND:
    null symbol
    goto DONE

DONE:
    .return(symbol)
.end

.sub _import_symbol :method
    .param pmc symbol

    .local string symname
    .local pmc stack
    .local pmc hash

    symname = symbol.'_get_name_as_string'()

    hash = getattribute self,  "internal"

    stack = hash[symname]

    if_null stack, CREATE_STACK
    goto PUSH_SYMBOL

CREATE_STACK:
    stack = new 'ResizablePMCArray'
    hash[symname] = stack
    goto PUSH_SYMBOL

PUSH_SYMBOL:
    push stack, symbol
    goto DONE

DONE:
    .return(symbol)
.end

.sub _shadow_symbol :method
    .param string name

    .local pmc symbol
    .local pmc stack
    .local pmc hash

    hash = getattribute self, "internal"
    stack = hash[name]

    symbol = _SYMBOL(name)
    symbol.'_set_package'(self)

    push stack, symbol

    .return(symbol)
.end

.sub _unshadow_symbol :method
    .param string name

    .local pmc hash
    hash = getattribute self, "internal"
    .local pmc stack
    stack = hash[name]

    # delete the currently active symbol
    .local int size
    size = stack
    dec size
    stack = size

    .return ()
.end

.sub _get_exports :method
    .local string keyval
    .local pmc exports
    .local pmc hash
    .local pmc key
    .local pmc val
    .local pmc i

    exports = new 'ResizablePMCArray'
    hash = getattribute self,  "external"

    iter i, hash
    push_eh DONE

LOOP:
    shift key, i

    keyval = key
    .STRING(val, keyval)

    push exports, val

    goto LOOP

DONE:
    .return(exports)
.end

.sub _export_symbol :method
    .param string name

    .local pmc external
    .local pmc internal
    .local pmc symbol
    .local pmc stack
    .local int top

    internal = getattribute self,  "internal"
    external = getattribute self,  "external"

    stack = internal[name]

    if_null stack, SYMBOL_NOT_FOUND

    external[name] = stack

    goto DONE

SYMBOL_NOT_FOUND:
    symbol = self.'_intern_symbol'(name)

    stack = internal[name]
    external[name] = stack

    goto DONE

DONE:
    symbol = stack[-1]

    .return(symbol)
.end

.sub _intern_symbol :method
    .param string name

    .local pmc symbol
    .local pmc status
    .local pmc stack
    .local pmc hash
    .local int top

    # the attribute internal has been set up in _init_types
    hash = getattribute self,  "internal"
    stack = hash[name]

    unless_null stack, DONE

    symbol = _SYMBOL(name)

    stack = new 'ResizablePMCArray'
    push stack, symbol
    hash[name] = stack

    goto DONE

DONE:
    top = stack
    top = top - 1

    symbol = stack[top]

    .return(symbol)
.end

.sub _get_name :method
    .local pmc retv
    retv = getattribute self, "name"

    .return(retv)
.end

.sub _set_name :method
    .param pmc name

    setattribute self, "name", name

    .return(name)
.end

.sub _get_name_as_string :method
    .local pmc name
    name = getattribute self, "name"
    .local string retv
    retv = name

    .return(retv)
.end

.sub __get_string :method
    .local pmc name
    name = getattribute self, "name"

    .local pmc retv
    retv = new 'String'

    .local pmc tmps
    tmps = new 'String'
    tmps = "#<PACKAGE "
    concat retv, tmps, name

    tmps = ">"
    concat retv, retv, tmps

   .return(retv)
.end

.namespace ["LispReadtable"]

.sub _get_table :method
    .local pmc retv
    retv = getattribute self, "table"

   .return(retv)
.end

.sub _set_table :method
    .param pmc table

    setattribute self, "table", table

   .return(table)
.end

.sub _get_case :method
    .local pmc retv
    retv = getattribute self, "case"

    .return(retv)
.end

.sub _set_case :method
    .param pmc case
    setattribute self, "case", case

    .return(case)
.end

.sub __init :method
    .local pmc table
    .local pmc case

     table = new 'Array'
     table = 128

     table[0]  = INVALID_CHAR
     table[1]  = INVALID_CHAR
     table[2]  = INVALID_CHAR
     table[3]  = INVALID_CHAR
     table[4]  = INVALID_CHAR
     table[5]  = INVALID_CHAR
     table[6]  = INVALID_CHAR
     table[7]  = INVALID_CHAR
     table[8]  = CONSTITUENT_CHAR            # Backspace
     table[9]  = WHITESPACE_CHAR             # Tab
     table[10] = WHITESPACE_CHAR             # Newline
     table[11] = INVALID_CHAR
     table[12] = WHITESPACE_CHAR             # Page
     table[13] = WHITESPACE_CHAR             # Return
     table[14] = INVALID_CHAR
     table[15] = INVALID_CHAR
     table[16] = INVALID_CHAR
     table[17] = INVALID_CHAR
     table[18] = INVALID_CHAR
     table[19] = INVALID_CHAR
     table[20] = INVALID_CHAR
     table[21] = INVALID_CHAR
     table[22] = INVALID_CHAR
     table[23] = INVALID_CHAR
     table[24] = INVALID_CHAR
     table[25] = INVALID_CHAR
     table[26] = INVALID_CHAR
     table[27] = INVALID_CHAR
     table[28] = INVALID_CHAR
     table[29] = INVALID_CHAR
     table[30] = INVALID_CHAR
     table[31] = INVALID_CHAR
     table[32] = WHITESPACE_CHAR             # Space
     table[33] = CONSTITUENT_CHAR            # !
     table[34] = TERM_MACRO_CHAR             # "
     table[35] = NTERM_MACRO_CHAR            # #
     table[36] = CONSTITUENT_CHAR            # $
     table[37] = CONSTITUENT_CHAR            # %
     table[38] = CONSTITUENT_CHAR            # &
     table[39] = TERM_MACRO_CHAR             # '
     table[40] = TERM_MACRO_CHAR             # (
     table[41] = TERM_MACRO_CHAR             # )
     table[42] = CONSTITUENT_CHAR            # *
     table[43] = CONSTITUENT_CHAR            # +
     table[44] = TERM_MACRO_CHAR             # ,
     table[45] = CONSTITUENT_CHAR            # -
     table[46] = CONSTITUENT_CHAR            # .
     table[47] = CONSTITUENT_CHAR            # /
     table[48] = CONSTITUENT_CHAR            # 0
     table[49] = CONSTITUENT_CHAR            # 1
     table[50] = CONSTITUENT_CHAR            # 2
     table[51] = CONSTITUENT_CHAR            # 3
     table[52] = CONSTITUENT_CHAR            # 4
     table[53] = CONSTITUENT_CHAR            # 5
     table[54] = CONSTITUENT_CHAR            # 6
     table[55] = CONSTITUENT_CHAR            # 7
     table[56] = CONSTITUENT_CHAR            # 8
     table[57] = CONSTITUENT_CHAR            # 9
     table[58] = CONSTITUENT_CHAR            # :
     table[59] = TERM_MACRO_CHAR             # ;
     table[60] = CONSTITUENT_CHAR            # <
     table[61] = CONSTITUENT_CHAR            # =
     table[62] = CONSTITUENT_CHAR            # >
     table[63] = CONSTITUENT_CHAR            # ?
     table[64] = CONSTITUENT_CHAR            # @
     table[65] = CONSTITUENT_CHAR            # A
     table[66] = CONSTITUENT_CHAR            # B
     table[67] = CONSTITUENT_CHAR            # C
     table[68] = CONSTITUENT_CHAR            # D
     table[69] = CONSTITUENT_CHAR            # E
     table[70] = CONSTITUENT_CHAR            # F
     table[71] = CONSTITUENT_CHAR            # G
     table[72] = CONSTITUENT_CHAR            # H
     table[73] = CONSTITUENT_CHAR            # I
     table[74] = CONSTITUENT_CHAR            # J
     table[75] = CONSTITUENT_CHAR            # K
     table[76] = CONSTITUENT_CHAR            # L
     table[77] = CONSTITUENT_CHAR            # M
     table[78] = CONSTITUENT_CHAR            # N
     table[79] = CONSTITUENT_CHAR            # O
     table[80] = CONSTITUENT_CHAR            # P
     table[81] = CONSTITUENT_CHAR            # Q
     table[82] = CONSTITUENT_CHAR            # R
     table[83] = CONSTITUENT_CHAR            # S
     table[84] = CONSTITUENT_CHAR            # T
     table[85] = CONSTITUENT_CHAR            # U
     table[86] = CONSTITUENT_CHAR            # V
     table[87] = CONSTITUENT_CHAR            # W
     table[88] = CONSTITUENT_CHAR            # X
     table[89] = CONSTITUENT_CHAR            # Y
     table[90] = CONSTITUENT_CHAR            # Z
     table[91] = CONSTITUENT_CHAR            # [
     table[92] = SESCAPE_CHAR                # \
     table[93] = CONSTITUENT_CHAR            # ]
     table[94] = CONSTITUENT_CHAR            # ^
     table[95] = CONSTITUENT_CHAR            # _
     table[96] = TERM_MACRO_CHAR             # `
     table[97] = CONSTITUENT_CHAR            # a
     table[98] = CONSTITUENT_CHAR            # b
     table[99] = CONSTITUENT_CHAR            # c
     table[100] = CONSTITUENT_CHAR           # d
     table[101] = CONSTITUENT_CHAR           # e
     table[102] = CONSTITUENT_CHAR           # f
     table[103] = CONSTITUENT_CHAR           # g
     table[104] = CONSTITUENT_CHAR           # h
     table[105] = CONSTITUENT_CHAR           # i
     table[106] = CONSTITUENT_CHAR           # j
     table[107] = CONSTITUENT_CHAR           # k
     table[108] = CONSTITUENT_CHAR           # l
     table[109] = CONSTITUENT_CHAR           # m
     table[110] = CONSTITUENT_CHAR           # n
     table[111] = CONSTITUENT_CHAR           # o
     table[112] = CONSTITUENT_CHAR           # p
     table[113] = CONSTITUENT_CHAR           # q
     table[114] = CONSTITUENT_CHAR           # r
     table[115] = CONSTITUENT_CHAR           # s
     table[116] = CONSTITUENT_CHAR           # t
     table[117] = CONSTITUENT_CHAR           # u
     table[118] = CONSTITUENT_CHAR           # v
     table[119] = CONSTITUENT_CHAR           # w
     table[120] = CONSTITUENT_CHAR           # x
     table[121] = CONSTITUENT_CHAR           # y
     table[122] = CONSTITUENT_CHAR           # z
     table[123] = CONSTITUENT_CHAR           # {
     table[124] = MESCAPE_CHAR               # |
     table[125] = CONSTITUENT_CHAR           # }
     table[126] = CONSTITUENT_CHAR           # ~
     table[127] = CONSTITUENT_CHAR           # Rubout

     case = new 'Boolean'
     case = 0

     setattribute self, "table", table
     setattribute self, "case", case
.end

.sub __get_string :method
    .local pmc name
    .local pmc tmps
    .local pmc retv

     retv = new 'String'
     retv = "#<READTABLE 0x????????>"

    .return(retv)
.end

.namespace ["LispStream"]

.sub _get_io :method
    .local pmc retv
    retv = getattribute self, "stream"

    .return(retv)
.end

.sub _set_io :method
    .param pmc io

    setattribute self, "stream", io

    .return(io)
.end

.sub __get_string :method
    .local pmc name
    name = new 'String'
    name = "#<IO STREAM>"

    .return(name)
.end

.namespace ["LispSymbol"]

.sub _get_documentation :method
    .local pmc retv
    retv = getattribute self, "documentation"

    .return(retv)
.end

.sub _set_documentation :method
    .param pmc docs

    setattribute self, 'documentation', docs

    .return(docs)
.end

.sub _get_function :method
    .local pmc retv
    retv = getattribute self, "function"

    .return(retv)
.end

.sub _set_function :method
    .param pmc function
    setattribute self, 'function', function

    .return(function)
.end

.sub _get_name :method
    .local pmc retv
    retv = getattribute self, 'name'

    .return(retv)
.end

.sub _set_name :method
    .param pmc name

    setattribute self, "name", name

    .return(name)
.end

.sub _get_name_as_string :method
    .local pmc name
    name = getattribute self, "name"

    .local string retv
    retv = name

    .return(retv)
.end

.sub _get_package :method
    .local pmc retv
    retv = getattribute self, "package"

    .return(retv)
.end

.sub _set_package :method
    .param pmc package
    setattribute self, "package", package

    .return(package)
.end

.sub _get_special :method
    .local pmc retv
    retv = getattribute self, "special"

    .return(retv)
.end

.sub _set_special :method
    .param pmc special
    setattribute self, "special", special

    .return(special)
.end

.sub _get_value :method
    .local pmc retv
    retv = getattribute self, "value"

    .return(retv)
.end

.sub _set_value :method
    .param pmc value

     setattribute self, "value", value

    .return(value)
.end

.sub __get_string :method
    .local pmc name
    name = getattribute self, "name"

    .return(name)
.end

.sub __get_bool :method
    .local pmc retv
    retv = getprop "defined", self

    .return(retv)
.end

.namespace []

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
