
ANTLR_HOME=/usr/local/antlr-3.0b3
CLASSPATH=.:$(ANTLR_HOME)/lib/antlr-3.0b3.jar:$(ANTLR_HOME)/lib/stringtemplate-2.3b9.jar:$(ANTLR_HOME)/lib/antlr-2.7.6.jar

JAVAC=javac -classpath $(CLASSPATH)
ANTLR=java -classpath $(CLASSPATH) org.antlr.Tool

all: Main.class JakoParserLexer.class JakoParser.lexer.g JakoParserLexer.tokens

JakoParser.java JakoParser.tokens JakoParser.lexer.g JakoParserLexer.java JakoParserLexer.tokens: jako.g
	$(ANTLR) jako.g && test -e JakoParser.java || false

Main.class: Main.java JakoParser.class
	$(JAVAC) Main.java

JakoParser.class: JakoParser.java
	$(JAVAC) JakoParser.java

JakoParserLexer.class: JakoParserLexer.java
	$(JAVAC) JakoParserLexer.java

test:
	./jakop ../*.jako ../examples/*.jako

clean:
	rm -f *.class JakoParser.java JakoParser.tokens JakoParserLexer.java JakoParserLexer.class JakoParserLexer.tokens JakoParser.lexer.g

