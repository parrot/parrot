# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_ldap.pir - PHP ldap  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string ldap_8859_to_t61(string value)>

Translate 8859 characters to t61 characters

NOT IMPLEMENTED.

=cut

.sub 'ldap_8859_to_t61'
    not_implemented()
.end

=item C<bool ldap_add(resource link, string dn, array entry)>

Add entries to LDAP directory

NOT IMPLEMENTED.

=cut

.sub 'ldap_add'
    not_implemented()
.end

=item C<bool ldap_bind(resource link [, string dn, string password])>

Bind to LDAP directory

NOT IMPLEMENTED.

=cut

.sub 'ldap_bind'
    not_implemented()
.end

=item C<bool ldap_compare(resource link, string dn, string attr, string value)>

Determine if an entry has a specific value for one of its attributes

NOT IMPLEMENTED.

=cut

.sub 'ldap_compare'
    not_implemented()
.end

=item C<resource ldap_connect([string host [, int port]])>

Connect to an LDAP server

NOT IMPLEMENTED.

=cut

.sub 'ldap_connect'
    not_implemented()
.end

=item C<int ldap_count_entries(resource link, resource result)>

Count the number of entries in a search result

NOT IMPLEMENTED.

=cut

.sub 'ldap_count_entries'
    not_implemented()
.end

=item C<bool ldap_delete(resource link, string dn)>

Delete an entry from a directory

NOT IMPLEMENTED.

=cut

.sub 'ldap_delete'
    not_implemented()
.end

=item C<string ldap_dn2ufn(string dn)>

Convert DN to User Friendly Naming format

NOT IMPLEMENTED.

=cut

.sub 'ldap_dn2ufn'
    not_implemented()
.end

=item C<string ldap_err2str(int errno)>

Convert error number to error string

NOT IMPLEMENTED.

=cut

.sub 'ldap_err2str'
    not_implemented()
.end

=item C<int ldap_errno(resource link)>

Get the current ldap error number

NOT IMPLEMENTED.

=cut

.sub 'ldap_errno'
    not_implemented()
.end

=item C<string ldap_error(resource link)>

Get the current ldap error string

NOT IMPLEMENTED.

=cut

.sub 'ldap_error'
    not_implemented()
.end

=item C<array ldap_explode_dn(string dn, int with_attrib)>

Splits DN into its component parts

NOT IMPLEMENTED.

=cut

.sub 'ldap_explode_dn'
    not_implemented()
.end

=item C<string ldap_first_attribute(resource link, resource result_entry)>

Return first attribute

NOT IMPLEMENTED.

=cut

.sub 'ldap_first_attribute'
    not_implemented()
.end

=item C<resource ldap_first_entry(resource link, resource result)>

Return first result id

NOT IMPLEMENTED.

=cut

.sub 'ldap_first_entry'
    not_implemented()
.end

=item C<resource ldap_first_reference(resource link, resource result)>

Return first reference

NOT IMPLEMENTED.

=cut

.sub 'ldap_first_reference'
    not_implemented()
.end

=item C<bool ldap_free_result(resource result)>

Free result memory

NOT IMPLEMENTED.

=cut

.sub 'ldap_free_result'
    not_implemented()
.end

=item C<array ldap_get_attributes(resource link, resource result_entry)>

Get attributes from a search result entry

NOT IMPLEMENTED.

=cut

.sub 'ldap_get_attributes'
    not_implemented()
.end

=item C<string ldap_get_dn(resource link, resource result_entry)>

Get the DN of a result entry

NOT IMPLEMENTED.

=cut

.sub 'ldap_get_dn'
    not_implemented()
.end

=item C<array ldap_get_entries(resource link, resource result)>

Get all result entries

NOT IMPLEMENTED.

=cut

.sub 'ldap_get_entries'
    not_implemented()
.end

=item C<bool ldap_get_option(resource link, int option, mixed retval)>

Get the current value of various session-wide parameters

NOT IMPLEMENTED.

=cut

.sub 'ldap_get_option'
    not_implemented()
.end

=item C<array ldap_get_values_len(resource link, resource result_entry, string attribute)>

Get all values with lengths from a result entry

NOT IMPLEMENTED.

=cut

.sub 'ldap_get_values_len'
    not_implemented()
.end

=item C<resource ldap_list(resource link, string base_dn, string filter [, array attrs [, int attrsonly [, int sizelimit [, int timelimit [, int deref]]]]])>

Single-level search

NOT IMPLEMENTED.

=cut

.sub 'ldap_list'
    not_implemented()
.end

=item C<bool ldap_mod_add(resource link, string dn, array entry)>

Add attribute values to current

NOT IMPLEMENTED.

=cut

.sub 'ldap_mod_add'
    not_implemented()
.end

=item C<bool ldap_mod_del(resource link, string dn, array entry)>

Delete attribute values

NOT IMPLEMENTED.

=cut

.sub 'ldap_mod_del'
    not_implemented()
.end

=item C<bool ldap_mod_replace(resource link, string dn, array entry)>

Replace attribute values with new ones

NOT IMPLEMENTED.

=cut

.sub 'ldap_mod_replace'
    not_implemented()
.end

=item C<string ldap_next_attribute(resource link, resource result_entry)>

Get the next attribute in result

NOT IMPLEMENTED.

=cut

.sub 'ldap_next_attribute'
    not_implemented()
.end

=item C<resource ldap_next_entry(resource link, resource result_entry)>

Get next result entry

NOT IMPLEMENTED.

=cut

.sub 'ldap_next_entry'
    not_implemented()
.end

=item C<resource ldap_next_reference(resource link, resource reference_entry)>

Get next reference

NOT IMPLEMENTED.

=cut

.sub 'ldap_next_reference'
    not_implemented()
.end

=item C<bool ldap_parse_reference(resource link, resource reference_entry, array referrals)>

Extract information from reference entry

NOT IMPLEMENTED.

=cut

.sub 'ldap_parse_reference'
    not_implemented()
.end

=item C<bool ldap_parse_result(resource link, resource result, int errcode, string matcheddn, string errmsg, array referrals)>

Extract information from result

NOT IMPLEMENTED.

=cut

.sub 'ldap_parse_result'
    not_implemented()
.end

=item C<resource ldap_read(resource link, string base_dn, string filter [, array attrs [, int attrsonly [, int sizelimit [, int timelimit [, int deref]]]]])>

Read an entry

NOT IMPLEMENTED.

=cut

.sub 'ldap_read'
    not_implemented()
.end

=item C<bool ldap_rename(resource link, string dn, string newrdn, string newparent, bool deleteoldrdn)>

Modify the name of an entry

NOT IMPLEMENTED.

=cut

.sub 'ldap_rename'
    not_implemented()
.end

=item C<bool ldap_sasl_bind(resource link [, string binddn, string password, string sasl_mech, string sasl_realm, string sasl_authc_id, string sasl_authz_id, string props])>

Bind to LDAP directory using SASL

NOT IMPLEMENTED.

=cut

.sub 'ldap_sasl_bind'
    not_implemented()
.end

=item C<resource ldap_search(resource link, string base_dn, string filter [, array attrs [, int attrsonly [, int sizelimit [, int timelimit [, int deref]]]]])>

Search LDAP tree under base_dn

NOT IMPLEMENTED.

=cut

.sub 'ldap_search'
    not_implemented()
.end

=item C<bool ldap_set_option(resource link, int option, mixed newval)>

Set the value of various session-wide parameters

NOT IMPLEMENTED.

=cut

.sub 'ldap_set_option'
    not_implemented()
.end

=item C<bool ldap_set_rebind_proc(resource link, string callback)>

Set a callback function to do re-binds on referral chasing.

NOT IMPLEMENTED.

=cut

.sub 'ldap_set_rebind_proc'
    not_implemented()
.end

=item C<bool ldap_sort(resource link, resource result, string sortfilter)>

Sort LDAP result entries

NOT IMPLEMENTED.

=cut

.sub 'ldap_sort'
    not_implemented()
.end

=item C<bool ldap_start_tls(resource link)>

Start TLS

NOT IMPLEMENTED.

=cut

.sub 'ldap_start_tls'
    not_implemented()
.end

=item C<string ldap_t61_to_8859(string value)>

Translate t61 characters to 8859 characters

NOT IMPLEMENTED.

=cut

.sub 'ldap_t61_to_8859'
    not_implemented()
.end

=item C<bool ldap_unbind(resource link)>

Unbind from LDAP directory

NOT IMPLEMENTED.

=cut

.sub 'ldap_unbind'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
