saveall
loadlib P1, 'libpq'
dlfunc P2, P1, 'PQconnectStart', 'pt'
store_global 'PostgreSQL::PQconnectStart', P2
dlfunc P2, P1, 'PQconnectPoll', 'ip'
store_global 'PostgreSQL::PQconnectPoll', P2
dlfunc P2, P1, 'PQconnectdb', 'pt'
store_global 'PostgreSQL::PQconnectdb', P2
dlfunc P2, P1, 'PQsetdbLogin', 'pttttttt'
store_global 'PostgreSQL::PQsetdbLogin', P2
dlfunc P2, P1, 'PQfinish', 'vp'
store_global 'PostgreSQL::PQfinish', P2
dlfunc P2, P1, 'PQconndefaults', 'p'
store_global 'PostgreSQL::PQconndefaults', P2
dlfunc P2, P1, 'PQconninfoFree', 'vp'
store_global 'PostgreSQL::PQconninfoFree', P2
dlfunc P2, P1, 'PQresetStart', 'ip'
store_global 'PostgreSQL::PQresetStart', P2
dlfunc P2, P1, 'PQresetPoll', 'ip'
store_global 'PostgreSQL::PQresetPoll', P2
dlfunc P2, P1, 'PQreset', 'vp'
store_global 'PostgreSQL::PQreset', P2
dlfunc P2, P1, 'PQrequestCancel', 'ip'
store_global 'PostgreSQL::PQrequestCancel', P2
dlfunc P2, P1, 'PQdb', 'tp'
store_global 'PostgreSQL::PQdb', P2
dlfunc P2, P1, 'PQuser', 'tp'
store_global 'PostgreSQL::PQuser', P2
dlfunc P2, P1, 'PQpass', 'tp'
store_global 'PostgreSQL::PQpass', P2
dlfunc P2, P1, 'PQhost', 'tp'
store_global 'PostgreSQL::PQhost', P2
dlfunc P2, P1, 'PQport', 'tp'
store_global 'PostgreSQL::PQport', P2
dlfunc P2, P1, 'PQtty', 'tp'
store_global 'PostgreSQL::PQtty', P2
dlfunc P2, P1, 'PQoptions', 'tp'
store_global 'PostgreSQL::PQoptions', P2
dlfunc P2, P1, 'PQstatus', 'ip'
store_global 'PostgreSQL::PQstatus', P2
dlfunc P2, P1, 'PQtransactionStatus', 'ip'
store_global 'PostgreSQL::PQtransactionStatus', P2
dlfunc P2, P1, 'PQparameterStatus', 'tpt'
store_global 'PostgreSQL::PQparameterStatus', P2
dlfunc P2, P1, 'PQprotocolVersion', 'ip'
store_global 'PostgreSQL::PQprotocolVersion', P2
dlfunc P2, P1, 'PQerrorMessage', 'tp'
store_global 'PostgreSQL::PQerrorMessage', P2
dlfunc P2, P1, 'PQsocket', 'ip'
store_global 'PostgreSQL::PQsocket', P2
dlfunc P2, P1, 'PQbackendPID', 'ip'
store_global 'PostgreSQL::PQbackendPID', P2
dlfunc P2, P1, 'PQclientEncoding', 'ip'
store_global 'PostgreSQL::PQclientEncoding', P2
dlfunc P2, P1, 'PQsetClientEncoding', 'ipt'
store_global 'PostgreSQL::PQsetClientEncoding', P2
dlfunc P2, P1, 'PQsetErrorVerbosity', 'ipi'
store_global 'PostgreSQL::PQsetErrorVerbosity', P2
dlfunc P2, P1, 'PQtrace', 'vpp'
store_global 'PostgreSQL::PQtrace', P2
dlfunc P2, P1, 'PQuntrace', 'vp'
store_global 'PostgreSQL::PQuntrace', P2
dlfunc P2, P1, 'PQexec', 'ppt'
store_global 'PostgreSQL::PQexec', P2
dlfunc P2, P1, 'PQexecParams', 'pptiLTLLi'
store_global 'PostgreSQL::PQexecParams', P2
dlfunc P2, P1, 'PQexecPrepared', 'pptit33i'
store_global 'PostgreSQL::PQexecPrepared', P2
dlfunc P2, P1, 'PQsendQuery', 'ipt'
store_global 'PostgreSQL::PQsendQuery', P2
dlfunc P2, P1, 'PQsendQueryParams', 'iptiit33i'
store_global 'PostgreSQL::PQsendQueryParams', P2
dlfunc P2, P1, 'PQsendQueryPrepared', 'iptit33i'
store_global 'PostgreSQL::PQsendQueryPrepared', P2
dlfunc P2, P1, 'PQgetResult', 'pp'
store_global 'PostgreSQL::PQgetResult', P2
dlfunc P2, P1, 'PQisBusy', 'ip'
store_global 'PostgreSQL::PQisBusy', P2
dlfunc P2, P1, 'PQconsumeInput', 'ip'
store_global 'PostgreSQL::PQconsumeInput', P2
dlfunc P2, P1, 'PQnotifies', 'pp'
store_global 'PostgreSQL::PQnotifies', P2
dlfunc P2, P1, 'PQputCopyData', 'ipti'
store_global 'PostgreSQL::PQputCopyData', P2
dlfunc P2, P1, 'PQputCopyEnd', 'ipt'
store_global 'PostgreSQL::PQputCopyEnd', P2
dlfunc P2, P1, 'PQgetCopyData', 'ipti'
store_global 'PostgreSQL::PQgetCopyData', P2
dlfunc P2, P1, 'PQgetline', 'ipti'
store_global 'PostgreSQL::PQgetline', P2
dlfunc P2, P1, 'PQputline', 'ipt'
store_global 'PostgreSQL::PQputline', P2
dlfunc P2, P1, 'PQgetlineAsync', 'ipti'
store_global 'PostgreSQL::PQgetlineAsync', P2
dlfunc P2, P1, 'PQputnbytes', 'ipti'
store_global 'PostgreSQL::PQputnbytes', P2
dlfunc P2, P1, 'PQendcopy', 'ip'
store_global 'PostgreSQL::PQendcopy', P2
dlfunc P2, P1, 'PQsetnonblocking', 'ipi'
store_global 'PostgreSQL::PQsetnonblocking', P2
dlfunc P2, P1, 'PQisnonblocking', 'ip'
store_global 'PostgreSQL::PQisnonblocking', P2
dlfunc P2, P1, 'PQflush', 'ip'
store_global 'PostgreSQL::PQflush', P2
dlfunc P2, P1, 'PQfn', 'ppi33ipi'
store_global 'PostgreSQL::PQfn', P2
dlfunc P2, P1, 'PQresultStatus', 'ip'
store_global 'PostgreSQL::PQresultStatus', P2
dlfunc P2, P1, 'PQresStatus', 'ti'
store_global 'PostgreSQL::PQresStatus', P2
dlfunc P2, P1, 'PQresultErrorMessage', 'tp'
store_global 'PostgreSQL::PQresultErrorMessage', P2
dlfunc P2, P1, 'PQresultErrorField', 'cpi'
store_global 'PostgreSQL::PQresultErrorField', P2
dlfunc P2, P1, 'PQntuples', 'ip'
store_global 'PostgreSQL::PQntuples', P2
dlfunc P2, P1, 'PQnfields', 'ip'
store_global 'PostgreSQL::PQnfields', P2
dlfunc P2, P1, 'PQbinaryTuples', 'ip'
store_global 'PostgreSQL::PQbinaryTuples', P2
dlfunc P2, P1, 'PQfname', 'tpi'
store_global 'PostgreSQL::PQfname', P2
dlfunc P2, P1, 'PQfnumber', 'ipt'
store_global 'PostgreSQL::PQfnumber', P2
dlfunc P2, P1, 'PQftable', 'ipi'
store_global 'PostgreSQL::PQftable', P2
dlfunc P2, P1, 'PQftablecol', 'ipi'
store_global 'PostgreSQL::PQftablecol', P2
dlfunc P2, P1, 'PQfformat', 'ipi'
store_global 'PostgreSQL::PQfformat', P2
dlfunc P2, P1, 'PQftype', 'ipi'
store_global 'PostgreSQL::PQftype', P2
dlfunc P2, P1, 'PQfsize', 'ipi'
store_global 'PostgreSQL::PQfsize', P2
dlfunc P2, P1, 'PQfmod', 'ipi'
store_global 'PostgreSQL::PQfmod', P2
dlfunc P2, P1, 'PQcmdStatus', 'tp'
store_global 'PostgreSQL::PQcmdStatus', P2
dlfunc P2, P1, 'PQoidStatus', 'tp'
store_global 'PostgreSQL::PQoidStatus', P2
dlfunc P2, P1, 'PQoidValue', 'ip'
store_global 'PostgreSQL::PQoidValue', P2
dlfunc P2, P1, 'PQcmdTuples', 'tp'
store_global 'PostgreSQL::PQcmdTuples', P2
dlfunc P2, P1, 'PQgetvalue', 'tpii'
store_global 'PostgreSQL::PQgetvalue', P2
dlfunc P2, P1, 'PQgetlength', 'ipii'
store_global 'PostgreSQL::PQgetlength', P2
dlfunc P2, P1, 'PQgetisnull', 'ipii'
store_global 'PostgreSQL::PQgetisnull', P2
dlfunc P2, P1, 'PQclear', 'vp'
store_global 'PostgreSQL::PQclear', P2
dlfunc P2, P1, 'PQfreemem', 'vp'
store_global 'PostgreSQL::PQfreemem', P2
dlfunc P2, P1, 'PQescapeBytea', 'ttl4'
store_global 'PostgreSQL::PQescapeBytea', P2
dlfunc P2, P1, 'PQunescapeBytea', 'tt4'
store_global 'PostgreSQL::PQunescapeBytea', P2
dlfunc P2, P1, 'PQmakeEmptyPGresult', 'ppi'
store_global 'PostgreSQL::PQmakeEmptyPGresult', P2
dlfunc P2, P1, 'lo_open', 'ipii'
store_global 'PostgreSQL::lo_open', P2
dlfunc P2, P1, 'lo_close', 'ipi'
store_global 'PostgreSQL::lo_close', P2
dlfunc P2, P1, 'lo_read', 'ipitl'
store_global 'PostgreSQL::lo_read', P2
dlfunc P2, P1, 'lo_write', 'ipitl'
store_global 'PostgreSQL::lo_write', P2
dlfunc P2, P1, 'lo_lseek', 'ipiii'
store_global 'PostgreSQL::lo_lseek', P2
dlfunc P2, P1, 'lo_creat', 'ipi'
store_global 'PostgreSQL::lo_creat', P2
dlfunc P2, P1, 'lo_tell', 'ipi'
store_global 'PostgreSQL::lo_tell', P2
dlfunc P2, P1, 'lo_unlink', 'ipi'
store_global 'PostgreSQL::lo_unlink', P2
dlfunc P2, P1, 'lo_import', 'ipt'
store_global 'PostgreSQL::lo_import', P2
dlfunc P2, P1, 'lo_export', 'ipit'
store_global 'PostgreSQL::lo_export', P2
dlfunc P2, P1, 'PQmblen', 'iti'
store_global 'PostgreSQL::PQmblen', P2
dlfunc P2, P1, 'PQenv2encoding', 'iv'
store_global 'PostgreSQL::PQenv2encoding', P2
restoreall

