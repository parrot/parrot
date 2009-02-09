# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 TITLE

Mysql.pir - Test NCI with mysqlclient

=head1 SYNOPSIS

Object oriented module for mysql client.

This module closely follow the mysql C API.

This is an initial version, be careful and not expect too much.

=cut

.include 'datatypes.pasm'

########################################################################

.namespace ['Mysql']

#-----------------------------------------------------------------------
.sub initialize :load :init :anon

######## Class creation

    .local pmc mysqlclass
    mysqlclass = newclass ['Mysql']
    addattribute mysqlclass, 'mysql'

    .local pmc stmtclass
    stmtclass = newclass ['Mysql'; 'Statement']
    addattribute stmtclass, 'stmt'

    .local pmc resultclass
    resultclass = newclass ['Mysql'; 'Result']
    addattribute resultclass, 'mysql'
    addattribute resultclass, 'result'
    addattribute resultclass, 'desc'
    addattribute resultclass, 'fields'

    .local pmc rowclass
    rowclass = newclass ['Mysql';'Row']
    addattribute rowclass, 'data'

######## Export common subs to class namespaces

    .local pmc explist
    explist = new 'ResizablePMCArray'
    explist [0] = 'get_mysql_handle'
    explist [1] = 'get_mysql_function'

    .local pmc ns, nsresult, nsstmt
    ns = get_namespace
    nsresult = get_namespace ['Result']
    ns.'export_to'(nsresult, explist)
    nsstmt = get_namespace ['Statement']
    ns.'export_to'(nsstmt, explist)
.end

#-----------------------------------------------------------------------
.sub fail
    .param string msg
    new $P0, 'Exception'
    new $P1, 'String'
    set $P1, msg
    setattribute $P0, 'message', $P1
    throw $P0
    # Just in case...
    exit 1
.end

#-----------------------------------------------------------------------
.sub get_mysql_handle
    .local pmc clientlib
    clientlib = get_global 'clientlib'
    $I0 = defined clientlib
    if $I0 goto haslib
    clientlib = loadlib 'libmysqlclient'
    $I0 = defined clientlib
    if $I0 goto libloaded
    fail('Cannot load mysql client lib')
libloaded:
    set_global 'clientlib', clientlib
haslib:
    .return(clientlib)
.end

#-----------------------------------------------------------------------
.sub get_mysql_function
    .param string name
    .param string signature

    .local pmc handle
    handle = get_mysql_handle()
    .local pmc func
# Check if already stored
    func = get_global name
    $I0 = defined func
    if $I0 goto done
# Get from library
    func = dlfunc handle, name, signature
# And store for later usage
    set_global name, func
done:
    .return(func)
.end

#-----------------------------------------------------------------------
.sub get_client_info
    .local pmc func
    func = get_mysql_function('mysql_get_client_info', 'tv')
    $S0 = func()
    .return($S0)
.end

#-----------------------------------------------------------------------
.sub 'new'
    .local pmc mysql
    mysql = new ['Mysql']
    .return(mysql)
.end

#-----------------------------------------------------------------------
.sub init :vtable
    .local pmc mysql_init
    mysql_init = get_mysql_function('mysql_init', 'pp')

    .local pmc mysql
    $P0 = null
    mysql = mysql_init($P0)
    setattribute self, 'mysql', mysql
#    say 'Hello, Mysql'
.end

#-----------------------------------------------------------------------
.sub error :method
    .local pmc mysql_error
    mysql_error = get_mysql_function('mysql_error', 'tp')
    .local pmc mysql
    mysql = getattribute self, 'mysql'
    $S0 = mysql_error(mysql)
    .return($S0)
.end

#-----------------------------------------------------------------------
.sub connect :method
    .param string host
    .param string user
    .param string pass
    .param string database

    .local pmc mysql_real_connect
    mysql_real_connect = get_mysql_function('mysql_real_connect', 'ppttttitl')
    .local pmc mysql
    mysql = getattribute self, 'mysql'
    .local pmc result
    $S0 = null
    result = mysql_real_connect(mysql, host, user, pass, database, 0, $S0, 0)
    $I0 = defined result
    if $I0 goto good
    print 'Connection failed: '
    $S0 = self.'error'()
    say $S0
    exit 0
good:
.end

#-----------------------------------------------------------------------
.sub escape_string :method
    .param string from
# This is a quick and dirty implementation for initial testing
# Escape all chars mentioned in mysql docs, ignoring charset
# and encoding issues.

    .local string to
    clone to, from

    .local int i
    .local string escaped
    .local string toescape
    escaped = '\\'
    i = 0
nstep1:
    i = index to, '\', i
    eq i, -1, step2
    $S0 = substr to, 0, i
    inc i
    $S1 = substr to, i
    inc i
    concat $S0, escaped
    concat to, $S0, $S1
    goto nstep1
step2:
    i = 0
    escaped = "\'"
nstep2:
    i = index to, "'", i
    eq i, -1, step3
    $S0 = substr to, 0, i
    inc i
    $S1 = substr to, i
    inc i
    concat $S0, escaped
    concat to, $S0, $S1
    goto nstep2
step3:
    i = 0
    escaped = '\"'
nstep3:
    i = index to, '"', i
    eq i, -1, step4
    $S0 = substr to, 0, i
    inc i
    $S1 = substr to, i
    inc i
    concat $S0, escaped
    concat to, $S0, $S1
    goto nstep3
step4:
    i = 0
    escaped = "\\n"
    toescape = chr 10
    print '"'
    print toescape
    say '"'
nstep4:
    i = index to, toescape, i
    eq i, -1, step5
    $S0 = substr to, 0, i
    inc i
    $S1 = substr to, i
    inc i
    concat $S0, escaped
    concat to, $S0, $S1
    goto nstep4
step5:
    i = 0
    escaped = "\\r"
    toescape = chr 13
    print '"'
    print toescape
    say '"'
nstep5:
    i = index to, toescape, i
    eq i, -1, step6
    $S0 = substr to, 0, i
    inc i
    $S1 = substr to, i
    inc i
    concat $S0, escaped
    concat to, $S0, $S1
    goto nstep5
step6:
    i = 0
    escaped = "\\0"
    toescape = chr 0
    print '"'
    print toescape
    say '"'
nstep6:
    i = index to, toescape, i
    eq i, -1, step7
    $S0 = substr to, 0, i
    inc i
    $S1 = substr to, i
    inc i
    concat $S0, escaped
    concat to, $S0, $S1
    goto nstep6
step7:
    i = 0
    escaped = "\\Z"
    toescape = chr 26
    print '"'
    print toescape
    say '"'
nstep7:
    i = index to, toescape, i
    eq i, -1, step8
    $S0 = substr to, 0, i
    inc i
    $S1 = substr to, i
    inc i
    concat $S0, escaped
    concat to, $S0, $S1
    goto nstep7
step8:

    .return(to)
.end

#-----------------------------------------------------------------------
.sub query :method
    .param string stmt

    .local pmc mysql_query
    mysql_query = get_mysql_function('mysql_query', 'ipt')
    .local pmc mysql
    mysql = getattribute self, 'mysql'
    mysql_query(mysql, stmt)

    $S0 = self.'error'()
    unless $S0 goto done
    say $S0
    exit 1
done:
.end

#-----------------------------------------------------------------------
.sub store_result :method
    .local pmc mysql_store_result
    mysql_store_result = get_mysql_function('mysql_store_result', 'pp')
    .local pmc mysql
    mysql = getattribute self, 'mysql'
    .local pmc r
    r = mysql_store_result(mysql)

    .local pmc args
    args = new 'Hash'
    args ['mysql'] = mysql
    args ['result'] = r

    .local pmc res
    res = new ['Mysql';'Result'], args
    .return(res)
.end

#-----------------------------------------------------------------------
.sub use_result :method
    .local pmc mysql_use_result
    mysql_use_result = get_mysql_function('mysql_use_result', 'pp')
    .local pmc mysql
    mysql = getattribute self, 'mysql'
    .local pmc r
    r = mysql_use_result(mysql)

    .local pmc args
    args = new 'Hash'
    args ['mysql'] = mysql
    args ['result'] = r

    .local pmc res
    res = new ['Mysql';'Result'], args
    .return(res)
.end

#-----------------------------------------------------------------------
.sub prepare :method
    .param string stmt_str

    say stmt_str
    .local pmc mysql
    mysql = getattribute self, 'mysql'
    .local pmc mysql_stmt_init
    mysql_stmt_init = get_mysql_function('mysql_stmt_init', 'pp')
    .local pmc stmt
    stmt = mysql_stmt_init(mysql)
    .local pmc mysql_stmt_prepare
    mysql_stmt_prepare = get_mysql_function('mysql_stmt_prepare', 'ipti')
    $I0 = bytelength stmt_str
    $I1 = mysql_stmt_prepare(stmt, stmt_str, $I0)

    .local pmc args
    args = new 'Hash'
    args['stmt'] = stmt
    .local pmc stmtobj
    stmtobj = new ['Mysql';'Statement'], args
    .return(stmtobj)
.end

########################################################################

.namespace ['Mysql';'Statement']

#-----------------------------------------------------------------------
.sub param_count :method
    .local pmc stmt
    stmt = getattribute self, 'stmt'
    .local pmc mysql_stmt_param_count
    mysql_stmt_param_count = get_mysql_function('mysql_stmt_param_count', 'lp')
    $I0 = mysql_stmt_param_count(stmt)
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub close :method
    .local pmc stmt
    stmt = getattribute self, 'stmt'
    .local pmc mysql_stmt_close
    mysql_stmt_close = get_mysql_function('mysql_stmt_close', 'ip')
    $I0 = mysql_stmt_close(stmt)
    null stmt
    setattribute self, 'stmt', stmt
    .return($I0)
.end

########################################################################

.namespace ['Mysql';'Result']

#-----------------------------------------------------------------------
.sub init_pmc :vtable
    .param pmc mysql :named
    .param pmc r :named

#    say 'Result init'

    .local pmc field_count
    field_count = get_mysql_function('mysql_field_count', 'ip')
    .local pmc mysql
    mysql = getattribute self, 'mysql'
    .local int fields
    fields = field_count(mysql)

    .local pmc desc
    desc = new 'FixedIntegerArray'
    $I0 = 3
    mul $I0, fields
    set desc, $I0
    $I1 = 0
    $I2 = 0
nextcol:
    desc [$I2] = .DATATYPE_CSTR
    inc $I2
    desc [$I2] = 1
    inc $I2
    desc [$I2] = 0
    inc $I2
    inc $I1
    ne $I1, fields, nextcol
    setattribute self, 'desc', desc
.end

#-----------------------------------------------------------------------
.sub destroy :vtable
    self.'free'()
.end

#-----------------------------------------------------------------------
.sub free :method
    .local pmc r
    r = getattribute self, 'result'
    $I0 = defined r
    unless $I0 goto done
    .local pmc free_result
    free_result = get_mysql_function('mysql_free_result', 'vp')
    free_result(r)
    null r
    setattribute self, 'result', r
done:
.end

#-----------------------------------------------------------------------
.sub field_count :method
    .local pmc field_count
    field_count = get_mysql_function('mysql_field_count', 'ip')
    .local pmc mysql
    mysql = getattribute self, 'mysql'
    .local int fields
    fields = field_count(mysql)
    .return(fields)
.end

#-----------------------------------------------------------------------
.sub fetch_row :method

    .local pmc rowres
    .local pmc r
    r = getattribute self, 'result'
    $I0 = defined r
    unless $I0 goto nomore

    .local pmc res
    .local pmc fetch_row
    fetch_row = get_mysql_function('mysql_fetch_row', 'pp')
    .local pmc row
    row = fetch_row(r)
    $I0 = defined row
    unless $I0 goto nomore

    .local pmc desc
    desc = getattribute self, 'desc'
    assign row, desc

    .local int fields
    fields = desc
    div fields, 3
#    say fields
    $I0 = 0
    res = new 'FixedStringArray'
    set res, fields
nextcol:
#    say $I0
    $S0 = row [$I0]
    res [$I0] = $S0
    inc $I0
    eq $I0, fields, endrow
    goto nextcol
endrow:

    .local pmc args
    args = new 'Hash'
    args ['data'] = res
    rowres = new ['Mysql';'Row'], args
    .return(rowres)
nomore:
    rowres = new 'Undef'
    .return(rowres)
.end

########################################################################

.namespace ['Mysql';'Row']

#-----------------------------------------------------------------------
.sub get_integer :vtable
    .local pmc data
    data = getattribute self, 'data'
    $I0 = data
    .return($I0)
.end

.sub get_number :vtable
    .local pmc data
    data = getattribute self, 'data'
    $I0 = data
    $N0 = $I0
    .return($N0)
.end

.sub get_string_keyed :vtable
    .param int n

    .local pmc data
    data = getattribute self, 'data'
    $S0 = data [n]
    .return($S0)
.end

.sub get_pmc_keyed :vtable
    .param int n

    .local pmc data
    data = getattribute self, 'data'
    $S0 = data [n]
    $P0 = new 'String'
    $P0 = $S0
    .return($P0)
.end

.sub get :method
    .param int n

    $P0 = self[n]
    .return($P0)
.end

.sub elems :method
    .local pmc data
    data = getattribute self, 'data'
    $I0 = data
    .return($I0)
.end

#-----------------------------------------------------------------------
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
