# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/lexical.pasm - Lexical scope

=head1 SYNOPSIS

    % ./parrot examples/assembly/lexical.pasm

=head1 DESCRIPTION

A program to demonstrate lexical scopes (C<new_pad>, C<store_lex>,
C<find_lex>).

=cut

new P0, .Integer
new P1, .Integer
new P2, .Integer
new P3, .Integer
set P0, 0
set P1, 1

# outer most lexical scope
new_pad 0
store_lex 0, "a", P0
find_lex P3, "a"
print P3 # prints 0
print "\n"

new_pad 1
store_lex 1, "b", P1
store_lex 1, "a", P1

find_lex P3, "a"
print P3 # prints 1
print "\n"

find_lex P3, "b"
print P3 # prints 1
print "\n"

# get outer a
find_lex P3, 0, "a"
print P3 # prints 0
print "\n"

pop_pad

find_lex P3, "a"
print P3 # prints 0
print "\n"
end

=head1 SEE ALSO

F<examples/assembly/lexical2.pasm>, F<examples/assembly/lexical3.pasm>.

=cut
