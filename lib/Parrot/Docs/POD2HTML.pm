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

=item C<do_beginning()>

Reimplements the C<Pod::Simple::HTML> method to add a header to the start
of the document.

=cut

sub do_beginning 
{
	my $self = shift;

	# We have to do this because it has the side effect of setting
	# content_seen.
	$self->get_short_title();
	
	return unless $self->content_seen;

	# Suppress the warning in the tests.
	$self->{RESOURCES_URL} = '' unless $self->{RESOURCES_URL};
	$self->{NAV_BAR} = '' unless $self->{NAV_BAR};
	
	my $title = $self->{'Title'};
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

=item C<do_middle()>

Does the middle of the document.

=cut

sub do_middle 
{
	my $self = shift;
	my $fh = $self->{'output_fh'};
  	my ($token, $type, $tagname);
	my @stack;
	my $dont_wrap = 0;
  
	while ( $token = $self->get_token )
	{
		if ( ($type = $token->type) eq 'start' ) 
		{
			if ( ($tagname = $token->tagname) eq 'L' ) 
			{
				Pod::Simple::HTML::esc($type = $self->do_link($token));
				
				if ( defined $type and length $type ) 
				{
					print $fh "<a href='$type'>";
				} 
				else 
				{
					print $fh "<a>";
				}
			}
			elsif ( $tagname eq 'F' )
			{
				my $text = Pod::Simple::HTML::esc($self->get_token->text);
				my $dist = Parrot::Distribution->new;
				
				# Only link to files that will have HTML pages.
				
				if ( $dist->relative_path_is_file($text) 
					and $dist->file_with_relative_path($text)->contains_pod )
				{
					my $path = $self->append_html_suffix($text);
					my $file = $self->{TARGET}->file_with_relative_path($path);
			
					$path = $self->{DOCS_FILE}->parent->relative_path($file);
			
					print $fh $self->{'Tagmap'}{$tagname} . 
						"<a href='$path'>$text</a>";
				}
				else
				{
					print $fh "<i>$text</i>";
				}
			}
			elsif ($tagname eq 'item-text' or $tagname =~ m/^head\d$/s) 
			{
				print $fh $self->{'Tagmap'}{$tagname} || next;
				
				my @to_unget;
				
				while ( 1 )
				{
					push @to_unget, $self->get_token;
					
					last if $to_unget[-1]->is_end
						and $to_unget[-1]->tagname eq $tagname;
				}
				
				my $name = $self->linearize_tokens(@to_unget);
				
				if ( defined $name ) 
				{
					$name =~ tr/ /_/;
					print $fh "<a name=\"", 
						Pod::Simple::HTML::esc($name), "\"\n>";
				} 
				else 
				{
					print $fh "<a\n>";
				}
				
				$self->unget_token(@to_unget);
			} 
			elsif ($tagname eq 'Data') 
			{
				my $next = $self->get_token;
				
				next unless defined $next;
				
				unless( $next->type eq 'text' )
				{
					$self->unget_token($next);
					next;
				}
				
				printf $fh "\n" . $next->text . "\n";
				next;
			} 
			else 
			{
				if( $tagname =~ m/^over-(.+)$/s ) 
				{
					push @stack, $1;
				} 
				elsif ( $tagname eq 'Para') 
				{
					$tagname = 'Para_item' if @stack and $stack[-1] eq 'text';
				}
				
				print $fh $self->{'Tagmap'}{$tagname} || next;
				
				++$dont_wrap if 
					$tagname eq 'Verbatim' 
					or $tagname eq "VerbatimFormatted"
					or $tagname eq 'X';
			}
		} 
		elsif ( $type eq 'end' ) 
		{
			if( ($tagname = $token->tagname) =~ m/^over-/s ) 
			{
				pop @stack;
			}
			elsif ( $tagname eq 'Para' ) 
			{
				$tagname = 'Para_item' if @stack and $stack[-1] eq 'text';
			}

			print $fh $self->{'Tagmap'}{"/$tagname"} || next;
			
			--$dont_wrap if $tagname eq 'Verbatim' or $tagname eq 'X';
		} 
		elsif ( $type eq 'text' ) 
		{
			Pod::Simple::HTML::esc($type = $token->text);
			$type =~ s/([\?\!\"\'\.\,]) /$1\n/g unless $dont_wrap;
			
			# URLs not in L<>.
			$type =~ s|(http://[^\s)]+)|<a href="$1">$1</a>|gs;
	
			print $fh $type;
		}
	}
	
	return 1;
}

=item C<resolve_pod_page_link($to, $section)>

Resolves the POD link. Perl modules are converted to paths.

=cut

sub resolve_pod_page_link 
{
	my $self = shift;
	my $to = shift;
	my $section = shift;
	my $dist = Parrot::Distribution->new;
	
	if ( $to =~ /::/o )
	{
		# This is not very obvious, so let me explain. We get the file
		# for the module, then we take its path relative to the 
		# distribution, then we append the HTML suffix and get the
		# docs file. Once we have that all we need is the relative
		# path from the current directory to the file and return that
		# as the link.
		
		my $file = $dist->file_for_perl_module($to);
		
		return 'TODO' unless $file;
		
		my $path = $self->append_html_suffix($dist->relative_path($file));
			
		$file = $self->{TARGET}->file_with_relative_path($path);
		
		return $self->{DOCS_FILE}->parent->relative_path($file);
	}
	
	return 'TODO';
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
	
	$self->{TARGET} = $target;
	
	# Use our own method for consistency.
	$self->{'Title'} = $file->short_description;
	
	$rel_path = $self->append_html_suffix($rel_path);
		
	my $docs_file = $target->file_with_relative_path($rel_path);
	
	$self->{DOCS_FILE} = $docs_file;

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