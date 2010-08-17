#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$
#
# perl script that writes modified POD files to the directory
# 'build/modified_pod'. Then this script writes the latex file
# 'build/parrot-book.tex' by generating chapters from the little modified POD.
#

use strict;
use warnings;

use Getopt::Long ();
use Pod::PseudoPod::LaTeX;

my $item_list_ref = [ ['intro.pod', 'Introduction to Parrot'],
                      ['overview.pod', 'Overview'],
                      ['submissions.pod', 'Submitting bug reports and patches'],
                      ['running.pod', 'Parrot\'s command line options'],
                    ];

my $PIR_chap_list_ref = [ 'ch01_introduction.pod', 'ch02_getting_started.pod',
                          'ch03_basic_syntax.pod', 'ch04_variables.pod',
                          'ch05_control_structures.pod', 'ch06_subroutines.pod',
                          'ch07_objects.pod', 'ch08_io.pod',
                          'ch09_exceptions.pod',
                        ];

my $lang = @$item_list_ref - 1;
my $MOD_BUILD_PATH='build/modified_pod/';

my ( $result, $give_out );

$result = Getopt::Long::GetOptions (
    "print" => \$give_out,
);

if ($give_out)  {
    for my $i ( 0.. $lang )
        { print $item_list_ref->[$i][0], "\n" }
    exit;
};


for my $i ( 0..$lang ) {
    write_mod( $i );
}


open my $TEX_FH, '>', 'build/parrot-book.tex';

print $TEX_FH <<'HEADER';
\documentclass[11pt,a4paper,oneside]{report}
\usepackage{graphics,graphicx}
\usepackage{colortbl}
%
%\setcounter{secnumdepth}{2}
%\setcounter{tocdepth}{2}

\begin{document}
\tableofcontents
HEADER

for my $i ( 0..$lang ) {
    my $parser = Pod::PseudoPod::LaTeX->new();
    $parser->output_fh( $TEX_FH );
    $parser->parse_file( "${MOD_BUILD_PATH}$item_list_ref->[$i][0]" );
}

print $TEX_FH <<'PIR_TITEL';
\chapter{PIR Guide}

PIR_TITEL

open my $PIR_TEX_FH, '>', 'build/pir_guide_tex.in';
$lang = @$PIR_chap_list_ref - 1;
for my $i ( 0..$lang ) {
    my $parser = Pod::PseudoPod::LaTeX->new();
    $parser->output_fh( $PIR_TEX_FH );
    $parser->parse_file( 'book/pir/' . $PIR_chap_list_ref->[$i] );
}
close( $PIR_TEX_FH );

open $PIR_TEX_FH, '<', 'build/pir_guide_tex.in';
while( <$PIR_TEX_FH> ) {
    s/^\\section\*/\\section/;
    s/subsubsub/subsub/;
    print $TEX_FH $_;
}
close( $PIR_TEX_FH );

print $TEX_FH <<'FOOTER';
\end{document}
FOOTER

close( $TEX_FH );


sub write_mod {
    my $upper_bound = 6;

    open( my $IN_FH, '<', $item_list_ref->[$_[0]][0] ) or
        die "$0: can't open $item_list_ref->[$_[0]][0] for reading ($!)\n";
    open( my $OUT_FH, '>', "${MOD_BUILD_PATH}$item_list_ref->[$_[0]][0]" ) or
        die "$0: can't open ${MOD_BUILD_PATH}$item_list_ref->[$_[0]][0]: $!\n";

    # change the upper bound for the file running.pod
    $upper_bound = 14 if $_[0] == 3;

    # do the same as: sed -e '4,6c\=head0 $item_list_ref->[$i][1]'
    while( <$IN_FH> ) {
        if ( ($. < 4) || ($. > $upper_bound) ) {
            print $OUT_FH $_
        }
        else {
            print $OUT_FH "=head0 $item_list_ref->[$_[0]][1]\n"
                if $. == $upper_bound;
        }
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
