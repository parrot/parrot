# Copyright (C) 2008-2009, Parrot Foundation.
# $Id$

.namespace ['SQLite']

.const int SQLITE_OK         =   0   # Successful result
# beginning-of-error-codes
.const int SQLITE_ERROR      =   1   # SQL error or missing database
.const int SQLITE_INTERNAL   =   2   # Internal logic error in SQLite
.const int SQLITE_PERM       =   3   # Access permission denied
.const int SQLITE_ABORT      =   4   # Callback routine requested an abort
.const int SQLITE_BUSY       =   5   # The database file is locked
.const int SQLITE_LOCKED     =   6   # A table in the database is locked
.const int SQLITE_NOMEM      =   7   # A malloc() failed
.const int SQLITE_READONLY   =   8   # Attempt to write a readonly database
.const int SQLITE_INTERRUPT  =   9   # Operation terminated by sqlite3_interrupt()
.const int SQLITE_IOERR      =  10   # Some kind of disk I/O error occurred
.const int SQLITE_CORRUPT    =  11   # The database disk image is malformed
.const int SQLITE_NOTFOUND   =  12   # NOT USED. Table or record not found
.const int SQLITE_FULL       =  13   # Insertion failed because database is full
.const int SQLITE_CANTOPEN   =  14   # Unable to open the database file
.const int SQLITE_PROTOCOL   =  15   # NOT USED. Database lock protocol error
.const int SQLITE_EMPTY      =  16   # Database is empty
.const int SQLITE_SCHEMA     =  17   # The database schema changed
.const int SQLITE_TOOBIG     =  18   # String or BLOB exceeds size limit
.const int SQLITE_CONSTRAINT =  19   # Abort due to constraint violation
.const int SQLITE_MISMATCH   =  20   # Data type mismatch
.const int SQLITE_MISUSE     =  21   # Library used incorrectly
.const int SQLITE_NOLFS      =  22   # Uses OS features not supported on host
.const int SQLITE_AUTH       =  23   # Authorization denied
.const int SQLITE_FORMAT     =  24   # Auxiliary database format error
.const int SQLITE_RANGE      =  25   # 2nd parameter to sqlite3_bind out of range
.const int SQLITE_NOTADB     =  26   # File opened that is not a database file
.const int SQLITE_ROW        =  100  # sqlite3_step() has another row ready
.const int SQLITE_DONE       =  101  # sqlite3_step() has finished executing

.sub '_sqlite_init' :load
    .local pmc libname
    .local pmc function
    .local pmc sqlite_funcs

    libname = loadlib 'libsqlite3'
    set_global '_sqlite3', libname

    sqlite_funcs = new 'ResizableStringArray'
    push sqlite_funcs, 'step'
    push sqlite_funcs, 'ip'
    push sqlite_funcs, 'finalize'
    push sqlite_funcs, 'ip'
    push sqlite_funcs, 'close'
    push sqlite_funcs, 'ip'
    push sqlite_funcs, 'errmsg'
    push sqlite_funcs, 'tp'
    push sqlite_funcs, 'errcode'
    push sqlite_funcs, 'ip'
    push sqlite_funcs, 'bind_int'
    push sqlite_funcs, 'ipii'
    push sqlite_funcs, 'bind_double'
    push sqlite_funcs, 'ipid'
    push sqlite_funcs, 'bind_text'
    push sqlite_funcs, 'ipitii'
    push sqlite_funcs, 'column_name'
    push sqlite_funcs, 'tpi'
    push sqlite_funcs, 'column_text'
    push sqlite_funcs, 'tpi'

    function  = dlfunc libname, 'sqlite3_open', 'itV'
    set_global 'open_raw', function

    function  = dlfunc libname, 'sqlite3_prepare_v2', 'iptiVp'
    set_global 'prepare_raw', function

    .local pmc list_iter
    list_iter = iter sqlite_funcs
    .local string func_name, signature
    .local pmc    function

  list_loop:
    unless list_iter goto done
    func_name = shift list_iter
    signature = shift list_iter
    $S0 = concat 'sqlite3_', func_name
    function  = dlfunc libname, $S0, signature
    set_global func_name, function
    goto list_loop

  done:

.end

.sub 'open'
  .param string connectstr
  .local pmc dbhandle
  .local pmc open_raw
  .local int rc

  open_raw = get_global 'open_raw'
  dbhandle = new 'Pointer'
  rc = open_raw(connectstr, dbhandle)

  .return(dbhandle)
.end

.sub 'prepare'
  .param pmc dbhandle
  .param string psstr
  .local int psstrlen
  .local pmc pshandle
  .local pmc dummy
  .local pmc prepare_raw
  .local int rc

  prepare_raw = get_global 'prepare_raw'

  pshandle = new 'Pointer'
  dummy = new 'Pointer'
  psstrlen = length psstr
  rc = prepare_raw(dbhandle, psstr, psstrlen, pshandle, dummy)

  .return(pshandle)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
