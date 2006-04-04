// Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
// $Id$

header "AntlrPast2PirPastTreeWalker.__init__" 
{
  self.reg       = 10;  // counter for unlimited number of PMC registers
}

//-----------------------------------------------------------------------------
// Options for ANTLR
//-----------------------------------------------------------------------------
options 
{
  language = "Python";      // generate Lexer, Parser and TreeParser in Python
}


//----------------------------------------------------------------------------
// Transform ANTLR PAST to PIR that sets up PAST
//----------------------------------------------------------------------------
class AntlrPast2PirPastTreeWalker extends TreeParser;

options
{
  buildAST    = true;    // transform AST 
  importVocab = BcLexer; // Vocabulary that contains only the PAST nodes 
}

//tokens 
//{
  // These tokens are not in the parse tree.
  // They make up an AST that is equivalent to the PAST data structure.
  // PAST_Stmts;
  // PAST_Stmt;
  // PAST_Exp;
  // PAST_Op;
  // PAST_Val_Strqq;
  // PAST_Val_Num;
//}

gen_pir_past!
  : #(PAST_Stmts PEPN:code_blocks )
    {
      pir_before = """
.local pmc stmts_children
stmts_children = new .ResizablePMCArray
#"""
      pir_after = """
.local pmc stmts
stmts = new 'PAST::Stmts'

stmts.set_node('1', 1, stmts_children)
            
#"""

      #gen_pir_past = #( [ PIR_OP, pir_before ], #PEPN, [PIR_OP, pir_after] ); 
    }
  ;

code_blocks
  : ( #( PAST_Code stmt stmt ) )+
  ;

stmt! 
  : #( PAST_Stmt reg_E=E:exp )
    {
      reg = self.reg
      self.reg = self.reg + 10;
      pir = """
    $P%d = new 'PAST::Stmt'
    $P%d = new .ResizablePMCArray

    push $P%d, $P%d 
    $P%d.set_node('1', 1 ,$P%d)

    push stmts_children, $P%d
#""" % (
    reg,
    reg + 1,
    reg + 1, reg_E,
    reg, reg + 1,
    reg
       )

      #stmt = #( [ PIR_NOOP, "noop" ], #E, [PIR_OP, pir] ); 
    }
  ;

exp! returns[reg]
  : #( PAST_Exp ( reg_O=O:op
                  {
                    reg = self.reg;
                    self.reg = self.reg + 10;
                    pir = """
                              $P%d = new 'PAST::Exp'
                              $P%d = new .ResizablePMCArray
              
                              push $P%d, $P%d 
                              $P%d.set_node('1', 1, $P%d)
              #""" % (
                              reg,
                              reg + 1,
              
                              reg + 1, reg_O,
                              reg, reg + 1
                     )

                    #exp = #( [ PIR_NOOP, "noop" ], #O, [PIR_OP, pir] ); 
                  }
                  | 
                  reg_V_STRQQ=V_STRQQ:val_strqq
                  {
                    reg = self.reg;
                    self.reg = self.reg + 10;
                    pir = """
                              $P%d = new 'PAST::Exp'
                              $P%d = new .ResizablePMCArray

                              push $P%d, $P%d 
                              $P%d.set_node('1', 1, $P%d)
              #""" % (
                              reg,
                              reg + 1,
              
                              reg + 1, reg_V_STRQQ,
                              reg, reg + 1
                     )

                    #exp = #( [ PIR_NOOP, "noop" ], #V_STRQQ, [PIR_OP, pir] ); 
                  }
                  | 
                  reg_V_NUM=V_NUM:val_num
                  {
                    reg = self.reg;
                    self.reg = self.reg + 10;
                    pir = """
                              $P%d = new 'PAST::Exp'
                              $P%d = new .ResizablePMCArray

                              push $P%d, $P%d 
                              $P%d.set_node('1', 1, $P%d)
              #""" % (
                              reg,
                              reg + 1,
              
                              reg + 1, reg_V_NUM,
                              reg, reg + 1
                     )

                    #exp = #( [ PIR_NOOP, "noop" ], #V_NUM, [PIR_OP, pir] ); 
                  }
                )
     )
  ;

op! returns[reg]
  : #( PAST_Op reg_E=E:exp ) 
    {
      reg = self.reg;
      self.reg = self.reg + 10;
      pir = """
            $P%d = new 'PAST::Op'
            $P%d = new .ResizablePMCArray

            push $P%d, $P%d 
            $P%d.set_node('1', 1, 'print' ,$P%d)
#""" % (
            reg,
            reg + 1,

            reg + 1, reg_E,
            reg, reg + 1
       )

      #op = #( [ PIR_NOOP, "noop" ], #E, [PIR_OP, pir] ); 
    }
  ;

val_strqq! returns[reg]
  : V:PAST_Val_Strqq 
    {
      reg = self.reg;
      self.reg = self.reg + 10;
      pir = """
                    $P%d = new 'PAST::Val'
                    $P%d.set_node( '1', 0, '%s' )
                    $P%d.valtype( 'strqq' )
#""" % ( reg, reg, V.getText(), reg )
       
      #val_strqq = #( [PIR_OP, pir] ); 
    }
  ;

val_num! returns[reg]
  : V:PAST_Val_Num 
    {
      reg = self.reg;
      self.reg = self.reg + 10;
      pir = """
                    $P%d = new 'PAST::Val'
                    $P%d.set_node( '1', 0, '%s' )
                    $P%d.valtype( 'num' )
#""" % ( reg, reg, V.getText(), reg )
       
      #val_num = #( [PIR_OP, pir] ); 
    }
  ;
