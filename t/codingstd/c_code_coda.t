#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 2;
use Parrot::Distribution;
use Parrot::Test::Util::Runloop;

=head1 NAME

t/codingstd/c_code_coda.t - checks for editor hint coda in C source

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_code_coda.t

    # test specific files
    % perl t/codingstd/c_code_coda.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language source files have the proper editor hints coda,
as specified in PDD07.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

## L<PDD07/Smart Editor Style Support/"C source files, and files largely consisting of C" "must end with this coda">

my $coda = <<'CODA';
/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
CODA

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();

Parrot::Test::Util::Runloop->testloop(
    name        => 'every file has a coda',
    files       => [@files],
    per_file    => sub { shift =~ m{\Q$coda\E\n*\z} },
    diag_prefix => 'No coda found'
);

Parrot::Test::Util::Runloop->testloop(
    name        => 'only one coda per file',
    files       => [@files],
    per_file    => \&check_duplicates,
    diag_prefix => 'Duplicate coda found'
);

sub check_duplicates {
    my $buf = shift;

    # append to the extra_coda array if coda-like text appears more than once
    my $vim_many = 0;
    $vim_many++ while $buf =~ m{^ [* \t]* vim[:] }gmx;
    my $emacs_many = 0;
    $emacs_many++ while $buf =~ m{^ [* \t]* Local \s variables: }gmx;
    return ($vim_many <= 1 && $emacs_many <= 1);
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
