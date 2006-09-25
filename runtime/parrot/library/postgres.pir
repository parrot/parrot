.namespace ['Pg']
.sub __postgres_init :load

loadlib $P1, 'libpq'
if $P1 goto has_lib
$P2 = new .Exception
$P2[0] = 'error loading libpg - loadlib failed'
throw $P2
has_lib:
dlfunc $P2, $P1, 'PQconnectStart', 'pt'
store_global 'PQconnectStart', $P2
dlfunc $P2, $P1, 'PQconnectPoll', 'ip'
store_global 'PQconnectPoll', $P2
dlfunc $P2, $P1, 'PQconnectdb', 'pt'
store_global 'PQconnectdb', $P2
dlfunc $P2, $P1, 'PQsetdbLogin', 'pttttttt'
store_global 'PQsetdbLogin', $P2
dlfunc $P2, $P1, 'PQfinish', 'vp'
store_global 'PQfinish', $P2
dlfunc $P2, $P1, 'PQconndefaults', 'p'
store_global 'PQconndefaults', $P2
dlfunc $P2, $P1, 'PQconninfoFree', 'vp'
store_global 'PQconninfoFree', $P2
dlfunc $P2, $P1, 'PQresetStart', 'ip'
store_global 'PQresetStart', $P2
dlfunc $P2, $P1, 'PQresetPoll', 'ip'
store_global 'PQresetPoll', $P2
dlfunc $P2, $P1, 'PQreset', 'vp'
store_global 'PQreset', $P2
dlfunc $P2, $P1, 'PQrequestCancel', 'ip'
store_global 'PQrequestCancel', $P2
dlfunc $P2, $P1, 'PQdb', 'tp'
store_global 'PQdb', $P2
dlfunc $P2, $P1, 'PQuser', 'tp'
store_global 'PQuser', $P2
dlfunc $P2, $P1, 'PQpass', 'tp'
store_global 'PQpass', $P2
dlfunc $P2, $P1, 'PQhost', 'tp'
store_global 'PQhost', $P2
dlfunc $P2, $P1, 'PQport', 'tp'
store_global 'PQport', $P2
dlfunc $P2, $P1, 'PQtty', 'tp'
store_global 'PQtty', $P2
dlfunc $P2, $P1, 'PQoptions', 'tp'
store_global 'PQoptions', $P2
dlfunc $P2, $P1, 'PQstatus', 'ip'
store_global 'PQstatus', $P2
dlfunc $P2, $P1, 'PQtransactionStatus', 'ip'
store_global 'PQtransactionStatus', $P2
dlfunc $P2, $P1, 'PQparameterStatus', 'tpt'
store_global 'PQparameterStatus', $P2
dlfunc $P2, $P1, 'PQprotocolVersion', 'ip'
store_global 'PQprotocolVersion', $P2
dlfunc $P2, $P1, 'PQerrorMessage', 'tp'
store_global 'PQerrorMessage', $P2
dlfunc $P2, $P1, 'PQsocket', 'ip'
store_global 'PQsocket', $P2
dlfunc $P2, $P1, 'PQbackendPID', 'ip'
store_global 'PQbackendPID', $P2
dlfunc $P2, $P1, 'PQclientEncoding', 'ip'
store_global 'PQclientEncoding', $P2
dlfunc $P2, $P1, 'PQsetClientEncoding', 'ipt'
store_global 'PQsetClientEncoding', $P2
dlfunc $P2, $P1, 'PQsetErrorVerbosity', 'ipi'
store_global 'PQsetErrorVerbosity', $P2
dlfunc $P2, $P1, 'PQtrace', 'vpp'
store_global 'PQtrace', $P2
dlfunc $P2, $P1, 'PQuntrace', 'vp'
store_global 'PQuntrace', $P2
dlfunc $P2, $P1, 'PQexec', 'ppt'
store_global 'PQexec', $P2
dlfunc $P2, $P1, 'PQexecParams', 'pptippppi'
store_global 'PQexecParams', $P2
dlfunc $P2, $P1, 'PQprepare', 'ppttip'
store_global 'PQprepare', $P2
dlfunc $P2, $P1, 'PQexecPrepared', 'pptipppi'
store_global 'PQexecPrepared', $P2
dlfunc $P2, $P1, 'PQsendQuery', 'ipt'
store_global 'PQsendQuery', $P2
# TODO dlfunc $P2, $P1, 'PQsendQueryParams', 'iptiit33i'
# TODO store_global 'PQsendQueryParams', $P2
# TODO dlfunc $P2, $P1, 'PQsendQueryPrepared', 'iptit33i'
# TODO store_global 'PQsendQueryPrepared', $P2
dlfunc $P2, $P1, 'PQgetResult', 'pp'
store_global 'PQgetResult', $P2
dlfunc $P2, $P1, 'PQisBusy', 'ip'
store_global 'PQisBusy', $P2
dlfunc $P2, $P1, 'PQconsumeInput', 'ip'
store_global 'PQconsumeInput', $P2
dlfunc $P2, $P1, 'PQnotifies', 'pp'
store_global 'PQnotifies', $P2
dlfunc $P2, $P1, 'PQputCopyData', 'ipti'
store_global 'PQputCopyData', $P2
dlfunc $P2, $P1, 'PQputCopyEnd', 'ipt'
store_global 'PQputCopyEnd', $P2
dlfunc $P2, $P1, 'PQgetCopyData', 'ipti'
store_global 'PQgetCopyData', $P2
dlfunc $P2, $P1, 'PQgetline', 'ipti'
store_global 'PQgetline', $P2
dlfunc $P2, $P1, 'PQputline', 'ipt'
store_global 'PQputline', $P2
dlfunc $P2, $P1, 'PQgetlineAsync', 'ipti'
store_global 'PQgetlineAsync', $P2
dlfunc $P2, $P1, 'PQputnbytes', 'ipti'
store_global 'PQputnbytes', $P2
dlfunc $P2, $P1, 'PQendcopy', 'ip'
store_global 'PQendcopy', $P2
dlfunc $P2, $P1, 'PQsetnonblocking', 'ipi'
store_global 'PQsetnonblocking', $P2
dlfunc $P2, $P1, 'PQisnonblocking', 'ip'
store_global 'PQisnonblocking', $P2
dlfunc $P2, $P1, 'PQflush', 'ip'
store_global 'PQflush', $P2
dlfunc $P2, $P1, 'PQfn', 'ppi33ipi'
store_global 'PQfn', $P2
dlfunc $P2, $P1, 'PQresultStatus', 'ip'
store_global 'PQresultStatus', $P2
dlfunc $P2, $P1, 'PQresStatus', 'ti'
store_global 'PQresStatus', $P2
dlfunc $P2, $P1, 'PQresultErrorMessage', 'tp'
store_global 'PQresultErrorMessage', $P2
dlfunc $P2, $P1, 'PQresultErrorField', 'cpi'
store_global 'PQresultErrorField', $P2
dlfunc $P2, $P1, 'PQntuples', 'ip'
store_global 'PQntuples', $P2
dlfunc $P2, $P1, 'PQnfields', 'ip'
store_global 'PQnfields', $P2
dlfunc $P2, $P1, 'PQbinaryTuples', 'ip'
store_global 'PQbinaryTuples', $P2
dlfunc $P2, $P1, 'PQfname', 'tpi'
store_global 'PQfname', $P2
dlfunc $P2, $P1, 'PQfnumber', 'ipt'
store_global 'PQfnumber', $P2
dlfunc $P2, $P1, 'PQftable', 'ipi'
store_global 'PQftable', $P2
dlfunc $P2, $P1, 'PQftablecol', 'ipi'
store_global 'PQftablecol', $P2
dlfunc $P2, $P1, 'PQfformat', 'ipi'
store_global 'PQfformat', $P2
dlfunc $P2, $P1, 'PQftype', 'ipi'
store_global 'PQftype', $P2
dlfunc $P2, $P1, 'PQfsize', 'ipi'
store_global 'PQfsize', $P2
dlfunc $P2, $P1, 'PQfmod', 'ipi'
store_global 'PQfmod', $P2
dlfunc $P2, $P1, 'PQcmdStatus', 'tp'
store_global 'PQcmdStatus', $P2
dlfunc $P2, $P1, 'PQoidStatus', 'tp'
store_global 'PQoidStatus', $P2
dlfunc $P2, $P1, 'PQoidValue', 'ip'
store_global 'PQoidValue', $P2
dlfunc $P2, $P1, 'PQcmdTuples', 'tp'
store_global 'PQcmdTuples', $P2
dlfunc $P2, $P1, 'PQgetvalue', 'tpii'
store_global 'PQgetvalue', $P2
dlfunc $P2, $P1, 'PQgetlength', 'ipii'
store_global 'PQgetlength', $P2
dlfunc $P2, $P1, 'PQgetisnull', 'ipii'
store_global 'PQgetisnull', $P2
dlfunc $P2, $P1, 'PQclear', 'vp'
store_global 'PQclear', $P2
dlfunc $P2, $P1, 'PQfreemem', 'vp'
store_global 'PQfreemem', $P2
dlfunc $P2, $P1, 'PQescapeBytea', 'ttl4'
store_global 'PQescapeBytea', $P2
dlfunc $P2, $P1, 'PQunescapeBytea', 'tt4'
store_global 'PQunescapeBytea', $P2
dlfunc $P2, $P1, 'PQmakeEmptyPGresult', 'ppi'
store_global 'PQmakeEmptyPGresult', $P2
dlfunc $P2, $P1, 'lo_open', 'ipii'
store_global 'lo_open', $P2
dlfunc $P2, $P1, 'lo_close', 'ipi'
store_global 'lo_close', $P2
dlfunc $P2, $P1, 'lo_read', 'ipitl'
store_global 'lo_read', $P2
dlfunc $P2, $P1, 'lo_write', 'ipitl'
store_global 'lo_write', $P2
dlfunc $P2, $P1, 'lo_lseek', 'ipiii'
store_global 'lo_lseek', $P2
dlfunc $P2, $P1, 'lo_creat', 'ipi'
store_global 'lo_creat', $P2
dlfunc $P2, $P1, 'lo_tell', 'ipi'
store_global 'lo_tell', $P2
dlfunc $P2, $P1, 'lo_unlink', 'ipi'
store_global 'lo_unlink', $P2
dlfunc $P2, $P1, 'lo_import', 'ipt'
store_global 'lo_import', $P2
dlfunc $P2, $P1, 'lo_export', 'ipit'
store_global 'lo_export', $P2
dlfunc $P2, $P1, 'PQmblen', 'iti'
store_global 'PQmblen', $P2
dlfunc $P2, $P1, 'PQenv2encoding', 'i'
store_global 'PQenv2encoding', $P2

dlfunc $P2, $P1, 'PQsetNoticeReceiver', 'pppP'
store_global 'PQsetNoticeReceiver', $P2
.end

