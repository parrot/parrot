# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_snmp.pir - PHP snmp  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<void php_snmpv3(INTERNAL_FUNCTION_PARAMETERS, int st)>

*
* Generic SNMPv3 object fetcher
* From here is passed on the the common internal object fetcher.
*
* st=SNMP_CMD_GET   snmp3_get() - query an agent and return a single value.
* st=SNMP_CMD_GETNEXT   snmp3_getnext() - query an agent and return the next single value.
* st=SNMP_CMD_WALK   snmp3_walk() - walk the mib and return a single dimensional array
*                       containing the values.
* st=SNMP_CMD_REALWALK   snmp3_real_walk() - walk the mib and return an
*                            array of oid,value pairs.
* st=SNMP_CMD_SET  snmp3_set() - query an agent and set a single value
*


NOT IMPLEMENTED.

=cut

.sub 'php_snmpv3'
    not_implemented()
.end

=item C<string snmp2_get(string host, string community, string object_id [, int timeout [, int retries]])>

Fetch a SNMP object

NOT IMPLEMENTED.

=cut

.sub 'snmp2_get'
    not_implemented()
.end

=item C<string snmp2_getnext(string host, string community, string object_id [, int timeout [, int retries]])>

Fetch a SNMP object

NOT IMPLEMENTED.

=cut

.sub 'snmp2_getnext'
    not_implemented()
.end

=item C<array snmp2_real_walk(string host, string community, string object_id [, int timeout [, int retries]])>

Return all objects including their respective object id withing the specified one

NOT IMPLEMENTED.

=cut

.sub 'snmp2_real_walk'
    not_implemented()
.end

=item C<int snmp2_set(string host, string community, string object_id, string type, mixed value [, int timeout [, int retries]])>

Set the value of a SNMP object

NOT IMPLEMENTED.

=cut

.sub 'snmp2_set'
    not_implemented()
.end

=item C<array snmp2_walk(string host, string community, string object_id [, int timeout [, int retries]])>

Return all objects under the specified object id

NOT IMPLEMENTED.

=cut

.sub 'snmp2_walk'
    not_implemented()
.end

=item C<int snmp3_get(string host, string sec_name, string sec_level, string auth_protocol, string auth_passphrase, string priv_protocol, string priv_passphrase, string object_id [, int timeout [, int retries]])>

Fetch the value of a SNMP object

NOT IMPLEMENTED.

=cut

.sub 'snmp3_get'
    not_implemented()
.end

=item C<int snmp3_getnext(string host, string sec_name, string sec_level, string auth_protocol, string auth_passphrase, string priv_protocol, string priv_passphrase, string object_id [, int timeout [, int retries]])>

Fetch the value of a SNMP object

NOT IMPLEMENTED.

=cut

.sub 'snmp3_getnext'
    not_implemented()
.end

=item C<int snmp3_real_walk(string host, string sec_name, string sec_level, string auth_protocol, string auth_passphrase, string priv_protocol, string priv_passphrase, string object_id [, int timeout [, int retries]])>

Fetch the value of a SNMP object

NOT IMPLEMENTED.

=cut

.sub 'snmp3_real_walk'
    not_implemented()
.end

=item C<int snmp3_set(string host, string sec_name, string sec_level, string auth_protocol, string auth_passphrase, string priv_protocol, string priv_passphrase, string object_id, string type, mixed value [, int timeout [, int retries]])>

Fetch the value of a SNMP object

NOT IMPLEMENTED.

=cut

.sub 'snmp3_set'
    not_implemented()
.end

=item C<int snmp3_walk(string host, string sec_name, string sec_level, string auth_protocol, string auth_passphrase, string priv_protocol, string priv_passphrase, string object_id [, int timeout [, int retries]])>

Fetch the value of a SNMP object

NOT IMPLEMENTED.

=cut

.sub 'snmp3_walk'
    not_implemented()
.end

=item C<bool snmp_get_quick_print(void)>

Return the current status of quick_print

NOT IMPLEMENTED.

=cut

.sub 'snmp_get_quick_print'
    not_implemented()
.end

=item C<int snmp_get_valueretrieval()>

Return the method how the SNMP values will be returned

NOT IMPLEMENTED.

=cut

.sub 'snmp_get_valueretrieval'
    not_implemented()
.end

=item C<int snmp_read_mib(string filename)>

Reads and parses a MIB file into the active MIB tree.

NOT IMPLEMENTED.

=cut

.sub 'snmp_read_mib'
    not_implemented()
.end

=item C<void snmp_set_enum_print(int enum_print)>

Return all values that are enums with their enum value instead of the raw integer

NOT IMPLEMENTED.

=cut

.sub 'snmp_set_enum_print'
    not_implemented()
.end

=item C<void snmp_set_oid_output_format(int oid_format)>

Set the OID output format.

NOT IMPLEMENTED.

=cut

.sub 'snmp_set_oid_output_format'
    not_implemented()
.end

=item C<void snmp_set_quick_print(int quick_print)>

Return all objects including their respective object id withing the specified one

NOT IMPLEMENTED.

=cut

.sub 'snmp_set_quick_print'
    not_implemented()
.end

=item C<int snmp_set_valueretrieval(int method)>

Specify the method how the SNMP values will be returned

NOT IMPLEMENTED.

=cut

.sub 'snmp_set_valueretrieval'
    not_implemented()
.end

=item C<string snmpget(string host, string community, string object_id [, int timeout [, int retries]])>

Fetch a SNMP object

NOT IMPLEMENTED.

=cut

.sub 'snmpget'
    not_implemented()
.end

=item C<string snmpgetnext(string host, string community, string object_id [, int timeout [, int retries]])>

Fetch a SNMP object

NOT IMPLEMENTED.

=cut

.sub 'snmpgetnext'
    not_implemented()
.end

=item C<array snmprealwalk(string host, string community, string object_id [, int timeout [, int retries]])>

Return all objects including their respective object id withing the specified one

NOT IMPLEMENTED.

=cut

.sub 'snmprealwalk'
    not_implemented()
.end

=item C<int snmpset(string host, string community, string object_id, string type, mixed value [, int timeout [, int retries]])>

Set the value of a SNMP object

NOT IMPLEMENTED.

=cut

.sub 'snmpset'
    not_implemented()
.end

=item C<array snmpwalk(string host, string community, string object_id [, int timeout [, int retries]])>

Return all objects under the specified object id

NOT IMPLEMENTED.

=cut

.sub 'snmpwalk'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
