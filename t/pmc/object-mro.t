#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 6;

=head1 NAME

t/pmc/object-mro.t - Object Methods Resolution Order

=head1 SYNOPSIS

	% prove t/pmc/object-mro.t

=head1 DESCRIPTION

These are tests for the C3 MRO order

=cut

pir_output_is(<<'CODE', <<'OUTPUT', "print mro diamond");
#
# A   B A   E
#  \ /   \ /
#   C     D
#    \   /
#     \ /
#      F
.sub main :main
    .local pmc A, B, C, D, E, F, m, p, it
    newclass A, "A"
    newclass B, "B"
    subclass C, A, "C"
    addparent C, B

    subclass D, A, "D"
    newclass E, "E"
    addparent D, E

    subclass F, C, "F"
    addparent F, D
    m = get_mro F
    it = new .Iterator, m
    it = 0
loop:
    unless it goto ex
    p = shift it
    $S0 = classname p
    print_item $S0
    goto loop
ex:
    print_newline
.end
CODE
F C D A B E
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "print mro 1");
#
# example take from: http://www.python.org/2.3/mro.html
#
# class O: pass
# class F(O): pass
# class E(O): pass
# class D(O): pass
# class C(D,F): pass
# class B(D,E): pass
# class A(B,C): pass
#
#                           6
#                          ---
# Level 3                 | O |                  (more general)
#                       /  ---  \
#                      /    |    \                      |
#                     /     |     \                     |
#                    /      |      \                    |
#                   ---    ---    ---                   |
# Level 2        3 | D | 4| E |  | F | 5                |
#                   ---    ---    ---                   |
#                    \  \ _ /       |                   |
#                     \    / \ _    |                   |
#                      \  /      \  |                   |
#                       ---      ---                    |
# Level 1            1 | B |    | C | 2                 |
#                       ---      ---                    |
#                         \      /                      |
#                          \    /                      \ /
#                            ---
# Level 0                 0 | A |                (more specialized)
#                            ---
#
.sub main :main
    .local pmc A, B, C, D, E, F, O
    newclass O, "O"
    subclass F, O, "F"
    subclass E, O, "E"
    subclass D, O, "D"

    subclass C, D, "C"
    addparent C, F

    subclass B, D, "B"
    addparent B, E

    subclass A, B, "A"
    addparent A, C

    .local pmc m, it, p

    m = get_mro A
    it = new .Iterator, m
    it = 0
loop:
    unless it goto ex
    p = shift it
    $S0 = classname p
    print_item $S0
    goto loop
ex:
    print_newline
.end
CODE
A B C D E F O
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "print mro 2");
#
# example take from: http://www.python.org/2.3/mro.html
#
# class O: pass
# class F(O): pass
# class E(O): pass
# class D(O): pass
# class C(D,F): pass
# class B(E,D): pass
# class A(B,C): pass
#
#                            6
#                           ---
# Level 3                  | O |
#                        /  ---  \
#                       /    |    \
#                      /     |     \
#                     /      |      \
#                   ---     ---    ---
# Level 2        2 | E | 4 | D |  | F | 5
#                   ---     ---    ---
#                    \      / \     /
#                     \    /   \   /
#                      \  /     \ /
#                       ---     ---
# Level 1            1 | B |   | C | 3
#                       ---     ---
#                        \       /
#                         \     /
#                           ---
# Level 0                0 | A |
#                           ---
#

.sub main :main
    .local pmc A, B, C, D, E, F, O
    newclass O, "O"
    subclass F, O, "F"
    subclass E, O, "E"
    subclass D, O, "D"

    subclass C, D, "C"
    addparent C, F

    subclass B, E, "B"
    addparent B, D

    subclass A, B, "A"
    addparent A, C

    .local pmc m, it, p

    m = get_mro A
    it = new .Iterator, m
    it = 0
loop:
    unless it goto ex
    p = shift it
    $S0 = classname p
    print_item $S0
    goto loop
ex:
    print_newline
.end
CODE
A B E C D F O
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "print mro 3");
#
#    C
#   / \
#  /   \
# A     B
#  \   /
#   \ /
#    D
#
.sub main :main
    .local pmc A, B, C, D
    newclass C, "C"
    subclass A, C, "A"
    subclass B, C, "B"
    subclass D, A, "D"
    addparent D, B

    .local pmc m, it, p

    m = get_mro D
    it = new .Iterator, m
    it = 0
loop:
    unless it goto ex
    p = shift it
    $S0 = classname p
    print_item $S0
    goto loop
ex:
    print_newline
.end
CODE
D A B C
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "print mro 4");
#
#          Object
#            ^
#            |
#         LifeForm
#          ^    ^
#         /      \
#    Sentient    BiPedal
#       ^          ^
#       |          |
#  Intelligent  Humanoid
#        ^        ^
#         \      /
#          Vulcan
#
# example taken from: L<http://gauss.gwydiondylan.org/books/drm/drm_50.html>
#
#  define class <sentient> (<life-form>) end class;
#  define class <bipedal> (<life-form>) end class;
#  define class <intelligent> (<sentient>) end class;
#  define class <humanoid> (<bipedal>) end class;
#  define class <vulcan> (<intelligent>, <humanoid>) end class;
#
.sub main :main
    .local pmc Object, LifeForm, Sentient, BiPedal, Intelligent, Humanoid, Vulcan

    newclass Object, "Object"

    subclass LifeForm, Object, "LifeForm"

    subclass Sentient, LifeForm, "Sentient"
    subclass Intelligent, Sentient, "Intelligent"

    subclass BiPedal, LifeForm, "BiPedal"
    subclass Humanoid, BiPedal, "Humanoid"

    subclass Vulcan, Intelligent, "Vulcan"
    addparent Vulcan, Humanoid

    .local pmc m, it, p

    m = get_mro Vulcan
    it = new .Iterator, m
    it = 0
loop:
    unless it goto ex
    p = shift it
    $S0 = classname p
    print_item $S0
    goto loop
ex:
    print_newline
.end
CODE
Vulcan Intelligent Sentient Humanoid BiPedal LifeForm Object
OUTPUT

# ... now some tests which fail to compose the class

pir_output_like(<<'CODE', <<'OUTPUT', "mro error 1");
#
# example take from: http://www.python.org/2.3/mro.html
#
# "Serious order disagreement" # From Guido
# class O: pass
# class X(O): pass
# class Y(O): pass
# class A(X,Y): pass
# class B(Y,X): pass
# try:
#     class Z(A,B): pass # creates Z(A,B) in Python 2.2
# except TypeError:
#     pass # Z(A,B) cannot be created in Python 2.3
#
.sub main :main
    .local pmc O, X, Y, A, B, Z

    newclass O, "O"
    subclass X, O, "X"
    subclass Y, O, "Y"

    subclass A, X, "A"
    addparent A, Y

    subclass B, Y, "B"
    addparent B, X

    subclass Z, A, "Z"
    addparent Z, B
.end
CODE
/inconsisten class hierarchy/
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
