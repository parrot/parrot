// Copyright: 2005 The Perl Foundation.  All Rights Reserved.
// $Id$

header "Antlr2PastTreeWalker.__init__" 
{
  self.reg_num   = 0;  // counter for unlimited number of PMC registers
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
  : #(PAST_Stmts S1:past_stmt S2:past_stmt)
    {
      pir = """
.local pmc stmts
stmts = new 'PAST::Stmts'
$P11 = new PerlArray

    $P12 = new 'PAST::Stmt'
    $P13 = new PerlArray

        $P14 = new 'PAST::Exp'
        $P15 = new PerlArray

            $P16 = new 'PAST::Op'
            $P17 = new PerlArray
                $P18 = new 'PAST::Exp'
                $P19 = new PerlArray

                    $P20 = new 'PAST::Val'
                    $P20.set_node('1', 0, 1 )
            
                push $P19, $P20 
                $P18.set_node('1', 1, $P19)
            
            push $P17, $P18 
            $P16.set_node('1', 1, 'print' ,$P17)
            
        push $P15, $P16 
        $P14.set_node('1', 1 ,$P15)
            
    push $P13, $P14 
    $P12.set_node('1', 1 ,$P13)
push $P11, $P12
            
    $P21 = new 'PAST::Stmt'
    $P22 = new PerlArray

            $P23 = new 'PAST::Exp'
            $P24 = new PerlArray

                $P25 = new 'PAST::Op'
                $P26 = new PerlArray

                    $P27 = new 'PAST::Exp'
                    $P28 = new PerlArray
                    
                        $P29 = new 'PAST::Val'
                        $P29.set_node('1', 0, '"\\n"' )
                
                    push $P28, $P29 
                    $P27.set_node('1', 1, $P28)
            
                push $P26, $P27 
                $P25.set_node('1', 1, 'print' ,$P26)
            
            push $P24, $P25 
            $P23.set_node('1', 1 ,$P24)
            
    push $P22, $P23 
    $P21.set_node('1', 1 ,$P22)
push $P11, $P21

stmts.set_node('1', 1, $P11)
            
#"""
      #gen_pir_past = #( [PIR_OP, pir], #S1, #S2 ); 
    }
  ;

past_stmt!
  : #( PAST_Stmt past_exp )
    {
      pir = """
      # stmt
#"""
      #past_stmt = #( [PIR_OP, pir] ); 
    }
  ;

past_exp!
  : #(PAST_Exp ( past_op | past_val ) ) 
  ;

past_op!
  : #( PAST_Op past_exp ) 
  ;

past_val!
  : PAST_Val 
  ;
