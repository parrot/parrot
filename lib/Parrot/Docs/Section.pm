# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section - Documentation section

=head1 SYNOPSIS

    use Parrot::Docs::Section;

=head1 DESCRIPTION

A documentation I<section> is an HTML page containing links to one or
more, grouped or ungrouped items.

C<Parrot::Docs::Section> is a subclass of C<Parrot::Docs::Group>.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section;

use strict;

use Parrot::Docs::Group;
@Parrot::Docs::Section::ISA = qw(Parrot::Docs::Group);

use Parrot::Docs::Item;
use Parrot::Docs::Directory;
use Parrot::Docs::HTMLPage;

=item C<root_section()>

Returns the root section.

=cut

sub root_section
{
    require Parrot::Docs::Section::Parrot;
    
    return Parrot::Docs::Section::Parrot->new;
}

=item C<new_section($name, $text, @items)>

Returns a new section. 

Use this when creating subsections within a subclass's C<new()> method.

=cut

sub new_section
{
    my $self = shift;
    
    return Parrot::Docs::Section->new(@_);
}

=item C<new($name, $index_path, @contents)>

Returns a new section.

C<$name> and C<$index_path> are required, though C<$index_path> defaults
to F<index.html> if undefined or an empty string is supplied.

C<@contents> is one or more sections, groups and/or items.

=cut

sub new
{
    my $self = ref $_[0] ? ref shift : shift;
    my $name = shift;
    my $index_path = shift || 'index.html';
    my $text = shift;
    my @contents = @_;
    
    $self = $self->SUPER::new($name, $text, @contents);
    $self->{INDEX_PATH} = $index_path;
    
    return $self;
}

=back

=head2 Instance Methods

=over 4

=item C<is_root_section()>

Returns whether the section is the root section.

=cut

sub is_root_section
{
    my $self = shift;
    
    return $self->isa('Parrot::Docs::Section::Parrot');
}

=item C<html_link($path)>

Returns the HTML link for the section.

=cut

sub html_link
{
    my $self = shift;
    my $path = shift;
    
    if ( $path )
    {
        $path = join('/', $path, $self->{INDEX_PATH});
    }
    else
    {
        $path = $self->{INDEX_PATH};
    }
    
    return '<a href="' . $path . '">' . $self->name . '</a>';
}

=item C<write_html($source, $target, $silent)>

Calls C<write_html()> on the contents of the section.

An HTML link to the section's index is returned.

=cut

sub write_html
{
    my $self = shift;
    my $source = shift || die "No source\n";
    my $target = shift || die "No target\n";
    my $silent = shift || 0;
    my $index_html = $self->write_contents_html($source, $target, $silent);
    
    print "\n", $self->{INDEX_PATH} unless $silent;
    
    return '' unless $index_html;
    
    if ( $self->{TEXT} )
    {
        $index_html = "<p>$self->{TEXT}</p>\n\n" . $index_html;
    }
    elsif ( $index_html !~ /<DIV CLASS="pod">[^<]*<[Hh]/o )
    {
        # If there is no heading or text then we have to bump it down a bit.
        $index_html = "<BR>\n" . $index_html;
    }

    my $index = $target->file_with_name($self->{INDEX_PATH});
    
    $index->write(
        Parrot::Docs::HTMLPage->header(
            $self->name, $self->html_navigation, '../resources'));
    $index->append($index_html);
    $index->append(Parrot::Docs::HTMLPage->footer('', '../resources'));
    
    return $self->html_link . "<br>\n";
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::Docs::Group>

=item C<Parrot::Docs::Item>

=back

=cut

1;