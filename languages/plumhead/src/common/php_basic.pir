# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_basic.pir - PHP basic Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<mixed call_user_func(string function_name [, mixed parmeter] [, mixed ...])>

Call a user function which is the first parameter

=cut

.sub 'call_user_func'
    not_implemented()
.end

=item C<mixed call_user_func_array(string function_name, array parameters)>

Call a user function which is the first parameter with the arguments contained in array

=cut

.sub 'call_user_func_array'
    not_implemented()
.end

=item C<mixed call_user_method(string method_name, mixed object [, mixed parameter] [, mixed ...])>

Call a user method on a specific object or class

=cut

.sub 'call_user_method'
    not_implemented()
.end

=item C<mixed call_user_method_array(string method_name, mixed object, array params)>

Call a user method on a specific object or class using a parameter array

=cut

.sub 'call_user_method_array'
    not_implemented()
.end

=item C<int connection_aborted(void)>

Returns true if client disconnected

=cut

.sub 'connection_aborted'
    not_implemented()
.end

=item C<int connection_status(void)>

Returns the connection status bitfield

=cut

.sub 'connection_status'
    not_implemented()
.end

=item C<mixed constant(string const_name)>

Given the name of a constant this function will return the constants associated value

=cut

.sub 'constant'
    not_implemented()
.end

=item C<array error_get_last()>

Get the last occurred error as associative array. Returns NULL if there hasn't been an error yet.

=cut

.sub 'error_get_last'
    not_implemented()
.end

=item C<bool error_log(string message [, int message_type [, string destination [, string extra_headers]]])>

Send an error message somewhere

=cut

.sub 'error_log'
    not_implemented()
.end

=item C<void flush(void)>

Flush the output buffer

=cut

.sub 'flush'
    not_implemented()
.end

=item C<string get_cfg_var(string option_name)>

Get the value of a PHP configuration option

=cut

.sub 'get_cfg_var'
    not_implemented()
.end

=item C<string get_current_user(void)>

Get the name of the owner of the current PHP script

=cut

.sub 'get_current_user'
    not_implemented()
.end

=item C<string get_include_path()>

Get the current include_path configuration option

=cut

.sub 'get_include_path'
    not_implemented()
.end

=item C<int get_magic_quotes_gpc(void)>

Get the current active configuration setting of magic_quotes_gpc

=cut

.sub 'get_magic_quotes_gpc'
    not_implemented()
.end

=item C<int get_magic_quotes_runtime(void)>

Get the current active configuration setting of magic_quotes_runtime

=cut

.sub 'get_magic_quotes_runtime'
    not_implemented()
.end

=item C<string getenv(string varname)>

Get the value of an environment variable

=cut

.sub 'getenv'
    not_implemented()
.end

=item C<array getopt(string options [, array longopts])>

Get options from the command line argument list

=cut

.sub 'getopt'
    not_implemented()
.end

=item C<int getprotobyname(string name)>

Returns protocol number associated with name as per /etc/protocols

=cut

.sub 'getprotobyname'
    not_implemented()
.end

=item C<string getprotobynumber(int proto)>

Returns protocol name associated with protocol number proto

=cut

.sub 'getprotobynumber'
    not_implemented()
.end

=item C<int getservbyname(string service, string protocol)>

Returns port associated with service. Protocol must be "tcp" or "udp"

=cut

.sub 'getservbyname'
    not_implemented()
.end

=item C<string getservbyport(int port, string protocol)>

Returns service name associated with port. Protocol must be "tcp" or "udp"

=cut

.sub 'getservbyport'
    not_implemented()
.end

=item C<bool highlight_file(string file_name [, bool return] )>

Syntax highlight a source file

=cut

.sub 'highlight_file'
    not_implemented()
.end

=item C<bool highlight_string(string string [, bool return] )>

Syntax highlight a string or optionally return it

=cut

.sub 'highlight_string'
    not_implemented()
.end

=item C<int ignore_user_abort(bool value)>

Set whether we want to ignore a user abort event or not

=cut

.sub 'ignore_user_abort'
    not_implemented()
.end

=item C<bool import_request_variables(string types [, string prefix])>

Import GET/POST/Cookie variables into the global scope

=cut

.sub 'import_request_variables'
    not_implemented()
.end

=item C<string inet_ntop(string in_addr)>

Converts a packed inet address to a human readable IP address string

=cut

.sub 'inet_ntop'
    not_implemented()
.end

=item C<string inet_pton(string ip_address)>

Converts a human readable IP address to a packed binary string

=cut

.sub 'inet_pton'
    not_implemented()
.end

=item C<string ini_get(string varname)>

Get a configuration option

=cut

.sub 'ini_get'
    not_implemented()
.end

=item C<array ini_get_all([string extension])>

Get all configuration options

=cut

.sub 'ini_get_all'
    not_implemented()
.end

=item C<void ini_restore(string varname)>

Restore the value of a configuration option specified by varname

=cut

.sub 'ini_restore'
    not_implemented()
.end

=item C<string ini_set(string varname, string newvalue)>

Set a configuration option, returns false on error and the old value of the configuration option on success

=cut

.sub 'ini_set'
    not_implemented()
.end

=item C<int ip2long(string ip_address)>

Converts a string containing an (IPv4) Internet Protocol dotted address into a proper address

=cut

.sub 'ip2long'
    not_implemented()
.end

=item C<bool is_uploaded_file(string path)>

Check if file was created by rfc1867 upload

=cut

.sub 'is_uploaded_file'
    not_implemented()
.end

=item C<string long2ip(int proper_address)>

Converts an (IPv4) Internet network address into a string in Internet standard dotted format

=cut

.sub 'long2ip'
    not_implemented()
.end

=item C<bool move_uploaded_file(string path, string new_path)>

Move a file if and only if it was created by an upload

=cut

.sub 'move_uploaded_file'
    not_implemented()
.end

=item C<array parse_ini_file(string filename [, bool process_sections])>

Parse configuration file

=cut

.sub 'parse_ini_file'
    not_implemented()
.end

=item C<string php_strip_whitespace(string file_name)>

Return source with stripped comments and whitespace

=cut

.sub 'php_strip_whitespace'
    not_implemented()
.end

=item C<mixed print_r(mixed var [, bool return])>

Prints out or returns information about the specified variable

=cut

.sub 'print_r'
    not_implemented()
.end

=item C<bool putenv(string setting)>

Set the value of an environment variable

=cut

.sub 'putenv'
    not_implemented()
.end

=item C<void register_shutdown_function(string function_name)>

Register a user-level function to be called on request termination

=cut

.sub 'register_shutdown_function'
    not_implemented()
.end

=item C<bool register_tick_function(string function_name [, mixed arg [, mixed ... ]])>

Registers a tick callback function

=cut

.sub 'register_tick_function'
    not_implemented()
.end

=item C<void restore_include_path()>

Restore the value of the include_path configuration option

=cut

.sub 'restore_include_path'
    not_implemented()
.end

=item C<string set_include_path(string new_include_path)>

Sets the include_path configuration option

=cut

.sub 'set_include_path'
    not_implemented()
.end

=item C<bool set_magic_quotes_runtime(int new_setting)>

Set the current active configuration setting of magic_quotes_runtime and return previous

=cut

.sub 'set_magic_quotes_runtime'
    not_implemented()
.end

=item C<void sleep(int seconds)>

Delay for a given number of seconds

=cut

.sub 'sleep'
    not_implemented()
.end

=item C<array sys_getloadavg()>



=cut

.sub 'sys_getloadavg'
    not_implemented()
.end

=item C<mixed time_nanosleep(long seconds, long nanoseconds)>

Delay for a number of seconds and nano seconds

=cut

.sub 'time_nanosleep'
    not_implemented()
.end

=item C<mixed time_sleep_until(float timestamp)>

Make the script sleep until the specified time

=cut

.sub 'time_sleep_until'
    not_implemented()
.end

=item C<void unregister_tick_function(string function_name)>

Unregisters a tick callback function

=cut

.sub 'unregister_tick_function'
    not_implemented()
.end

=item C<void usleep(int micro_seconds)>

Delay for a given number of micro seconds

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
