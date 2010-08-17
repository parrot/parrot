# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Docs::Text2HTML - Plain text to HTML formatter

=head1 SYNOPSIS

    use Parrot::Docs::Text2HTML;

=head1 DESCRIPTION

C<Parrot::Docs::Text2HTML> subclasses C<Parrot::Docs::POD2HTML>.

=head2 Instance Methods

=over

=cut

package Parrot::Docs::Text2HTML;

use strict;
use warnings;

use base qw( Parrot::Docs::POD2HTML );

=item C<write_html($source, $target, $rel_path, $item)>

Writes an HTML version of the file specified by C<$rel_path> in
C<$source> to the equivalent location in C<$target>.

=cut

sub write_html {
    my $self     = shift;
    my $source   = shift;
    my $target   = shift;
    my $rel_path = shift;
    my $item     = shift;
    my $file     = $source->file_with_relative_path($rel_path);

    $self->{TARGET} = $target;

    # Use our own method for consistency.
    $self->{'Title'} = $file->title;

    $rel_path = $self->append_html_suffix($rel_path);

    my $docs_file = $target->file_with_relative_path($rel_path);

    $self->{DOCS_FILE} = $docs_file;

    $rel_path = $self->href_path( $docs_file->parent->relative_path( $target->parent_path ) );

    my $name = $target->name;

    # This is a cheat because we know that all top-level sections
    # have their indexes in the root directory - but it works.

    $self->{NAV_BAR}       = $item->html_navigation("$rel_path/$name");
    $self->{RESOURCES_URL} = "$rel_path/resources";

    $docs_file->write( $self->html_for_file($file) );
}


=item C<html_for_file($file)>

Returns the HTML for the specified file.

=cut

sub html_for_file {
    my $self   = shift;
    my $file   = shift;

    my $string = $self->html_header_before_title;
    $string .= $self->{'Title'};
    $string .= $self->html_header_after_title;
    $string .= "\n<pre>\n";
    $string .= $file->read;
    $string .= "\n</pre>\n";
    $string .= $self->html_footer;

    return $string;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
