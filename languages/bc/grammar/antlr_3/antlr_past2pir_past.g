// Copyright: 2006 The Perl Foundation.  All Rights Reserved.
// $Id$

// header "AntlrPast2PirPastTreeWalker.__init__" 
// {
  // self.reg       = 10;  // counter for unlimited number of PMC registers
// }

//-----------------------------------------------------------------------------
// Options for ANTLR
//-----------------------------------------------------------------------------
// options 
// {
  // language = "Python";      // generate Lexer, Parser and TreeParser in Python
// }


//----------------------------------------------------------------------------
// Transform ANTLR PAST to PIR that sets up PAST
//----------------------------------------------------------------------------
tree grammar AntlrPast2PirPast;

options
{
  ASTLabelType=CommonTree;
  tokenVocab='grammar/antlr_3/BcParser';
}

gen_pir_past
  : ^(PROGRAM INT)
    {
      System.out.println(" OK in antlr_past2pir_past");
    }
  ;
/*      
pir_before = """
.local pmc stmts_children
stmts_children = new PerlArray
#"""
      pir_after = """
.local pmc stmts
stmts = new 'PAST::Stmts'

stmts.set_node('1', 1, stmts_children)
            
#"""

      #gen_pir_past = #( [ PIR_OP, pir_before ], #PEPN, [PIR_OP, pir_after] ); 
*/
