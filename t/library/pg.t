#!./parrot 
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/library/pg.t  -- Postgres Tests

=head1 SYNOPSIS

  ./parrot t/library/pg.t

=head1 DESCRIPTION

Test Parrot's libpg interface. The test is using the user's default
table, which should be created by your sysadmin.

=cut

.const int N_TESTS = 12

## XXX
## .include 'postgres.pasm'
.const int CONNECTION_OK = 0

.const int PGRES_COMMAND_OK = 1
.const int PGRES_TUPLES_OK = 2

.sub main :main
    load_bytecode 'Test/Builder.pir'
    .local pmc test       
    test = new 'Test::Builder'
    test.'plan'(N_TESTS)
    push_eh no_pg
    load_bytecode 'postgres.pir'
    test.'ok'(1, 'load_bytecode')
    load_bytecode 'Pg.pir'
    test.'ok'(1, 'load_bytecode Pg')
    clear_eh

    .local pmc cl, con, res
    cl = getclass 'Pg'
    test.'ok'(1, 'Pg class exists')
    con = cl.'connectdb'('')           # assume table = user is present
    $I0 = isa con, ['Pg'; 'Conn']
    test.'ok'($I0, 'con isa Pg;Conn')
    $I0 = istrue con
    test.'ok'($I0, 'con is true after connect')
    $I0 = con.'status'()
    $I1 = iseq $I0, CONNECTION_OK 
    test.'ok'($I1, 'con.status() == CONNECTION_OK ')
    res = con.'exec'('BEGIN')
    test.'ok'(1, 'exec BEGIN called')
    $I0 = isa res, ['Pg'; 'Result']
    test.'ok'($I0, 'res isa Pg;Result')
    $I0 = res.'resultStatus'()
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'res.resultStatus() == PGRES_COMMAND_OK ')
    res.'clear'()
# TODO
    res = con.'exec'('ABORT')
    $I0 = res.'resultStatus'()
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'ABORT succeeded')
    null res
    # this calls __finalize, but there isn't a good way to test this
    # because any references to the object would prevent destruction
    #'
    sweep 1
    con.'finish'()
    test.'ok'(1, 'con.finish()')
    $I0 = isfalse con
    test.'ok'($I0, 'con is false after finish')
    test.'finish'()
    end
no_pg:	
    .local pmc ex
    .local string msg
    .get_results(ex, msg)
    test.'skip'(N_TESTS)
    test.'finish'()
.end

