#! perl
# Copyright (C) 2001-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More 'tests' => 24;
use File::Spec::Functions qw(:ALL);

=head1 NAME

t/perl/Parrot_Docs.t - Parrot::Docs unit tests

=head1 SYNOPSIS

    % prove t/perl/Parrot_Docs.t

=head1 DESCRIPTION

These tests cover the basic functionality of the C<Parrot::Docs>
modules: file types, POD syntax checking, and to-HTML formatting.

When one or more of the C<Parrot::Docs> modules is modified, run the tests
to ensure nothing is broken.

=cut

BEGIN { use_ok("Parrot::Docs::POD2HTML") }

ok(
    Parrot::Docs::POD2HTML->href_path('docs\pdds\pdd00_pdd.pod.html') eq
        'docs/pdds/pdd00_pdd.pod.html',
    'href_path'
);

BEGIN { use_ok('Parrot::Docs::Directory') }
BEGIN { use_ok('Parrot::Docs::File') }

teardown();

my $d = Parrot::Docs::Directory->new( catfile(qw(lib Parrot Docs)) );
my @a = $d->files_of_type('Perl module');

# This will fail if you add a new module.
is( @a, 9, 'files_of_type succeed' );
@a = $d->files_of_type('foo');
is( @a, 0, 'files_of_type fail' );

my $f = $d->file_with_name('File.pm');
ok( $f->is_of_type('Perl module'), 'is_of_type succeed' );
ok( !$f->is_of_type('foo'), 'is_of_type fail' );
is( $f->short_description, 'Docs-Related File', 'short_description' );

$f = Parrot::Docs::File->new( tmp_file_path('file.pod') );
$f->write("foo");
ok( !$f->contains_pod, 'contains_pod no' );
$f->write("=head1 FOO\n\nFoo\n\n=cut\n\nbar\n");
ok( $f->contains_pod, 'contains_pod yes, no errors' );
is( $f->num_pod_errors, 0, 'num_pod_errors none' );

# Not the best of tests, but at least something.
$f->write("=haed1 FOO\n\nFoo\n\n=cut\n\nbar\n");
ok( $f->contains_pod, 'contains_pod yes, errors' );
is( $f->num_pod_errors, 1, 'num_pod_errors one' );
like( $f->pod_errors, qr/error/s, 'pod_errors' );

# Now the structural classes.
BEGIN { use_ok('Parrot::Docs::Item') }
BEGIN { use_ok('Parrot::Docs::Group') }
BEGIN { use_ok('Parrot::Docs::Section') }

my $src = Parrot::Docs::Directory->new( tmp_dir_path('src') );
$d = $src->directory_with_name('foo');
$f = $d->file_with_name('file1.pod');
$f->write("=head1 NAME\n\nxyz - foo/file1.pod\n\n=cut\n");
$f = $d->file_with_name('file2.pod');
$f->write("=head1 NAME\n\nxyz - foo/file1.pod\n\n=cut\n");
$d = $src->directory_with_name('bar');
$f = $d->file_with_name('file3.pod');
$f->write("=head1 NAME\n\nxyz - bar/file3.pod\n\n=cut\n");
$f = $src->file_with_name('file.txt');
$f->write("file.txt");
$d = $src->directory_with_name('pub');
$f = $d->file_with_name('beer.pint');

my $i = Parrot::Docs::Item->new( 'Usual suspects', 'foo', 'bar' );
ok( $i, 'new item' );

my $g = Parrot::Docs::Group->new(
    'Usual suspects',
    '',
    Parrot::Docs::Item->new( '', 'foo' ),
    Parrot::Docs::Item->new( '', 'bar' )
);

ok( $g, 'new group' );
is( $g->name, 'Usual suspects', 'name' );

my $s = Parrot::Docs::Section->new(
    'Usual Suspects',
    'index.html',
    'here they are...',
    Parrot::Docs::Item->new( 'our old friend', 'foo' ),
    Parrot::Docs::Group->new(
        'Bar', 'no jeans', Parrot::Docs::Item->new( 'time please', 'bar', 'pub' )
        )
);

ok( $s, 'new section' );

my $tgt = Parrot::Docs::Directory->new( tmp_dir_path('tgt') );

# hack to omit adding the files to MANIFEST.generated
$s->{TESTING} = 1;
$s->write_html( $src, $tgt, 1 );

$f = $tgt->file_with_name('index.html');

ok( $f, 'index.html' );

my $html = $f->read;

ok(
    $html        =~ m|Usual Suspects|s
#        && $html =~ m|here they are|s
        && $html =~ m|foo/file1.pod|s
        && $html =~ m|foo/file2.pod|s
        && $html =~ m|Bar|s
#        && $html =~ m|no jeans|s
        && $html =~ m|bar/file3.pod|s
        && $html =~ m|time please|s,
    'write_html'
);

teardown();

sub teardown {
    Parrot::Docs::File->new( tmp_file_path('file.pod') )->delete();
    Parrot::Docs::Directory->new( tmp_dir_path('src') )->delete();
    Parrot::Docs::Directory->new( tmp_dir_path('tgt') )->delete();
}

# tmp_dir_path(@dirs)
sub tmp_dir_path {
    return catdir( tmpdir, @_ );
}

# tmp_file_path(@dirs, $file)
sub tmp_file_path {
    my $file;

    if ( @_ == 1 ) {
        $file = catfile( tmp_dir_path(), shift );
    }
    else {
        $file = pop(@_);
        $file = catfile( tmp_dir_path(@_), $file );
    }

    return $file;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
