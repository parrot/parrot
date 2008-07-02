# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_dba.pir - PHP dba  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<void dba_close(resource handle)>

Closes database

NOT IMPLEMENTED.

=cut

.sub 'dba_close'
    not_implemented()
.end

=item C<bool dba_delete(string key, resource handle)>

Deletes the entry associated with key
If inifile: remove all other key lines

NOT IMPLEMENTED.

=cut

.sub 'dba_delete'
    not_implemented()
.end

=item C<bool dba_exists(string key, resource handle)>

Checks, if the specified key exists

NOT IMPLEMENTED.

=cut

.sub 'dba_exists'
    not_implemented()
.end

=item C<string dba_fetch(string key, [int skip ,] resource handle)>

Fetches the data associated with key

NOT IMPLEMENTED.

=cut

.sub 'dba_fetch'
    not_implemented()
.end

=item C<string dba_firstkey(resource handle)>

Resets the internal key pointer and returns the first key

NOT IMPLEMENTED.

=cut

.sub 'dba_firstkey'
    not_implemented()
.end

=item C<array dba_handlers([bool full_info])>

List configured database handlers

NOT IMPLEMENTED.

=cut

.sub 'dba_handlers'
    not_implemented()
.end

=item C<bool dba_insert(string key, string value, resource handle)>

If not inifile: Insert value as key, return false, if key exists already
If inifile: Add vakue as key (next instance of key)

NOT IMPLEMENTED.

=cut

.sub 'dba_insert'
    not_implemented()
.end

=item C<array|false dba_key_split(string key)>

Splits an inifile key into an array of the form array(0=>group,1=>value_name) but returns false if input is false or null

NOT IMPLEMENTED.

=cut

.sub 'dba_key_split'
    not_implemented()
.end

=item C<array dba_list()>

List opened databases

NOT IMPLEMENTED.

=cut

.sub 'dba_list'
    not_implemented()
.end

=item C<string dba_nextkey(resource handle)>

Returns the next key

NOT IMPLEMENTED.

=cut

.sub 'dba_nextkey'
    not_implemented()
.end

=item C<resource dba_open(string path, string mode [, string handlername, string ...])>

Opens path using the specified handler in mode

NOT IMPLEMENTED.

=cut

.sub 'dba_open'
    not_implemented()
.end

=item C<bool dba_optimize(resource handle)>

Optimizes (e.g. clean up, vacuum) database

NOT IMPLEMENTED.

=cut

.sub 'dba_optimize'
    not_implemented()
.end

=item C<resource dba_popen(string path, string mode [, string handlername, string ...])>

Opens path using the specified handler in mode persistently

NOT IMPLEMENTED.

=cut

.sub 'dba_popen'
    not_implemented()
.end

=item C<bool dba_replace(string key, string value, resource handle)>

Inserts value as key, replaces key, if key exists already
If inifile: remove all other key lines

NOT IMPLEMENTED.

=cut

.sub 'dba_replace'
    not_implemented()
.end

=item C<bool dba_sync(resource handle)>

Synchronizes database

NOT IMPLEMENTED.

=cut

.sub 'dba_sync'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
