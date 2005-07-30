// Copyright: 2005 The Perl Foundation.  All Rights Reserved.
// $Id$


// based on antrltut by javadude
// based on POSIX ...

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
  self.reg_num = 0;        // counter for unlimited number of PMC registers
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
  k = 1;                            // two characters of lookahead
}

// C-like comments
//COMMENT
  //: "//" (~('\n'|'\r'))*
    //{ $setType(Token.SKIP); }
  //;


// Literals

// DIGIT is a subrule used by NUMBER
protected 
DIGIT
  :   '0'..'9' | 'A' .. 'F'
  ;

NUMBER 
  :   (DIGIT)+ 
    |
      '.' (DIGIT)+
  ;
  
// String literals are everything in double quotes, no escaping
STRING
  : '"'!
    ( '"' '"'!
    | ~('"'|'\n'|'\r')
    )*
    ( '"'!
    | // nothing -- write error message
    )
   ;

NEWLINE
  options 
  {
    generateAmbigWarnings=false; // single '\r' is ambig with '\r' '\n'
  }
  :   '\r'
    | '\n'
    | '\r' '\n'
    ;



// Whitespace -- ignored
WS
  : (   ' '
      | '\t'
      | '\f'
    )
    { $setType(Token.SKIP); }
  ;


// an identifier.  Note that testLiterals is set to true!  This means
// that after we match the rule, we look in the literals table to see
// if it's a literal or really an identifer
IDENT
  options 
  {
    testLiterals=true;
  }
  : ('a'..'z') ('a'..'z')*
  ;
  
LETTER
  : 'a'..'z'
  ;
  
// Operators
DOT        : '.'   ;
BECOMES    : ":="  ;
COLON      : ':'   ;
SEMI       : ';'   ;
COMMA      : ','   ;
ASSIGN_OP  : '=' | "^="      ;
LBRACKET   : '['   ;
RBRACKET   : ']'   ;
DOTDOT     : ".."  ;
LPAREN     : '('   ;
RPAREN     : ')'   ;
REL_OP     : '<' | '>' | "==" | "<=" | ">=" | "!="   ;
PLUS       : '+'   ;
MINUS      : '-'   ;
INCR_DECR  : "++" | "--"   ;
MUL        : '*'   ;
DIV        : '/'   ;
MOD        : '%'   ;

// TODO: is Lexeror Parser handling keywords
//           Define    Break    Quit    Length
// /*       'define', 'break', 'quit', 'length'     */
//           Return    For    If    While    Sqrt
// /*       'return', 'for', 'if', 'while', 'sqrt'  */

//           Scale    Ibase    Obase    Auto
// /*       'scale', 'ibase', 'obase', 'auto'       */



//-----------------------------------------------------------------------------
// Define a Parser, calling it BcParser
//-----------------------------------------------------------------------------
class BcParser extends Parser;
options 
{
  k = 1;
  defaultErrorHandler = true;      // Don't generate parser error handlers
  buildAST = true;                 // Build an AST for treewalking
}

tokens 
{
  PIR_OP;         // A line of PIR code
  UNARY_MINUS;    // A line of PIR code
}

// "quit" is really a keyword
program
  : (expr_newline)* 
    "quit"!
    // end-of-file
  ;

expr_newline
  : addingExpression NEWLINE!
  ;


subprogramBody
  : (basicDecl)*
    (procedureDecl)*
    statementList
  ;


basicDecl
  :   varDecl
    | constDecl
    | typeDecl
  ;


varDecl
  : "var" identList COLON typeName
    (BECOMES constantValue)?
    SEMI
  ;


constDecl
  : "constant" identList COLON typeName
    BECOMES constantValue SEMI
  ;



identList
  : LETTER (COMMA LETTER)*
  ;


constantValue
  :   NUMBER
    | LETTER
  ;


typeDecl
  : "type" LETTER ASSIGN_OP
    (   arrayDecl
      | recordDecl
    )
    SEMI
  ;


arrayDecl
  : "array" LBRACKET integerConstant DOTDOT integerConstant RBRACKET
    "of" typeName
  ;

integerConstant
  :   NUMBER
    | LETTER // again, a constant...
  ;


recordDecl
  : "record" (identList COLON typeName SEMI)+ "end" "record"
  ;


typeName
  :   LETTER
    | "Integer"
    | "Boolean"
  ;


procedureDecl
  : "procedure" LETTER (formalParameters)? ASSIGN_OP
        subprogramBody
    SEMI
  ;


formalParameters
  : LPAREN parameterSpec (SEMI parameterSpec)* RPAREN
  ;


parameterSpec
  : ("var")? identList COLON typeName
  ;

statement
  :   exitStatement
    | returnStatement
    | ifStatement
    | loopStatement
    | ioStatement
    | (LETTER (LPAREN|SEMI))=> procedureCallStatement
    | assignmentStatement
    | expression
  ;


statementList
  :   addingExpression statementList
    | // nothing
  ;

assignmentStatement
  : variableReference BECOMES expression SEMI
  ;


exitStatement
  : "exit" "when" expression SEMI
  ;

procedureCallStatement
  : LETTER (actualParameters)? SEMI
  ;

actualParameters
  : LPAREN (expression (COMMA expression)*)? RPAREN
  ;

returnStatement
  : "return" SEMI
  ;

ifStatement
  : "if" ifPart "end" "if" SEMI
  ;

ifPart
  : expression "then"
    statementList
    (   "elsif" ifPart
      | "else" statementList
    )?
  ;

loopStatement
  : ("while" expression)? "loop"
        statementList
    "end" "loop" SEMI
  ;

endStatement
  : "end" SEMI
  ;

variableReference
  : LETTER
    (   LBRACKET expression RBRACKET
      | DOT LETTER
    )*
  ;



ioStatement
  :   "put" LPAREN expression RPAREN SEMI
    | "get" LPAREN variableReference RPAREN SEMI
    | "newLine" (LPAREN RPAREN)? SEMI
    | "skipLine" (LPAREN RPAREN)? SEMI
  ;


primitiveElement
  :   variableReference
    | constantValue
    | LPAREN expression RPAREN
  ;


booleanNegationExpression
  : ("not")* primitiveElement
  ;

multiplyingExpression
  : signExpression ((MUL^|DIV^|MOD^) signExpression)*
  ;

signExpression!
  :   MINUS i1:NUMBER
      {
        #signExpression = #( [ UNARY_MINUS ], #i1 ) 
      }
    | i2:NUMBER
      {
        #signExpression = #i2 
      }
  ;

addingExpression
  : multiplyingExpression ((PLUS^|MINUS^) multiplyingExpression)* 
  ;

relationalExpression
  : addingExpression ((ASSIGN_OP|NOT_EQUALS|REL_OP) addingExpression)*
  ;

expression
  : relationalExpression (("and"|"or") relationalExpression)*
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
    reg_name = "P%d" % self.reg_num
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
    reg_name = "P%d" % self.reg_num
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
    reg_name = "P%d" % self.reg_num
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
    reg_name = "P%d" % self.reg_num
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
    reg_name = "P%d" % self.reg_num
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
    reg_name = "P%d" % self.reg_num
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

expr returns [reg_name]
  :   reg_name=plus
    | reg_name=minus
    | reg_name=mul
    | reg_name=div
    | reg_name=mod
    | reg_name=signExpression
  ;

expr_line
  : reg_name=E:expr
    {
      #expr = #( [ PIR_NOOP, "noop" ], #E, [PIR_OP, "\nprint "], [PIR_OP,reg_name], [PIR_NEWLINE, "\nprint \"\\n\" # "] )
    }
  ;

expr_list
  : (expr)+
  ;

gen_pir!
  :   A:expr_line
      {
        #gen_pir = #([PIR_HEADER, "pir header\n#"], #A, [PIR_FOOTER, "pir footer\nend\n#"]); 
      }
    | #( PIR_OP B:expr_line )
      {
        #gen_pir = #([PIR_HEADER, "pir header tree\n#"], #B, [PIR_FOOTER, "pir footer tree\nend\n#"]); 
      }
  ;
