#! perl
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config qw(%PConfig);
use Parrot::Distribution;
use Parrot::Headerizer;

=head1 NAME

t/codingstd/c_function_docs.t - checks for missing function documentation

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_function_docs.t

    # test specific files
    % perl t/codingstd/c_function_docs.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language source files have documentation for each function
declared.

=cut

my $DIST = Parrot::Distribution->new;
my $headerizer = Parrot::Headerizer->new;

# can not handle .ops or .pmc files yet
my @files = grep {/\.(c|h)$/ } @ARGV ? @ARGV :
    map {s/^$PConfig{build_dir}\///; $_} map {s/\\/\//g; $_} map {$_->path} $DIST->get_c_language_files();

plan tests => scalar @files;

my %todos;
while (<DATA>) {
    next if /^#/;
    next if /^\s*$/;
    chomp;
    $todos{$_} = 1;
}

foreach my $path (@files) {

    my $buf = $DIST->slurp($path);
    my @missing_docs;

    my @function_decls = $headerizer->extract_function_declarations($buf);

    for my $function_decl (@function_decls) {

        my $escaped_decl = $headerizer->generate_documentation_signature($function_decl);

        my $missing = '';
        if ( $buf =~ m/^\Q$escaped_decl\E$(.*?)^=cut/sm ) {
            my $docs = $1;
            $docs =~ s/\s//g;
            if ($docs eq '') {
                $missing = 'boilerplate only';
            }
            # else:  docs!
        }
        else {
            $missing = 'missing';
        }
        if ($missing) {
            if ($missing eq 'boilerplate only') {
                push @missing_docs, "$path ($missing)\nIn:\n$escaped_decl\n";
            }
            else {
                push @missing_docs, "$path ($missing)\n$function_decl\nWant:\n$escaped_decl\n";
            }
        }
    }

    TODO: {
        local $TODO = 'Missing function docs' if $todos{$path};

    ok ( ! @missing_docs, $path)
        or diag( @missing_docs
            . " function(s) lacking documentation:\n"
            . join ("\n", @missing_docs, "\n"));
    }
}

__DATA__
compilers/imcc/pcc.c
compilers/imcc/reg_alloc.c
compilers/pirc/src/pircapi.c
config/gen/platform/ansi/dl.c
config/gen/platform/ansi/exec.c
config/gen/platform/ansi/time.c
config/gen/platform/darwin/memalign.c
config/gen/platform/generic/dl.c
config/gen/platform/generic/exec.c
config/gen/platform/generic/math.c
config/gen/platform/generic/memalign.c
config/gen/platform/generic/stat.c
config/gen/platform/generic/time.c
config/gen/platform/netbsd/math.c
config/gen/platform/openbsd/math.c
config/gen/platform/solaris/math.c
config/gen/platform/solaris/time.c
examples/compilers/japhc.c
src/gc/generational_ms.c
src/io/io_string.c
src/string/charset/ascii.c
src/string/charset/binary.c
src/string/charset/iso-8859-1.c
src/string/charset/unicode.c

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
