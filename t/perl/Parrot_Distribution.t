#! perl
# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More 'tests' => 8;


=head1 NAME

t/perl/Parrot_Distribution.t - Parrot::Distribution unit tests

=head1 SYNOPSIS

	% prove t/perl/Parrot_Distribution.t

=head1 DESCRIPTION

=cut


BEGIN { use_ok('Parrot::Distribution') };

die "Run these tests from the distribution root\n" unless -d 't/perl';

# search upwards
chdir 't/perl';
my $d = Parrot::Distribution->new();
isa_ok($d, 'Parrot::Docs::Directory');

ok($d->c_source_file_with_name('pf_items'), 'C source file');
ok( ! $d->c_source_file_with_name('dummy'), 'C source file not there');

ok($d->c_header_file_with_name('parrot'), 'C header file');
ok( ! $d->c_header_file_with_name('dummy'), 'C header file not there');

ok($d->file_for_perl_module('Parrot::Docs::Section::Parrot'), 'Perl module file');
ok( ! $d->file_for_perl_module('Parrot::Dummy'), 'Perl module file not there');
