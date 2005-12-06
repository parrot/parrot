// Copyright: 2005 The Perl Foundation.  All Rights Reserved.
// $Id$

// antlr2past.g is a misnomer. antlr_past2pir_past.g would be a better fit

header "Antlr2PastTreeWalker.__init__" 
{
  self.reg       = 10;  // counter for unlimited number of PMC registers
  self.label_num = 0;  // counter for generation jump labels
  self.level     = 0;  // for indentation
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
class Antlr2PastTreeWalker extends TreeParser;

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
  // PAST_Val;
//}

gen_pir_past!
  : #(PAST_Stmts reg_S1=S1:past_stmt reg_S2=S2:past_stmt)
    {
      pir = """
# stmts will be used by the executing part 
.local pmc stmts
stmts = new 'PAST::Stmts'

.local pmc stmts_children
stmts_children = new PerlArray
push stmts_children, $P%d
push stmts_children, $P%d

stmts.set_node('1', 1, stmts_children)
            
#""" % ( reg_S1, reg_S2 )

      #gen_pir_past = #( [ PIR_NOOP, "noop" ], #S1, #S2, [PIR_OP, pir] ); 
    }
  ;

past_stmt! returns[reg]
  : #( PAST_Stmt reg_E=E:past_exp )
    {
      reg = self.reg;
      self.reg = self.reg + 10;
      pir = """
    $P%d = new 'PAST::Stmt'
    $P%d = new PerlArray

    push $P%d, $P%d 
    $P%d.set_node('1', 1 ,$P%d)
#""" % (
    reg,
    reg + 1,
    reg + 1, reg_E,
    reg, reg + 1
       )

      #past_stmt = #( [ PIR_NOOP, "noop" ], #E, [PIR_OP, pir] ); 
    }
  ;

past_exp! returns[reg]
  : #( PAST_Exp ( reg_O=O:past_op
                  {
                    reg = self.reg;
                    self.reg = self.reg + 10;
                    pir = """
                              $P%d = new 'PAST::Exp'
                              $P%d = new PerlArray
              
                              push $P%d, $P%d 
                              $P%d.set_node('1', 1, $P%d)
              #""" % (
                              reg,
                              reg + 1,
              
                              reg + 1, reg_O,
                              reg, reg + 1
                     )

                    #past_exp = #( [ PIR_NOOP, "noop" ], #O, [PIR_OP, pir] ); 
                  }
                  | 
                  reg_V=V:past_val 
                  {
                    reg = self.reg;
                    self.reg = self.reg + 10;
                    pir = """
                              $P%d = new 'PAST::Exp'
                              $P%d = new PerlArray

                              push $P%d, $P%d 
                              $P%d.set_node('1', 1, $P%d)
              #""" % (
                              reg,
                              reg + 1,
              
                              reg + 1, reg_V,
                              reg, reg + 1
                     )

                    #past_exp = #( [ PIR_NOOP, "noop" ], #V, [PIR_OP, pir] ); 
                  }
                )
     )
  ;

past_op! returns[reg]
  : #( PAST_Op reg_E=E:past_exp ) 
    {
      reg = self.reg;
      self.reg = self.reg + 10;
      pir = """
            $P%d = new 'PAST::Op'
            $P%d = new PerlArray

            push $P%d, $P%d 
            $P%d.set_node('1', 1, 'print' ,$P%d)
#""" % (
            reg,
            reg + 1,

            reg + 1, reg_E,
            reg, reg + 1
       )

      #past_op = #( [ PIR_NOOP, "noop" ], #E, [PIR_OP, pir] ); 
    }
  ;

past_val! returns[reg]
  : V:PAST_Val 
    {
      reg = self.reg;
      self.reg = self.reg + 10;
      pir = """
                    $P%d = new 'PAST::Val'
                    $P%d.set_node('1', 0, '%s' )
#""" % ( reg, reg, V.getText() )
       
      #past_val = #( [PIR_OP, pir] ); 
    }
  ;
