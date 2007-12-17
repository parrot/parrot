#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$


use Test::More;
sub Pod::Coverage::TRACE_ALL () { 1 }
eval "use Test::Pod::Coverage 1.04";
plan skip_all => "Test::Pod::Coverage 1.04 required for testing POD coverage" if $@;
plan skip_all => "Currently a developer-only test" unless -d '.svn';
all_pod_coverage_ok();

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
