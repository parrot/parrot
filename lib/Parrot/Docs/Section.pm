# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section - Docmentation section

=head1 SYNOPSIS

    use Parrot::Docs::Section;
    
    my $s = Parrot::Docs::Section->new('Usual Suspects', 'index.html',
        'here they are...',
        Parrot::Docs::Item->new('old faithful', 'foo'),
        Parrot::Docs::Group->new('Bar', 'no jeans',
            Parrot::Docs::Item->new('time please', 'bar', 'pub')));
    
    $s->write_html();

=head1 DESCRIPTION

A section is an HTML page containing links to one or more, grouped or
ungrouped items.

This is a subclass of C<Parrot::Docs::Group>.

=head2 Methods

=over

=cut

package Parrot::Docs::Section;

use strict;

use Parrot::Docs::Group;
@Parrot::Docs::Section::ISA = qw(Parrot::Docs::Group);

use Parrot::Docs::Item;
use Parrot::Docs::Directory;

=item C<root_section()>

Returns the root section.

=cut

sub root_section
{
    my $self = shift;

	require Parrot::Docs::Section::Parrot;
	
	return Parrot::Docs::Section::Parrot->new;
}

=item C<is_root_section()>

Returns whether the section is the root section.

=cut

sub is_root_section
{
    my $self = shift;
    
	return $self->isa('Parrot::Docs::Section::Parrot');
}

=item C<new_section($name, $text, @items)>

Returns a new section. 

Use this when creating subsection in a subclass's C<new()> method.

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

C<$source> is a C<Parrot::Docs::Directory> for the distribution
directory. It defaults to the current working directory.

C<$target> is the C<Parrot::Docs::Directory> in which to write the HTML.
It defaults to the F<docs/html> directory.

If C<$silent> is true then progress is not reported.

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
    
    $index_html = "<p>$self->{TEXT}</p>\n\n" . $index_html if $self->{TEXT};
    $index_html = "<h1>$self->{NAME}\n\n" . $index_html;

    my $index = $target->file_with_name($self->{INDEX_PATH});
    
    $index->write($self->html_header);
    $index->append($index_html);
    $index->append($self->html_footer);
    
    return $self->html_link . "<br>\n";
}

=item C<html_header()>

Returns the HTML header.

=cut

sub html_header
{
	my $self = shift;
    my $title = $self->name;
	my $navigation = $self->html_navigation;
	
    <<"HEADER";
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
    "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>  
    <head><title>$title</title>
        <link rel="stylesheet" href="../resources/perl-styles.css" 
            type="text/css" />
    </head>
<body> 
    <a name="_top"></a>
    <table width=100%>
        <tr>
            <td align="LEFT" valign="TOP">
            	$navigation
            </td>
            <td align="RIGHT">
                <img src="../resources/parrot.small.png">
            </td>
        </tr>
    </table>
    <div class="pod">
HEADER
}

=item C<html_footer()>

Returns the HTML footer.

=cut

sub html_footer
{
	my $self = shift;
	
	<<'FOOTER';
        </div>
    </body>
</html>
FOOTER
}

=back

=head1 SEE ALSO

C<Parrot::Docs::Group>, C<Parrot::Docs::Item>.

=cut

1;