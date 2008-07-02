# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_openssl.pir - PHP openssl  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool openssl_csr_export(resource csr, string &out [, bool notext=true])>

Exports a CSR to file or a var

NOT IMPLEMENTED.

=cut

.sub 'openssl_csr_export'
    not_implemented()
.end

=item C<bool openssl_csr_export_to_file(resource csr, string outfilename [, bool notext=true])>

Exports a CSR to file

NOT IMPLEMENTED.

=cut

.sub 'openssl_csr_export_to_file'
    not_implemented()
.end

=item C<mixed openssl_csr_get_public_key(mixed csr)>

Returns the subject of a CERT or FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'openssl_csr_get_public_key'
    not_implemented()
.end

=item C<mixed openssl_csr_get_subject(mixed csr)>

Returns the subject of a CERT or FALSE on error

NOT IMPLEMENTED.

=cut

.sub 'openssl_csr_get_subject'
    not_implemented()
.end

=item C<bool openssl_csr_new(array dn, resource &privkey [, array configargs, array extraattribs])>

Generates a privkey and CSR

NOT IMPLEMENTED.

=cut

.sub 'openssl_csr_new'
    not_implemented()
.end

=item C<resource openssl_csr_sign(mixed csr, mixed x509, mixed priv_key, long days [, array config_args [, long serial]])>

Signs a cert with another CERT

NOT IMPLEMENTED.

=cut

.sub 'openssl_csr_sign'
    not_implemented()
.end

=item C<mixed openssl_error_string(void)>

Returns a description of the last error, and alters the index of the error messages. Returns false when the are no more messages

NOT IMPLEMENTED.

=cut

.sub 'openssl_error_string'
    not_implemented()
.end

=item C<bool openssl_open(string data, &string opendata, string ekey, mixed privkey)>

Opens data

NOT IMPLEMENTED.

=cut

.sub 'openssl_open'
    not_implemented()
.end

=item C<bool openssl_pkcs12_export(mixed x509, string &out, mixed priv_key, string pass[, array args])>

Creates and exports a PKCS12 to a var

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkcs12_export'
    not_implemented()
.end

=item C<bool openssl_pkcs12_export_to_file(mixed x509, string filename, mixed priv_key, string pass[, array args])>

Creates and exports a PKCS to file

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkcs12_export_to_file'
    not_implemented()
.end

=item C<bool openssl_pkcs12_read(string PKCS12, array &certs, string pass)>

Parses a PKCS12 to an array

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkcs12_read'
    not_implemented()
.end

=item C<bool openssl_pkcs7_decrypt(string infilename, string outfilename, mixed recipcert [, mixed recipkey])>

Decrypts the S/MIME message in the file name infilename and output the results to the file name outfilename.  recipcert is a CERT for one of the recipients. recipkey specifies the private key matching recipcert, if recipcert does not include the key

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkcs7_decrypt'
    not_implemented()
.end

=item C<bool openssl_pkcs7_encrypt(string infile, string outfile, mixed recipcerts, array headers [, long flags [, long cipher]])>

Encrypts the message in the file named infile with the certificates in recipcerts and output the result to the file named outfile

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkcs7_encrypt'
    not_implemented()
.end

=item C<bool openssl_pkcs7_sign(string infile, string outfile, mixed signcert, mixed signkey, array headers [, long flags [, string extracertsfilename]])>

Signs the MIME message in the file named infile with signcert/signkey and output the result to file name outfile. headers lists plain text headers to exclude from the signed portion of the message, and should include to, from and subject as a minimum

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkcs7_sign'
    not_implemented()
.end

=item C<bool openssl_pkcs7_verify(string filename, long flags [, string signerscerts [, array cainfo [, string extracerts [, string content]]]])>

Verifys that the data block is intact, the signer is who they say they are, and returns the CERTs of the signers

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkcs7_verify'
    not_implemented()
.end

=item C<bool openssl_pkey_export(mixed key, &mixed out [, string passphrase [, array config_args]])>

Gets an exportable representation of a key into a string or file

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkey_export'
    not_implemented()
.end

=item C<bool openssl_pkey_export_to_file(mixed key, string outfilename [, string passphrase, array config_args)>

Gets an exportable representation of a key into a file

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkey_export_to_file'
    not_implemented()
.end

=item C<void openssl_pkey_free(int key)>

Frees a key

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkey_free'
    not_implemented()
.end

=item C<resource openssl_pkey_get_details(resource key)>

returns an array with the key details (bits, pkey, type)

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkey_get_details'
    not_implemented()
.end

=item C<int openssl_pkey_get_private(string key [, string passphrase])>

Gets private keys

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkey_get_private'
    not_implemented()
.end

=item C<int openssl_pkey_get_public(mixed cert)>

Gets public key from X.509 certificate

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkey_get_public'
    not_implemented()
.end

=item C<resource openssl_pkey_new([array configargs])>

Generates a new private key

NOT IMPLEMENTED.

=cut

.sub 'openssl_pkey_new'
    not_implemented()
.end

=item C<bool openssl_private_decrypt(string data, string decrypted, mixed key [, int padding])>

Decrypts data with private key

NOT IMPLEMENTED.

=cut

.sub 'openssl_private_decrypt'
    not_implemented()
.end

=item C<bool openssl_private_encrypt(string data, string crypted, mixed key [, int padding])>

Encrypts data with private key

NOT IMPLEMENTED.

=cut

.sub 'openssl_private_encrypt'
    not_implemented()
.end

=item C<bool openssl_public_decrypt(string data, string crypted, resource key [, int padding])>

Decrypts data with public key

NOT IMPLEMENTED.

=cut

.sub 'openssl_public_decrypt'
    not_implemented()
.end

=item C<bool openssl_public_encrypt(string data, string crypted, mixed key [, int padding])>

Encrypts data with public key

NOT IMPLEMENTED.

=cut

.sub 'openssl_public_encrypt'
    not_implemented()
.end

=item C<int openssl_seal(string data, &string sealdata, &array ekeys, array pubkeys)>

Seals data

NOT IMPLEMENTED.

=cut

.sub 'openssl_seal'
    not_implemented()
.end

=item C<bool openssl_sign(string data, &string signature, mixed key[, int signature_alg])>

Signs data

NOT IMPLEMENTED.

=cut

.sub 'openssl_sign'
    not_implemented()
.end

=item C<int openssl_verify(string data, string signature, mixed key)>

Verifys data

NOT IMPLEMENTED.

=cut

.sub 'openssl_verify'
    not_implemented()
.end

=item C<bool openssl_x509_check_private_key(mixed cert, mixed key)>

Checks if a private key corresponds to a CERT

NOT IMPLEMENTED.

=cut

.sub 'openssl_x509_check_private_key'
    not_implemented()
.end

=item C<int openssl_x509_checkpurpose(mixed x509cert, int purpose, array cainfo [, string untrustedfile])>

Checks the CERT to see if it can be used for the purpose in purpose. cainfo holds information about trusted CAs

NOT IMPLEMENTED.

=cut

.sub 'openssl_x509_checkpurpose'
    not_implemented()
.end

=item C<bool openssl_x509_export(mixed x509, string &out [, bool notext = true])>

Exports a CERT to file or a var

NOT IMPLEMENTED.

=cut

.sub 'openssl_x509_export'
    not_implemented()
.end

=item C<bool openssl_x509_export_to_file(mixed x509, string outfilename [, bool notext = true])>

Exports a CERT to file or a var

NOT IMPLEMENTED.

=cut

.sub 'openssl_x509_export_to_file'
    not_implemented()
.end

=item C<void openssl_x509_free(resource x509)>

Frees X.509 certificates

NOT IMPLEMENTED.

=cut

.sub 'openssl_x509_free'
    not_implemented()
.end

=item C<array openssl_x509_parse(mixed x509 [, bool shortnames=true])>

Returns an array of the fields/values of the CERT

NOT IMPLEMENTED.

=cut

.sub 'openssl_x509_parse'
    not_implemented()
.end

=item C<resource openssl_x509_read(mixed cert)>

Reads X.509 certificates

NOT IMPLEMENTED.

=cut

.sub 'openssl_x509_read'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
