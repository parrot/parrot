#! perl
# Copyright (C) 2014-2016, Parrot Foundation.

use warnings;
use strict;

=head1 NAME

tools/build/namealias_c.pl - Create src/string/namealias.c

=head1 SYNOPSIS

Simplifies

with --create:

    perl -F'/;/' -alne'print "$F[10],\t0x$F[0]" if $F[1] eq "<control>" and $F[10]' \
      UnicodeData.txt >> src/string/namealias_c.in

without:

    gperf --output-file=src/string/namealias.c src/string/namealias_c.in

    manual cleanup for inline, C++ compat and codingstd_tests.

=head1 DESCRIPTION

Create F<src/string/namealias.c> from gperf generated namealias hash
for missing icu control character name aliases.

gperf does create perfect hashes, but not perfect C.
Not compilable with C++ as with ANSI-C.
Multiple codingstd violations.

=cut

my $src = "src/string/namealias_c.in";
my $tmp = "tmp_namealias.c";
my $out = "src/string/namealias.c";
system("gperf", "--output-file=$tmp", $src);

my $IN;
unless (open $IN, '<', $tmp) {
    warn "gperf not available or failed. Using the prepared $out\n"; # but no problem, we have the file
    exit;
}
open my $OUT, '>', $out or die "Can't write '$out': $!";
local $/ = "\n\n";
while (<$IN>) {

    # overlong line, and don't bother bug-gnu-gperf\@gnu.org with crazy encodings
    # also c_indent.t
    s/^#?error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf\@gnu.org>."/#  error "gperf generated tables don't work with this execution character set."/m;

    # skip line directives. would be nice but they are wrong with gperf version 3.0.4
    s/^#line .*?\n//gm;

    # C++ requires full struct initializers
    # c_operator.t: there should be one space or a newline after a comma
    s/{-1},/{-1, 0},/g;

    # skip inline. we use it twice in core_ops.c. Note that on windows this regex fails.
    s/\Q#if (defined (__STDC_VERSION__) && __STDC_VERSION__ >= 199901L) || defined(__cplusplus) || defined(__GNUC_STDC_INLINE__)
inline
#elif defined(__GNUC__)
__inline
#endif\E//;
    s/\Q#ifdef __GNUC__
__inline
#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__
__attribute__ ((__gnu_inline__))
#endif
#endif\E//;
    s/\Q#ifdef __GNUC__
__inline
#else
#ifdef __cplusplus
inline
#endif
#endif\E//;

    # c_parens.t:
    # There should be no space between a function name and the following open parenthesis
    s/(_lookup|_hash|strcmp) \(/$1(/g;
    # There should be at least one space between a C keyword and any subsequent open parenthesis
    s/sizeof\(/sizeof (/g;

    print $OUT $_;
}
close $IN;
close $OUT;
END {
    unlink $tmp;
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
