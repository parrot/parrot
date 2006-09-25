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

.const int N_TESTS = 28

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
    clear_eh
    test.'ok'(1, 'load_bytecode')
    load_bytecode 'Pg.pir'
    test.'ok'(1, 'load_bytecode Pg')

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
    # install a notice receiver to silent the CREATE
    .const .Sub cb = 'notice'
    $P0 = con.'setNoticeReceiver'(cb, test)
    # create a temp table
    res = con.'exec'(<<'EOT')
CREATE TEMP TABLE parrot_tbl (
    id     serial,
    foo    text,
    bar    text
)
EOT
    $I0 = res.'resultStatus'()
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'table created PGRES_COMMAND_OK ')
    # add a row
    res = con.'exec'(<<'EOT')
INSERT INTO parrot_tbl (foo, bar) VALUES('a', 'b')
EOT
    $I0 = res.'resultStatus'()
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'insert row PGRES_COMMAND_OK ')
    # get all
    res = con.'exec'(<<'EOT')
SELECT * FROM parrot_tbl
EOT
    $I0 = res.'resultStatus'()
    $I1 = iseq $I0, PGRES_TUPLES_OK
    test.'ok'($I1, 'select * PGRES_TUPLES_OK ')
    # check tuples
    $I0 = res.'ntuples'()
    $I1 = iseq $I0, 1
    test.'ok'($I1, 'res.ntuples == 1')
    $I0 = res.'nfields'()
    $I1 = iseq $I0, 3
    test.'ok'($I1, 'res.nfields == 3')
    # check field name
    $S0 = res.'fname'(1)
    $I1 = iseq $S0, "foo"
    test.'ok'($I1, 'res.fname(1) == "foo"')
    $S0 = res.'fname'(2)
    $I1 = iseq $S0, "bar"
    test.'ok'($I1, 'res.fname(1) == "bar"')
    # check vals
    $S0 = res.'getvalue'(0, 1)
    $I1 = iseq $S0, 'a'
    test.'ok'($I1, 'getvalue(0, 1) == "a"')
    $S0 = res.'getvalue'(0, 2)
    $I1 = iseq $S0, 'b'
    test.'ok'($I1, 'getvalue(0, 2) == "b"')
# TODO
    # execParams
    res = con.'execParams'(<<'EOT', 'c', 'd')
INSERT INTO parrot_tbl (foo, bar) VALUES($1, $2)
EOT
    $I0 = res.'resultStatus'()
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'insert w execParams PGRES_COMMAND_OK ')
    res = con.'exec'(<<'EOT')
SELECT * FROM parrot_tbl
EOT
    $I0 = res.'ntuples'()
    $I1 = iseq $I0, 2
    test.'ok'($I1, 'res.ntuples == 2')
    # check vals
    $S0 = res.'getvalue'(1, 1)
    $I1 = iseq $S0, 'c'
    test.'ok'($I1, 'getvalue(1, 1) == "c"')
    $S0 = res.'getvalue'(1, 2)
    $I1 = iseq $S0, 'd'
    test.'ok'($I1, 'getvalue(1, 2) == "d"')
    # done
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

# notice receiver callback function
.sub 'notice'
    .param pmc test
    .param pmc res
    test.'ok'(1, 'notice receiver called')
    # res ought to be a PGresult struct
    $I0 = typeof res
    $I1 = iseq $I0, .UnManagedStruct
    test.'ok'($I1, 'notice callback got a struct')

    .local pmc st
    test.'skip'(1,  'notice result is still ok')
    .return()
# XXX for some strange reason it is PGRES_EMPTY_QUERY now
    st = get_root_global ['parrot';'Pg'], 'PQresultStatus'
    $I0 = st(res)
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'notice result is still ok')
.end
