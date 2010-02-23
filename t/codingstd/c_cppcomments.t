#! perl
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;
use Parrot::Test::Util::Runloop;

=head1 NAME

t/codingstd/c_cppcomments.t - checks for C++ style comments

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_cppcomments.t

    # test specific files
    % perl t/codingstd/c_cppcoments.t src/foo.t include/parrot/bar.h

=head1 DESCRIPTION

Checks that no source file in the distribution uses C++ style comments.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my @files;
if ( @ARGV ) {
    @files = <@ARGV>;
}
else {
    my $DIST = Parrot::Distribution->new();
    @files = $DIST->get_c_language_files();
    @files = grep { $_->name !~ /.l$/ } @files;
}

Parrot::Test::Util::Runloop->testloop(
    name        => 'no c++ comments',
    files       => [@files],
    per_file    => \&check_cppcomments,
    diag_prefix => 'C++ comments found'
);

# TT # 414 (https://trac.parrot.org/parrot/ticket/414):
# In the POD inside a C source code file, a hyperlink such as
# https://trac.parrot.org will be inaccurately reported as a C++-style
# comment.
# Quick fix added
sub check_cppcomments {
    my $buf = shift;
    $buf =~ s{ (?:
                   (?: ' (?: \\\\ | \\' | [^'] )* ' )  # remove ' string
                 | (?: " (?: \\\\ | \\" | [^"] )* " )  # remove " string
                 | /\* .*? \*/                         # remove C comment
                 | https?:\/\/                         # TT # 414 quick fix
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
