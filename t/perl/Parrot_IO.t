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

When one or more of the C<Parrot::IO> modules is modified, run the tests
to ensure nothing is broken.

=cut

use lib 'lib';
use Test::More 'tests' => 54;
use File::Spec::Functions qw(:ALL);
    
# Path is really only an abstract superclass but there's a few things we
# can do with it.
BEGIN { use_ok('Parrot::IO::Path') };

my $suffix = 'txt';
my $name = 'file';
my $fullname = join '.', $name, $suffix;
my $tmpfile = tmp_file_path($fullname);

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

ok($p->parent_path eq tmp_dir_path(), 'parent_path');

teardown();

BEGIN { use_ok('Parrot::IO::Directory') };
BEGIN { use_ok('Parrot::IO::File') };

my $d = Parrot::IO::Directory->tmp_directory('t');
ok($d, 'tmp_directory');

# Create a file in a directory that does not exist.
my $f3 = Parrot::IO::File->new(tmp_file_path('t', 'one', 'two', 'file3.bar'));
ok($f3, 'file new');

my $d1 = $d->directory_with_name('one');
my $d2 = $d1->directory_with_name('two');
ok($d1 && $d2, 'directory_with_name');

my $f = Parrot::IO::File->tmp_file($fullname);
ok($f, 'tmp_file');

# Check the instance got re-blessed.
ok($p == $f, 'path became file');

my $f1 = $d1->file_with_name('file1.txt');
my $f2 = $d2->file_with_name('file2.foo');
ok($f1 && $f2, 'file_with_name');

# Relative paths.
ok($d->relative_path($d->path) eq '', 'relative_path same dir');
ok($d1->relative_path($f1->path) eq 'file1.txt', 'relative_path same file');
ok($d->relative_path($d1->path) eq 'one', 'relative_path down to dir');
ok($d->relative_path($f1->path) eq catfile(qw(one file1.txt)), 
	'relative_path down to file');
ok($d1->relative_path($d->path) eq '..', 'relative_path up to dir');
ok($d->relative_path($f->path) eq catfile(qw(.. file.txt)), 
	'relative_path up to file');
ok($d1->relative_path($f->path) eq catfile(qw(.. .. file.txt)), 
	'relative_path up twice to file');
ok($d->relative_path_is_directory(catdir(qw(one two))), 
	'relative_path_is_directory');
ok($d->relative_path_is_file(catfile(qw(one two file2.foo))), 
	'relative_path_is_file');
ok($d2 == $d->directory_with_relative_path(catdir(qw(one/two))),
	'file_with_relative_path');
ok($f2 == $d->file_with_relative_path(catfile(qw(one two file2.foo))),
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

$f = Parrot::IO::File->new(
	catfile('lib', 'Parrot', 'IO', 'File.pm'));
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
	unlink(tmp_file_path(qw(t one two file2.foo)));
	unlink(tmp_file_path(qw(t one two file3.bar)));
	unlink(tmp_file_path(qw(t one file1.txt)));
	rmdir(tmp_dir_path(qw(t one two)));
	rmdir(tmp_dir_path(qw(t one)));
	rmdir(tmp_dir_path('t'));
}

# tmp_dir_path(@dirs)
sub tmp_dir_path
{
	return catdir(tmpdir, @_);
}

# tmp_file_path(@dirs, $file)
sub tmp_file_path
{
	my $file;
	
	if ( @_ == 1 )
	{
		$file = catfile(tmp_dir_path(), shift);
	}
	else
	{
		$file = pop(@_);
		$file = catfile(tmp_dir_path(@_), $file);
	}
	
	return $file;
}
