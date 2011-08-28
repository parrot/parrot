#! perl
# Copyright (C) 2001-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Config;
use File::Spec::Functions;

my $parrot_config = "parrot_config" . $PConfig{o};

plan skip_all => 'src/parrot_config.o does not exist' unless -e catfile("src", $parrot_config);

plan tests => 2;

=head1 NAME

t/src/basic.t - Basics

=head1 SYNOPSIS

    % prove t/src/basic.t

=head1 DESCRIPTION

Tests C<printf> and C<exit_fatal> functions.

=cut

c_output_is( <<'CODE', <<'OUTPUT', "hello world" );
    #include <stdio.h>
    #include <stdlib.h>

    int
    main(int argc, const char* argv[])
    {
        printf("Hello, World!\n");
        exit(0);
    }
CODE
Hello, World!
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "direct exit_fatal call" );
    #include <parrot/parrot.h>
    #include <parrot/exceptions.h>

    int
    main(int argc, const char* argv[])
    {
         exit_fatal(0, "Blow'd Up(tm)"); /* ' */
    }
CODE
Blow'd Up(tm)
OUTPUT

# for $EDITOR '

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
