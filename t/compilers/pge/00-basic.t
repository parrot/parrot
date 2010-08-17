#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/compilers/pge/00-grammar.t - test some simple grammars

=head1 SYNOPSIS

% prove t/compilers/pge/00-grammar.t

=head1 DESCRIPTION

Test the basic testing library.

=cut

.sub main :main
    load_bytecode 'Test/Builder.pbc'

    .local pmc test

    test = new [ 'Test'; 'Builder' ]
    test.'plan'(1)
    test.'ok'(1,'Basic passing')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
