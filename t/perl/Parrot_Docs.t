#! perl -w

=head1 NAME

t/perl/Parrot_Docs.t - Parrot::Docs unit tests

=head1 SYNOPSIS

	% perl t/perl/Parrot_Docs.t

=head1 DESCRIPTION

These tests cover the basic functionality of the C<Parrot::Docs>
modules: file types, POD syntax checking, and to-HTML formatting.

When one or more of the C<Parrot::Docs> modules is modified, run the tests
to ensure nothing is broken.

=cut

use lib 'lib';
use Test::More 'tests' => 23;
use File::Spec::Functions qw(:ALL);

# IO stuff first.
BEGIN { use_ok('Parrot::Docs::Directory') };
BEGIN { use_ok('Parrot::Docs::File') };

teardown();

my $d = Parrot::Docs::Directory->new(catfile(qw(lib Parrot Docs)));
my @a = $d->files_of_type('Perl module');
# This will fail if you add a new module.
ok(@a == 6, 'files_of_type succeed');
@a = $d->files_of_type('foo');
ok(@a == 0, 'files_of_type fail');

my $f = $d->file_with_name('File.pm');
ok($f->is_of_type('Perl module'), 'is_of_type succeed');
ok(!$f->is_of_type('foo'), 'is_of_type fail');
ok($f->short_description eq 'Docs-related file methods', 'short_description');

# We have to sleep(1) here to ensure the modification time changes.
$f = Parrot::Docs::File->new(tmp_file_path('file.pod'));
$f->write("foo");
ok(!$f->contains_pod, 'contains_pod no');
sleep(1);
$f->write("=head1 FOO\n\nFoo\n\n=cut\n\nbar\n");
ok($f->contains_pod, 'contains_pod yes, no errors');
ok($f->num_pod_errors == 0, 'num_pod_errors none');
# Not the best of tests, but at least something.
ok($f->pod_as_html =~ m|<html>.*?</html>|s, 'pod_as_html');
sleep(1);
$f->write("=haed1 FOO\n\nFoo\n\n=cut\n\nbar\n");
ok($f->contains_pod, 'contains_pod yes, errors');
ok($f->num_pod_errors == 1, 'num_pod_errors one');
ok($f->pod_errors =~ /error/s, 'pod_errors');

# Now the structural classes.
BEGIN { use_ok('Parrot::Docs::Item') };
BEGIN { use_ok('Parrot::Docs::Group') };
BEGIN { use_ok('Parrot::Docs::Section') };

my $src = Parrot::Docs::Directory->new(tmp_dir_path('src'));
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

my $i = Parrot::Docs::Item->new('Usual suspects', 'foo', 'bar');
ok($i, 'new item');

my $g = Parrot::Docs::Group->new('Usual suspects', '',
	Parrot::Docs::Item->new('', 'foo'),
	Parrot::Docs::Item->new('', 'bar'));

ok($g, 'new group');
ok($g->name eq 'Usual suspects', 'name');

$s = Parrot::Docs::Section->new('Usual Suspects', 'index.html',
		'here they are...',
	    Parrot::Docs::Item->new('our old friend', 'foo'),
		Parrot::Docs::Group->new('Bar', 'no jeans',
	    	Parrot::Docs::Item->new('time please', 'bar', 'pub')));

ok($s, 'new section');

my $tgt = Parrot::Docs::Directory->new(tmp_dir_path('tgt'));

$s->write_html($src, $tgt, 1);

$f = $tgt->file_with_name('index.html');

ok($f, 'index.html');

$html = $f->read;

ok($html =~ m|Usual Suspects|s &&
$html =~ m|here they are|s &&
$html =~ m|foo/file1.pod|s &&
$html =~ m|foo/file2.pod|s &&
$html =~ m|Bar|s &&
$html =~ m|no jeans|s &&
$html =~ m|bar/file3.pod|s &&
$html =~ m|time please|s, 'write_html');

teardown();

sub teardown
{
	Parrot::Docs::File->new(tmp_file_path('file.pod'))->delete;
	Parrot::Docs::Directory->new(tmp_dir_path('src'));
	Parrot::Docs::Directory->new(tmp_dir_path('tgt'));
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
