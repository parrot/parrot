# Copyright (C) 2004-2009, Parrot Foundation.

.namespace ['Pg']

.sub wrap_cstring_arg :anon :subid('0xdeadbeef')
    .param pmc fn
    .param int n
    .lex "fn", $P0
    .lex "n",  $P1
    $P0 = fn
    $P1 = box n
    .const "Sub" $P2 = "cstring_arg_wrapper"
    $P2 = newclosure $P2
    .return ($P2)
.end

.sub cstring_arg_wrapper :anon :outer('0xdeadbeef')
    .param pmc args :slurpy
    .local pmc fn
    .local int n
    fn   = find_lex "fn"
    $P0  = find_lex "n"
    n    = $P0

    $P0 = null
    $P0 = dlfunc $P0, "Parrot_str_to_cstring", "ppS"
    $P1 = getinterp
    $S0 = args[n]
    $P2 = $P0($P1, $S0)
    args[n] = $P2

    $P3 = fn(args :flat)

    $P0 = null
    $P0 = dlfunc $P0, "Parrot_str_free_cstring", "vp"
    $P0($P2)

    .return ($P3)
.end

.sub wrap_cstring_ret :anon :subid('0xcafebabe')
    .param pmc fn
    .lex "fn", $P0
    $P0 = fn
    .const "Sub" $P1 = "cstring_ret_wrapper"
    $P1 = newclosure $P1
    .return ($P1)
.end

.sub cstring_ret_wrapper :anon :outer('0xcafebabe')
    .param pmc args :slurpy
    .local pmc fn
    fn = find_lex "fn"
    $P0 = fn(args :flat)

    $P1 = null
    $P1 = dlfunc $P1, "Parrot_str_new", "Spi"
    $S0 = $P1($P0, 0)

    .return ($S0)
.end

.sub __postgres_init :load
    $P1 = loadlib 'libpq'
    if $P1 goto has_lib
    $P1 = loadlib 'pq'
    if $P1 goto has_lib
    $P1 = loadlib 'cygpq'
    if $P1 goto has_lib
    $P2 = new 'Exception'
    $P2 = 'error loading libpq - loadlib failed'
    throw $P2

  has_lib:
    $P2 = dlfunc $P1, 'PQconnectStart', 'pp'
    $P2 = wrap_cstring_arg($P2, 0)
    set_global 'PQconnectStart', $P2
    $P2 = dlfunc $P1, 'PQconnectPoll', 'ip'
    set_global 'PQconnectPoll', $P2
    $P2 = dlfunc $P1, 'PQconnectdb', 'pp'
    $P2 = wrap_cstring_arg($P2, 0)
    set_global 'PQconnectdb', $P2
    $P2 = dlfunc $P1, 'PQsetdbLogin', 'pppppppp'
    $P2 = wrap_cstring_arg($P2, 0)
    $P2 = wrap_cstring_arg($P2, 1)
    $P2 = wrap_cstring_arg($P2, 2)
    $P2 = wrap_cstring_arg($P2, 3)
    $P2 = wrap_cstring_arg($P2, 4)
    $P2 = wrap_cstring_arg($P2, 5)
    $P2 = wrap_cstring_arg($P2, 6)
    set_global 'PQsetdbLogin', $P2
    $P2 = dlfunc $P1, 'PQfinish', 'vp'
    set_global 'PQfinish', $P2
    $P2 = dlfunc $P1, 'PQconndefaults', 'p'
    set_global 'PQconndefaults', $P2
    $P2 = dlfunc $P1, 'PQconninfoFree', 'vp'
    set_global 'PQconninfoFree', $P2
    $P2 = dlfunc $P1, 'PQresetStart', 'ip'
    set_global 'PQresetStart', $P2
    $P2 = dlfunc $P1, 'PQresetPoll', 'ip'
    set_global 'PQresetPoll', $P2
    $P2 = dlfunc $P1, 'PQreset', 'vp'
    set_global 'PQreset', $P2
    $P2 = dlfunc $P1, 'PQrequestCancel', 'ip'
    set_global 'PQrequestCancel', $P2
    $P2 = dlfunc $P1, 'PQdb', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQdb', $P2
    $P2 = dlfunc $P1, 'PQuser', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQuser', $P2
    $P2 = dlfunc $P1, 'PQpass', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQpass', $P2
    $P2 = dlfunc $P1, 'PQhost', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQhost', $P2
    $P2 = dlfunc $P1, 'PQport', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQport', $P2
    $P2 = dlfunc $P1, 'PQtty', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQtty', $P2
    $P2 = dlfunc $P1, 'PQoptions', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQoptions', $P2
    $P2 = dlfunc $P1, 'PQstatus', 'ip'
    set_global 'PQstatus', $P2
    $P2 = dlfunc $P1, 'PQtransactionStatus', 'ip'
    set_global 'PQtransactionStatus', $P2
    $P2 = dlfunc $P1, 'PQparameterStatus', 'ppp'
    $P2 = wrap_cstring_ret($P2)
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQparameterStatus', $P2
    $P2 = dlfunc $P1, 'PQprotocolVersion', 'ip'
    set_global 'PQprotocolVersion', $P2
    $P2 = dlfunc $P1, 'PQerrorMessage', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQerrorMessage', $P2
    $P2 = dlfunc $P1, 'PQsocket', 'ip'
    set_global 'PQsocket', $P2
    $P2 = dlfunc $P1, 'PQbackendPID', 'ip'
    set_global 'PQbackendPID', $P2
    $P2 = dlfunc $P1, 'PQclientEncoding', 'ip'
    set_global 'PQclientEncoding', $P2
    $P2 = dlfunc $P1, 'PQsetClientEncoding', 'ipp'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQsetClientEncoding', $P2
    $P2 = dlfunc $P1, 'PQsetErrorVerbosity', 'ipi'
    set_global 'PQsetErrorVerbosity', $P2
    $P2 = dlfunc $P1, 'PQtrace', 'vpp'
    set_global 'PQtrace', $P2
    $P2 = dlfunc $P1, 'PQuntrace', 'vp'
    set_global 'PQuntrace', $P2
    $P2 = dlfunc $P1, 'PQexec', 'ppp'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQexec', $P2
    $P2 = dlfunc $P1, 'PQexecParams', 'pppippppi'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQexecParams', $P2
    $P2 = dlfunc $P1, 'PQprepare', 'ppppip'
    $P2 = wrap_cstring_arg($P2, 1)
    $P2 = wrap_cstring_arg($P2, 2)
    set_global 'PQprepare', $P2
    $P2 = dlfunc $P1, 'PQexecPrepared', 'pppipppi'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQexecPrepared', $P2
    $P2 = dlfunc $P1, 'PQsendQuery', 'ipp'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQsendQuery', $P2
# TODO $P2 = dlfunc $P1, 'PQsendQueryParams', 'iptiit33i'
# TODO set_global 'PQsendQueryParams', $P2
# TODO $P2 = dlfunc $P1, 'PQsendQueryPrepared', 'iptit33i'
# TODO set_global 'PQsendQueryPrepared', $P2
    $P2 = dlfunc $P1, 'PQgetResult', 'pp'
    set_global 'PQgetResult', $P2
    $P2 = dlfunc $P1, 'PQisBusy', 'ip'
    set_global 'PQisBusy', $P2
    $P2 = dlfunc $P1, 'PQconsumeInput', 'ip'
    set_global 'PQconsumeInput', $P2
    $P2 = dlfunc $P1, 'PQnotifies', 'pp'
    set_global 'PQnotifies', $P2
    $P2 = dlfunc $P1, 'PQputCopyData', 'ippi'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQputCopyData', $P2
    $P2 = dlfunc $P1, 'PQputCopyEnd', 'ipp'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQputCopyEnd', $P2
    $P2 = dlfunc $P1, 'PQgetCopyData', 'ippi'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQgetCopyData', $P2
    $P2 = dlfunc $P1, 'PQgetline', 'ippi'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQgetline', $P2
    $P2 = dlfunc $P1, 'PQputline', 'ipp'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQputline', $P2
    $P2 = dlfunc $P1, 'PQgetlineAsync', 'ippi'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQgetlineAsync', $P2
    $P2 = dlfunc $P1, 'PQputnbytes', 'ippi'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQputnbytes', $P2
    $P2 = dlfunc $P1, 'PQendcopy', 'ip'
    set_global 'PQendcopy', $P2
    $P2 = dlfunc $P1, 'PQsetnonblocking', 'ipi'
    set_global 'PQsetnonblocking', $P2
    $P2 = dlfunc $P1, 'PQisnonblocking', 'ip'
    set_global 'PQisnonblocking', $P2
    $P2 = dlfunc $P1, 'PQflush', 'ip'
    set_global 'PQflush', $P2
# TODO $P2 = dlfunc $P1, 'PQfn', 'ppi33ipi'
# TODO set_global 'PQfn', $P2
    $P2 = dlfunc $P1, 'PQresultStatus', 'ip'
    set_global 'PQresultStatus', $P2
    $P2 = dlfunc $P1, 'PQresStatus', 'pi'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQresStatus', $P2
    $P2 = dlfunc $P1, 'PQresultErrorMessage', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQresultErrorMessage', $P2
    $P2 = dlfunc $P1, 'PQresultErrorField', 'cpi'
    set_global 'PQresultErrorField', $P2
    $P2 = dlfunc $P1, 'PQntuples', 'ip'
    set_global 'PQntuples', $P2
    $P2 = dlfunc $P1, 'PQnfields', 'ip'
    set_global 'PQnfields', $P2
    $P2 = dlfunc $P1, 'PQbinaryTuples', 'ip'
    set_global 'PQbinaryTuples', $P2
    $P2 = dlfunc $P1, 'PQfname', 'ppi'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQfname', $P2
    $P2 = dlfunc $P1, 'PQfnumber', 'ipp'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'PQfnumber', $P2
    $P2 = dlfunc $P1, 'PQftable', 'ipi'
    set_global 'PQftable', $P2
    $P2 = dlfunc $P1, 'PQftablecol', 'ipi'
    set_global 'PQftablecol', $P2
    $P2 = dlfunc $P1, 'PQfformat', 'ipi'
    set_global 'PQfformat', $P2
    $P2 = dlfunc $P1, 'PQftype', 'ipi'
    set_global 'PQftype', $P2
    $P2 = dlfunc $P1, 'PQfsize', 'ipi'
    set_global 'PQfsize', $P2
    $P2 = dlfunc $P1, 'PQfmod', 'ipi'
    set_global 'PQfmod', $P2
    $P2 = dlfunc $P1, 'PQcmdStatus', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQcmdStatus', $P2
    $P2 = dlfunc $P1, 'PQoidStatus', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQoidStatus', $P2
    $P2 = dlfunc $P1, 'PQoidValue', 'ip'
    set_global 'PQoidValue', $P2
    $P2 = dlfunc $P1, 'PQcmdTuples', 'pp'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQcmdTuples', $P2
    $P2 = dlfunc $P1, 'PQgetvalue', 'ppii'
    $P2 = wrap_cstring_ret($P2)
    set_global 'PQgetvalue', $P2
    $P2 = dlfunc $P1, 'PQgetlength', 'ipii'
    set_global 'PQgetlength', $P2
    $P2 = dlfunc $P1, 'PQgetisnull', 'ipii'
    set_global 'PQgetisnull', $P2
    $P2 = dlfunc $P1, 'PQclear', 'vp'
    set_global 'PQclear', $P2
    $P2 = dlfunc $P1, 'PQfreemem', 'vp'
    set_global 'PQfreemem', $P2
# TODO $P2 = dlfunc $P1, 'PQescapeBytea', 'ppl4'
# TODO $P2 = wrap_cstring_ret($P2)
# TODO $P2 = wrap_cstring_arg($P2, 0)
# TODO set_global 'PQescapeBytea', $P2
# TODO $P2 = dlfunc $P1, 'PQunescapeBytea', 'pp4'
# TODO $P2 = wrap_cstring_ret($P2)
# TODO $P2 = wrap_cstring_arg($P2, 0)
# TODO set_global 'PQunescapeBytea', $P2
    $P2 = dlfunc $P1, 'PQmakeEmptyPGresult', 'ppi'
    set_global 'PQmakeEmptyPGresult', $P2
    $P2 = dlfunc $P1, 'lo_open', 'ipii'
    set_global 'lo_open', $P2
    $P2 = dlfunc $P1, 'lo_close', 'ipi'
    set_global 'lo_close', $P2
    $P2 = dlfunc $P1, 'lo_read', 'ipipl'
    $P2 = wrap_cstring_ret($P2)
    $P2 = wrap_cstring_arg($P2, 2)
    set_global 'lo_read', $P2
    $P2 = dlfunc $P1, 'lo_write', 'ipipl'
    $P2 = wrap_cstring_arg($P2, 2)
    set_global 'lo_write', $P2
    $P2 = dlfunc $P1, 'lo_lseek', 'ipiii'
    set_global 'lo_lseek', $P2
    $P2 = dlfunc $P1, 'lo_creat', 'ipi'
    set_global 'lo_creat', $P2
    $P2 = dlfunc $P1, 'lo_tell', 'ipi'
    set_global 'lo_tell', $P2
    $P2 = dlfunc $P1, 'lo_unlink', 'ipi'
    set_global 'lo_unlink', $P2
    $P2 = dlfunc $P1, 'lo_import', 'ipp'
    $P2 = wrap_cstring_arg($P2, 1)
    set_global 'lo_import', $P2
    $P2 = dlfunc $P1, 'lo_export', 'ipip'
    $P2 = wrap_cstring_arg($P2, 2)
    set_global 'lo_export', $P2
    $P2 = dlfunc $P1, 'PQmblen', 'ipi'
    $P2 = wrap_cstring_arg($P2, 0)
    set_global 'PQmblen', $P2
    $P2 = dlfunc $P1, 'PQenv2encoding', 'i'
    set_global 'PQenv2encoding', $P2
    $P2 = dlfunc $P1, 'PQsetNoticeReceiver', 'pppP'
    set_global 'PQsetNoticeReceiver', $P2
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
