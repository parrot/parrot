#!perl -w
# Copyright (C) 2010, Parrot Foundation.
# $Id$

use strict;
use Pod::PseudoPod::LaTeX;

print <<'HEADER';
\documentclass[11pt,a4paper,oneside]{report}
\usepackage{graphics,graphicx}
\usepackage{colortbl}

\begin{document}
\tableofcontents
HEADER

for (@ARGV) {
    my $parser = Pod::PseudoPod::LaTeX->new();
    $parser->output_fh( *STDOUT );
    $parser->parse_file( $_ );
}

print <<'FOOTER';
\end{document}
FOOTER
