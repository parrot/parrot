# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_user_filters.pir - PHP user_filters Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<void stream_bucket_append(resource brigade, resource bucket)>

Append bucket to brigade

NOT IMPLEMENTED.

=cut

.sub 'stream_bucket_append'
    not_implemented()
.end

=item C<object stream_bucket_make_writeable(resource brigade)>

Return a bucket object from the brigade for operating on

NOT IMPLEMENTED.

=cut

.sub 'stream_bucket_make_writeable'
    not_implemented()
.end

=item C<resource stream_bucket_new(resource stream, string buffer)>

Create a new bucket for use on the current stream

NOT IMPLEMENTED.

=cut

.sub 'stream_bucket_new'
    not_implemented()
.end

=item C<void stream_bucket_prepend(resource brigade, resource bucket)>

Prepend bucket to brigade

NOT IMPLEMENTED.

=cut

.sub 'stream_bucket_prepend'
    not_implemented()
.end

=item C<bool stream_filter_register(string filtername, string classname)>

Registers a custom filter handler class

NOT IMPLEMENTED.

=cut

.sub 'stream_filter_register'
    not_implemented()
.end

=item C<array stream_get_filters(void)>

Returns a list of registered filters

NOT IMPLEMENTED.

=cut

.sub 'stream_get_filters'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
