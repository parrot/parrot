// Copyright: 2005 The Perl Foundation.  All Rights Reserved.
// $Id$

// Test whether the installed antlr has python support

options {
    language=Python;
}

class test_python_l extends Lexer;

TEST : 't' 
     ;
