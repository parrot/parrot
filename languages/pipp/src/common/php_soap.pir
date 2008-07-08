# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_soap.pir - PHP soap  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<object SoapClient::SoapClient( mixed wsdl [, array options])>

SoapClient constructor

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::SoapClient'
    not_implemented()
.end

=item C<mixed SoapClient::__call( string function_name, array arguments [, array options [, array input_headers [, array output_headers]]])>

Calls a SOAP function

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::__call'
    not_implemented()
.end

=item C<string SoapClient::__doRequest()>

SoapClient::__doRequest()

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::__doRequest'
    not_implemented()
.end

=item C<array SoapClient::__getFunctions( void )>

Returns list of SOAP functions

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::__getFunctions'
    not_implemented()
.end

=item C<string SoapClient::__getLastRequest( void )>

Returns last SOAP request

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::__getLastRequest'
    not_implemented()
.end

=item C<string SoapClient::__getLastRequestHeaders(void)>

Returns last SOAP request headers

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::__getLastRequestHeaders'
    not_implemented()
.end

=item C<object SoapClient::__getLastResponse( void )>

Returns last SOAP response

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::__getLastResponse'
    not_implemented()
.end

=item C<string SoapClient::__getLastResponseHeaders(void)>

Returns last SOAP response headers

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::__getLastResponseHeaders'
    not_implemented()
.end

=item C<array SoapClient::__getTypes( void )>

Returns list of SOAP types

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::__getTypes'
    not_implemented()
.end

=item C<void SoapClient::__setCookie(string name [, strung value])>

Sets cookie thet will sent with SOAP request.
The call to this function will effect all folowing calls of SOAP methods.
If value is not specified cookie is removed.

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::__setCookie'
    not_implemented()
.end

=item C<string SoapClient::__setLocation([string new_location])>

Sets the location option (the endpoint URL that will be touched by the
following SOAP requests).
If new_location is not specified or null then SoapClient will use endpoint
from WSDL file.
The function returns old value of location options.

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::__setLocation'
    not_implemented()
.end

=item C<void SoapClient::__setSoapHeaders(array SoapHeaders)>

Sets SOAP headers for subsequent calls (replaces any previous
values).
If no value is specified, all of the headers are removed.

NOT IMPLEMENTED.

=cut

.sub 'SoapClient::__setSoapHeaders'
    not_implemented()
.end

=item C<object SoapFault::SoapFault( string faultcode, string faultstring [, string faultactor [, mixed detail [, string faultname [, mixed headerfault]]]])>

SoapFault constructor

NOT IMPLEMENTED.

=cut

.sub 'SoapFault::SoapFault'
    not_implemented()
.end

=item C<object SoapFault::SoapFault( string faultcode, string faultstring [, string faultactor [, mixed detail [, string faultname [, mixed headerfault]]]])>

SoapFault constructor

NOT IMPLEMENTED.

=cut

.sub 'SoapFault::SoapFault'
    not_implemented()
.end

=item C<object SoapHeader::SoapHeader( string namespace, string name [, mixed data [, bool mustUnderstand [, mixed actor]]])>

SoapHeader constructor

NOT IMPLEMENTED.

=cut

.sub 'SoapHeader::SoapHeader'
    not_implemented()
.end

=item C<object SoapParam::SoapParam( mixed data, string name)>

SoapParam constructor

NOT IMPLEMENTED.

=cut

.sub 'SoapParam::SoapParam'
    not_implemented()
.end

=item C<object SoapServer::SoapServer( mixed wsdl [, array options])>

SoapServer constructor

NOT IMPLEMENTED.

=cut

.sub 'SoapServer::SoapServer'
    not_implemented()
.end

=item C<void SoapServer::addFunction(mixed functions)>

Adds one or several functions those will handle SOAP requests

NOT IMPLEMENTED.

=cut

.sub 'SoapServer::addFunction'
    not_implemented()
.end

=item C< SoapServer::fault( staring code, string string [, string actor [, mixed details [, string name]]] )>

Issue SoapFault indicating an error

NOT IMPLEMENTED.

=cut

.sub 'SoapServer::fault'
    not_implemented()
.end

=item C<array SoapServer::getFunctions(void)>

Returns list of defined functions

NOT IMPLEMENTED.

=cut

.sub 'SoapServer::getFunctions'
    not_implemented()
.end

=item C<void SoapServer::handle( [string soap_request])>

Handles a SOAP request

NOT IMPLEMENTED.

=cut

.sub 'SoapServer::handle'
    not_implemented()
.end

=item C<void SoapServer::setClass(string class_name [, mixed args])>

Sets class which will handle SOAP requests

NOT IMPLEMENTED.

=cut

.sub 'SoapServer::setClass'
    not_implemented()
.end

=item C<void SoapServer::setObject(object)>

Sets object which will handle SOAP requests

NOT IMPLEMENTED.

=cut

.sub 'SoapServer::setObject'
    not_implemented()
.end

=item C<object SoapServer::setPersistence( int mode )>

Sets persistence mode of SoapServer

NOT IMPLEMENTED.

=cut

.sub 'SoapServer::setPersistence'
    not_implemented()
.end

=item C<object SoapVar::SoapVar( mixed data, int encoding [, string type_name [, string type_namespace [, string node_name [, string node_namespace]]]])>

SoapVar constructor

NOT IMPLEMENTED.

=cut

.sub 'SoapVar::SoapVar'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
