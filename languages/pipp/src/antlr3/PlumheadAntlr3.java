// $Id$

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintStream;

import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class PlumheadAntlr3 
{
  public static void main(String[] args) throws Exception 
  {
    // XXX proper command line parsing
    String srcFn = args[0];
    String pirFn = args[1];

    // lexing
    CharStream input         = new ANTLRFileStream(srcFn);
    PlumheadLexer lex        = new PlumheadLexer(input);
    CommonTokenStream tokens = new CommonTokenStream(lex);
    // System.out.println("tokens="+tokens);

    // Parsing, generating PAST in ANTLR
    PlumheadParser parser = new PlumheadParser(tokens);
    PlumheadParser.program_return antlrPast = parser.program();
    // System.out.println("tree: "+((Tree)antlrPast.tree).toStringTree());
    
    // Printing out PIR, that sets up PAST in PIR
    System.setOut( new PrintStream( new FileOutputStream( pirFn ) ) );
    CommonTreeNodeStream nodes = new CommonTreeNodeStream((Tree)antlrPast.tree);
    GenPastNqp treeParser = new GenPastNqp(nodes);
    treeParser.gen_past_nqp();
  }
}
