#! perl
# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Cwd;
use File::Spec ();
use Parrot::Distribution;
use Test::More tests => 3;

=head1 NAME

t/codingstd/copyright.t - checks for an appropriate copyright
statement in parrot source files

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/copyright.t

    # test specific files
    % perl t/codingstd/copyright.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Ensures that the copyright statement exists in each source file and that it
is up to date.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;

my @files = @ARGV ? <@ARGV> : (
    $DIST->get_c_language_files(),
    $DIST->get_perl_language_files(),
    $DIST->get_make_language_files(),
    $DIST->get_pir_language_files(),
);
my (
    @no_copyright_files,
    @bad_format_copyright_files,
    @duplicate_copyright_files,
);

my $copyright_simple =
    qr/Copyright \(C\) \d{4}/i;
my $copyright_parrot =
    qr/Copyright \(C\) (?:\d{4}\-)?\d{4}, Parrot Foundation\.\n/;

foreach my $file (@files) {

    # if we have command line arguments, the file is the full path
    # otherwise, use the relevant Parrot:: path method
    my $path = @ARGV ? $file : $file->path;

    my $buf = $DIST->slurp($path);

    # does there exist a copyright statement at all?
    if ( $buf !~ $copyright_simple ) {
        push @no_copyright_files, $path;
        next;
    }

    # is the copyright text correct?
    # If so, remove it...
    if ( ! ($buf =~ s/$copyright_parrot//) ) {
        push @bad_format_copyright_files, $path;
    }
    # ... and then see if any other copyright notices exist.
    elsif ($buf =~ $copyright_simple) {
        push @duplicate_copyright_files, $path;
    }
}

my $suggested_version=<<END_SUGGESTION;
  Copyright (C) C<start-year>-C<last-year-modified>, Parrot Foundation.
To find the C<start-year>, use a command such as:
  svn log C<filename> | grep 'lines' | tail -n 1
To find the C<last-year-modified>, use a command such as:
  svn log C<filename> | grep 'lines' | head -n 1
END_SUGGESTION

# run the tests
ok( !scalar(@no_copyright_files), 'Copyright statement exists' )
    or diag(
    join
        $/ => "No copyright statement found in " . scalar @no_copyright_files . " files:",
    @no_copyright_files,
    "The copyright statement should read something like:",
    $suggested_version
    );

    ok( !scalar(@bad_format_copyright_files), 'Copyright statement in the right format' )
        or diag(
        join
            $/ => "Bad format in copyright statement found in "
            . scalar @bad_format_copyright_files
            . " files:",
        @bad_format_copyright_files,
        "Please update to read something like:",
        $suggested_version
        );

# Certain files contain the string 'Copyright (c)' more than once
# because they contain heredocs for generated files, correctly cite the
# copyright information for non-Parrot code, etc.  We shall exclude them
# from our test for duplicate copyright statements.

my @permitted_duplicate_copyright_files = (
    {
        file    => 'examples/c/test_main.c',
        reason  => 'sample code',
    },
    {
        file    => 'Configure.pl',
        reason  => 'cite automake copyright statement',
    },
    {
        file    => 'config/gen/opengl.pm',
        reason  => 'heredoc text for generated file',
    },
    {
        file    => 'lib/Parrot/Configure/Messages.pm',
        reason  => 'heredoc for print_introduction()',
    },
    {
        file    => 't/tools/dev/searchops/samples.pm',
        reason  => 'sample code used in testing',
    },
    {
        file    => 'tools/build/vtable_extend.pl',
        reason  => 'heredoc text for generated file',
    },
    {
        file    => 'tools/dev/create_language.pl',
        reason  => 'generated files in data section',
    },
    {
        file    => 'examples/pir/quine_ord.pir',
        reason  => 'quine',
    },
    {
        file    => 'tools/dev/nci_thunk_gen.pir',
        reason  => 'heredoc text for generated file',
    },
    {
        file    => 'src/main.c',
        reason  => 'Parrot_version() prints copyright notice ',
    },
    {
        file    => 't/examples/streams.t',
        reason  => 'heredoc-like text in test',
    },
);
my $cwd = cwd();
my %permitted_duplicate_copyright_files =
    map { ( File::Spec->catfile( $cwd, $_->{file} ) ) => 1 }
        @permitted_duplicate_copyright_files;

my @non_permitted_duplicate_copyright_files =
    grep { ! $permitted_duplicate_copyright_files{ $_ } }
        @duplicate_copyright_files;

TODO: {
    local $TODO = 'duplicate copyrights exist.';

    ok( !scalar(@non_permitted_duplicate_copyright_files),
        'Duplicate Copyright statements' )
        or diag(
        join
            $/ => "Duplicate copyright statement found in "
            . scalar @non_permitted_duplicate_copyright_files
            . " files:",
        @non_permitted_duplicate_copyright_files,
        "Please get copyright assigned to Parrot Foundation",
        "and remove alternate notice; or remove duplicated",
        "notice for Parrot Foundation."
        );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
