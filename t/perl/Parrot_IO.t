#! perl
# Copyright (C) 2001-2012, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More 'tests' => 56;

use Parrot::Distribution;
use File::Spec::Functions ':ALL';
use File::Temp qw/tempdir/;

=head1 NAME

t/perl/Parrot_IO.t - Parrot::IO unit tests

=head1 SYNOPSIS

    % prove t/perl/Parrot_IO.t

=head1 DESCRIPTION

These tests cover the basic functionality of C<Parrot::IO::File> and
C<Parrot::IO::Directory>: directory contents, file
C<read>/C<write>/C<append>, modification times, and relative paths.

There are also a few test for C<Parrot::IO::Path>, the abstract
superclass for these two modules, which cover "tmp" paths, and name and
suffix recognition.

When one or more of the C<Parrot::IO> modules is modified, run the tests
to ensure nothing is broken.

=cut

# Path is really only an abstract superclass but there are a few things we
# can do with it.
BEGIN { use_ok('Parrot::IO::Path') }

my $file_temp_work_path = tempdir(
    'PARROT_IO_XXXX',
    TMPDIR => 1,
    CLEANUP => 1
);
# you can sort of count on the var below being the unique part of the temp dir
my $file_temp_dir = (splitdir($file_temp_work_path))[-1];

my $suffix   = 'txt';
my $name     = 'file';
my $fullname = join '.', $name, $suffix;
my $tmpfile  = tmp_file_path($fullname);

my $p = Parrot::IO::Path->new($tmpfile);

# Path parsing.
ok( $p,                      'new' );
ok( $p->has_suffix(),        'has_suffix none' );
ok( $p->has_suffix($suffix), 'has_suffix correct' );
ok( !$p->has_suffix('foo'),  'has_suffix incorrect' );
is( $p->suffix(),              $suffix,   'suffix' );
is( $p->name(),                $fullname, 'name' );
is( $p->name_without_suffix(), $name,     'name_without_suffix' );

# Check we get the same instance each time.
is( $p, Parrot::IO::Path->new($tmpfile), 'instance cached' );
my $oldp = $p;
$p->delete();
ok( !defined $p, 'delete undefined instance' );

# This will not create the file on disk.
$p = Parrot::IO::Path->new($tmpfile);
isnt( $oldp, $p, 'delete from cache' );

is( $p->parent_path(), tmp_dir_path(), 'parent_path' );

my $r = Parrot::IO::Path->new( rootdir() );
ok( !$r->parent_path(), 'root has no parent_path' );

teardown();

BEGIN { use_ok('Parrot::IO::Directory') }
BEGIN { use_ok('Parrot::IO::File') }

$r = Parrot::IO::Directory->new(rootdir);
ok( $r, 'new' );
isa_ok( $r, 'Parrot::IO::Directory' );
ok( !$r->parent(), 'root has no parent' );

my $d = Parrot::IO::Directory->tmp_directory(
    catfile($file_temp_dir, 't')
);
ok( $d, 'tmp_directory' );

# Create a file in a directory that does not exist.
my $f3 = Parrot::IO::File->new( tmp_file_path( 't', 'one', 'two', 'file3.bar' ) );
ok( $f3, 'file new' );

my $d1 = $d->directory_with_name('one');
my $d2 = $d1->directory_with_name('two');
ok( $d1 && $d2, 'directory_with_name' );

my $f = Parrot::IO::File->tmp_file(catfile($file_temp_dir, $fullname));
ok( $f, 'tmp_file' );

# Check the instance got re-blessed.
is( $p, $f, 'path became file' );

my $f1 = $d1->file_with_name('file1.txt');
my $f2 = $d2->file_with_name('file2.foo');
ok( $f1 && $f2, 'file_with_name' );

# Relative paths.
is( $d->relative_path( $d->path ),   curdir(),                   'relative_path same dir' );
is( $d1->relative_path( $f1->path ), 'file1.txt',                'relative_path same file' );
is( $d->relative_path( $d1->path ),  'one',                      'relative_path down to dir' );
is( $d->relative_path( $f1->path ),  catfile(qw(one file1.txt)), 'relative_path down to file' );
is( $d1->relative_path( $d->path ),  '..',                       'relative_path up to dir' );
is( $d->relative_path( $f->path ),   catfile(qw(.. file.txt)),   'relative_path up to file' );
is( $d1->relative_path( $f->path ), catfile(qw(.. .. file.txt)), 'relative_path up twice to file' );
ok( $d->relative_path_is_directory( catdir(qw(one two)) ),       'relative_path_is_directory' );
ok( $d->relative_path_is_file( catfile(qw(one two file2.foo)) ), 'relative_path_is_file' );
is( $d2, $d->directory_with_relative_path( catdir(qw(one/two)) ),       'file_with_relative_path' );
is( $f2, $d->file_with_relative_path( catfile(qw(one two file2.foo)) ), 'file_with_relative_path' );

# Names and paths.
my @a = $d1->file_and_directory_names;
is( 'file1.txt two', join( ' ', @a ), 'file_and_directory_names' );

@a = $d1->file_and_directory_paths;
is( @a, 2, 'file_and_directory_paths' );
@a = $d1->directory_paths;
is( @a, 1, 'directory_paths' );
@a = $d1->file_paths;
is( @a, 1, 'file_paths' );

# File instances
@a = $d2->files;
is( 'file2.foo file3.bar', join( ' ', map { $_->name } @a ), 'files' );
@a = $d->files(1);
is( 'file1.txt file2.foo file3.bar', join( ' ', map { $_->name } @a ), 'files recursive' );
@a = $d->files( 1, 'two' );
is( 'file1.txt', join( ' ', map { $_->name } @a ), 'files recursive ignore' );

# File suffix
@a = $d1->file_suffixes();
ok( 'txt' eq join( ' ', @a ), 'file_suffixes' );
@a = $d->file_suffixes(1);
is( 'bar foo txt', join( ' ', @a ), 'file_suffixes recursive' );

@a = $d->file_suffixes( 1, 'two' );
is( 'txt', join( ' ', @a ), 'file_suffixes recursive ignore' );

@a = $d->files_with_suffix( 'txt', 1, 'two' );
is( 'file1.txt', join( ' ', map { $_->name } @a ), 'files_with_suffix recursive ignore' );

# Status (stat info)
my $time = $f3->stat->mtime;
diag $time if $^O eq 'MSWin32';
ok( !$f3->modified_since($time), 'not modified_since' );

# So that the modified time will be greater than $time.
sleep 1 while time() <= ( $time + 1 );

# Now the read/write stuff.
$f3->write("hello");
is( $f3->read, "hello", 'read/write' );
$f3->append("\nworld");
is( $f3->read, "hello\nworld", 'append and scalar read' );
@a = $f3->read;
is( $a[1], "world", 'array read' );

TODO: {
    local $TODO = "stat->mtime broken in the Windows msvcrt [GH #820]"
      if $^O eq 'MSWin32' and !defined &Win32::UTCFileTime::stat;
    diag $f3->stat->mtime if $^O eq 'MSWin32';
    ok( $f3->modified_since($time), 'modified_since' );
}
$f3->delete();
@a = $d2->files();
is( @a, 1, 'file delete' );
ok( !defined $f3, 'delete undefined file' );

$d2->delete();
@a = $d1->directories();
is( @a, 0, 'directory delete' );
ok( !defined $d2, 'delete undefined directory' );

$d->delete_contents();
@a = $d->file_and_directory_paths();
is( @a, 0, 'delete_contents' );

teardown();

sub teardown {
    unlink( tmp_file_path(qw(t one two file2.foo)) );
    unlink( tmp_file_path(qw(t one two file3.bar)) );
    unlink( tmp_file_path(qw(t one file1.txt)) );
    rmdir( tmp_dir_path(qw(t one two)) );
    rmdir( tmp_dir_path(qw(t one)) );
    rmdir( tmp_dir_path('t') );
}

# tmp_dir_path(@dirs)
sub tmp_dir_path {
    return catdir( $file_temp_work_path, @_ );
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
