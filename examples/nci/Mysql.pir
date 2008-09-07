# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 TITLE

Mysql.pir - Test NCI with mysqlclient

=head1 SYNOPSIS

Object oriented module for mysql client.

This module closely follow the mysql C API.

This is an initial version, be careful and not expect too much.

=cut

########################################################################

.namespace ['Mysql']

#-----------------------------------------------------------------------
.sub initialize :load :init :anon

######## Class creation

    .local pmc mysqlclass
    mysqlclass = newclass ['Mysql']
    addattribute mysqlclass, 'mysql'

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

    .local pmc ns, nsresult
    ns = get_namespace
    nsresult = get_namespace ['Result']
    ns.export_to(nsresult, explist)
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
    say 'mysql client library not found'
    exit 1
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
    mysql_real_connect = get_mysql_function('mysql_real_connect', 'ppttttiti')
    .local pmc mysql
    mysql = getattribute self, 'mysql'
    .local pmc result
    $S0 = null
    result = mysql_real_connect(mysql, host, user, pass, database, 0, $S0, 0)
    $I0 = defined result
    if $I0 goto good
    print 'Connection failed: '
    $S0 = self.error()
    say $S0
    exit 0
good:
.end

#-----------------------------------------------------------------------
.sub query :method
    .param string stmt

    .local pmc mysql_query
    mysql_query = get_mysql_function('mysql_query', 'ipt')
    .local pmc mysql
    mysql = getattribute self, 'mysql'
    mysql_query(mysql, stmt)

    $S0 = self.error()
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
    desc [$I2] = -69
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
    .local pmc r
    r = getattribute self, 'result'
    .local pmc free_result
    free_result = get_mysql_function('mysql_free_result', 'vp')
    free_result(r)
.end

#-----------------------------------------------------------------------
.sub fetch_row :method

    .local pmc r
    r = getattribute self, 'result'

    .local pmc res
    .local pmc fetch_row
    fetch_row = get_mysql_function('mysql_fetch_row', 'pp')
    .local pmc row
    .local pmc rowres
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
nomore:
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
