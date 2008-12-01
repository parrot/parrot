#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;
use Parrot::Test::Util::Runloop;

=head1 NAME

t/codingstd/cppcomments.t - checks for C++ style comments

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/cppcomments.t

    # test specific files
    % perl t/codingstd/cppcoments.t src/foo.t include/parrot/bar.h

=head1 DESCRIPTION

Checks that no source file in the distribution uses C++ style comments.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new();
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();
@files = grep { $_->name !~ /.l$/ } @files;


Parrot::Test::Util::Runloop->testloop(
    name        => 'no c++ comments',
    files       => [@files],
    per_file    => \&check_cppcomments,
    diag_prefix => 'C++ comments found'
);

sub check_cppcomments {
    my $buf = shift;
    $buf =~ s{ (?:
                   (?: ' (?: \\\\ | \\' | [^'] )* ' )  # remove ' string
                 | (?: " (?: \\\\ | \\" | [^"] )* " )  # remove " string
                 | /\* .*? \*/                         # remove C comment
               )
            }{}gsx;

    return $buf !~ m{ ( .*? // .* ) }x;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
