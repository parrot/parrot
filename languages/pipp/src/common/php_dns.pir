# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_dns.pir - PHP dns Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int dns_check_record(string host [, string type])>

Check DNS records corresponding to a given Internet host name or IP address

NOT IMPLEMENTED.

=cut

.sub 'dns_check_record'
    not_implemented()
.end

=item C<bool dns_get_mx(string hostname, array mxhosts [, array weight])>

Get MX records corresponding to a given Internet host name

NOT IMPLEMENTED.

=cut

.sub 'dns_get_mx'
    not_implemented()
.end

=item C<array|false dns_get_record(string hostname [, int type[, array authns, array addtl]])>

Get any Resource Record corresponding to a given Internet host name

NOT IMPLEMENTED.

=cut

.sub 'dns_get_record'
    not_implemented()
.end

=item C<string gethostbyaddr(string ip_address)>

Get the Internet host name corresponding to a given IP address

NOT IMPLEMENTED.

=cut

.sub 'gethostbyaddr'
    not_implemented()
.end

=item C<string gethostbyname(string hostname)>

Get the IP address corresponding to a given Internet host name

NOT IMPLEMENTED.

=cut

.sub 'gethostbyname'
    not_implemented()
.end

=item C<array gethostbynamel(string hostname)>

Return a list of IP addresses that a given hostname resolves to.

NOT IMPLEMENTED.

=cut

.sub 'gethostbynamel'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
