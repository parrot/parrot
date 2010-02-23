#! perl
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/distro/meta_yml.t - check sanity of the META.yml file

=head1 SYNOPSIS

    % prove t/distro/meta_yml.t

=head1 DESCRIPTION

Checks the sanitiy of the file META.yml, which gives information
on a CPAN distribution.

=cut

use strict;
use warnings;
use 5.008;

use Test::More;

# Test::CPAN::Meta complains about 'artistic2' license.
# So let's wait for version 0.08
# See http://rt.cpan.org/Public/Bug/Display.html?id=34130
eval "use Test::CPAN::Meta 0.08";
plan skip_all => "Test::CPAN::Meta 0.08 required for testing META.yml" if $@;

meta_yaml_ok();

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
