// $Id$

import org.antlr.runtime.*;

public class Bc 
{
  public static void main(String[] args) throws Exception 
  {
    CharStream input = new ANTLRFileStream(args[0]);
    System.out.println( "1" );
    // BcLexer lex = new BcLexer(input);
    // CommonTokenStream tokens = new CommonTokenStream(lex);
    // System.out.println("tokens="+tokens);
    // BcParser parser = new BcParser(tokens);
    // parser.program();
  }
}
