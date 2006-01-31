// $Id$

import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Bc 
{
  public static void main(String[] args) throws Exception 
  {
    CharStream input = new ANTLRFileStream(args[0]);
    System.out.println( "1" );
    BcParserLexer lex = new BcParserLexer(input);
    CommonTokenStream tokens = new CommonTokenStream(lex);
    // System.out.println("tokens="+tokens);
    BcParser parser = new BcParser(tokens);
    BcParser.program_return r = parser.program();
    // System.out.println("tree: "+((Tree)r.tree).toStringTree());
  }
}
