#! perl -w

=head1 NAME

t/perl/Parrot_IO.t - Parrot::IO unit tests

=head1 SYNOPSIS

	% perl t/perl/Parrot_IO.t

=head1 DESCRIPTION

These tests cover the basic functionality of C<Parrot::IO::File> and
C<Parrot::IO::Directory>: directory contents, file
C<read>/C<write>/C<append>, modification times, and relative paths.

There are also a few test for C<Parrot::IO::Path>, the abstract
superclass for these two modules, which cover "tmp" paths, and name and
suffix recognition.

These tests need only be run when one or more of the C<Parrot::IO>
modules are modified.

=cut

use lib 'lib';
use Test::More 'no_plan';
use File::Spec;
    
# Path is really only an abstract superclass but there's a few things we
# can do with it.
BEGIN { use_ok('Parrot::IO::Path') };

my $suffix = 'txt';
my $name = 'file';
my $fullname = join '.', $name, $suffix;
my $tmpdir = File::Spec->tmpdir;
my $tmpfile = File::Spec->catfile($tmpdir, $fullname);

my $p = Parrot::IO::Path->new($tmpfile);

# Path parsing.
ok($p, 'new');
ok($p->has_suffix, 'has_suffix none');
ok($p->has_suffix($suffix), 'has_suffix correct');
ok(!$p->has_suffix('foo'), 'has_suffix incorrect');
ok($p->suffix eq $suffix, 'suffix');
ok($p->name eq $fullname, 'name');
ok($p->name_without_suffix eq $name, 'name_without_suffix');

# Check we get the same instance each time.
ok($p == Parrot::IO::Path->new($tmpfile), 'instance cached');
my $oldp = "$p";
$p->delete;
ok(! defined $p, 'delete undefines instance');
# This won't actually create the file on disk.
$p = Parrot::IO::Path->new($tmpfile);
ok($oldp ne $p, 'delete from cache');

ok($p->parent_path eq $tmpdir, 'parent_path');

BEGIN { use_ok('Parrot::IO::Directory') };

teardown() if -d File::Spec->catdir($tmpdir, 't');

my $d = Parrot::IO::Directory->tmp_directory('t');
ok($d, 'tmp_directory');
my $d1 = $d->directory_with_name('one');
my $d2 = $d1->directory_with_name('two');
ok($d1 && $d2, 'directory_with_name');

BEGIN { use_ok('Parrot::IO::File') };

my $f = Parrot::IO::File->tmp_file($fullname);
ok($f, 'tmp_file');
my $f1 = $d1->file_with_name('file1.txt');
my $f2 = $d2->file_with_name('file2.foo');
my $f3 = $d2->file_with_name('file3.bar');
ok($f1 && $f2 && $f3, 'file_with_name');

# Check the instance got re-blessed.
ok($p == $f, 'path became file');

# Relative paths.
ok($d->relative_path($d->path) eq '', 'relative_path same dir');
ok($d1->relative_path($f1->path) eq 'file1.txt', 'relative_path same file');
ok($d->relative_path($d1->path) eq 'one', 'relative_path down to dir');
ok($d->relative_path($f1->path) eq 'one/file1.txt', 
	'relative_path down to file');
ok($d1->relative_path($d->path) eq '..', 'relative_path up to dir');
ok($d->relative_path($f->path) eq '../file.txt', 'relative_path up to file');
ok($d1->relative_path($f->path) eq '../../file.txt', 
	'relative_path up twice to file');

ok($d->relative_path_is_directory('one/two'), 'relative_path_is_directory');
ok($d->relative_path_is_file('one/two/file2.foo'), 'relative_path_is_file');

ok($d2 == $d->directory_with_relative_path('one/two'),
	'file_with_relative_path');
ok($f2 == $d->file_with_relative_path('one/two/file2.foo'),
	'file_with_relative_path');

# Names and paths.
my @a = $d1->file_and_directory_names;
ok('file1.txt two' eq join(' ', @a), 'file_and_directory_names');

@a = $d1->file_and_directory_paths;
ok(@a == 2, 'file_and_directory_paths');
@a = $d1->directory_paths;
ok(@a == 1, 'directory_paths');
@a = $d1->file_paths;
ok(@a == 1, 'file_paths');

# File instances
@a = $d2->files;
ok('file2.foo file3.bar' eq join(' ', map {$_->name} @a), 'files');
@a = $d->files(1);
ok('file1.txt file2.foo file3.bar' eq join(' ', map {$_->name} @a), 
	'files recursive');
@a = $d->files(1, 'two');
ok('file1.txt' eq join(' ', map {$_->name} @a), 'files recursive ignore');

# File suffix
@a = $d1->file_suffixes();
ok('txt' eq join(' ', @a), 'file_suffixes');
@a = $d->file_suffixes(1);
ok('bar foo txt' eq join(' ', @a), 'file_suffixes recursive');

@a = $d->file_suffixes(1, 'two');
ok('txt' eq join(' ', @a), 'file_suffixes recursive ignore');

@a = $d->files_with_suffix('txt', 1, 'two');
ok('file1.txt' eq join(' ', map {$_->name} @a), 
	'files_with_suffix recursive ignore');

# Status (stat info)
my $time = time;
ok(! $f3->modified_since($time), 'not modified_since');

# So that the modified time will be greater than $time.
sleep 1;

# Now the read/write stuff.
$f3->write("hello");
ok($f3->read eq "hello", 'read/write');
$f3->append("\nworld");
ok($f3->read eq "hello\nworld", 'append and scalar read');
@a = $f3->read;
ok($a[1] eq "world", 'array read');

ok($f3->modified_since($time), 'modified_since');

$f = Parrot::IO::File->new('lib/Parrot/IO/File.pm');
ok($f->has_cvs_id, 'has_cvs_id');
ok($f->cvs_id =~ /File.pm,v/, 'cvs_id');

$f3->delete;
@a = $d2->files;
ok(@a == 1, 'file delete');
ok(! defined $f3, 'delete undefined file');

$d2->delete;
@a = $d1->directories;
ok(@a == 0, 'directory delete');
ok(! defined $d2, 'delete undefined directory');

$d->delete_contents;
@a = $d->file_and_directory_paths;
ok(@a == 0, 'delete_contents');

teardown();

sub teardown
{
	unlink(File::Spec->catfile($tmpdir, 't/one/two/file2.foo'));
	unlink(File::Spec->catfile($tmpdir, 't/one/two/file3.bar'));
	unlink(File::Spec->catfile($tmpdir, 't/one/file1.txt'));
	rmdir(File::Spec->catdir($tmpdir, 't/one/two'));
	rmdir(File::Spec->catdir($tmpdir, 't/one'));
	rmdir(File::Spec->catdir($tmpdir, 't'));
}