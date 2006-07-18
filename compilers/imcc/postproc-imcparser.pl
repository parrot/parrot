#!perl

use 5.006;
use strict;
use warnings;

=head1 TITLE

postproc-imcparser.pl

=head1 SYNOPSIS

    # Normally run as part of the "make" process
    % postproc-imcparser.pl imcc.y.flag imcparser.c

=head1 DESCRIPTION

This program is a Bison post-processor to support reentrant flex.
As of Bison 2.1, it does not support passing more than one YYLEX_PARAM
or YYPARSE_PARAM.

However, we need two parameters (interp and yyscanner) for each
parsing/scanning context.  This program tries to do a source-level
patch against known Bison output formats, and fails with an error
when it cannot handle the input format.

=cut

my $flag_file = shift or die "Usage: $0 imcc.y.flag imcparser.c";
my $c_file    = shift;

if (-e $flag_file and -e $c_file and -M $flag_file <= -M $c_file) {
    # The .c file was not regenerated -- simply exit
    exit;
}

{
    local $/;
    open my $in, '<', $c_file or die "Cannot read from $c_file: $!";
    my $src = <$in>;
    close $in;

    # Obviously already patched -- simply exit.
    exit if $src =~ /YYLEX_PARAM , yyscanner/;

    # Patch the source file to support an additional yyscanner argument
    (   $src =~ s/YYLEX_PARAM\)/YYLEX_PARAM , yyscanner)/mg
    and $src =~ s/YYPARSE_PARAM\)/YYPARSE_PARAM , void *yyscanner)/mg
    and $src =~ s/^yyparse \(Interp.*/yyparse (Interp *interp, void *yyscanner)/mg
    and $src =~ s/^yyparse \(interp.*/yyparse (interp, yyscanner)/mg
    and $src =~ s/^(\s*)Interp .*/$1Interp *interp, void *yyscanner;/mg
    ) or die "Patching $c_file filed; bison file format changed?";

    open my $out, '>', $c_file or die "Cannot write to $c_file: $!";
    print $out $src;
    close $out;
}

1;
