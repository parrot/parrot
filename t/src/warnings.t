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

t/src/warnings.t - Parrot warnings

=head1 SYNOPSIS

    % prove t/src/warnings.t

=head1 DESCRIPTION

Test functions defined in src/warnings.c

=head1 HISTORY

Hacked from t/src/basics.t

=cut

c_output_is( <<'CODE', <<'OUTPUT', "print_pbc_location" );

#include <parrot/parrot.h>

int
main(int argc, const char* argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    int error_val;

    if (interp) {
        print_pbc_location(interp);

        Parrot_destroy(interp);
    }
    return 0;
}
CODE
(null)
OUTPUT

c_output_is( <<'CODE', <<'OUTPUT', "Parrot_warn" );

#include <parrot/parrot.h>

int
main(int argc, const char* argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    int error_val;

    if (interp) {
        PARROT_WARNINGS_on(interp, PARROT_WARNINGS_ALL_FLAG);

        error_val = Parrot_warn(interp, PARROT_WARNINGS_ALL_FLAG, "all");
        Parrot_io_eprintf(interp, "%d\n", error_val);

        /* warnings are on, this should return an error */
        error_val = Parrot_warn(interp, PARROT_WARNINGS_NONE_FLAG, "none");
        Parrot_io_eprintf(interp, "%d\n", error_val);

        error_val = Parrot_warn(interp, PARROT_WARNINGS_UNDEF_FLAG, "undef");
        Parrot_io_eprintf(interp, "%d\n", error_val);

        error_val = Parrot_warn(interp, PARROT_WARNINGS_IO_FLAG, "io");
        Parrot_io_eprintf(interp, "%d\n", error_val);

        error_val = Parrot_warn(interp, PARROT_WARNINGS_PLATFORM_FLAG, "platform");
        Parrot_io_eprintf(interp, "%d\n", error_val);

        error_val = Parrot_warn(interp, PARROT_WARNINGS_DYNEXT_FLAG, "dynext");
        Parrot_io_eprintf(interp, "%d\n", error_val);

        error_val = Parrot_warn(interp, 0, "eek"); /* should return error */
        Parrot_io_eprintf(interp, "%d\n", error_val);

        Parrot_destroy(interp);
   }
   return 0;
}
CODE
all
(null)
1
2
undef
(null)
1
io
(null)
1
platform
(null)
1
dynext
(null)
1
2
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
