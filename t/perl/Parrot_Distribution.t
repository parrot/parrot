#! perl -w

=head1 NAME

t/perl/Parrot_Distribution.t - Parrot::Distribution unit tests

=head1 SYNOPSIS

	% perl t/perl/Parrot_Distribution.t

=head1 DESCRIPTION

=cut

use lib 'lib';
use Test::More 'tests' => 5;

BEGIN { use_ok('Parrot::Distribution') };

die "Run these tests from the distribution root\n" unless -d 't/perl';
chdir 't/perl';
$d = Parrot::Distribution->new;
ok($d, 'find distribution');
$f = $d->c_source_file_with_name('pf_items');
ok($f, 'C source file');
$f = $d->c_header_file_with_name('parrot');
ok($f, 'C header file');
$f = $d->file_for_perl_module('Parrot::Docs::Section::Parrot');
ok($f, 'Perl module file');
