#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw[ . lib ../lib ../../lib ];
use Test::More tests => 1;
use Parrot::Distribution;

=head1 NAME

t/codingstd/c_enum.t - checks for rules related to enums in C source

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_enum.t

    # test specific files
    % perl t/codingstd/c_enum.t src/foo.c include/parrot/bar.h


=head1 DESCRIPTION

Checks that all C language source files use enums appropriately (eg: C89-compliant).

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? <@ARGV> : $DIST->get_c_language_files();

check_enums(@files);

exit;

sub check_enums {
    my @trailing_comma;

    foreach my $file (@_) {
        my $path = @ARGV ? $file : $file->path();
        my $buf  = $DIST->slurp($path);

        # strip ', ", and C comments
        $buf =~ s{ (?:
                       (?: (') (?: \\\\ | \\' | [^'] )* (') ) # remove ' string
                     | (?: (") (?: \\\\ | \\" | [^"] )* (") ) # remove " string
                     | /(\*) .*? (\*)/                        # remove C comment
                   )
                }{defined $1 ? "$1$2" : defined $3 ? "$3$4" : "$5$6"}egsx;

        if ($buf =~ /enum \s+ (?: (\w+) \s+ )? {
                [^}]+,
                \s+ } (?: \s+ (\w+) )?/x) {
            my $name = $1 || $2 || '(anonymous)';
            push @trailing_comma => "$path: $name";
        }
    }

    is( join("\n", @trailing_comma), "", <<END_DESCRIPTION );
trailing commas in enums are not legal C89
END_DESCRIPTION
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
