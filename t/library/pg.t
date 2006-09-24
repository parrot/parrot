#!./parrot 
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/library/pg.t  -- Postgres Tests

=head1 SYNOPSIS

  ./parrot t/library/pg.t

=head1 DESCRIPTION

Test Parrot's libpg interface.

=cut

.const int N_TESTS = 1

.sub main :main
    load_bytecode 'Test/Builder.pir'
    .local pmc test       
    test = new 'Test::Builder'
    test.'plan'(N_TESTS)
    load_bytecode 'postgres.pir'
    test.'ok'(1, 'load_bytecode')
    test.'finish'()
.end

