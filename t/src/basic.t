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

Tests C<printf> and C<Parrot_util_byte_index>.

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

# for $EDITOR '

c_output_is( <<'CODE', <<'OUTPUT', "Parrot_util_byte_index" );
    #include <stdio.h>
    #include <stdlib.h>
    #include <assert.h>
    #include "parrot/parrot.h"
    #include "parrot/extend.h"
    #include "parrot/misc.h"

    static Parrot_Interp new_interp()
    {
        Parrot_Interp interp = Parrot_interp_new(NULL);
        if (!interp) {
            fprintf(stderr, "Could not create Parrot interpreter\n");
            exit(1);
        }
        return interp;
    }

    static STRING* new_string(Parrot_Interp interp, const char * value)
    {
        return Parrot_str_new(interp, value, strlen(value));
    }

    int
    main(int argc, const char* argv[])
    {
        Parrot_Interp interp = Parrot_interp_new(NULL);
        STRING *invoked = new_string(interp, "invoked");
        STRING *invoked2 = new_string(interp, "invoked");
        STRING *invoked_ = new_string(interp, "invoked_");
        STRING *array = new_string(interp, "array");
        STRING *scalar_boolean = new_string(interp, "scalar boolean");
        STRING *boolean = new_string(interp, "boolean");
        INTVAL i;

        i = Parrot_util_byte_index(interp, invoked, invoked, 0);
        assert(i == 0);
        if (i != 0)
            return EXIT_FAILURE;

        i = Parrot_util_byte_index(interp, invoked, invoked2, 0);
        assert(i == 0);
        if (i != 0)
            return EXIT_FAILURE;

        i = Parrot_util_byte_index(interp, invoked, array, 0);
        assert(i == -1);
        if (i != -1)
            return EXIT_FAILURE;

        i = Parrot_util_byte_index(interp, invoked, invoked_, 0);
        assert(i == -1);
        if (i != -1)
            return EXIT_FAILURE;

        i = Parrot_util_byte_index(interp, invoked_, invoked, 0);
        assert(i == 0);
        if (i != 0)
            return EXIT_FAILURE;

        i = Parrot_util_byte_index(interp, array, boolean, 0);
        assert(i == -1);
        if (i != -1)
            return EXIT_FAILURE;

        i = Parrot_util_byte_index(interp, scalar_boolean, array, 0);
        assert(i == -1);
        if (i != -1)
            return EXIT_FAILURE;

        i = Parrot_util_byte_index(interp, boolean, scalar_boolean, 0);
        assert(i == -1);
        if (i != -1)
            return EXIT_FAILURE;

        i = Parrot_util_byte_index(interp, scalar_boolean, boolean, 0);
        //assert(i == 7);
        if (i != 7) {
            printf("=> %d with \"boolean\" in \"scalar boolean\"\n", i);
            return EXIT_FAILURE;
        }

        Parrot_interp_destroy(interp);
        printf("ok\n");
        return EXIT_SUCCESS;
    }
CODE
ok
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
