# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

import os
import sys
import re
import getopt

lib_path = os.path.join( os.path.dirname(sys.argv[0]), 'python', 'lib' )
sys.path.insert( 0, lib_path )
import antlr
import bc

class Visitor(antlr.ASTVisitor):
   def __init__(self,*args):
      super(Visitor,self).__init__(*args)
      self.level = 0
      if not args:
         self.cout = sys.stdout
         return
      if isinstance(args[0],file):
         self.cout = args[0]
         return
      assert 0

   def printf(self,fmt,*args):
      if not args:
          sys.stdout.write(fmt)
          return
      argv = tuple(args)
      self.cout.write(fmt % argv)

   def flush(self):
      self.cout.flush()

   def visit1(self,node):
      if not node:
         self.printf(" nil ")
         return

      c = node.getType()
      t = node.getText()
      k = node.getFirstChild()
      s = node.getNextSibling()
    
      self.printf("( <type: %s>",c)
      if t:
         self.printf("<text: %s> ",t)
      if k:
        self.visit1(k);
      self.printf(")")
      if s:
        self.visit1(s);

   def visit(self,node):
      self.visit1(node);
      self.printf("\n")
      

def main():
   
   # only one option: -l
   # first argument is the input file name
   (options, bc_filenames) = getopt.getopt(sys.argv[1:], 'l')
   # TODO: option checkint, consider option -l
   # TODO: allow multiple input files and STDIN
   bc_fn  = bc_filenames[0]
   bc_fh = open(bc_fn, 'r')
   regexp = re.compile( r"bc$" )
   pir_fh = open( regexp.sub("pir", bc_fn), 'w' )
   p6_fh  = open( regexp.sub("p6", bc_fn), 'w' )

   L = bc.BcLexer.Lexer(bc_fh) 
   P = bc.BcParser.Parser(L)
   P.setFilename(L.getFilename())

   ### Parse the input expression
   try:
      P.program()
   except antlr.ANTLRException, ex:
      print "*** error(s) while parsing."
      print ">>> exit(1)"
      sys.exit(1)

 
   # ast is generated because of the option "buildAST = true;" in bc_parser.g
   ast = P.getAST()
   
   if not ast:
      print "stop - no AST generated."
      sys.exit(0)
      
   visitor = Visitor()

   ###show tree
   sys.stdout = pir_fh
   print ""
   print "=begin comment"
   print ""
   print "AST after parsing " + bc_filenames[0] 
   print ""
   print "toStringList: " + ast.toStringList()
   print ""
   print "visit>>"
   print ""
   # visitor.visit(ast);
   print "visit<<"
   print ""
   print "=end comment"
   print ""

   W = bc.BcTreeWalker.Walker();
   W.gen_pir(ast);
   pir_ast = W.getAST()
   print ""
   print "=begin comment"
   print ""
   print "AST after being processed by TreeParser"
   print ""
   print "pir_ast.toStringList:" 
   print pir_ast.toStringList()
   print ""
   print "visit>>\n"
   #visitor.visit(pir_ast);
   print "visit<<"
   print ""
   print "=end comment"
   print ""
   print "=cut"
   print """
#!/usr/bin/env parrot

.sub "main" @MAIN
  .local int temp_int
  .local pmc a_lex, b_lex, c_lex, d_lex, e_lex, f_lex, g_lex, h_lex, i_lex, j_lex, k_lex, l_lex, m_lex, n_lex, o_lex, p_lex, q_lex, r_lex, s_lex, t_lex, u_lex, v_lex, w_lex, x_lex, y_lex, z_lex
   a_lex = new .Float
   b_lex = new .Float
   c_lex = new .Float
   d_lex = new .Float
   e_lex = new .Float
   f_lex = new .Float
   g_lex = new .Float
   h_lex = new .Float
   i_lex = new .Float
   j_lex = new .Float
   k_lex = new .Float
   l_lex = new .Float
   m_lex = new .Float
   n_lex = new .Float
   o_lex = new .Float
   p_lex = new .Float
   q_lex = new .Float
   r_lex = new .Float
   s_lex = new .Float
   t_lex = new .Float
   u_lex = new .Float
   v_lex = new .Float
   w_lex = new .Float
   x_lex = new .Float
   y_lex = new .Float
   z_lex = new .Float
   """
   pir_ast = W.getAST();
   print '# ' + pir_ast.toStringList();

   print """
.end
   """

   # Now dump the AST as Perl6
   # TODO: This is a dummy implementation right now
   sys.stdout = p6_fh
   W.gen_p6(ast);
   p6_ast = W.getAST()
   print ""
   print "=begin comment"
   print ""
   print "AST after being processed by TreeParser"
   print ""
   print "p6_ast.toStringList:" 
   print p6_ast.toStringList()
   print ""

if __name__ == "__main__":
   main()
