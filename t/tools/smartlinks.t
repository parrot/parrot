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

use File::Temp qw( tempdir tempfile );
use Parrot::Test;
use Test::More;

eval { require Moose };
$@ ? plan skip_all => 'Moose not installed' : plan tests => 65;


BEGIN { use_ok 'SmartLink' or die };


sub vdiag(@) { &diag if $ENV{TEST_VERBOSE} };

{
    vdiag 'SmartLink: multiple keyphrases';
    my $link= q{L<S05/bar/baz quux>};

    eval{ my $l= SmartLink->new; };
    like( $@, '/^Attribute \(.*? is required/',
        '->new requires one or more attributes' );

    my $l= SmartLink->new( link => $link );

    isa_ok( $l, 'SmartLink' );
    is( $l->link, $link, '->link returns full link text' );
    is( $l->section, 'bar', '->section returns document section' );
    ok( $l->has_keyphrases, '->has_keyphrases returns true' );

    vdiag 'SmartLink->Keyphrase';
    my $k= $l->keyphrases;
    ok( $l->has_keyphrases, '->has_keyphrases returns true' );
    isa_ok( $k, 'Keyphrase' );
    is( $k->string, 'baz quux', '->string returns keyphrase string' );
    is_deeply( $k->list, [qw/baz quux/],
        '->list returns arrayref of keyphrases' );
    is( $k->regex, '\bbaz\b.+?\bquux\b', '->regex returns regex' );

    vdiag 'SmartLink->Doc';
    my $d= $l->doc;
    isa_ok( $d, 'Doc' );
    is( $d->id, 'S05', '->id returns document identifier' );
    is( $d->prefix, 'S', '->prefix returns document prefix' );
    is( $d->num, '05', '->num returns document number' );


    vdiag 'SmartLink: invalid format';
    $link= q{L<S05/bar/>};
    eval{ my $l= SmartLink->new( link => $link ); };
    like( $@,
        '/^Attribute \(link\) does not pass the type constraint \(PodLink\)/',
        '->new fails with malformed smartlink' );


    vdiag 'SmartLink: complex keyphrases';
    $link= q{L<S05/bar/a b 'c d e' f g "h'i j" k>};
    $l= SmartLink->new( link => $link );

    isa_ok( $l, 'SmartLink' );
    is( $l->link, $link, '->link returns full link text' );
    is( $l->section, 'bar', '->section returns document section' );
    ok( $l->has_keyphrases, '->has_keyphrases returns true' );

    vdiag 'SmartLink->Keyphrase';
    $k= $l->keyphrases;
    ok( $l->has_keyphrases, '->has_keyphrases returns true' );
    isa_ok( $k, 'Keyphrase' );
    is( $k->string, q{a b 'c d e' f g "h'i j" k},
        '->string returns keyphrase string' );
    is_deeply( $k->list, ['a', 'b', 'c d e', 'f', 'g', "h'i j", 'k'],
        '->list returns arrayref of keyphrases' );
    is( $k->regex,
        q{\ba\b.+?\bb\b.+?\bc\ d\ e\b.+?\bf\b.+?\bg\b.+?\bh\'i\ j\b.+?\bk\b},
        '->regex returns regex' );

    vdiag 'SmartLink->Doc';
    $d= $l->doc;
    isa_ok( $d, 'Doc' );
    is( $d->id, 'S05', '->doc returns document identifier' );
    is( $d->prefix, 'S', '->docprefix returns document prefix' );
    is( $d->num, '05', '->docnum returns document number' );


    vdiag 'SmartLink: no keyphrases';
    $link= q{L<S05/bar>};
    $l= SmartLink->new( link => $link );

    isa_ok( $l, 'SmartLink' );
    is( $l->link, $link, '->link returns full link text' );
    is( $l->section, 'bar', '->section returns document section' );
    ok( !$l->has_keyphrases, '->has_keyphrases returns false' );
    is( $l->keyphrases, undef, '->keyphrases returns undef' );
}

{
    vdiag 'File';
    my( $fh, $fn )= tempfile();
    print $fh "i am a file" and close $fh;
    my $f= File->new( filename => $fn );
    isa_ok( $f, 'File' );
    # TODO: many more tests
}

{
    # TODO: this should use a tempfile
    vdiag 'PodFile';
    my $fn= 'docs/pdds/pdd03_calling_conventions.pod';

    eval{ my $p= PodFile->new; };
    like( $@, '/^Attribute \(.*?\) is required/',
        '->new requires one or more attributes' );

    my $p= PodFile->new( filename => $fn );

    isa_ok( $p, 'PodFile' );
    is( $p->filename, $fn, '->filename returns given filename' );
    is( $p->name, 'pdd03_calling_conventions', '->name returns file basename' );
    is( $p->path, 'docs/pdds/', '->path returns file path' );
    is( $p->extension, '.pod', '->extension returns C<.pod>' );
    # TODO: ->tree
}

{
    # TODO: this should use a tempfile
    vdiag 'SpecFile';
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
    # TODO: this should use a tempfile
    vdiag 'SpecFiles';
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
    # TODO: this should use a tempfile
    vdiag 'TestFile';
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
