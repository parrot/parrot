# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::POD2HTML - Parrot POD to HTML formatter

=head1 SYNOPSIS

	use Parrot::Docs::POD2HTML;

=head1 DESCRIPTION

C<Pod::Simple::HTML> subclass.

=head2 Methods

=over

=cut

package Parrot::Docs::POD2HTML;

use strict;

use Pod::Simple::HTML;
@Parrot::Docs::POD2HTML::ISA = qw(Pod::Simple::HTML);
# This is just here to keep Pod::Simple::HTML's version_tag_comment() happy.
$Parrot::Docs::POD2HTML::VERSION = '1.0';

=item C<get_title()>

Looks for a POD heading called NAME, or TITLE (aka TITEL), and returns
its text.

=cut

sub get_title
{
	my $self = shift;
	my $title;
	
	# Once this is standardized it shouldn't be needed.
	foreach my $name (qw(NAME TITLE TITEL))
	{
		last if $title = $self->_get_titled_section($name, max_token => 50, 
			desperate => 1, @_);
	}
	
	return $title;
}

=item C<get_short_title()>

Returns the short description from the document's title.

=cut

sub get_short_title
{
	my $self = shift;
	my $title = $self->get_title(@_);
	
	if ( $title =~ m/^(\S{1,60})\s+--?\s+./s )
	{
		$title = $1;
	}
	else
	{
		# It's non-standard. Tidy it up a bit.
		$title =~ s/^\s+//o;
		$title =~ s/\s+$//o;
		$title =~ s/-$//o;
	}
	
	return $title;
}

=item C<do_beginning()>

Reimplements the C<Pod::Simple::HTML> method to add a header to the start
of the document.

=cut

sub do_beginning 
{
	my $self = shift;

	# This has the side effect of setting content_seen.
	my $title = $self->get_short_title() || 'Untitled';
	
	return unless $self->content_seen;

	$self->{'Title'} = $title;
	
	# Suppress the warning in the tests.
	$self->{RESOURCES_URL} = '' unless $self->{RESOURCES_URL};
	$self->{NAV_BAR} = '' unless $self->{NAV_BAR};
	
	Pod::Simple::HTML::esc($title);

	# It's not nice that the header and footer are duplicated
	# in section. Should we have two classes for them?
	
	print {$self->{'output_fh'}}
	<<"HEADER",
<html>
	<head>
		<title>$title</title>
		<link rel="stylesheet" href="$self->{RESOURCES_URL}/perl-styles.css" 
			type="text/css" />
	</head>
	<body>
	<a name="_top"></a>
	<table width=100%>
		<tr>
			<td align="LEFT" valign="TOP">
				$self->{NAV_BAR}
			</td>
			<td align="RIGHT">
				<img src="$self->{RESOURCES_URL}/parrot.small.png">
			</td>
		</tr>
	</table>
	<div class="pod">
HEADER
	$self->version_tag_comment;

	return 1;
}

=item C<do_end()>

Reimplements the C<Pod::Simple::HTML> method to add a footer to the end
of the document.

=cut

sub do_end 
{
	my $self = shift;
	
	print {$self->{'output_fh'}} <<"FOOTER";
		</div>
	</body>
</html>
FOOTER
		
	return 1;
}

=item C<html_for_file($file)>

Returns the HTML for the specified file.

=cut

sub html_for_file
{
	my $self = shift;
	my $file = shift;
	my $string = "";
	
	$self->output_string(\$string);
	$self->parse_file($file->path);
	
	# Give the code sections equal space top and bottom.
	$string =~ s|</pre>|\n\n</pre>|gs;
	
	# Tidy up the C reference *s.
	$string =~ s|\s\*\s+\b| \*|gs;
	
	# Add the up arrows.
	$string =~ s|</h(\d)| <a href="#_top"><img alt="^" border=0 src="$self->{RESOURCES_URL}/up.gif"></a></h$1|gs;
	
	# Make the list items bold. This is for function listings.
	$string =~ s|<dt>|<dt><b>|gs;
	$string =~ s|</dt>|</b></dt>|gs;
	
	# Unlinked URLs. We should not be having to do this here.
	$string =~ s|(http://[^\s<)]+)|<a href="$1">$1</a>|gs;
	
	my ($see_also) = $string =~ m|(<h1><a name="SEE_ALSO".*?<p>.*?</p>)|s;
	
	if ( $see_also )
	{
		my $original = $see_also;
		
		$string =~ s|$original|$see_also|s;
	}
	
	return $string;
}

=item C<write_html($source, $target, $rel_path, $item)>

Writes an HTML version of the file specified by C<$rel_path> in
C<$source> to the equivalent location in C<$target>.

=cut

sub write_html
{
	my $self = shift;
	my $source = shift;
	my $target = shift;
	my $rel_path = shift;
	my $item = shift;
	my $file = $source->file_with_relative_path($rel_path);
	
	return unless $file->contains_pod;
	
	$rel_path = $self->append_html_suffix($rel_path);
		
	my $docs_file = $target->file_with_relative_path($rel_path);

	$rel_path = $docs_file->parent->relative_path($target->parent_path);

	my $name = $target->name;
	
	# This is a cheat because we know that all top-level sections
	# have their indexes in the root directory - but it works.
	
	$self->{NAV_BAR} = $item->html_navigation("$rel_path/$name");
	$self->{RESOURCES_URL} = "$rel_path/resources";

	$docs_file->write($self->html_for_file($file));
}

=item C<append_html_suffix($path)>

Returns C<$path> with and HTML file suffix added.

=cut

sub append_html_suffix
{
	my $self = shift;
	my $path = shift;
	
	return $path . '.html';
}

=back

=cut

1;