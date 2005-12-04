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
  : PAST_Stmts
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
      #gen_pir_past = #( [PIR_OP, pir] ); 
    }
  ;
