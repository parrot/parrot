#! perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 TITLE

tools/dev/mk_chm.pl - Create files for HTML Help Workshop

=head1 SYNOPSIS

    % perl tools/dev/mk_chm.pl

=head1 DESCRIPTION

Creates the following files :

 parrot.hhp
 index.hhk
 toc.hhc

=cut

use strict;
use warnings;
use lib qw( lib ../lib ../../lib );
use Parrot::Config;

my $version = $PConfig{VERSION} . $PConfig{DEVEL};

my $filename = 'docs/html/index.html';
open my $IN, '<', $filename
    or die "Can't open $filename ($!)";
my $index;
while (<$IN>) {
    if (/^<a href=\"(\w+\.\w+)\">(.*)<\/a>/) {
        $index .= <<"TEXT";
          <LI> <OBJECT type="text/sitemap">
              <param name="Name" value="$2">
              <param name="Local" value="$1">
            </OBJECT>
TEXT
    }
}
close $IN;

$filename = 'docs/html/parrot.hhp';
open my $OUT, '>', $filename
    or die "Can't open $filename ($!)";
print $OUT <<"TEXT";
[OPTIONS]
Binary TOC=Yes
Compatibility=1.1 or later
Compiled file=Parrot-$version.chm
Contents file=toc.hhc
Default Window=Main
Default topic=index.html
Display compile progress=Yes
Full-text search=Yes
Index file=index.hhk
Language=0x0409 English (UNITED STATES)

[WINDOWS]
Main=,"toc.hhc","index.hhk","index.html","index.html",,,,,0x22520,,0x603006,,,,,,,,0

[FILES]
index.html
TEXT
close $OUT;

$filename = 'docs/html/index.hhk';
open $OUT, '>', $filename
    or die "Can't open $filename ($!)";
print $OUT <<'TEXT';
<HTML>
  <HEAD>
  </HEAD>
  <BODY>
    <UL>
    </UL>
  </BODY>
</HTML>
TEXT
close $OUT;

$filename = 'docs/html/toc.hhc';
open $OUT, '>', $filename
    or die "Can't open $filename ($!)";
print $OUT <<"TEXT";
<HTML>
  <HEAD>
    <meta name="generator" content="idl2html 2.60 (Perl 5.010000)">
  </HEAD>
  <BODY>
    <OBJECT type="text/site properties">
      <param name="ImageType" value="Folder">
    </OBJECT>
    <UL>
      <LI> <OBJECT type="text/sitemap">
          <param name="Name" value="What's in the Parrot distribution?">
          <param name="ImageNumber" value="1">
        </OBJECT>
        <UL>
$index        </UL>
      <LI> <OBJECT type="text/sitemap">
          <param name="Name" value="Book">
          <param name="ImageNumber" value="1">
        </OBJECT>
    </UL>
  </BODY>
</HTML>
TEXT
close $OUT;


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
