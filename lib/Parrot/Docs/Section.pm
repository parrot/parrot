# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section - Docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section;
	
	my $section = Parrot::Docs::Section->new('Usual Suspects', 'index.html',
	    Parrot::Docs::Item->new('', 'foo'),
		Parrot::Docs::Group->new('Bar', '',
	    	Parrot::Docs::Item->new('', 'bar', 'pub')
	    )
	);
	
	$section->write_html();

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

=item C<section($name, $text, @items)>

Returns a new section. 

Use this when creating subsection in a subclass's C<new()> method.

=cut

sub section
{
	my $self = shift;
	
	return Parrot::Docs::Section->new(@_);
}

=item C<group($name, $text, @items)>

Returns a new group.

Use this when creating groups in a subclass's C<new()> method.

=cut

sub group
{
	my $self = shift;
	
	return Parrot::Docs::Group->new(@_);
}

=item C<item($text, @paths)>

Returns a new item.

Use this when creating items in a subclass's C<new()> method.

=cut

sub item
{
	my $self = shift;
	
	return Parrot::Docs::Item->new(@_);
}

=item C<write_html($source, $target, $silent, $delete)>

Calls C<write_html()> on the contents of the section.

C<$source> is a C<Parrot::Docs::Directory> for the distribution
directory. It defaults to the current working directory.

C<$target> is the C<Parrot::Docs::Directory> in which to write the HTML.
It defaults to the F<docs/html> directory.

If C<$silent> is true then progress is not reported.

If C<$delete> is true then the contents of C<$target> will be deleted
before any HTML is written. This argument is intended to be used only
once by the root section, it is not passed to subsections.

=cut

sub write_html
{
	my $self = shift;
	my $source = shift || Parrot::Docs::Directory->new('.');
	my $target = shift || Parrot::Docs::Directory->new("docs/html");
	my $silent = shift || 0;
	my $delete = shift || 0;
	my $index_html = '';

	# This is only done here. It's not passed down.
	$target->delete_contents if $delete;

	print "\n\n", $self->name unless $silent;
	
	foreach my $content (@{$self->{CONTENTS}})
	{
		$index_html .= $content->write_html($source, $target, $silent);
	}
	
	print "\n", $self->{INDEX_PATH} unless $silent;
	
	return '' unless $index_html;
	
	$index_html = "<p>$self->{TEXT}</p>\n\n" . $index_html if $self->{TEXT};
	$index_html = "<h1>$self->{NAME}</h1>\n\n" . $index_html;

	my $index = $target->file_with_name($self->{INDEX_PATH});

	$index->write(<<'HEADER');
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
	"http://www.w3.org/TR/REC-html40/loose.dtd">

<html>  

<head><title>parrot - </title>
<link rel="stylesheet" href="../resources/perl-styles.css" type="text/css" />
</head>
<body> 
<table width=100%>
<tr>
<td valign="TOP">
<a href="index.html">Contents</a>
</td>
<td align="RIGHT">
<img src="../resources/parrot.small.png">
</td>
</tr>
</table>
<div class="pod">
<a name="_top"></a>

HEADER

	$index->append($index_html);
	$index->append(<<'FOOTER');
</div>
</body>
</html>
FOOTER
	
	return sprintf("<a href= \"%s\">%s</a><br>\n",
		$self->{INDEX_PATH}, $self->name);
}

=back

=head1 SEE ALSO

C<Parrot::Docs::Group>, C<Parrot::Docs::Item>.

=cut

1;