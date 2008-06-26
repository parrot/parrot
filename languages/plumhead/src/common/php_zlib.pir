# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_zlib.pir - PHP zlib  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string gzcompress(string data [, int level])>

Gzip-compress a string

NOT IMPLEMENTED.

=cut

.sub 'gzcompress'
    not_implemented()
.end

=item C<string gzdeflate(string data [, int level])>

Gzip-compress a string

NOT IMPLEMENTED.

=cut

.sub 'gzdeflate'
    not_implemented()
.end

=item C<string gzencode(string data [, int level [, int encoding_mode]])>

GZ encode a string

NOT IMPLEMENTED.

=cut

.sub 'gzencode'
    not_implemented()
.end

=item C<array gzfile(string filename [, int use_include_path])>

Read und uncompress entire .gz-file into an array

NOT IMPLEMENTED.

=cut

.sub 'gzfile'
    not_implemented()
.end

=item C<string gzinflate(string data [, int length])>

Unzip a gzip-compressed string

NOT IMPLEMENTED.

=cut

.sub 'gzinflate'
    not_implemented()
.end

=item C<resource gzopen(string filename, string mode [, int use_include_path])>

Open a .gz-file and return a .gz-file pointer

NOT IMPLEMENTED.

=cut

.sub 'gzopen'
    not_implemented()
.end

=item C<string gzuncompress(string data [, int length])>

Unzip a gzip-compressed string

NOT IMPLEMENTED.

=cut

.sub 'gzuncompress'
    not_implemented()
.end

=item C<string ob_gzhandler(string str, int mode)>

Encode str based on accept-encoding setting - designed to be called from ob_start()

NOT IMPLEMENTED.

=cut

.sub 'ob_gzhandler'
    not_implemented()
.end

=item C<int readgzfile(string filename [, int use_include_path])>

Output a .gz-file

NOT IMPLEMENTED.

=cut

.sub 'readgzfile'
    not_implemented()
.end

=item C<string zlib_get_coding_type(void)>

Returns the coding type used for output compression

NOT IMPLEMENTED.

=cut

.sub 'zlib_get_coding_type'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
