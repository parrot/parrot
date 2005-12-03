// Copyright: 2005 The Perl Foundation.  All Rights Reserved.
// $Id$

header "Antlr2PastTreeWalker.__init__" 
{
  self.reg_num   = 0;  // counter for unlimited number of PMC registers
  self.label_num = 0;  // counter for generation jump labels
}

//-----------------------------------------------------------------------------
// Options for ANTLR
//-----------------------------------------------------------------------------
options 
{
  language = "Python";      // generate Lexer, Parser and TreeParser in Python
}


//----------------------------------------------------------------------------
// Transform AST, so that it contains PIR that sets up PAST
//----------------------------------------------------------------------------
class Antlr2PastTreeWalker extends TreeParser;

options
{
  buildAST    = true;	// transform AST 
  importVocab = BcLexer;
}

tokens 
{
  // These tokens are not in the parse tree.
  // They make up an AST that is equivalent to the PAST data structure.
  PAST_Stmts;
  PAST_Stmt;
  PAST_Exp;
  PAST_Op;
  PAST_Val;
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
    | #( If reg_name=E3:relational_expr p2:expr_line )
      {
        pir = "\n" + \
              "unless " + reg_name + " goto LABEL_%d\n#" % self.label_num 
        #expr_line = #( [ PIR_NOOP, "noop" ], #E3, [PIR_OP, pir], #p2, [PIR_OP,"\nLABEL_0:\n#"] )
      }
    | p:PIR_OP
      {
        #expr_line = #p
      };

relational_expr! returns[reg_name]
  :   reg_name=e1:expr
      {
         #relational_expr = #e1
      } 
    | #( op:REL_OP reg_name_left=e2:expr reg_name_right=e3:expr ) 
      {
        reg_name = "temp_int"    // this will be returned
        pir_op_for_rel_op = { "<":  "islt",
                              "<=": "isle",
                              ">":  "isgt",
                              ">=": "isge",
                              "==": "iseq",
                              "!=": "isne",
                            }
        pir = "\n" + \
              reg_name + " = " + pir_op_for_rel_op[op.getText()] + ' ' + reg_name_left + ", " + reg_name_right + "\n #"
        #relational_expr = #( [ PIR_NOOP, "noop" ], #e2, e3, [PIR_OP, pir] )
      }
  ;

expr_list
  : (expr_line|PIR_FUNCTION_DEF)+
  ;

gen_pir!
  : B:expr_list
    {
      pir = """
            .local pmc val
            val = new 'PAST::Val'
            val.set_node('1', 0, 1 )
            
            .local pmc exp
            exp = new 'PAST::Exp'
            $P4 = new PerlArray
            push $P4, val 
            exp.set_node('1', 1, $P4)
            
            .local pmc op
            op = new 'PAST::Op'
            $P5 = new PerlArray
            push $P5, exp 
            op.set_node('1', 1, 'print' ,$P5)
            
            .local pmc exp
            exp = new 'PAST::Exp'
            $P6 = new PerlArray
            push $P6, op 
            exp.set_node('1', 1 ,$P6)
            
            .local pmc stmt1
            stmt1 = new 'PAST::Stmt'
            $P7 = new PerlArray
            push $P7, exp 
            stmt1.set_node('1', 1 ,$P7)
            
            .local pmc val
            val = new 'PAST::Val'
            val.set_node('1', 0, '"\\n"' )
            
            .local pmc exp
            exp = new 'PAST::Exp'
            $P4 = new PerlArray
            push $P4, val 
            exp.set_node('1', 1, $P4)
            
            .local pmc op
            op = new 'PAST::Op'
            $P5 = new PerlArray
            push $P5, exp 
            op.set_node('1', 1, 'print' ,$P5)
            
            .local pmc exp
            exp = new 'PAST::Exp'
            $P6 = new PerlArray
            push $P6, op 
            exp.set_node('1', 1 ,$P6)
            
            .local pmc stmt2
            stmt2 = new 'PAST::Stmt'
            $P7 = new PerlArray
            push $P7, exp 
            stmt2.set_node('1', 1 ,$P7)


            .local pmc stmts
            stmts = new 'PAST::Stmts'
            $P8 = new PerlArray
            push $P8, stmt1
            push $P8, stmt2
            stmts.set_node('1', 1, $P8)
            
#"""
      #gen_pir = #( [PIR_OP, pir] ); 
    }
  ;
