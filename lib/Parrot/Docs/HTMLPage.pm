# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::HTMLPage - HTML Docmentation Page

=head1 DESCRIPTION

This just provides a C<header()> and C<footer()> method for now, to 
prevent code being duplicated int C<Parrot::Docs::POD2HTML> and 
C<Parrot::Docs::Section>.

=head2 Methods

=over

=cut

package Parrot::Docs::HTMLPage;

use strict;

=item C<header($title, $navigation, $resources)>

Returns the page header with the specified title and navigation bar.
C<$resources> should be the relative path from the page to
F<docs/resources>, the image and CSS file directory.

=cut

sub header
{
    my $self = shift;
    # Default values to keep warnings quiet in tests.
    my $title = shift || 'Untitled';
    my $navigation = shift || '';
    my $resources = shift || '';
    
    <<"HEADER";
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
    "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>  
    <head><title>$title</title>
        <link rel="stylesheet" href="$resources/perl-styles.css" 
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
                <img src="$resources/parrot.small.png">
            </td>
        </tr>
    </table>
    <div class="pod">
HEADER
}

=item C<footer()>

Returns the page footer.

=cut

sub footer
{
    <<'FOOTER';
        </div>
    </body>
</html>
FOOTER
}

=back

=cut

1;


