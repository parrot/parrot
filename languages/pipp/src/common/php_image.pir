# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_image.pir - PHP image Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<array getimagesize(string imagefile [, array info])>

Get the size of an image as 4-element array

NOT IMPLEMENTED.

=cut

.sub 'getimagesize'
    not_implemented()
.end

=item C<string image_type_to_extension(int imagetype [, bool include_dot])>

Get file extension for image-type returned by getimagesize, exif_read_data, exif_thumbnail, exif_imagetype

NOT IMPLEMENTED.

=cut

.sub 'image_type_to_extension'
    not_implemented()
.end

=item C<string image_type_to_mime_type(int imagetype)>

Get Mime-Type for image-type returned by getimagesize, exif_read_data, exif_thumbnail, exif_imagetype

NOT IMPLEMENTED.

=cut

.sub 'image_type_to_mime_type'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
