#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/tools/smartlinks.t - test the smartlink generator

=head1 SYNOPSIS

    % prove t/tools/smartlinks.t

=head1 DESCRIPTION

Tests the C<smartlinks.pl> utility by exersizing different options,
processing example test files and spec documents, and examining
the output.

We never actually check the *full* output of the utility.
We simply check several smaller components to avoid a test file
that is far too unweildy.

=cut


use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Parrot::Test 'no_plan'; #tests => 34;
use Test::More;


BEGIN { use_ok 'SmartLink' or die };

{
    diag 'SmartLink';
    my $link= q{L<S05/bar/baz quux>};

    eval{ my $l= SmartLink->new; };
    like( $@, '/^Attribute \(.*? is required/', '->new requires one or more attributes' );

    my $l= SmartLink->new( link => $link );

    isa_ok( $l, 'SmartLink' );
    is( $l->link, $link, '->link returns full link text' );
    is( $l->doc, 'S05', '->doc returns document identifier' );
    is( $l->section, 'bar', '->section returns document section' );
    is( $l->docprefix, 'S', '->docprefix returns document prefix' );
    is( $l->docnum, '05', '->docnum returns documnt number' );
    is_deeply( $l->keyphrases, [qw/baz quux/],
        '->keyphrases returns array of keyphrases' );

    $link= q{L<S05/bar/a b 'c d e' f g "h'i j" k>};
    $l= SmartLink->new( link => $link );

    isa_ok( $l, 'SmartLink' );
    is( $l->link, $link, '->link returns full link text' );
    is( $l->doc, 'S05', '->doc returns document identifier' );
    is( $l->section, 'bar', '->section returns document section' );
    is( $l->docprefix, 'S', '->docprefix returns document prefix' );
    is( $l->docnum, '05', '->docnum returns documnt number' );
    is_deeply( $l->keyphrases, ['a', 'b', 'c d e', 'f', 'g', "h'i j", 'k'],
        '->keyphrases returns array of keyphrases' );
}

{
    diag 'PodFile';
    my $fn= 'docs/pdds/pdd03_calling_conventions.pod';

    eval{ my $p= PodFile->new; };
    like( $@, '/^Attribute \(.*?\) is required/', '->new requires one or more attributes' );

    my $p= PodFile->new( filename => $fn );

    isa_ok( $p, 'PodFile' );
    is( $p->filename, $fn, '->filename returns given filename' );
    is( $p->name, 'pdd03_calling_conventions', '->name returns file basename' );
    is( $p->path, 'docs/pdds/', '->path returns file path' );
    is( $p->extension, '.pod', '->extension returns C<.pod>' );
    # TODO: ->tree
}

{
    diag 'SpecFile';
    my $fn= 'docs/pdds/pdd03_calling_conventions.pod';
    my $pre= 'pdd';

    eval{ my $s= SpecFile->new; };
    like( $@, '/^Attribute \(.*?\) is required/', '->new requires one or more attributes' );

    my $s= SpecFile->new( filename => $fn, prefix => $pre );

    isa_ok( $s, 'SpecFile' );
    is( $s->name, 'pdd03_calling_conventions', '->name returns file basename' );
    is( $s->path, 'docs/pdds/', '->path returns file path' );
    is( $s->extension, '.pod', '->extension returns C<.pod>' );
    is( $s->num, '03', '->num returns spec number' );

    $s= SpecFile->new( filename => '3.pod', prefix => '' );
    is( $s->name, '3', '->name returns "3"' );
    is( $s->prefix, '', '->prefix returns empty string' );
    is( $s->num, '3', '->num returns spec number' );

    $s= SpecFile->new( filename => 'S.pod', prefix => 'S' );
    is( $s->name, 'S', '->name returns "S"' );
    is( $s->prefix, 'S', '->prefix returns "S"' );
    is( $s->num, '', '->num returns empty string' );
}

{
    diag 'SpecFiles';
    my $root= 'docs/pdds/';
    my $pre= 'pdd';

    eval{ my $s= SpecFiles->new; };
    like( $@, '/^Attribute \(.*?\) is required/', '->new requires one or more attributes' );

    my $s= SpecFiles->new( prefix => $pre, root => $root );

    isa_ok( $s, 'SpecFiles' );
    is( $s->root, $root, '->root returns spec file directory' );
    is( $s->extension, '.pod', '->extension returns file extension' );
    is( $s->prefix, $pre, '->prefix returns spec file prefix' );
    is( ref $s->files, 'ARRAY', '->files is an array reference' );

    ok( ( grep {$_->name eq 'pdd07_codingstd'} @{$s->files} ),
        '->files contains a known spec file' );
    # TODO: many more ->files tests
}

{
    diag 'TestFile';
    my $fn= 't/util/smartlinks.t';

    eval{ my $t= TestFile->new; };
    like( $@, '/^Attribute \(.*?\) is required/', '->new requires one or more attributes' );

    my $t= TestFile->new( filename => $fn );

    isa_ok( $t, 'TestFile' );
    is( $t->filename, $fn, '->filename returns given filename' );
    is( $t->name, 'smartlinks', '->name returns file basename' );
    is( $t->path, 't/util/', '->path returns file path' );
    is( $t->extension, '.t', '->extension returns C<.pod>' );
    # TODO: ->tests, ->smartlinks
}

# TODO: Test
# TODO: TestInfo
# TODO: SmartLinkServer
# TODO: main
# TODO: end-to-end testing


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
