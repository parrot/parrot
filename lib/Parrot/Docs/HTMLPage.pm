# Copyright (C) 2004-2007, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Docs::HTMLPage - HTML Documentation Page

=head1 DESCRIPTION

C<Parrot::Docs::HTMLPage> gives Parrot documentation pages the Parrot
house-style.

This just provides C<header()> and C<footer()> class methods for now, to
prevent code being duplicated in C<Parrot::Docs::POD2HTML> and
C<Parrot::Docs::Section>.

=head2 Class Methods

=over

=cut

package Parrot::Docs::HTMLPage;

use strict;
use warnings;

=item C<header($title, $navigation, $resources, $version)>

Returns the page header with the specified title and navigation bar.
C<$resources> should be the relative path from the page to
F<docs/resources>, the image and CSS file directory.

=cut

sub header {
    my $self = shift;

    # Default values to keep warnings quiet in tests.
    my $title      = shift || 'Untitled';
    my $navigation = shift || '';
    my $resources  = shift || '';
    my $version    = shift || '';
    my $breadcrumb = $navigation;
    $breadcrumb .= " &raquo; " if $navigation;
    $breadcrumb .= $title;

    <<"HEADER";
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Parrot $version - $title</title>
        <link rel="stylesheet" type="text/css"
            href="$resources/parrot.css"
            media="all">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    </head>
    <body>
        <div id="wrapper">
            <div id="header">

                <a href="http://www.parrot.org">
                <img border=0 src="$resources/parrot_logo.png" id="logo" alt="parrot">
                </a>
            </div> <!-- "header" -->
            <div id="divider"></div>
            <div id="mainbody">
                <div id="breadcrumb">
                    $breadcrumb
                </div>
HEADER
}

=item C<footer($navigation, $resources)>

Returns the page footer.

C<$navigation> is currently unused.

C<$resources> should be the relative path from the page to
F<docs/resources>, the image and CSS file directory.

=cut

sub footer {
    my $self       = shift;
    my $navigation = shift || '';
    my $resources  = shift || '';
    my $version    = shift || '';

    my $footer = <<"FOOTER";
            </div> <!-- "mainbody" -->
            <div id="divider"></div>
            <div id="footer">
	        Copyright &copy; 2002-2010, Parrot Foundation.
FOOTER

    $footer .= "\n<br>Parrot version $version" if $version;
    $footer .= <<"FOOTER";
            </div>
        </div> <!-- "wrapper" -->
    </body>
</html>
FOOTER

    return $footer;
}

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
