#!/usr/bin/perl

use strict;
use warnings;

use File::Spec::Functions;
use ExtUtils::MakeMaker;

chdir( catdir(qw( lib Parrot )) );
my $custom_typemap = catfile(qw( .. .. typemap ));

( my $perl_typemap = $INC{'ExtUtils/MakeMaker.pm'} ) =~ s/MakeMaker.pm/typemap/;

my $c_file = qx/xsubpp -prototypes -typemap $perl_typemap -typemap $custom_typemap Embed.xs/;
open( my $file, '>', 'Embed.c' ) or die "Cannot write Embed.c\n";
print {$file} $c_file;
close $file;
