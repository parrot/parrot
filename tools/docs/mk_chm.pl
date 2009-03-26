#! perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 TITLE

tools/dev/mk_chm.pl - Create files for HTML Help Workshop

=head1 SYNOPSIS

    % perl tools/dev/mk_chm.pl

=head1 DESCRIPTION

Alters files in docs/html and creates the following files :

 parrot.hhp
 index.hhk
 toc.hhc

=cut

use strict;
use warnings;
use lib qw( lib ../lib ../../lib );

use File::Copy;
use File::Find;
use Parrot::Config;
use Parrot::Docs::Section::Parrot;

copy('docs/resources/parrot.css', 'docs/html/parrot.css');
copy('docs/resources/parrot_logo.png', 'docs/html/parrot_logo.png');
find(\&alter_html, 'docs/html');

sub alter_html {
    return unless (/\.html$/);
    system(qq{perl -i.bak -pe "s{\.\./resources/}{};" $_});
}

my $version = $PConfig{VERSION} . $PConfig{DEVEL};

my $docs = Parrot::Docs::Section::Parrot->new;
my $dist = Parrot::Distribution->new;
my $toc   = $docs->build_toc_chm( $dist );
my $index = $docs->build_index_chm( $dist );

my $filename = 'docs/html/parrot.hhp';
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
Title=Parrot VM $version

[WINDOWS]
Main=,"toc.hhc","index.hhk","index.html","index.html",,,,,0x22520,,0x60304e,,,,,,,,0

[FILES]
index.html
TEXT
close $OUT;

$filename = 'docs/html/index.hhk';
open $OUT, '>', $filename
    or die "Can't open $filename ($!)";
print $OUT <<"TEXT";
<HTML>
<HEAD>
<meta name="generator" content="(Perl $])">
</HEAD><BODY>
<UL>
$index
</UL>
</BODY></HTML>
TEXT
close $OUT;

$filename = 'docs/html/toc.hhc';
open $OUT, '>', $filename
    or die "Can't open $filename ($!)";
print $OUT <<"TEXT";
<HTML>
<HEAD>
<meta name="generator" content="(Perl $])">
</HEAD><BODY>
<OBJECT type="text/site properties">
	<param name="ImageType" value="Folder">
</OBJECT>
<UL>
$toc
	<LI> <OBJECT type="text/sitemap">
		<param name="Name" value="Book">
		</OBJECT>
	<UL>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="Overview">
			<param name="Local" value="../book/ch01_overview.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="Getting Started">
			<param name="Local" value="../book/ch02_getting_started.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="PIR Basics">
			<param name="Local" value="../book/ch03_pir_basics.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="PIR Subroutines">
			<param name="Local" value="../book/ch04_pir_subroutines.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="PASM">
			<param name="Local" value="../book/ch05_pasm.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="Library">
			<param name="Local" value="../book/ch06_library.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="Testing and Debugging">
			<param name="Local" value="../book/ch07_testing_and_debugging.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="Architecture">
			<param name="Local" value="../book/ch08_architecture.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="Parrot Compiler Toolkit">
			<param name="Local" value="../book/ch09_pct.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="High Level Languages">
			<param name="Local" value="../book/ch10_hlls.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="PMC">
			<param name="Local" value="../book/ch11_pmcs.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="Opcodes">
			<param name="Local" value="../book/ch12_opcodes.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="References">
			<param name="Local" value="../book/ch13_reference.html">
			</OBJECT>
		<LI> <OBJECT type="text/sitemap">
			<param name="Name" value="Appendix : Patch Submission">
			<param name="Local" value="../book/appX_patch_submission.html">
			</OBJECT>
	</UL>
-</UL>
</BODY></HTML>
TEXT
close $OUT;


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
