
.sub _init_types
  .local pmc class

   subclass class, "FixedPMCArray", "LispCons"

   subclass class, "Float", "LispFloat"

   newclass class, "LispFunction"
   addattribute class, "documentation"
   addattribute class, "args"
   addattribute class, "body"
   addattribute class, "name"
   addattribute class, "scope"

   subclass class, "LispFunction", "LispMacro"

   subclass class, "LispFunction", "LispSpecialForm"

   subclass class, "Hash", "LispHash"

   subclass class, "Integer", "LispInteger"

   newclass class, "LispPackage"
   addattribute class, "external"
   addattribute class, "internal"
   addattribute class, "name"

   newclass class, "LispReadtable"
   addattribute class, "table"
   addattribute class, "case"

   newclass class, "LispStream"
   addattribute class, "stream"

   subclass class, "String", "LispString"

   newclass class, "LispSymbol"
   addattribute class, "documentation"
   addattribute class, "function"
   addattribute class, "name"
   addattribute class, "package"
   addattribute class, "special"
   addattribute class, "value"
.end

.namespace ["LispCons"]

.sub __init method
   self = 2
.end

.sub __get_string method
  .local string car
  .local string cdr
  .local pmc retv
  .local pmc tmps

   retv = new String
   tmps = new String

   retv = "("

   car  = self[0]
   tmps = car

   concat retv, retv, tmps

   tmps = " . "

   concat retv, retv, tmps

   cdr  = self[1]
   tmps = cdr

   concat retv, retv, tmps

   tmps = ")"

   concat retv, retv, tmps

  .return(retv)
.end

.namespace ["LispFunction"]

.sub _get_args method
  .local pmc retv

   getattribute retv, self, "LispFunction\0args"

  .return(retv)
.end

.sub _set_args method
  .param pmc args

   setattribute self, "LispFunction\0args", args

  .return(args)
.end

.sub _get_body method
  .local pmc retv

   getattribute retv, self, "LispFunction\0body"

  .return(retv)
.end

.sub _set_body method
  .param pmc body

   setattribute self, "LispFunction\0body", body

  .return(body)
.end

.sub _get_name method
  .local pmc retv

   getattribute retv, self, "LispFunction\0name"

  .return(retv)
.end

.sub _set_name method
  .param pmc name

   setattribute self, "LispFunction\0name", name

  .return(name)
.end

.sub _get_scope method
  .local pmc retv

   getattribute retv, self, "LispFunction\0scope"

  .return(retv)
.end

.sub _set_scope method
  .param pmc scope

   setattribute self, "LispFunction\0scope", scope

  .return(scope)
.end

.sub __get_string method
  .local pmc retv
  .local pmc tmps
  .local pmc name
  .local int test

   name = self._get_name()

   defined test, name
   if test goto NAMED_FUNCTION

   name = new String
   name = "ANONYMOUS"

NAMED_FUNCTION:
   retv = new String
   retv = "#<FUNCTION "

   concat retv, retv, name

   tmps = new String
   tmps = ">"
   concat retv, retv, tmps

  .return(retv)
.end

.namespace ["LispHash"]

.sub __get_string method
  .local pmc name

   name = new String
   name = "#S(HASH-TABLE)"

  .return(name)
.end

.namespace ["LispMacro"]

.sub __get_string method
  .local pmc retv
  .local pmc tmps
  .local pmc name
  .local int test

   retv = new "LispString"
   retv = "#<MACRO>"

  .return(retv)
.end

.namespace ["LispPackage"]

.sub __init method
  .local pmc value

   value = new Hash
   setattribute self, "LispPackage\0external", value

   value = new Hash
   setattribute self, "LispPackage\0internal", value
.end

.sub _lookup_symbol method
  .param string name
  .local string type
  .local pmc symbol
  .local pmc stack
  .local int depth
  .local pmc hash

   getattribute hash, self,  "LispPackage\0internal"
   stack = hash[name]

   typeof type, stack
   if type == "None" goto SYMBOL_NOT_FOUND

   depth = stack
   depth = depth - 1

   symbol = stack[depth]

   goto DONE

SYMBOL_NOT_FOUND:
   null symbol
   goto DONE

DONE:
  .return(symbol)
.end

.sub _import_symbol method
  .param pmc symbol
  .local string symname
  .local string type
  .local pmc stack
  .local pmc hash

   symname = symbol._get_name_as_string()

   getattribute hash, self,  "LispPackage\0internal"

   stack = hash[symname]

   typeof type, stack
   if type == "None" goto CREATE_STACK
   goto PUSH_SYMBOL

CREATE_STACK:
   stack = new ResizablePMCArray
   hash[symname] = stack
   goto PUSH_SYMBOL

PUSH_SYMBOL:
   push stack, symbol
   goto DONE

DONE:
  .return(symbol)
.end

.sub _shadow_symbol method
  .param string name
  .local pmc symbol
  .local pmc stack
  .local pmc hash

   getattribute hash, self,  "LispPackage\0internal"
   stack = hash[name]

   symbol = _SYMBOL(name)
   symbol._set_package(self)

   push stack, symbol

  .return(symbol)
.end

.sub _unshadow_symbol method
  .param string name
  .local pmc symbol
  .local pmc stack
  .local pmc hash
  .local int size

   getattribute hash, self,  "LispPackage\0internal"
   stack = hash[name]

   size = stack
   dec size

   stack = size

  .return(symbol)
.end

.sub _get_exports method
  .local string keyval
  .local string type
  .local pmc exports
  .local pmc hash
  .local pmc key
  .local pmc val
  .local pmc i

   exports = new ResizablePMCArray

   getattribute hash, self,  "LispPackage\0external"

   iter i, hash
   push_eh DONE

  .local string type

LOOP:
   shift key, i

   keyval = key
  .STRING(val, keyval)

   push exports, val

   goto LOOP

DONE:
  .return(exports)
.end

.sub _export_symbol method
  .param string name
  .local pmc external
  .local pmc internal
  .local string type
  .local pmc symbol
  .local pmc stack
  .local int top

   getattribute internal, self,  "LispPackage\0internal"
   getattribute external, self,  "LispPackage\0external"

   stack = internal[name]

   typeof type, stack
   if type == "None" goto SYMBOL_NOT_FOUND

   external[name] = stack

   goto DONE

SYMBOL_NOT_FOUND:
   symbol = self._intern_symbol(name)

   stack = internal[name]
   external[name] = stack

   goto DONE

DONE:
   top = stack
   top = top - 1

   symbol = stack[top]

  .return(symbol)
.end

.sub _intern_symbol method
  .param string name
  .local string type
  .local pmc symbol
  .local pmc status
  .local pmc stack
  .local pmc hash
  .local int top

   getattribute hash, self,  "LispPackage\0internal"
   stack = hash[name]

   typeof type, stack
   if type != "None" goto DONE

   symbol = _SYMBOL(name)

   stack = new ResizablePMCArray
   push stack, symbol

   hash[name] = stack

   goto DONE

DONE:
   top = stack
   top = top - 1

   symbol = stack[top]

  .return(symbol)
.end

.sub _get_name method
  .local pmc retv

   getattribute retv, self, "LispPackage\0name"

  .return(retv)
.end

.sub _set_name method
  .param pmc name

   setattribute self, "LispPackage\0name", name

  .return(name)
.end

.sub _get_name_as_string method
  .local pmc name
  .local string retv

   getattribute name, self, "LispPackage\0name"
   retv = name

  .return(retv)
.end

.sub __get_string method
  .local pmc name
  .local pmc tmps
  .local pmc retv

   getattribute name, self, "LispPackage\0name"

   retv = new String
   tmps = new String

   tmps = "#<PACKAGE "

   concat retv, tmps, name

   tmps = ">"
   concat retv, retv, tmps

  .return(retv)
.end

.namespace ["LispReadtable"]

.sub _get_table method
  .local pmc retv

   getattribute retv, self, "LispReadtable\0table"

  .return(retv)
.end

.sub _set_table method
  .param pmc table

   setattribute self, "LispReadtable\0table", table

  .return(table)
.end

.sub _get_case method
  .local pmc retv

   getattribute retv, self, "LispReadtable\0case"

  .return(retv)
.end

.sub _set_case method
  .param pmc case

   setattribute self, "LispReadtable\0case", case

  .return(case)
.end

.sub __init method
  .local pmc table
  .local pmc case

   table = new Array
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

   case = new Boolean
   case = 0

   setattribute self, "LispReadtable\0table", table
   setattribute self, "LispReadtable\0case", case
.end

.sub __get_string method
  .local pmc name
  .local pmc tmps
  .local pmc retv

   retv = new String
   retv = "#<READTABLE 0x????????>"

  .return(retv)
.end

.namespace ["LispStream"]

.sub _get_io method
  .local pmc retv

   getattribute retv, self, "LispStream\0stream"

  .return(retv)
.end

.sub _set_io method
  .param pmc io

   setattribute self, "LispStream\0stream", io

  .return(io)
.end

.sub __get_string method
  .local pmc name

   name = new String
   name = "#<IO STREAM>"

  .return(name)
.end

.namespace ["LispSymbol"]

.sub _get_documentation method
  .local pmc retv

   getattribute retv, self, "LispSymbol\0documentation"

  .return(retv)
.end

.sub _set_documentation method
  .param pmc docs

   setattribute self, "LispSymbol\0documentation", docs

  .return(docs)
.end

.sub _get_function method
  .local pmc retv

   getattribute retv, self, "LispSymbol\0function"

  .return(retv)
.end

.sub _set_function method
  .param pmc function

   setattribute self, "LispSymbol\0function", function

  .return(function)
.end

.sub _get_name method
  .local pmc retv

   getattribute retv, self, "LispSymbol\0name"

  .return(retv)
.end

.sub _set_name method
  .param pmc name

   setattribute self, "LispSymbol\0name", name

  .return(name)
.end

.sub _get_name_as_string method
  .local pmc name
  .local string retv

   getattribute name, self, "LispSymbol\0name"
   retv = name

  .return(retv)
.end

.sub _get_package method
  .local pmc retv

   getattribute retv, self, "LispSymbol\0package"

  .return(retv)
.end

.sub _set_package method
  .param pmc package

   setattribute self, "LispSymbol\0package", package

  .return(package)
.end

.sub _get_special method
  .local pmc retv

   getattribute retv, self, "LispSymbol\0special"

  .return(retv)
.end

.sub _set_special method
  .param pmc special

   setattribute self, "LispSymbol\0special", special

  .return(special)
.end

.sub _get_value method
  .local pmc retv

   getattribute retv, self, "LispSymbol\0value"

  .return(retv)
.end

.sub _set_value method
  .param pmc value

   setattribute self, "LispSymbol\0value", value

  .return(value)
.end

.sub __get_string method
  .local pmc name

   getattribute name, self, "LispSymbol\0name"

  .return(name)
.end

.sub __get_bool method
  .local pmc retv

   getprop retv, "defined", self

  .return(retv)
.end

.namespace [""]
