#!/usr/bin/perl -w

use strict;
use lib '.';
use Parrot::Optimizer;

my $file = $ARGV[0];

my $opt = Parrot::Optimizer->new();
$opt->read($file);
$opt->optimize();
$opt->write($file.".opt");
