import java.io.*;
import org.antlr.runtime.*;

public class Main {
    private static void parse(String fileName) throws Exception {
        JakoParserLexer lex = new JakoParserLexer(new ANTLRFileStream(fileName));
        CommonTokenStream tokens = new CommonTokenStream(lex);

        JakoParser g = new JakoParser(tokens);

        try {
            g.semantic_unit();
        } catch (RecognitionException e) {
            e.printStackTrace();
        }
    }

    public static void main(String args[]) throws Exception {
        for (String fileName: args) {
            System.out.println();
            System.out.println(fileName + ": ");
            System.out.flush();
            parse(fileName);
        }
    }
}
