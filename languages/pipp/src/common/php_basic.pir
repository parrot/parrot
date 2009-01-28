# Copyright (C) 2008-2009, The Perl Foundation.
# $Id$

=head1 NAME

php_basic.pir - PHP basic Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<mixed call_user_func(string function_name [, mixed parmeter] [, mixed ...])>

Call a user function which is the first parameter

NOT IMPLEMENTED.

=cut

.sub 'call_user_func'
    not_implemented()
.end

=item C<mixed call_user_func_array(string function_name, array parameters)>

Call a user function which is the first parameter with the arguments contained in array

NOT IMPLEMENTED.

=cut

.sub 'call_user_func_array'
    not_implemented()
.end

=item C<mixed call_user_method(string method_name, mixed object [, mixed parameter] [, mixed ...])>

Call a user method on a specific object or class

NOT IMPLEMENTED.

=cut

.sub 'call_user_method'
    not_implemented()
.end

=item C<mixed call_user_method_array(string method_name, mixed object, array params)>

Call a user method on a specific object or class using a parameter array

NOT IMPLEMENTED.

=cut

.sub 'call_user_method_array'
    not_implemented()
.end

=item C<int connection_aborted(void)>

Returns true if client disconnected

NOT IMPLEMENTED.

=cut

.sub 'connection_aborted'
    not_implemented()
.end

=item C<int connection_status(void)>

Returns the connection status bitfield

NOT IMPLEMENTED.

=cut

.sub 'connection_status'
    not_implemented()
.end

=item C<mixed constant(string const_name)>

Given the name of a constant this function will return the constants associated value

=cut

.sub 'constant'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    .local string name
    name = $P1
    .local pmc val
    val = get_hll_global name
    if_null val, L2
    .return (val)
  L2:
    error(E_WARNING, "Couldn't find constant ", name)
    .RETURN_NULL()
.end

=item C<array error_get_last()>

Get the last occurred error as associative array. Returns NULL if there hasn't been an error yet.

NOT IMPLEMENTED.

=cut

.sub 'error_get_last'
    not_implemented()
.end

=item C<bool error_log(string message [, int message_type [, string destination [, string extra_headers]]])>

Send an error message somewhere

NOT IMPLEMENTED.

=cut

.sub 'error_log'
    not_implemented()
.end

=item C<void flush(void)>

Flush the output buffer

NOT IMPLEMENTED.

=cut

.sub 'flush'
    not_implemented()
.end

=item C<string get_cfg_var(string option_name)>

Get the value of a PHP configuration option

NOT IMPLEMENTED.

=cut

.sub 'get_cfg_var'
    not_implemented()
.end

=item C<string get_current_user(void)>

Get the name of the owner of the current PHP script

NOT IMPLEMENTED.

=cut

.sub 'get_current_user'
    not_implemented()
.end

=item C<string get_include_path()>

Get the current include_path configuration option
Currently only the current include path is returned.

STILL INCOMPLETE.

=cut

.sub 'get_include_path'
    .tailcall constant('DEFAULT_INCLUDE_PATH')
.end

=item C<int get_magic_quotes_gpc(void)>

Get the current active configuration setting of magic_quotes_gpc

NOT IMPLEMENTED.

=cut

.sub 'get_magic_quotes_gpc'
    not_implemented()
.end

=item C<int get_magic_quotes_runtime(void)>

Get the current active configuration setting of magic_quotes_runtime

NOT IMPLEMENTED.

=cut

.sub 'get_magic_quotes_runtime'
    not_implemented()
.end

=item C<string getenv(string varname)>

Get the value of an environment variable

STILL INCOMPLETE.

=cut

.sub 'getenv'
    .param pmc args :slurpy

    .local string varname
    ($I0, varname) = parse_parameters('s', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
#    $S0 = sapi_getenv(varname)
#    unless $S0 goto L2
#    .RETURN_STRING($S0)
#  L2:
    new $P0, 'Env'
    $S0 = $P0[varname]
    unless $S0 goto L3
    .RETURN_STRING($S0)
  L3:
    .RETURN_FALSE()
.end

=item C<array getopt(string options [, array longopts])>

Get options from the command line argument list

NOT IMPLEMENTED.

=cut

.sub 'getopt'
    not_implemented()
.end

=item C<int getprotobyname(string name)>

Returns protocol number associated with name as per /etc/protocols

NOT IMPLEMENTED.

=cut

.sub 'getprotobyname'
    not_implemented()
.end

=item C<string getprotobynumber(int proto)>

Returns protocol name associated with protocol number proto

NOT IMPLEMENTED.

=cut

.sub 'getprotobynumber'
    not_implemented()
.end

=item C<int getservbyname(string service, string protocol)>

Returns port associated with service. Protocol must be "tcp" or "udp"

NOT IMPLEMENTED.

=cut

.sub 'getservbyname'
    not_implemented()
.end

=item C<string getservbyport(int port, string protocol)>

Returns service name associated with port. Protocol must be "tcp" or "udp"

NOT IMPLEMENTED.

=cut

.sub 'getservbyport'
    not_implemented()
.end

=item C<bool highlight_file(string file_name [, bool return] )>

Syntax highlight a source file

NOT IMPLEMENTED.

=cut

.sub 'highlight_file'
    not_implemented()
.end

=item C<bool highlight_string(string string [, bool return] )>

Syntax highlight a string or optionally return it

NOT IMPLEMENTED.

=cut

.sub 'highlight_string'
    not_implemented()
.end

=item C<int ignore_user_abort(bool value)>

Set whether we want to ignore a user abort event or not

NOT IMPLEMENTED.

=cut

.sub 'ignore_user_abort'
    not_implemented()
.end

=item C<bool import_request_variables(string types [, string prefix])>

Import GET/POST/Cookie variables into the global scope

NOT IMPLEMENTED.

=cut

.sub 'import_request_variables'
    not_implemented()
.end

=item C<string inet_ntop(string in_addr)>

Converts a packed inet address to a human readable IP address string

NOT IMPLEMENTED.

=cut

.sub 'inet_ntop'
    not_implemented()
.end

=item C<string inet_pton(string ip_address)>

Converts a human readable IP address to a packed binary string

NOT IMPLEMENTED.

=cut

.sub 'inet_pton'
    not_implemented()
.end

=item C<string ini_get(string varname)>

Get a configuration option

NOT IMPLEMENTED.

=cut

.sub 'ini_get'
    .param pmc key

    $P0 = get_hll_global 'pipp_ini'
    .local string val_s
    val_s = $P0[key]
    .local pmc val
    val = new 'PhpString'
    val = val_s

    .return ( val )
.end

=item C<array ini_get_all([string extension])>

Get all configuration options

NOT IMPLEMENTED.

=cut

.sub 'ini_get_all'
    not_implemented()
.end

=item C<void ini_restore(string varname)>

Restore the value of a configuration option specified by varname

NOT IMPLEMENTED.

=cut

.sub 'ini_restore'
    not_implemented()
.end

=item C<string ini_set(string varname, string newvalue)>

Set a configuration option, returns false on error and the old value of the configuration option on success

NOT IMPLEMENTED.

=cut

.sub 'ini_set'
    .param pmc key
    .param pmc val

    $P0 = get_hll_global 'pipp_ini'
    .local string val_s
    val_s = val

    $P0[key] = val_s

    .return ( val )
.end

=item C<int ip2long(string ip_address)>

Converts a string containing an (IPv4) Internet Protocol dotted address into a proper address

NOT IMPLEMENTED.

=cut

.sub 'ip2long'
    not_implemented()
.end

=item C<bool is_uploaded_file(string path)>

Check if file was created by rfc1867 upload

NOT IMPLEMENTED.

=cut

.sub 'is_uploaded_file'
    not_implemented()
.end

=item C<string long2ip(int proper_address)>

Converts an (IPv4) Internet network address into a string in Internet standard dotted format

NOT IMPLEMENTED.

=cut

.sub 'long2ip'
    not_implemented()
.end

=item C<bool move_uploaded_file(string path, string new_path)>

Move a file if and only if it was created by an upload

NOT IMPLEMENTED.

=cut

.sub 'move_uploaded_file'
    not_implemented()
.end

=item C<array parse_ini_file(string filename [, bool process_sections])>

Parse configuration file

NOT IMPLEMENTED.

=cut

.sub 'parse_ini_file'
    not_implemented()
.end

=item C<string php_strip_whitespace(string file_name)>

Return source with stripped comments and whitespace

NOT IMPLEMENTED.

=cut

.sub 'php_strip_whitespace'
    not_implemented()
.end

=item C<mixed print_r(mixed var [, bool return])>

Prints out or returns information about the specified variable.

Currently this a c&b from C<var_dump()>.
Not sure what the differences are.

NOT IMPLEMENTED.

=cut

.include "library/dumper.pir"
.include "cclass.pasm"

.sub 'print_r'
    .param pmc a
    .param pmc return_flag           :optional  # TODO implement
    .param int has_return_flag       :opt_flag

    if null a goto set_null_type

    .local string type_of_pmc
    type_of_pmc = typeof a
    unless type_of_pmc == 'string' goto L1
    print a
    .return()

  L1:
    unless type_of_pmc == 'array' goto L2
    print "Array\n(\n"

    .local pmc    it, val, key
    .local string indent, key_str
    .local int    key_starts_with_digit
    indent = '    '
    it = iter a
  iter_loop:
    unless it goto iter_end
    shift key, it
    key_str = key
    key_starts_with_digit = is_cclass .CCLASS_NUMERIC, key_str, 0
    print indent
    print '['
    if key_starts_with_digit goto key_is_an_integer_1
  key_is_an_integer_1:
    print key
    if key_starts_with_digit goto key_is_an_integer_2
  key_is_an_integer_2:
    print '] => '
    val = a[key]
    print_r(val)

    branch iter_loop
  iter_end:
    say "\n)"
    .return()
  L2:
    unless type_of_pmc == 'integer' goto L3
    print 'int('
    print a
    say ')'

    .return()
  L3:
    unless type_of_pmc == 'boolean' goto L4
    print 'bool('
    if a goto a_is_true
    print 'false'
    say ')'

    .return()
  a_is_true:
    print 'true'
    say ')'

    .return()
  set_null_type:
    type_of_pmc = 'NULL'
  L4:
    unless type_of_pmc == 'NULL' goto L5
    say type_of_pmc

    .return()
  L5:
    # this should never happen
    print 'unexpectedly encountered a '
    print type_of_pmc
    print " PMC\n"
    _dumper(a)

    .return()
.end


=item C<bool putenv(string setting)>

Set the value of an environment variable

NOT IMPLEMENTED.

=cut

.sub 'putenv'
    not_implemented()
.end

=item C<void register_shutdown_function(string function_name)>

Register a user-level function to be called on request termination

NOT IMPLEMENTED.

=cut

.sub 'register_shutdown_function'
    not_implemented()
.end

=item C<bool register_tick_function(string function_name [, mixed arg [, mixed ... ]])>

Registers a tick callback function

NOT IMPLEMENTED.

=cut

.sub 'register_tick_function'
    not_implemented()
.end

=item C<void restore_include_path()>

Restore the value of the include_path configuration option

NOT IMPLEMENTED.

=cut

.sub 'restore_include_path'
    not_implemented()
.end

=item C<string set_include_path(string new_include_path)>

Sets the include_path configuration option

NOT IMPLEMENTED.

=cut

.sub 'set_include_path'
    not_implemented()
.end

=item C<bool set_magic_quotes_runtime(int new_setting)>

Set the current active configuration setting of magic_quotes_runtime and return previous

NOT IMPLEMENTED.

=cut

.sub 'set_magic_quotes_runtime'
    not_implemented()
.end

=item C<void sleep(int seconds)>

Delay for a given number of seconds

=cut

.sub 'sleep'
    .param pmc args :slurpy

    .local int seconds
    ($I0, seconds) = parse_parameters('l', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    sleep seconds
.end

=item C<array sys_getloadavg()>



NOT IMPLEMENTED.

=cut

.sub 'sys_getloadavg'
    not_implemented()
.end

=item C<mixed time_nanosleep(long seconds, long nanoseconds)>

Delay for a number of seconds and nano seconds

NOT IMPLEMENTED.

=cut

.sub 'time_nanosleep'
    not_implemented()
.end

=item C<mixed time_sleep_until(float timestamp)>

Make the script sleep until the specified time

NOT IMPLEMENTED.

=cut

.sub 'time_sleep_until'
    not_implemented()
.end

=item C<void unregister_tick_function(string function_name)>

Unregisters a tick callback function

NOT IMPLEMENTED.

=cut

.sub 'unregister_tick_function'
    not_implemented()
.end

=item C<void usleep(int micro_seconds)>

Delay for a given number of micro seconds

NOT IMPLEMENTED.

=cut

.sub 'usleep'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
