#! perl
# Copyright (C) 2001-2011, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 7;

=head1 NAME

t/op/spawnw.t - Run OS commands and tell about the exit code

=head1 SYNOPSIS

        % prove t/op/spawnw.t

=head1 DESCRIPTION

Tests spawning external commands.

spawnw does not capture STDOUT and STDERR from the spawned command.
So only the exit code can be tested.

The returned value is actually returned from the 'waitpid' system call.
In order to get the exit code from the spawned process, it needs to be right
shifted by 8 bit.

=head1 TODO

Test negative return codes.

=head1 SEE ALSO

The special variable $? in Perl 5.

=head1 AUTHOR

Nigel Sandever - C<nigelsandever@btconnect.com>

=cut

# perl command coded this way to avoid platform
# quoting issue.

# test string version of spawnw

my $perl = $^X;

pasm_output_is( <<"CODE", <<'OUTPUT', "exit code: 0" );
.pcc_sub :main main:
        set     S1, '$perl -e "exit(0)"'
        set     I1, 99
        spawnw  I1, S1
        shr     I2, I1, 8
        print   "return code: "
        print   I2
        print   "\\n"
        end
CODE
return code: 0
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "exit code: 123" );
.pcc_sub :main main:
        set     S1, '$perl -e "exit(123)"'
        set     I1, 99
        spawnw  I1, S1
        shr     I2, I1, 8
        print   "return code: "
        print   I2
        print   "\\n"
        end
CODE
return code: 123
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "exit code: 3" );
.pcc_sub :main main:
        set     S1, '$perl -e "exit(3)"'
        set     I1, 99
        spawnw  I1, S1
        shr     I2, I1, 8
        print   "return code: "
        print   I2
        print   "\\n"
        end
CODE
return code: 3
OUTPUT

# test array version of spawnw

pasm_output_is( <<"CODE", <<'OUTPUT', "exit code: 0" );
.pcc_sub :main main:
        new     P0, 'ResizablePMCArray'
        set     P0, 3
        set     P0[0], '$perl'
        set     P0[1], "-e"
        set     P0[2], "exit(0)"
        set     I1, 99
        spawnw  I1, P0
        shr     I2, I1, 8
        print   "return code: "
        print   I2
        print   "\\n"
        end
CODE
return code: 0
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "exit code: 123" );
.pcc_sub :main main:
        new     P0, 'ResizablePMCArray'
        set     P0, 3
        set     P0[0], '$perl'
        set     P0[1], "-e"
        set     P0[2], "exit(123)"
        set     I1, 99
        spawnw  I1, P0
        shr     I2, I1, 8
        print   "return code: "
        print   I2
        print   "\\n"
        end
CODE
return code: 123
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "exit code: 3" );
.pcc_sub :main main:
        new     P0, 'ResizablePMCArray'
        set     P0, 3
        set     P0[0], '$perl'
        set     P0[1], "-e"
        set     P0[2], "exit(3)"
        set     I1, 99
        spawnw  I1, P0
        shr     I2, I1, 8
        print   "return code: "
        print   I2
        print   "\\n"
        end
CODE
return code: 3
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', "grow argv buffer" );
.sub test :main
        .local pmc args

        \$S0 = "exit length(qq{"
        \$I0 = 0
loop:
        if \$I0 >= 1000 goto end
        \$S0 = concat \$S0, "A"
        inc \$I0
        branch loop
end:
        \$S0 = concat \$S0, "}) / 100"
        new args, 'ResizablePMCArray'
        push args, '$perl'
        push args, "-e"
        push args, \$S0
        \$I0 = spawnw args
        shr \$I1, \$I0, 8
        print   "return code: "
        print   \$I1
        print   "\\n"
        end
.end
CODE
return code: 10
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
