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

Does the beginning of the document.

=cut

sub do_beginning 
{
	my $self = $_[0];

	my $title = $self->get_short_title();
  
	unless($self->content_seen) {
		return;
	}
  
	$self->{'Title'} = $title || 'Untitlled';

	Pod::Simple::HTML::esc($title);
  
	print {$self->{'output_fh'}}
	<<"HEADER",
<html>
	<head>
		<title>$title</title>
		<link rel="stylesheet" href="http://dev.perl.org/perl-styles.css" 
			type="text/css" />
	</head>
	<body>
	
	<table width=100%>
		<tr>
			<td valign="TOP"><a href="">Contents</a></td>
			<td align=\"RIGHT\"><img src="http://www.parrotcode.org/images/parrot.small.png"></td>
		</tr>
	</table>
	<div class="pod">
	<a name="_top"></a>
HEADER
	$self->version_tag_comment;

	return 1;
}

=item C<do_end()>

Does the end of the document.

=cut

sub do_end 
{
	my $self = $_[0];
	
	print {$self->{'output_fh'}} <<"FOOTER";

		</div>
	</body>
</html>
FOOTER
		
	return 1;
}

=back

=cut

1;