# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

config/gen/languages.pm - Build files for language implementations

=head1 DESCRIPTION

Config step for languages.

=cut

package gen::languages;

use strict;
use warnings;

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':gen';

our $description = 'Configuring languages';
our @args;

sub runstep
{
    my ($self, $conf) = @_;

    genfile(
        'config/gen/makefiles/languages.in'          => 'languages/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );

    genfile(
        'languages/APL/config/makefiles/root.in'     => 'languages/APL/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
        conditioned_lines                            => 1,
    );
    genfile(
        'languages/amber/config/makefiles/root.in'   => 'languages/amber/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
        conditioned_lines                            => 1,
    );
    genfile(
        'languages/bc/config/makefiles/root.in'      => 'languages/bc/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/befunge/config/makefiles/root.in' => 'languages/befunge/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/bf/config//makefiles/root.in'     => 'languages/bf/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/cola/config/makefiles/root.in'    => 'languages/cola/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/HQ9plus/config/makefiles/root.in' => 'languages/HQ9plus/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
        conditioned_lines                            => 1,
    );
    genfile(
        'languages/jako/config/makefiles/root.in'    => 'languages/jako/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/lisp/config/makefiles/root.in'    => 'languages/lisp/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/lua/config/makefiles/root.in'     => 'languages/lua/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/m4/config/makefiles/root.in'      => 'languages/m4/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
        conditioned_lines                            => 1,
    );
    genfile(
        'languages/ook/config/makefiles/root.in'     => 'languages/ook/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/parrot_compiler/config/makefiles/root.in' => 'languages/parrot_compiler/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/perl6/config/makefiles/root.in'   => 'languages/perl6/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/pheme/config/makefiles/root.in'   => 'languages/pheme/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/pugs/config/makefiles/root.in'    => 'languages/pugs/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
        conditioned_lines                            => 1,
    );
    genfile(
        'languages/punie/config/makefiles/root.in'   => 'languages/punie/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/regex/config/makefiles/root.in'   => 'languages/regex/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/scheme/config/makefiles/root.in'  => 'languages/scheme/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/tap/config/makefiles/root.in'     => 'languages/tap/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
        conditioned_lines                            => 1
    );
    genfile(
        'languages/tcl/config/makefiles/root.in'     => 'languages/tcl/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
        conditioned_lines                            => 1,
    );
    genfile(
        'languages/tcl/config/makefiles/examples.in' => 'languages/tcl/examples/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/urm/config/makefiles/root.in'     => 'languages/urm/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/WMLScript/config/Makefile.in'     => 'languages/WMLScript/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );
    genfile(
        'languages/Zcode/config/makefiles/root.in'   => 'languages/Zcode/Makefile',
        commentType                                  => '#',
        replace_slashes                              => 1,
    );

    return $self;
}

1;
