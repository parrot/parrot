// Copyright: 2005 The Perl Foundation.  All Rights Reserved.
// $Id$

// antlr2past.g is a misnomer. antlr_past2pir_past.g would be a better fit

header "Antlr2PastTreeWalker.__init__" 
{
  self.reg       = 100;  // counter for unlimited number of PMC registers
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
  buildAST    = true;	 // transform AST 
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
.local pmc stmts
stmts = new 'PAST::Stmts'
$P%d = new PerlArray

    $P%d = new 'PAST::Stmt'
    $P%d = new PerlArray

        $P%d = new 'PAST::Exp'
        $P%d = new PerlArray

            $P%d = new 'PAST::Op'
            $P%d = new PerlArray

                $P%d = new 'PAST::Exp'
                $P%d = new PerlArray

                    $P%d = new 'PAST::Val'
                    $P%d.set_node('1', 0, 1 )
            
                push $P%d, $P%d 
                $P%d.set_node('1', 1, $P%d)
            
            push $P%d, $P%d 
            $P%d.set_node('1', 1, 'print' ,$P%d)
            
        push $P%d, $P%d 
        $P%d.set_node('1', 1 ,$P%d)
            
    push $P%d, $P%d 
    $P%d.set_node('1', 1 ,$P%d)

push $P%d, $P%d
            
    $P%d = new 'PAST::Stmt'
    $P%d = new PerlArray

            $P%d = new 'PAST::Exp'
            $P%d = new PerlArray

                $P%d = new 'PAST::Op'
                $P%d = new PerlArray

                    $P%d = new 'PAST::Exp'
                    $P%d = new PerlArray
                    
                        $P%d = new 'PAST::Val'
                        $P%d.set_node('1', 0, '"\\n"' )
                
                    push $P%d, $P%d 
                    $P%d.set_node('1', 1, $P%d)
            
                push $P%d, $P%d 
                $P%d.set_node('1', 1, 'print' ,$P%d)
            
            push $P%d, $P%d 
            $P%d.set_node('1', 1 ,$P%d)
            
    push $P%d, $P%d 
    $P%d.set_node('1', 1 ,$P%d)

push $P%d, $P%d

stmts.set_node('1', 1, $P%d)
            
#""" % (
11,
    reg_S1,
    reg_S1 + 1,
        reg_S1 + 2,
        reg_S1 + 3,
            reg_S1 + 4,
            reg_S1 + 5,
                reg_S1 + 6,
                reg_S1 + 7,
                    reg_S1 + 8,
                    reg_S1 + 8,
                reg_S1 + 7, reg_S1 + 8,
                reg_S1 + 6, reg_S1 + 7,
            reg_S1 + 5, reg_S1 + 6,
            reg_S1 + 4, reg_S1 + 5,
        reg_S1 + 3, reg_S1 + 4,
        reg_S1 + 2, reg_S1 + 3,
    reg_S1 + 1, reg_S1 + 2,
    reg_S1, reg_S1 + 1,
11, reg_S1,
    reg_S2,
    reg_S2 + 1,
        reg_S2 + 2,
        reg_S2 + 3,
            reg_S2 + 4,
            reg_S2 + 5,
                reg_S2 + 6,
                reg_S2 + 7,
                    reg_S2 + 8,
                    reg_S2 + 8,
                reg_S2 + 7, reg_S2 + 8,
                reg_S2 + 6, reg_S2 + 7,
            reg_S2 + 5, reg_S2 + 6,
            reg_S2 + 4, reg_S2 + 5,
        reg_S2 + 3, reg_S2 + 4,
        reg_S2 + 2, reg_S2 + 3,
    reg_S2 + 1, reg_S2 + 2,
    reg_S2, reg_S2 + 1,
11, reg_S2,
11 
       )
      #gen_pir_past = #( [PIR_OP, pir], #S1, #S2 ); 
    }
  ;

past_stmt! returns[reg]
  : #( PAST_Stmt past_exp )
    {
      reg = self.reg
      self.reg = self.reg + 100;
      pir = """
      # stmt
#"""
      #past_stmt = #( [PIR_OP, pir] ); 
    }
  ;

past_exp! returns[reg]
  : #(PAST_Exp ( past_op | past_val ) ) 
    {
      self.reg = self.reg + 100;
      pir = """
      # exp
#"""
      #past_stmt = #( [PIR_OP, pir] ); 
    }
  ;

past_op!
  : #( PAST_Op past_exp ) 
  ;

past_val!
  : PAST_Val 
  ;
