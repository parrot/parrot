#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.

=head1 NAME

t/library/pg.t  -- Postgres Tests

=head1 SYNOPSIS

  ./parrot t/library/pg.t

=head1 DESCRIPTION

Test Parrot's libpg interface. The test is using the user's default
table, which should be created by your sysadmin.

=cut

.const int N_TESTS = 43

## XXX
## .include 'postgres.pasm'
.include 'iglobals.pasm'
.const int CONNECTION_OK = 0

.const int PGRES_COMMAND_OK = 1
.const int PGRES_TUPLES_OK = 2

.sub main :main
    load_bytecode 'Test/Builder.pir'
    .local pmc test
    test = new [ 'Test'; 'Builder' ]
    $P0 = getinterp
    $P1 = $P0[.IGLOBALS_CONFIG_HASH]
    $I1 = $P1['HAS_EXTRA_NCI_THUNKS']

    if $I1 == 1 goto have_enough_nci

    test.'skip_all'('Extra NCI thunks not available')
    exit 0

  have_enough_nci:
    test.'plan'(N_TESTS)
    push_eh no_pg

    # TODO: fix when exception handling works again
    loadlib $P0, 'libpq'
    if $P0 goto have_lib
    loadlib $P0, 'pq'
    unless $P0 goto no_pg
 have_lib:
    load_bytecode 'postgres.pir'
    pop_eh
    test.'ok'(1, 'load_bytecode')
    load_bytecode 'Pg.pir'
    test.'ok'(1, 'load_bytecode Pg')

    .local pmc cl, con, res
    cl = new 'Pg'
    test.'ok'(1, 'Pg class exists')

    con = cl.'connectdb'('')           # assume table = user is present
    $I0 = isa con, ['Pg'; 'Conn']
    test.'ok'($I0, 'con isa Pg;Conn')
    $I0 = istrue con

    if $I0 goto have_connected
	test.'skip'( 39, 'no Pg connection; skipping remaining tests' )
	.return()

  have_connected:
    test.'ok'($I0, 'con is true after connect')
    $I0 = con.'status'()
    $I1 = iseq $I0, CONNECTION_OK
    test.'ok'($I1, 'con.status() == CONNECTION_OK ')
    # PGconn
    $P0 = con.'PGconn'()
    $P1 = get_root_global ['parrot';'Pg'], 'PQstatus'
    $I0 = $P1($P0)

    $I1 = iseq $I0, CONNECTION_OK
    test.'ok'($I1, 'status(PGconn) == CONNECTION_OK ')
    # exec
    res = con.'exec'('BEGIN')
    test.'ok'(1, 'exec BEGIN called')
    $I0 = isa res, ['Pg'; 'Result']
    test.'ok'($I0, 'res isa Pg;Result')
    $I0 = res.'resultStatus'()
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'res.resultStatus() == PGRES_COMMAND_OK ')
    res.'clear'()
    # install a notice receiver to silent the CREATE
    .const 'Sub' cb = 'notice'
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
    $I0 = res.'fnumber'('id')
    $I1 = iseq $I0, 0
    test.'ok'($I1, 'res.fnumber("id") == 0')
    $I0 = res.'fnumber'('bar')
    $I1 = iseq $I0, 2
    test.'ok'($I1, 'res.fnumber("bar") == 2')
    $I0 = res.'fnumber'('no_such_col_name')
    $I1 = iseq $I0, -1
    test.'ok'($I1, 'res.fnumber("no_such_col_name") == -1')
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
    # prepare
    res = con.'prepare'('ins2', <<'EOT', 2)
INSERT INTO parrot_tbl (foo, bar) VALUES($1, $2)
EOT
    $I0 = res.'resultStatus'()
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'prepare PGRES_COMMAND_OK ')

    res = con.'execPrepared'('ins2', 'e', 'f')
    $I0 = res.'resultStatus'()
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'execPrepared PGRES_COMMAND_OK ')
    res = con.'exec'(<<'EOT')
SELECT * FROM parrot_tbl
EOT
    $I0 = res.'ntuples'()
    $I1 = iseq $I0, 3
    test.'ok'($I1, 'res.ntuples == 3')

    res = con.'execPrepared'('ins2', 'g', 'h')
    $I0 = res.'resultStatus'()
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'execPrepared PGRES_COMMAND_OK ')
    res = con.'exec'(<<'EOT')
SELECT * FROM parrot_tbl
EOT
    $I0 = res.'ntuples'()
    $I1 = iseq $I0, 4
    test.'ok'($I1, 'res.ntuples == 4')
    res = con.'exec'(<<'EOT')
INSERT INTO parrot_tbl (foo) VALUES('i')
EOT
    $I0 = res.'resultStatus'()
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'insert row PGRES_COMMAND_OK ')
    res = con.'exec'(<<'EOT')
SELECT * FROM parrot_tbl
EOT
    $I0 = res.'ntuples'()
    $I1 = iseq $I0, 5
    test.'ok'($I1, 'res.ntuples == 5')
    $S0 = res.'getvalue'(4, 1)
    $I1 = iseq $S0, 'i'
    test.'ok'($I1, 'getvalue(4, 1) == "i"')
    $S0 = res.'getvalue'(4, 2)
    $I1 = iseq $S0, ''
    test.'ok'($I1, 'getvalue(4, 2) == ""')
    $I0 = res.'getisnull'(4, 1)
    $I1 = iseq $I0, 0
    test.'ok'($I1, 'getisnull(4, 1) == 0')
    $I0 = res.'getisnull'(4, 2)
    $I1 = iseq $I0, 1
    test.'ok'($I1, 'getisnull(4, 2) == 1')
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
    .get_results(ex)
    msg = ex
    test.'skip'(N_TESTS)
    test.'finish'()
.end

# notice receiver callback function
.sub 'notice'
    .param pmc test
    .param pmc res
    test.'ok'(1, 'notice receiver called')
    # res ought to be a PGresult struct
    $S0 = typeof res
    $I0 = $S0 == 'UnManagedStruct'
    test.'ok'($I0, 'notice callback got a struct')

    .local pmc st
    st = get_root_global ['parrot';'Pg'], 'PQresultStatus'
    $I0 = st(res)
    $I1 = iseq $I0, PGRES_COMMAND_OK
    test.'ok'($I1, 'notice result is still ok')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
