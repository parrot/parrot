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
    BcParserLexer lex = new BcParserLexer(input);
    CommonTokenStream tokens = new CommonTokenStream(lex);
    // System.out.println("tokens="+tokens);

    // Parsing, generating PAST in ANTLT
    BcParser parser = new BcParser(tokens);
    BcParser.program_return antlrPast = parser.program();
    // System.out.println("tree: "+((Tree)antlrPast.tree).toStringTree());
    
    // Printing out PIR, that sets up PAST in PIR
    System.setOut( new PrintStream( new FileOutputStream( pirFn ) ) );
    CommonTreeNodeStream nodes = new CommonTreeNodeStream((Tree)antlrPast.tree);
    AntlrPast2PirPast treeParser = new AntlrPast2PirPast(nodes);
    treeParser.gen_pir_past();
  }
}
