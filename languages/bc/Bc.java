// $Id$

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintStream;

import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Bc 
{
  public static void main(String[] args) throws Exception 
  {
    // XXX proper command line parsing
    String bcFn  = args[0];
    String pirFn = args[1];

    // lexing
    CharStream input = new ANTLRFileStream(bcFn);
    bcLexer lex = new bcLexer(input);
    CommonTokenStream tokens = new CommonTokenStream(lex);
    // System.out.println("tokens="+tokens);

    // Parsing, generating PAST in ANTLR
    bcParser parser = new bcParser(tokens);
    bcParser.program_return antlrPast = parser.program();
    // System.out.println("tree: "+((Tree)antlrPast.tree).toStringTree());
    
    // Printing out PIR, that sets up PAST in PIR
    System.setOut( new PrintStream( new FileOutputStream( pirFn ) ) );
    CommonTreeNodeStream nodes = new CommonTreeNodeStream((Tree)antlrPast.tree);
    antlr_past2pir_pastTreeParser treeParser = new antlr_past2pir_pastTreeParser(nodes);
    treeParser.gen_pir_past();
  }
}
