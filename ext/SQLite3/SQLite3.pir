
.namespace ['SQLite']

.sub _sqlite_init :load
    .local pmc libname
    .local pmc libname_s
    .local pmc namespace
    .local pmc namespace_key
    .local pmc function
    .local pmc test

    namespace = get_namespace
    namespace_key = namespace.'get_name'()

    libname = loadlib 'libsqlite3'
    set_global '_sqlite3', libname
    libname_s = loadlib 'sqlite3s'
    set_global '_sqlite3s', libname_s

    function  = dlfunc libname_s, 'pmc_check', 'vP'
    set_root_global namespace_key, 'pmc_check', function

    function  = dlfunc libname_s, 'sqlite3s_open', 'pt'
    set_root_global namespace_key, 'open', function

    function  = dlfunc libname_s, 'sqlite3s_prepare', 'ppt'
    set_root_global namespace_key, 'prepare', function

    function  = dlfunc libname, 'sqlite3_step', 'ip'
    set_root_global namespace_key, 'step', function

    function  = dlfunc libname, 'sqlite3_finalize', 'ip'
    set_root_global namespace_key, 'finalize', function

    function  = dlfunc libname, 'sqlite3_close', 'ip'
    set_root_global namespace_key, 'close', function
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
