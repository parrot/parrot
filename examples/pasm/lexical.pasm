# Copyright (C) 2001-2005 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/pasm/lexical.pasm - Lexical scope

=head1 SYNOPSIS

    % ./parrot examples/pasm/lexical.pasm

=head1 DESCRIPTION

A program to demonstrate lexical scopes (C<new_pad>, C<store_lex>,
C<find_lex>).

=cut

# Initialize some Integer PMCs, 
# which will be stored in lexical pads
new P1, .Integer
set P1, 99
new P2, .Integer
set P2, 2
new P3, .Integer
set P3, 3
new P4, .Integer
set P4, 4
new P5, .Integer
set P5, 5

# clear the lexical scope stack
new_pad 0
# 0: 

print "Storing 'a' in top lexical pad\n"
store_lex 0, "a", P1
# 0: "a" -> P1 
# Assigning after store_lex 
set P1, 1
set S1, "a"
bsr PRINT_LEX_S1_IN_CURRENT_SCOPE

# bottom is incidently is also the top
print "\n"
print "Storing 'c' in bottom lexical pad\n"
store_lex -1, "b", P3
# 0: "a" -> P1,  "b" -> P3 
set S1, "a"
bsr PRINT_LEX_S1_IN_CURRENT_SCOPE
set S1, "b"
bsr PRINT_LEX_S1_IN_CURRENT_SCOPE

# Overwriting
print "\n"
print "Overwriting 'c' in bottom lexical pad\n"
store_lex -1, "a", P2
# 0: "a" -> P2,  "b" -> P3 
set S1, "a"
bsr PRINT_LEX_S1_IN_CURRENT_SCOPE
set S1, "b"
bsr PRINT_LEX_S1_IN_CURRENT_SCOPE

print "\n"
print "Adding another stack level at bottom\n"
new_pad 1
# 0: "a" -> P2,  "b" -> P3 
# 1:
set S1, "a"
bsr PRINT_LEX_S1_IN_CURRENT_SCOPE
set S1, "b"
bsr PRINT_LEX_S1_IN_CURRENT_SCOPE

print "\n"
print "Override lexicals\n"
store_lex -1, "b", P4
store_lex 1, "a", P5
# 0: "a" -> P2,  "b" -> P3 
# 1: "a" -> P4,  "b" -> P5
set S1, "a"
bsr PRINT_LEX_S1_IN_CURRENT_SCOPE
set S1, "b"
bsr PRINT_LEX_S1_IN_CURRENT_SCOPE
set I1, 1
set S1, "a"
bsr PRINT_LEX_S1_IN_I1_SCOPE
set S1, "b"
bsr PRINT_LEX_S1_IN_I1_SCOPE

# get outer a, b
set I1, 0
set S1, "a"
bsr PRINT_LEX_S1_IN_I1_SCOPE
set S1, "b"
bsr PRINT_LEX_S1_IN_I1_SCOPE

print "\n"
print "Getting rid of bottom stack\n"
pop_pad
# 0: "a" -> P2,  "b" -> P3 
set S1, "a"
bsr PRINT_LEX_S1_IN_CURRENT_SCOPE
set S1, "b"
bsr PRINT_LEX_S1_IN_CURRENT_SCOPE

end

PRINT_LEX_S1_IN_CURRENT_SCOPE:
    null P10
    find_lex P10, S1
    print "The lexical '"
    print S1
    print "' has in the current scope the value "
    print P10 
    print ".\n"
ret

PRINT_LEX_S1_IN_I1_SCOPE:
    null P10
    find_lex P10, I1, S1
    print "The lexical '"
    print S1
    print "' has in scope "
    print I1
    print " the value "
    print P10 
    print ".\n"
ret
