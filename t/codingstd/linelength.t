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

Tests all source files for the limit of C<n> columns.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

use strict;
use warnings;

our $columns = 100;

use lib qw( . lib ../lib ../../lib );

use Test::More tests => 1;
use Parrot::Config;
use ExtUtils::Manifest qw( maniread );

diag "finding source files, this may take a while.";

our %check_language = map { $_ => 1; } qw{
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
my $manifest     = maniread("$build_dir/MANIFEST");
my $manifest_gen = maniread("$build_dir/MANIFEST.generated");

# Read some extra exceptions
while (<DATA>) {
    next if m{^#};
    next if m{^\s*$};
    chomp;
    $manifest_gen->{$_}++;
}

# find the files that we need to check
my @files = @ARGV ? @ARGV : source_files();

# check all the files and keep a list of those failing
my @lines_too_long;
foreach my $file (@files) {
    if (check($file)) {
	push @lines_too_long, $file . "\n";
    }
}

ok( !scalar(@lines_too_long), 'Line length ok' )
    or diag( "Lines longer than coding standard limit in " . 
	scalar @lines_too_long . " files:\n@lines_too_long" );

exit;


sub check {
    my $file = shift;

    my $ok = 1;

    open my $fh, '<', $file or die "Can't open file '$file'";
    while ( $ok && ( my $line = <$fh> ) ) {
        chomp $line;
        $ok = 0 if length($line) > $columns;
    }
    close $fh;

    return !$ok;
}


sub source_files {
    my @files;
    foreach my $file ( sort keys(%$manifest) ) {
	my $full_path = "$build_dir/$file";

	# skip binary files (including .pbc files)
	next if -B $full_path;

	# skip missing MANIFEST.generated files
	next unless -e $full_path;
	next if exists( $manifest_gen->{$file} );

	# I could make this other way, but this way is more flexible
	next if ( $full_path =~ m{^$build_dir/languages/([^/]+)/}
	    && !$check_language{$1} );

	push @files, $full_path if $file =~ m{\.c$};
	push @files, $full_path if $file =~ m{\.pmc$};
	push @files, $full_path if $file =~ m{\.ops$};
	push @files, $full_path if $file =~ m{\.pod$};
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
compilers/imcc/imclexer.c
compilers/imcc/imcparser.c
compilers/ast/astlexer.c
compilers/ast/astparser.c
# Generators with big strings
tools/dev/mk_inno.pl
tools/build/jit2c.pl
tools/build/nativecall.pl
tools/dev/lib_deps.pl
tools/dev/parrot_coverage.pl
# these ones include a big URL
cage/todo.pod
docs/gettingstarted.pod
docs/glossary.pod
languages/LANGUAGES.STATUS.pod
