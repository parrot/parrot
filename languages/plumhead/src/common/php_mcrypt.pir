# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_mcrypt.pir - PHP mcrypt  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string mcrypt_cbc(int cipher, string key, string data, int mode, string iv)>

CBC crypt/decrypt data using key key with cipher cipher starting with iv

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_cbc'
    not_implemented()
.end

=item C<string mcrypt_cfb(int cipher, string key, string data, int mode, string iv)>

CFB crypt/decrypt data using key key with cipher cipher starting with iv

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_cfb'
    not_implemented()
.end

=item C<string mcrypt_create_iv(int size, int source)>

Create an initialization vector (IV)

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_create_iv'
    not_implemented()
.end

=item C<string mcrypt_decrypt(string cipher, string key, string data, string mode, string iv)>

OFB crypt/decrypt data using key key with cipher cipher starting with iv

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_decrypt'
    not_implemented()
.end

=item C<string mcrypt_ecb(int cipher, string key, string data, int mode, string iv)>

ECB crypt/decrypt data using key key with cipher cipher starting with iv

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_ecb'
    not_implemented()
.end

=item C<string mcrypt_enc_get_algorithms_name(resource td)>

Returns the name of the algorithm specified by the descriptor td

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_enc_get_algorithms_name'
    not_implemented()
.end

=item C<int mcrypt_enc_get_block_size(resource td)>

Returns the block size of the cipher specified by the descriptor td

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_enc_get_block_size'
    not_implemented()
.end

=item C<int mcrypt_enc_get_iv_size(resource td)>

Returns the size of the IV in bytes of the algorithm specified by the descriptor td

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_enc_get_iv_size'
    not_implemented()
.end

=item C<int mcrypt_enc_get_key_size(resource td)>

Returns the maximum supported key size in bytes of the algorithm specified by the descriptor td

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_enc_get_key_size'
    not_implemented()
.end

=item C<string mcrypt_enc_get_modes_name(resource td)>

Returns the name of the mode specified by the descriptor td

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_enc_get_modes_name'
    not_implemented()
.end

=item C<array mcrypt_enc_get_supported_key_sizes(resource td)>

This function decrypts the crypttext

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_enc_get_supported_key_sizes'
    not_implemented()
.end

=item C<bool mcrypt_enc_is_block_algorithm(resource td)>

Returns TRUE if the alrogithm is a block algorithms

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_enc_is_block_algorithm'
    not_implemented()
.end

=item C<bool mcrypt_enc_is_block_algorithm_mode(resource td)>

Returns TRUE if the mode is for use with block algorithms

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_enc_is_block_algorithm_mode'
    not_implemented()
.end

=item C<bool mcrypt_enc_is_block_mode(resource td)>

Returns TRUE if the mode outputs blocks

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_enc_is_block_mode'
    not_implemented()
.end

=item C<int mcrypt_enc_self_test(resource td)>

This function runs the self test on the algorithm specified by the descriptor td

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_enc_self_test'
    not_implemented()
.end

=item C<string mcrypt_encrypt(string cipher, string key, string data, string mode, string iv)>

OFB crypt/decrypt data using key key with cipher cipher starting with iv

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_encrypt'
    not_implemented()
.end

=item C<string mcrypt_generic(resource td, string data)>

This function encrypts the plaintext

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_generic'
    not_implemented()
.end

=item C<bool mcrypt_generic_deinit(resource td)>

This function terminates encrypt specified by the descriptor td

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_generic_deinit'
    not_implemented()
.end

=item C<int mcrypt_generic_init(resource td, string key, string iv)>

This function initializes all buffers for the specific module

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_generic_init'
    not_implemented()
.end

=item C<int mcrypt_get_block_size(string cipher, string module)>

Get the key size of cipher

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_get_block_size'
    not_implemented()
.end

=item C<string mcrypt_get_cipher_name(string cipher)>

Get the key size of cipher

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_get_cipher_name'
    not_implemented()
.end

=item C<int mcrypt_get_iv_size(string cipher, string module)>

Get the IV size of cipher (Usually the same as the blocksize)

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_get_iv_size'
    not_implemented()
.end

=item C<int mcrypt_get_key_size(string cipher, string module)>

Get the key size of cipher

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_get_key_size'
    not_implemented()
.end

=item C<array mcrypt_list_algorithms([string lib_dir])>

List all algorithms in "module_dir"

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_list_algorithms'
    not_implemented()
.end

=item C<array mcrypt_list_modes([string lib_dir])>

List all modes "module_dir"

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_list_modes'
    not_implemented()
.end

=item C<bool mcrypt_module_close(resource td)>

Free the descriptor td

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_module_close'
    not_implemented()
.end

=item C<int mcrypt_module_get_algo_block_size(string algorithm [, string lib_dir])>

Returns the block size of the algorithm

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_module_get_algo_block_size'
    not_implemented()
.end

=item C<int mcrypt_module_get_algo_key_size(string algorithm [, string lib_dir])>

Returns the maximum supported key size of the algorithm

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_module_get_algo_key_size'
    not_implemented()
.end

=item C<array mcrypt_module_get_supported_key_sizes(string algorithm [, string lib_dir])>

This function decrypts the crypttext

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_module_get_supported_key_sizes'
    not_implemented()
.end

=item C<bool mcrypt_module_is_block_algorithm(string algorithm [, string lib_dir])>

Returns TRUE if the algorithm is a block algorithm

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_module_is_block_algorithm'
    not_implemented()
.end

=item C<bool mcrypt_module_is_block_algorithm_mode(string mode [, string lib_dir])>

Returns TRUE if the mode is for use with block algorithms

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_module_is_block_algorithm_mode'
    not_implemented()
.end

=item C<bool mcrypt_module_is_block_mode(string mode [, string lib_dir])>

Returns TRUE if the mode outputs blocks of bytes

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_module_is_block_mode'
    not_implemented()
.end

=item C<resource mcrypt_module_open(string cipher, string cipher_directory, string mode, string mode_directory)>

Opens the module of the algorithm and the mode to be used

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_module_open'
    not_implemented()
.end

=item C<bool mcrypt_module_self_test(string algorithm [, string lib_dir])>

Does a self test of the module "module"

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_module_self_test'
    not_implemented()
.end

=item C<string mcrypt_ofb(int cipher, string key, string data, int mode, string iv)>

OFB crypt/decrypt data using key key with cipher cipher starting with iv

NOT IMPLEMENTED.

=cut

.sub 'mcrypt_ofb'
    not_implemented()
.end

=item C<string mdecrypt_generic(resource td, string data)>

This function decrypts the plaintext

NOT IMPLEMENTED.

=cut

.sub 'mdecrypt_generic'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
