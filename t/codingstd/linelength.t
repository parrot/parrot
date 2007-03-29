#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

t/codingstd/linelength.t - Test code lines length

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/linelength.t

    # test specific files
    % perl t/codingstd/linelength.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Tests source files for the line length limit as defined in F<PDD07>.
Only some languages files are checked.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

use strict;
use warnings;

our $columns = 100;

use lib qw( . lib ../lib ../../lib );

use File::Spec;
use Test::More tests => 1;
use Parrot::Config;
use ExtUtils::Manifest qw( maniread );


# a list of languages where we want to test line length
our $include_languages = {};
$include_languages->{$_} = 1 for qw{
    APL
    WMLScript
    amber
    cardinal
    dotnet
    lua
    perl6
    pugs
    python
    tcl
};

# XXX this should really be using src_dir instead of build_dir but it
# doesn't exist (yet)
my $build_dir    = $PConfig{build_dir};
my $manifest     = maniread(File::Spec->catfile($build_dir, 'MANIFEST'));


# skip files listed in the __DATA__ section
my $skip_files = {};
while (<DATA>) {
    next if m{^#};
    next if m{^\s*$};
    chomp;
    $skip_files->{$_}++;
}

# find the files that we need to check
my @files = @ARGV ? @ARGV : source_files();


# check all the files and keep a list of those failing
my @lines_too_long;
foreach my $file (@files) {
    push @lines_too_long => "$file\n"
        if line_too_long($file);
}


## L<PDD07/Code Formatting/"Source line width is limited to 100 characters">
ok( !scalar(@lines_too_long), 'Line length ok' )
    or diag( "Lines longer than coding standard limit in "
        . scalar @lines_too_long
        . " files:\n@lines_too_long" );



exit;



sub line_too_long {
    my $file = shift;

    open my $fh, '<', $file or die "Can't open file '$file'";
    while ( my $line = <$fh> ) {
        chomp $line;
        return 1
            if length($line) > $columns;
    }
    return;
}


sub source_files {
    my @files;
    foreach my $file ( sort keys(%$manifest) ) {
        my $full_path = File::Spec->catfile($build_dir, $file);

        # skip binary files (including .pbc files)
        next if -B $full_path;

        # skip files specified in __DATA__ section
        next if exists( $skip_files->{$file} );

        # skip languages files, unless specifically included above
        next if $file =~ m{^languages/([^/]+)/} && !$include_languages->{$1};

        push @files => $full_path
            if $file =~ m{\.(c|pmc|ops|pod)$};
    }
    return @files;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

__DATA__
# Lex and Bison generated
compilers/ast/astlexer.c
compilers/ast/astparser.c
compilers/imcc/imclexer.c
compilers/imcc/imcparser.c
compilers/pirc/src/pirlexer.c
compilers/pirc/src/pirparser.c
# Generators with big strings
tools/build/jit2c.pl
tools/build/nativecall.pl
tools/dev/lib_deps.pl
tools/dev/mk_inno.pl
tools/dev/parrot_coverage.pl
# these ones include a big URL
cage/todo.pod
docs/dev/pmc_object_design_meeting_notes.pod
docs/gettingstarted.pod
docs/glossary.pod
languages/LANGUAGES.STATUS.pod
