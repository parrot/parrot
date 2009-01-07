.namespace ['Pg']
.sub __postgres_init :load

loadlib $P1, 'libpq'
if $P1 goto has_lib
loadlib $P1, 'pq'
if $P1 goto has_lib
loadlib $P1, 'cygpq'
if $P1 goto has_lib
$P2 = new 'Exception'
$P2 = 'error loading libpq - loadlib failed'
throw $P2
has_lib:
dlfunc $P2, $P1, 'PQconnectStart', 'pt'
set_global 'PQconnectStart', $P2
dlfunc $P2, $P1, 'PQconnectPoll', 'ip'
set_global 'PQconnectPoll', $P2
dlfunc $P2, $P1, 'PQconnectdb', 'pt'
set_global 'PQconnectdb', $P2
dlfunc $P2, $P1, 'PQsetdbLogin', 'pttttttt'
set_global 'PQsetdbLogin', $P2
dlfunc $P2, $P1, 'PQfinish', 'vp'
set_global 'PQfinish', $P2
dlfunc $P2, $P1, 'PQconndefaults', 'p'
set_global 'PQconndefaults', $P2
dlfunc $P2, $P1, 'PQconninfoFree', 'vp'
set_global 'PQconninfoFree', $P2
dlfunc $P2, $P1, 'PQresetStart', 'ip'
set_global 'PQresetStart', $P2
dlfunc $P2, $P1, 'PQresetPoll', 'ip'
set_global 'PQresetPoll', $P2
dlfunc $P2, $P1, 'PQreset', 'vp'
set_global 'PQreset', $P2
dlfunc $P2, $P1, 'PQrequestCancel', 'ip'
set_global 'PQrequestCancel', $P2
dlfunc $P2, $P1, 'PQdb', 'tp'
set_global 'PQdb', $P2
dlfunc $P2, $P1, 'PQuser', 'tp'
set_global 'PQuser', $P2
dlfunc $P2, $P1, 'PQpass', 'tp'
set_global 'PQpass', $P2
dlfunc $P2, $P1, 'PQhost', 'tp'
set_global 'PQhost', $P2
dlfunc $P2, $P1, 'PQport', 'tp'
set_global 'PQport', $P2
dlfunc $P2, $P1, 'PQtty', 'tp'
set_global 'PQtty', $P2
dlfunc $P2, $P1, 'PQoptions', 'tp'
set_global 'PQoptions', $P2
dlfunc $P2, $P1, 'PQstatus', 'ip'
set_global 'PQstatus', $P2
dlfunc $P2, $P1, 'PQtransactionStatus', 'ip'
set_global 'PQtransactionStatus', $P2
dlfunc $P2, $P1, 'PQparameterStatus', 'tpt'
set_global 'PQparameterStatus', $P2
dlfunc $P2, $P1, 'PQprotocolVersion', 'ip'
set_global 'PQprotocolVersion', $P2
dlfunc $P2, $P1, 'PQerrorMessage', 'tp'
set_global 'PQerrorMessage', $P2
dlfunc $P2, $P1, 'PQsocket', 'ip'
set_global 'PQsocket', $P2
dlfunc $P2, $P1, 'PQbackendPID', 'ip'
set_global 'PQbackendPID', $P2
dlfunc $P2, $P1, 'PQclientEncoding', 'ip'
set_global 'PQclientEncoding', $P2
dlfunc $P2, $P1, 'PQsetClientEncoding', 'ipt'
set_global 'PQsetClientEncoding', $P2
dlfunc $P2, $P1, 'PQsetErrorVerbosity', 'ipi'
set_global 'PQsetErrorVerbosity', $P2
dlfunc $P2, $P1, 'PQtrace', 'vpp'
set_global 'PQtrace', $P2
dlfunc $P2, $P1, 'PQuntrace', 'vp'
set_global 'PQuntrace', $P2
dlfunc $P2, $P1, 'PQexec', 'ppt'
set_global 'PQexec', $P2
dlfunc $P2, $P1, 'PQexecParams', 'pptippppi'
set_global 'PQexecParams', $P2
dlfunc $P2, $P1, 'PQprepare', 'ppttip'
set_global 'PQprepare', $P2
dlfunc $P2, $P1, 'PQexecPrepared', 'pptipppi'
set_global 'PQexecPrepared', $P2
dlfunc $P2, $P1, 'PQsendQuery', 'ipt'
set_global 'PQsendQuery', $P2
# TODO dlfunc $P2, $P1, 'PQsendQueryParams', 'iptiit33i'
# TODO set_global 'PQsendQueryParams', $P2
# TODO dlfunc $P2, $P1, 'PQsendQueryPrepared', 'iptit33i'
# TODO set_global 'PQsendQueryPrepared', $P2
dlfunc $P2, $P1, 'PQgetResult', 'pp'
set_global 'PQgetResult', $P2
dlfunc $P2, $P1, 'PQisBusy', 'ip'
set_global 'PQisBusy', $P2
dlfunc $P2, $P1, 'PQconsumeInput', 'ip'
set_global 'PQconsumeInput', $P2
dlfunc $P2, $P1, 'PQnotifies', 'pp'
set_global 'PQnotifies', $P2
dlfunc $P2, $P1, 'PQputCopyData', 'ipti'
set_global 'PQputCopyData', $P2
dlfunc $P2, $P1, 'PQputCopyEnd', 'ipt'
set_global 'PQputCopyEnd', $P2
dlfunc $P2, $P1, 'PQgetCopyData', 'ipti'
set_global 'PQgetCopyData', $P2
dlfunc $P2, $P1, 'PQgetline', 'ipti'
set_global 'PQgetline', $P2
dlfunc $P2, $P1, 'PQputline', 'ipt'
set_global 'PQputline', $P2
dlfunc $P2, $P1, 'PQgetlineAsync', 'ipti'
set_global 'PQgetlineAsync', $P2
dlfunc $P2, $P1, 'PQputnbytes', 'ipti'
set_global 'PQputnbytes', $P2
dlfunc $P2, $P1, 'PQendcopy', 'ip'
set_global 'PQendcopy', $P2
dlfunc $P2, $P1, 'PQsetnonblocking', 'ipi'
set_global 'PQsetnonblocking', $P2
dlfunc $P2, $P1, 'PQisnonblocking', 'ip'
set_global 'PQisnonblocking', $P2
dlfunc $P2, $P1, 'PQflush', 'ip'
set_global 'PQflush', $P2
dlfunc $P2, $P1, 'PQfn', 'ppi33ipi'
set_global 'PQfn', $P2
dlfunc $P2, $P1, 'PQresultStatus', 'ip'
set_global 'PQresultStatus', $P2
dlfunc $P2, $P1, 'PQresStatus', 'ti'
set_global 'PQresStatus', $P2
dlfunc $P2, $P1, 'PQresultErrorMessage', 'tp'
set_global 'PQresultErrorMessage', $P2
dlfunc $P2, $P1, 'PQresultErrorField', 'cpi'
set_global 'PQresultErrorField', $P2
dlfunc $P2, $P1, 'PQntuples', 'ip'
set_global 'PQntuples', $P2
dlfunc $P2, $P1, 'PQnfields', 'ip'
set_global 'PQnfields', $P2
dlfunc $P2, $P1, 'PQbinaryTuples', 'ip'
set_global 'PQbinaryTuples', $P2
dlfunc $P2, $P1, 'PQfname', 'tpi'
set_global 'PQfname', $P2
dlfunc $P2, $P1, 'PQfnumber', 'ipt'
set_global 'PQfnumber', $P2
dlfunc $P2, $P1, 'PQftable', 'ipi'
set_global 'PQftable', $P2
dlfunc $P2, $P1, 'PQftablecol', 'ipi'
set_global 'PQftablecol', $P2
dlfunc $P2, $P1, 'PQfformat', 'ipi'
set_global 'PQfformat', $P2
dlfunc $P2, $P1, 'PQftype', 'ipi'
set_global 'PQftype', $P2
dlfunc $P2, $P1, 'PQfsize', 'ipi'
set_global 'PQfsize', $P2
dlfunc $P2, $P1, 'PQfmod', 'ipi'
set_global 'PQfmod', $P2
dlfunc $P2, $P1, 'PQcmdStatus', 'tp'
set_global 'PQcmdStatus', $P2
dlfunc $P2, $P1, 'PQoidStatus', 'tp'
set_global 'PQoidStatus', $P2
dlfunc $P2, $P1, 'PQoidValue', 'ip'
set_global 'PQoidValue', $P2
dlfunc $P2, $P1, 'PQcmdTuples', 'tp'
set_global 'PQcmdTuples', $P2
dlfunc $P2, $P1, 'PQgetvalue', 'tpii'
set_global 'PQgetvalue', $P2
dlfunc $P2, $P1, 'PQgetlength', 'ipii'
set_global 'PQgetlength', $P2
dlfunc $P2, $P1, 'PQgetisnull', 'ipii'
set_global 'PQgetisnull', $P2
dlfunc $P2, $P1, 'PQclear', 'vp'
set_global 'PQclear', $P2
dlfunc $P2, $P1, 'PQfreemem', 'vp'
set_global 'PQfreemem', $P2
dlfunc $P2, $P1, 'PQescapeBytea', 'ttl4'
set_global 'PQescapeBytea', $P2
dlfunc $P2, $P1, 'PQunescapeBytea', 'tt4'
set_global 'PQunescapeBytea', $P2
dlfunc $P2, $P1, 'PQmakeEmptyPGresult', 'ppi'
set_global 'PQmakeEmptyPGresult', $P2
dlfunc $P2, $P1, 'lo_open', 'ipii'
set_global 'lo_open', $P2
dlfunc $P2, $P1, 'lo_close', 'ipi'
set_global 'lo_close', $P2
dlfunc $P2, $P1, 'lo_read', 'ipitl'
set_global 'lo_read', $P2
dlfunc $P2, $P1, 'lo_write', 'ipitl'
set_global 'lo_write', $P2
dlfunc $P2, $P1, 'lo_lseek', 'ipiii'
set_global 'lo_lseek', $P2
dlfunc $P2, $P1, 'lo_creat', 'ipi'
set_global 'lo_creat', $P2
dlfunc $P2, $P1, 'lo_tell', 'ipi'
set_global 'lo_tell', $P2
dlfunc $P2, $P1, 'lo_unlink', 'ipi'
set_global 'lo_unlink', $P2
dlfunc $P2, $P1, 'lo_import', 'ipt'
set_global 'lo_import', $P2
dlfunc $P2, $P1, 'lo_export', 'ipit'
set_global 'lo_export', $P2
dlfunc $P2, $P1, 'PQmblen', 'iti'
set_global 'PQmblen', $P2
dlfunc $P2, $P1, 'PQenv2encoding', 'i'
set_global 'PQenv2encoding', $P2

dlfunc $P2, $P1, 'PQsetNoticeReceiver', 'pppP'
set_global 'PQsetNoticeReceiver', $P2
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
