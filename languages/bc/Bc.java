// $Id$

import org.antlr.runtime.*;

public class Bc 
{
  public static void main(String[] args) throws Exception 
  {
    CharStream input = new ANTLRFileStream(args[0]);
    System.out.println( "1" );
    // SimpleCLexer lex = new SimpleCLexer(input);
    // CommonTokenStream tokens = new CommonTokenStream(lex);
    // System.out.println("tokens="+tokens);
    // SimpleC parser = new SimpleC(tokens);
    // parser.program();
  }
}
