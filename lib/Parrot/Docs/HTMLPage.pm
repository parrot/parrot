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
<HTML>  
    <HEAD>
        <TITLE>$title</TITLE>
        <LINK REL="stylesheet" TYPE="text/css" 
            HREF="$resources/perl.css" 
            TITLE="Default CSS2" media="screen">
    </HEAD>
    <BODY> 
        <A NAME="_top"></A>
        <TABLE CELLSPACING="0" WIDTH="730">
            <TR>
                <TD WIDTH="100%" COLSPAN="2" CLASS="BANNER">parrotcode: <SPAN CLASS="title">$title</SPAN></TD>
            </TR>
            <TR>
                <TD WIDTH="100%" COLSPAN="2"  ID="NAV" STYLE="border-bottom: 1px solid #191970;">
                    $navigation
                </TD>
            </TR>
        </TABLE>
        <DIV CLASS="pod">
HEADER
}

=item C<footer($navigation, $resources)>

Returns the page footer.

C<$navigation> is currently unused.

C<$resources> should be the relative path from the page to
F<docs/resources>, the image and CSS file directory.

=cut

sub footer
{
    my $self = shift;
    my $navigation = shift || '';
    my $resources = shift || '';
    
    <<"FOOTER";
        </DIV>
        <P>
        <TABLE BORDER="0" WIDTH="730" CELLSPACING="0" CELLPADDING="0">
            <TR ALIGN="RIGHT">
                <TD WIDTH="590" VALIGN="MIDDLE">
                    <BR>
                    <DIV CLASS="FOOTER">
                        <DIV ALIGN="LEFT">
                        </DIV>
                    </DIV>
                </TD>
                <TD VALIGN="middle" ALIGN="center">
                    <IMG BORDER=0
                        SRC="$resources/parrot.small.png" 
                        ALT="parrot">
                </TD>
            </TR>
        </TABLE>
    </BODY>
</HTML>
FOOTER
}

=back

=cut

1;


