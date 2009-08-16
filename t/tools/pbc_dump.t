#! perl
# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 NAME

t/tools/pbc_dump.t - test the Parrot Bytecode (PBC) Dumper

=head1 SYNOPSIS

    % prove t/tools/pbc_dump.t

=head1 DESCRIPTION

Tests the C<pbc_dump> tool by providing it with a number of source
files, and running through it with various commands.

We never actually check the I<full> output of pbc_dump.  We simply check
several smaller components to avoid a test file that is far too unwieldy.


=head1 REQUIREMENTS

This test script requires you to build pbc_dump, by typing
"make parrot_utils" (using a suitable make tool for your platform).
If this requirement has not been met, all tests will be skipped.

=cut

use strict;
use warnings;
use lib qw(lib);

use Test::More;
use IO::File ();
use Parrot::Config;
use Parrot::Test;
use File::Spec;

my $path;

BEGIN {
    $path = File::Spec->catfile( ".", "pbc_dump" );
    my $exefile = $path . $PConfig{exe};
    unless ( -f $exefile ) {
        plan skip_all => "pbc_dump hasn't been built. Run make parrot_utils";
        exit(0);
    }
    plan tests => 4;
}

dump_output_like( <<PIR, "pir", [qr/FIXUP_t/, qr/PIC_idx/, qr/CONSTANT_t/, qr/BYTECODE_t/], 'pbc_dump numeric');
.sub main :main
    \$N3 = 3.14159
    print \$N3
    print "\\n"
.end
PIR

=head1 HELPER SUBROUTINES

=head2 dump_output_like

    dump_output_like(<<PASM, "pasm", "some output", "running $file");

Takes 3-4 arguments: a file to run,
the filename-extension of the file (probably "pir" or "pasm"),
an arrayref or single regex string to match within pbc_dump's output,
and the optional test diagnostic.

=cut

sub dump_output_like {
    pbc_postprocess_output_like($path, @_ );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
