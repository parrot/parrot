#! perl
# Copyright (C) 2009-2010, Parrot Foundation.

=head1 NAME

t/tools/pbc_disassemble.t - test the Parrot Bytecode (PBC) Disassembler

=head1 SYNOPSIS

    % prove t/tools/pbc_disassemble.t

=head1 DESCRIPTION

Tests the C<pbc_disassemble> tool by providing it with a number of source
files, and running through it with various commands.

We never actually check the I<full> output of pbc_disassemble.  We simply check
several smaller components to avoid a test file that is far too unwieldy.


=head1 REQUIREMENTS

This test script requires you to build pbc_disassemble, by typing
"make parrot_utils" (using a suitable make tool for your platform).
If this requirement has not been met, all tests will be skipped.

=cut

use strict;
use warnings;
use lib qw(lib);

use Test::More;
use Parrot::Config;
use File::Spec;
use Parrot::Test;

my ($path, $exefile);

BEGIN {
    $path = File::Spec->catfile( ".", "pbc_disassemble" );
    $exefile = $path . $PConfig{exe};
    unless ( -f $exefile ) {
        plan skip_all => "pbc_disassemble hasn't been built. Run make parrot_utils";
        exit(0);
    }
    plan tests => 10;
}

my $helpregex = <<OUTPUT;
/pbc_disassemble - parrot bytecode disassembler

Usage:
pbc_disassemble .* [[]file.pbc[]]
pbc_disassemble -o file[.]pasm file[.]pbc

\\s+(-.{1},\\s+--.*(["]\\w+["])?\\s+.*
)+/m
OUTPUT

disassemble_raw_output_like( "--help", $helpregex, "pbc_disassemble help message");
disassemble_raw_output_like( "--thisisnotarealoption", $helpregex, "pbc_disassemble bad option");
disassemble_raw_output_like( "-h -b -o - -?", $helpregex, "pbc_disassemble every option");

my $errorregex = <<OUTPUT;
/Error during disassembly\nPackFile_Header_validate: This is not a valid Parrot bytecode file./m
OUTPUT

disassemble_raw_output_like( "-o del.pasm pbc_disassemble$PConfig{exe}", $errorregex, "pbc_disassemble bad bytecode file");

disassemble_output_like( <<PIR, "pir", qr/PMC_CONST.*set_n_nc.*print_n/ms, 'pbc_disassemble numeric ops');
.sub main :main
    \$N3 = 3.14159
    print \$N3
    print "\\n"
.end
PIR

disassemble_output_like( <<PIR, "pir", qr/PMC_CONST.*set_i_ic.*print_i/ms, 'pbc_disassemble integer ops');
.sub main :main
    \$I0 = 1982
    print \$I0
    print "\\n"
.end
PIR

disassemble_output_like( <<PIR, "pir", qr/PMC_CONST.*new_p_sc.*"ResizablePMCArray".*set_p_kic_ic\s*P.*set_i_p_kic\s*I.*/ms, 'pbc_disassemble pmc ops');
.sub main :main
    \$P0    = new 'ResizablePMCArray'
    \$P0[0] = 42
    \$I0 = \$P0[0]
.end
PIR

disassemble_output_like( <<PIR, "pir", qr/PMC_CONST.*set_s_sc\s*S.*print_s\s*S.*print_sc/ms, 'pbc_disassemble string ops');
.sub main :main
    \$S0 = "Wheels within wheels"
    print \$S0
    print "\\n"
.end
PIR

disassemble_output_like( <<PIR, "pir", qr/set_s_sc S0,utf8:"Hello"/ms, 'pbc_disassemble utf8 string');
.sub main :main
    \$S0 = utf8:"Hello"
.end
PIR

my $utf16 = pack('S*', unpack('C*', 'Hello'));
$utf16 =~ s/\0/\\\\0/g;
disassemble_output_like( <<PIR, "pir", qr/set_s_sc S0,utf16:"$utf16"/ms, 'pbc_disassemble utf16 string');
.sub main :main
    \$S0 = utf16:"Hello"
.end
PIR

=head1 HELPER SUBROUTINES

=head2 disassemble_output_like

    disassemble_output_like(<<PASM, "pasm", "some output", "running $file");

Takes 3-4 arguments: a file to run,
the filename-extension of the file (probably "pir" or "pasm"),
an arrayref or single regex string to match within pbc_disassemble's output,
and the optional test diagnostic.

=cut

sub disassemble_output_like {
    pbc_postprocess_output_like($path, @_ );
}

sub disassemble_raw_output_like {
    my ($options, $snippet, $desc)  = @_;
    my $out = `$exefile $options 2>&1`;
    like( $out, $snippet, $desc );
    return;
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
