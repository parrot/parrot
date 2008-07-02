# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_exif.pir - PHP exif  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int exif_imagetype(string imagefile)>

Get the type of an image

NOT IMPLEMENTED.

=cut

.sub 'exif_imagetype'
    not_implemented()
.end

=item C<array exif_read_data(string filename [, sections_needed [, sub_arrays[, read_thumbnail]]])>

Reads header data from the JPEG/TIFF image filename and optionally reads the internal thumbnails

NOT IMPLEMENTED.

=cut

.sub 'exif_read_data'
    not_implemented()
.end

=item C<string exif_tagname(index)>

Get headername for index or false if not defined

NOT IMPLEMENTED.

=cut

.sub 'exif_tagname'
    not_implemented()
.end

=item C<string exif_thumbnail(string filename [, &width, &height [, &imagetype]])>

Reads the embedded thumbnail

NOT IMPLEMENTED.

=cut

.sub 'exif_thumbnail'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
