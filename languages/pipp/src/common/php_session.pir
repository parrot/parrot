# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_session.pir - PHP session  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int session_cache_expire([int new_cache_expire])>

Return the current cache expire. If new_cache_expire is given, the current cache_expire is replaced with new_cache_expire

NOT IMPLEMENTED.

=cut

.sub 'session_cache_expire'
    not_implemented()
.end

=item C<string session_cache_limiter([string new_cache_limiter])>

Return the current cache limiter. If new_cache_limited is given, the current cache_limiter is replaced with new_cache_limiter

NOT IMPLEMENTED.

=cut

.sub 'session_cache_limiter'
    not_implemented()
.end

=item C<bool session_decode(string data)>

Deserializes data and reinitializes the variables

NOT IMPLEMENTED.

=cut

.sub 'session_decode'
    not_implemented()
.end

=item C<bool session_destroy(void)>

Destroy the current session and all data associated with it

NOT IMPLEMENTED.

=cut

.sub 'session_destroy'
    not_implemented()
.end

=item C<string session_encode(void)>

Serializes the current setup and returns the serialized representation

NOT IMPLEMENTED.

=cut

.sub 'session_encode'
    not_implemented()
.end

=item C<array session_get_cookie_params(void)>

Return the session cookie parameters

NOT IMPLEMENTED.

=cut

.sub 'session_get_cookie_params'
    not_implemented()
.end

=item C<string session_id([string newid])>

Return the current session id. If newid is given, the session id is replaced with newid

NOT IMPLEMENTED.

=cut

.sub 'session_id'
    not_implemented()
.end

=item C<bool session_is_registered(string varname)>

Checks if a variable is registered in session

NOT IMPLEMENTED.

=cut

.sub 'session_is_registered'
    not_implemented()
.end

=item C<string session_module_name([string newname])>

Return the current module name used for accessing session data. If newname is given, the module name is replaced with newname

NOT IMPLEMENTED.

=cut

.sub 'session_module_name'
    not_implemented()
.end

=item C<string session_name([string newname])>

Return the current session name. If newname is given, the session name is replaced with newname

NOT IMPLEMENTED.

=cut

.sub 'session_name'
    not_implemented()
.end

=item C<bool session_regenerate_id([bool delete_old_session])>

Update the current session id with a newly generated one. If delete_old_session is set to true, remove the old session.

NOT IMPLEMENTED.

=cut

.sub 'session_regenerate_id'
    not_implemented()
.end

=item C<bool session_register(mixed var_names [, mixed ...])>

Adds varname(s) to the list of variables which are freezed at the session end

NOT IMPLEMENTED.

=cut

.sub 'session_register'
    not_implemented()
.end

=item C<string session_save_path([string newname])>

Return the current save path passed to module_name. If newname is given, the save path is replaced with newname

NOT IMPLEMENTED.

=cut

.sub 'session_save_path'
    not_implemented()
.end

=item C<void session_set_cookie_params(int lifetime [, string path [, string domain [, bool secure[, bool httponly]]]])>

Set session cookie parameters

NOT IMPLEMENTED.

=cut

.sub 'session_set_cookie_params'
    not_implemented()
.end

=item C<void session_set_save_handler(string open, string close, string read, string write, string destroy, string gc)>

Sets user-level functions

NOT IMPLEMENTED.

=cut

.sub 'session_set_save_handler'
    not_implemented()
.end

=item C<bool session_start(void)>

Begin session - reinitializes freezed variables, registers browsers etc

NOT IMPLEMENTED.

=cut

.sub 'session_start'
    not_implemented()
.end

=item C<bool session_unregister(string varname)>

Removes varname from the list of variables which are freezed at the session end

NOT IMPLEMENTED.

=cut

.sub 'session_unregister'
    not_implemented()
.end

=item C<void session_unset(void)>

Unset all registered variables

NOT IMPLEMENTED.

=cut

.sub 'session_unset'
    not_implemented()
.end

=item C<void session_write_close(void)>

Write session data and end session

NOT IMPLEMENTED.

=cut

.sub 'session_write_close'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
