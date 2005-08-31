// Copyright: 2005 The Perl Foundation.  All Rights Reserved.
// $Id$


// based on antrltut by javadude
// based on IEEE P1003.2 Draft 11.2 Section 4.3

// Cheat sheet
//
// protected                    Use as a subrule in Lexer, never passed on to Parser
// !                            do not put in AST
// ^                            top of subtree
// { $setType(Token.SKIP); }    do not pass on to Parser

//-----------------------------------------------------------------------------
// gets inserted in the __init__ method of the generated Python class
//-----------------------------------------------------------------------------

header "BcTreeWalker.__init__" 
{
  self.reg_num = 0;    // counter for unlimited number of PMC registers
}

header "BcParser.__init__" 
{
  self.do_print = 1;    // indicate whether an expression should be printed
}


//-----------------------------------------------------------------------------
// Options for ANTLR
//-----------------------------------------------------------------------------
options 
{
  language = "Python";      // generate Lexer, Parser and TreeParser in Python
}


//----------------------------------------------------------------------------
// The bc lexer 
//----------------------------------------------------------------------------
class BcLexer extends Lexer;

options 
{
  // charVocabulary = '\0'..'\377';
  // testLiterals = false;          // don't automatically test for literals
  k = 2;                            // needed for comments LA(2)
}


// Tokens as in POSIX spec

// EOF is predefined by ANTLR

NEWLINE
  options 
  {
    generateAmbigWarnings=false; // single '\r' is ambig with '\r' '\n'
  }
  :   '\r'
    | '\n'
    | '\r' '\n'
  ;

// String literals are everything in double quotes, no escaping
STRING
  : '"'!  ( ~'"' )* '"'!
  ;

LETTER
  : 'a'..'z'
  ;
  
// DIGIT is a subrule used only by INTEGER
protected 
DIGIT
  :   '0' .. '9' 
    | 'A' .. 'F'
  ;

// INTEGER is a subrule used only by NUMBER
protected 
INTEGER
  : (DIGIT)+ 
  ;

NUMBER 
  :   INTEGER ("." INTEGER)?
    | '.' INTEGER
  ;
  
// Operators

// MUL_OP
MUL        : '*'   ;
DIV        : '/'   ;
MOD        : '%'   ;

//ASSIGN_OP  : '=' | "+=" | "-=" | "*=" | "/=" | "%=" | "^=" ;
ASSIGN_OP  : '='   ; 

REL_OP     : '<' | '>' | "==" | "<=" | ">=" | "!="   ;

// INCR_DECR  : "++" | "--"   ;
INCR       : "++" ;
DECR       : "--" ;

// TODO: is Lexeror Parser handling keywords
//           Define    Break    Quit    Length
//           Return    For    If    While    Sqrt
//           Scale    Ibase    Obase    Auto
Quit       : "quit";
Define     : "define";
Auto       : "auto";
 
KEYWORDS: "break" | "length" |
          "return" | "for" | "if" | "while" | "sqrt" |
          "scale" | "ibase" | "obase";

// See 4.3.7.2 item (16)
LPAREN     : '('   ;
RPAREN     : ')'   ;
COMMA      : ','   ;
PLUS       : '+'   ;
MINUS      : '-'   ;
SEMICOLON  : ';'   ;
LBRACKET   : '['   ;
RBRACKET   : ']'   ;
CARET      : '^'   ;
LCURLY     : '{'   ;
RCURLY     : '}'   ;

// not in POSIX spec

// Whitespace -- ignored
WS
  : (   ' '
      | '\t'
      | '\f'
    )
    { $setType(Token.SKIP); }
  ;

ML_COMMENT
  : "/*"
    (   { self.LA(2) != '/' }? '*'
      | '\n' { $newline; }
      | ~('*'|'\n')
    )*
    "*/"
    { $setType(SKIP); }
  ;


//-----------------------------------------------------------------------------
// Define a Parser, calling it BcParser
//-----------------------------------------------------------------------------
class BcParser extends Parser;
options 
{
  k = 1;                           // no lookahead
  defaultErrorHandler = true;      // Don't generate parser error handlers
  buildAST = true;                 // Build an AST for treewalking
}

tokens 
{
  PIR_OP;           // A line of PIR code
  UNARY_MINUS;     
  PIR_PRINT_PMC;    // A line of PIR code
  PIR_FUNCTION_DEF; // A function definition
}


// Rules named as in Posix Spec

// TODO: explicit check for EOF
program
  : (input_item)* EOF
  ;

input_item
  :   semicolon_list NEWLINE!
    | function
  ;

// TODO: trailing SEMICOLON
// empty lines are allowed
semicolon_list
  : (statement (SEMICOLON! statement)*)?
  ;

// Used for grouping of statements and in function definitions
// TODO trailing newlines or semicolons
statement_list
  :   (statement|NEWLINE!)*
    | // nothing
  ;

statement
  {
    pir = "\n#\n";
  }
  : 
      printable_expression
    | a:STRING
      {
        pir += "print '" + a.getText() + "'\n # ";
        #statement = #( [ PIR_OP, pir ] )
      }
    | Quit
      {
        pir += "end\n # ";
        #statement = #( [ PIR_OP, pir ] )
      }
    | LCURLY! statement_list RCURLY!
  ;

// not implemented yet
function              
  : Define LETTER LPAREN opt_parameter_list RPAREN LCURLY NEWLINE opt_auto_define_list statement_list RCURLY
    {
      #function = #( [ PIR_FUNCTION_DEF, "function definition" ] )
    }
  ;

opt_parameter_list
  : (parameter_list)?
  ;

// TODO: Demand a trailing letter
parameter_list
  : define_list 
  ;

// TODO
opt_auto_define_list
  : ( Auto define_list (NEWLINE|SEMICOLON) )? 
  ;

// TODO: allow declaration of arrays
define_list
  : LETTER ( COMMA LETTER )*
  ;

// TODO
opt_argument_list
  : argument_list 
  ;

// TODO
argument_list
  : expression
  ;

//TODO
relational_expression
  : expression
  ;

//TODO
return_expression
  : expression
  ;

printable_expression
  :   e:expression 
      {
        if self.do_print:
          #printable_expression = #( [ PIR_PRINT_PMC, "print" ], #e )
        else:
          #printable_expression = #e
          self.do_print = 1
      }
  ;

expression
  :   named_expression ( ASSIGN_OP^ expression { self.do_print = 0 } )?
    | INCR^ named_expression { self.do_print = 0 }
    | DECR^ named_expression { self.do_print = 0 }
    | adding_expression
  ;

//TODO
named_expression
  : LETTER
  ;

//
// Not in POSIX Spec
//

multiplying_expression
  : sign_expression ((MUL^|DIV^|MOD^) sign_expression)*
  ;

sign_expression!
  :   MINUS i1:paren_expression
      {
        #sign_expression = #( [ UNARY_MINUS ], #i1 ) 
      }
    | i2:paren_expression
      {
        #sign_expression = #i2 
      }
  ;

adding_expression
  : multiplying_expression ((PLUS^|MINUS^) multiplying_expression)* 
  ;

paren_expression
  :   NUMBER
    | LPAREN! adding_expression RPAREN!
  ;

//----------------------------------------------------------------------------
// Transform AST, so that it contains code
//----------------------------------------------------------------------------
class BcTreeWalker extends TreeParser;
options
{
  buildAST = true;	// transform AST 
}

tokens 
{
  PIR_FOOTER;     // At end of PIR script
  PIR_HEADER;     // At start of PIR script
  PIR_NOOP;       // noop
  PIR_COMMENT;    // A comment line
  PIR_NEWLINE;    // A comment line
}

plus! returns [reg_name]
  : #(PLUS reg_name_left=left:expr reg_name_right=right:expr)
  {
    reg_name = "$P%d" % self.reg_num
    self.reg_num = self.reg_num + 1
    pir = "\n" + \
          reg_name + " = new .Float\n" + \
          reg_name + " = add " + reg_name_left + ", " + reg_name_right + "\n #"
    #plus = #( [ PIR_NOOP, "noop" ], #left, #right, [PIR_OP, pir] );
  }
  ;

minus! returns [reg_name]
  : #(MINUS reg_name_left=left:expr reg_name_right=right:expr)
  {
    reg_name = "$P%d" % self.reg_num
    self.reg_num = self.reg_num + 1
    pir = "\n" + \
          reg_name + " = new .Float\n" + \
          reg_name + " = sub " + reg_name_left + ", " + reg_name_right + "\n #"
    #minus = #( [ PIR_NOOP, "noop" ], #left, #right, [PIR_OP, pir] );
  }
  ;

mul! returns [reg_name]
  : #(MUL reg_name_left=left:expr reg_name_right=right:expr)
  {
    reg_name = "$P%d" % self.reg_num
    self.reg_num = self.reg_num + 1
    pir = "\n" + \
          reg_name + " = new .Float\n" + \
          reg_name + " = mul " + reg_name_left + ", " + reg_name_right + "\n #"
    #mul = #( [ PIR_NOOP, "noop" ], #left, #right, [PIR_OP, pir] );
  }
  ;

div! returns [reg_name]
  : #(DIV reg_name_left=left:expr reg_name_right=right:expr)
  {
    reg_name = "$P%d" % self.reg_num
    self.reg_num = self.reg_num + 1
    pir = "\n" + \
          reg_name + " = new .Float\n" + \
          reg_name + " = div " + reg_name_left + ", " + reg_name_right + "\n #"
    #div = #( [ PIR_NOOP, "noop" ], #left, #right, [PIR_OP, pir] );
  }
  ;

mod! returns [reg_name]
  : #(MOD reg_name_left=left:expr reg_name_right=right:expr)
  {
    reg_name = "$P%d" % self.reg_num
    self.reg_num = self.reg_num + 1
    pir = "\n" + \
          reg_name + " = new .Float\n" + \
          reg_name + " = mod " + reg_name_left + ", " + reg_name_right + "\n #"
    #mod = #( [ PIR_NOOP, "noop" ], #left, #right, [PIR_OP, pir] );
  }
  ;

integer! returns [reg_name]
  : i:NUMBER
  {
    reg_name = "$P%d" % self.reg_num
    self.reg_num = self.reg_num + 1
    pir = "\n" + \
          reg_name + " = new .Float\n" + \
          reg_name + " = assign " + i.getText() + "\n #"
    #integer = #( [PIR_OP, pir] );
  } 
  ;

signExpression returns [reg_name]
  :   reg_name=i1:integer
      {
        pir = ""
        #signExpression = #( [ PIR_NOOP, "noop" ],  #signExpression, [PIR_OP, pir] );
      }
    | #( UNARY_MINUS reg_name=i2:integer )
      {
        pir = "\n" + \
              "neg " + reg_name + "\n#"
        #signExpression = #( [ PIR_NOOP, "noop" ],  #signExpression, [PIR_OP, pir] );
      }
  ;

namedExpression returns [reg_name]
  :   l:LETTER
      {
        reg_name = l.getText() + "_lex";
      }
  ;

expr returns [reg_name]
  :   reg_name=plus
    | reg_name=minus
    | reg_name=mul
    | reg_name=div
    | reg_name=mod
    | reg_name=signExpression
    | reg_name=namedExpression
  ;

expr_line!
  :   #( PIR_PRINT_PMC reg_name=E1:expr )
      {
        #expr_line = #( [ PIR_NOOP, "noop" ], #E1, [PIR_OP, "\nprint "], [PIR_OP,reg_name], [PIR_NEWLINE, "\nprint \"\\n\" # "] )
      }
    | #( ASSIGN_OP lex_name=namedExpression reg_name=E2:expr )
      {
        pir = "\n" + \
              lex_name + " = " + reg_name + "\n # "
        #expr_line = #( [ PIR_NOOP, "noop" ], #E2, [PIR_OP, pir] )
      }
    | #( INCR lex_name=namedExpression )
      {
        pir = "\n" + \
              lex_name + " = " + lex_name + " + 1 \n # "
        #expr_line = #( [ PIR_NOOP, "noop" ], [PIR_OP, pir], [PIR_OP, "\nprint "], [PIR_OP,lex_name], [PIR_NEWLINE, "\nprint \"\\n\" # "] )
      }
    | #( DECR lex_name=namedExpression )
      {
        pir = "\n" + \
              lex_name + " = " + lex_name + " - 1 \n # "
        #expr_line = #( [ PIR_NOOP, "noop" ], [PIR_OP, pir], [PIR_OP, "\nprint "], [PIR_OP,lex_name], [PIR_NEWLINE, "\nprint \"\\n\" # "] )
      }
    | p:PIR_OP
      {
        #expr_line = #p
      };

expr_list
  : (expr_line|PIR_FUNCTION_DEF)+
  ;

gen_pir!
  : B:expr_list
    {
      #gen_pir = #([PIR_HEADER, "pir header\n#"], #B, [PIR_FOOTER, "pir footer\n#"]); 
    }
  ;
