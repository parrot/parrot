# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_mhash.pir - PHP mhash  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string mhash(int hash, string data [, string key])>

Hash data with hash

NOT IMPLEMENTED.

=cut

.sub 'mhash'
    not_implemented()
.end

=item C<int mhash_count(void)>

Gets the number of available hashes

NOT IMPLEMENTED.

=cut

.sub 'mhash_count'
    not_implemented()
.end

=item C<int mhash_get_block_size(int hash)>

Gets the block size of hash

NOT IMPLEMENTED.

=cut

.sub 'mhash_get_block_size'
    not_implemented()
.end

=item C<string mhash_get_hash_name(int hash)>

Gets the name of hash

NOT IMPLEMENTED.

=cut

.sub 'mhash_get_hash_name'
    not_implemented()
.end

=item C<string mhash_keygen_s2k(int hash, string input_password, string salt, int bytes)>

Generates a key using hash functions

NOT IMPLEMENTED.

=cut

.sub 'mhash_keygen_s2k'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
