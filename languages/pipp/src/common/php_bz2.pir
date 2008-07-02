# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_bz2.pir - PHP bz2  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string bzcompress(string source [, int blocksize100k [, int workfactor]])>

Compresses a string into BZip2 encoded data

NOT IMPLEMENTED.

=cut

.sub 'bzcompress'
    not_implemented()
.end

=item C<string bzdecompress(string source [, int small])>

Decompresses BZip2 compressed data

NOT IMPLEMENTED.

=cut

.sub 'bzdecompress'
    not_implemented()
.end

=item C<int bzerrno(resource bz)>

Returns the error number

NOT IMPLEMENTED.

=cut

.sub 'bzerrno'
    not_implemented()
.end

=item C<array bzerror(resource bz)>

Returns the error number and error string in an associative array

NOT IMPLEMENTED.

=cut

.sub 'bzerror'
    not_implemented()
.end

=item C<string bzerrstr(resource bz)>

Returns the error string

NOT IMPLEMENTED.

=cut

.sub 'bzerrstr'
    not_implemented()
.end

=item C<resource bzopen(string|int file|fp, string mode)>

Opens a new BZip2 stream

NOT IMPLEMENTED.

=cut

.sub 'bzopen'
    not_implemented()
.end

=item C<string bzread(resource bz[, int length])>

Reads up to length bytes from a BZip2 stream, or 1024 bytes if length is not specified

NOT IMPLEMENTED.

=cut

.sub 'bzread'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
