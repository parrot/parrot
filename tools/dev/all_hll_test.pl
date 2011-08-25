#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use autodie;

=head1 NAME

tools/dev/all_hll_test.pl - run the test suite for a many of Parrot-dependent
projects.

=head1 SYNOPSIS

  $ perl tools/dev/all_hll_test.pl

=cut

# make a temp dir
# install Parrot to tmp/parrot_install
# download Rakudo to tmp/download
# build Rakudo using tmp/parrot_install/bin/parrot_config
# run Rakudo's spectest

my $tmp_dir = "/tmp/parrot_all_hll_test";
my $install_dir = "$tmp_dir/parrot_install";
qx<rm -rf $tmp_dir>;
mkdir $tmp_dir;
mkdir $install_dir;

print "running Configure.pl on Parrot in cwd\n";
system "perl Configure.pl --prefix=$install_dir";
print "installing Parrot into tmp dir\n";
system qw<make install>;

chdir $tmp_dir;
print "cloning nqp\n";
system qw<git clone git://github.com/perl6/nqp.git nqp_test>;
chdir "nqp_test";
system "perl Configure.pl --with_parrot=$install_dir/bin/parrot";
print "installing nqp to tmp dir\n";
system qw<make install>;

chdir $tmp_dir;
system qw<git clone -b nom https://github.com/rakudo/rakudo.git rakudo_test>;
chdir "rakudo_test";
system "perl Configure.pl --with-parrot=$install_dir/bin/parrot";
print "building Rakudo\n";
system qw<make spectest_regression>;
print "running Rakudo's spectest_regression\n";
system qw<make spectest_regression>;



# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
