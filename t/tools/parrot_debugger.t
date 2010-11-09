#! perl
# Copyright (C) 2007-2009, Parrot Foundation.

=head1 NAME

t/tools/parrot_debugger.t - test the Parrot Debugger

=head1 SYNOPSIS

    % prove t/tools/parrot_debugger.t

=head1 DESCRIPTION

Tests the C<parrot_debugger> tool by providing it with a number of source
files, and running through it with various commands.

We never actually check the I<full> output of parrot_debugger.  We simply check
several smaller components to avoid a test file that is far too unwieldy.


=head1 REQUIREMENTS

This test script requires you to build parrot_debugger, by typing
"make parrot_utils" (using a suitable make tool for your platform).
If this requirement has not been met, all tests will be skipped.

=cut

use strict;
use warnings;
use lib qw(lib);

use Test::More;
use IO::File ();
use Parrot::Config;
use File::Spec;

my $path_to_pdb;

BEGIN {
    $path_to_pdb = File::Spec->catfile( ".", "parrot_debugger" );
    my $exefile = $path_to_pdb . $PConfig{exe};
    unless ( -f $exefile ) {
        plan skip_all => "parrot_debugger hasn't been built. Run make parrot_utils";
        exit(0);
    }
    plan skip_all => "parrot_debugger changes have rendered these tests obsolete.";
    exit(0);
}

my $tests = 0;

pdb_output_like( <<PIR, "pir", "help", qr/List of commands:/, 'help page');
.sub main :main
    \$N3 = 3.14159
    print \$N3
    print "\\n"
.end
PIR
pdb_output_like( <<PIR, "pir", "r", qr/3\.14159/, 'running the program (pir)');
.sub main :main
    \$N3 = 3.14159
    print \$N3
    print "\\n"
.end
PIR
pdb_output_like( <<PASM, "pasm", "run", qr/42/, 'running the program (long,pasm)');
    set I1,42
    print I1
    print "\\n"
PASM
pdb_output_like( <<PASM, "pasm", "r", qr/42/, 'running the program (pasm)');
    set I1,42
    print I1
    print "\\n"
PASM
pdb_output_like( <<PASM, "pasm", "n", qr/one more time/, 'next instruction (pasm)');
    print "one more time\\n"
PASM
pdb_output_like( <<PASM, "pasm", "next", qr/one more time/, 'next instruction (long,pasm)');
    print "one more time\\n"
PASM
pdb_output_like( <<PIR, "pir", "n", qr/one more time/, 'next instruction (pir)');
.sub main :main
    print "one more time\\n"
.end
PIR
pdb_output_like( <<PIR, "pir", "next", qr/one more time/, 'next instruction (long,pir)');
.sub main :main
    print "one more time\\n"
.end
PIR
pdb_output_like( <<PIR, "pir", "s", qr/current instr.: 'main'/, 'show stack (pir)');
.sub main :main
    \$I1 = 242
.end
PIR
pdb_output_like( <<PIR, "pir", "stack", qr/current instr.: 'main'/, 'show stack (long,pir)');
.sub main :main
    \$I1 = 242
.end
PIR

pdb_output_like( <<PASM, "pasm", "s", qr/current instr.: '\(null\)'/, 'show stack (pasm)');
    set I1, 242
PASM

pdb_output_like( <<PASM, "pasm", "info", qr/Total memory allocated =/, 'info (pasm)');
    set I1, 242
PASM

pdb_output_like( <<PASM, "pasm", "b", qr/Breakpoint 1 at.*pos 0/, 'set breakpoint');
    set I1, 242
PASM
pdb_output_like( <<PASM, "pasm", "b\nb\nL", qr/Breakpoint 1 at pos 0\nBreakpoint 2 at pos 0/, 'list breakpoints');
    set I1, 242
PASM

pdb_output_like( <<PIR, "pir", "b\nb\nL", qr/Breakpoint 1 at pos 0\nBreakpoint 2 at pos 0/, 'list breakpoints (pir)');
.sub main :main
    \$I1 = 242
.end
PIR

pdb_output_like( <<PASM, "pasm", "t", qr/set I0, 242/, 'trace');
    set I0, 242
PASM

pdb_output_like( <<PIR, "pir", "t", qr/set I0, 242/, 'trace (pir)');
.sub main :main
    \$I0 = 242
.end
PIR

pdb_output_like( <<PASM, "pasm", "t 2", qr/\d+ set I0, 242\s*I0=-?\d+\s*\d+ set I1, 1982/, 'trace multiple statements');
    set I0, 242
    set I1, 1982
PASM

pdb_output_like( <<PIR, "pir", "t 2", qr/\d+ set I0, 242\s*I0=-?\d+\s*\d+ set I1, 1982/, 'trace multiple statements (pir)');
.sub main :main
    \$I0 = 242
    \$I1 = 1982
.end
PIR

pdb_output_like( <<PASM, "pasm", "t\np I0", qr/^242/m, 'print an integer register');
    set I0, 242
PASM

pdb_output_like( <<PIR, "pir", "t\np I0", qr/^242/m, 'print an integer register (pir)');
.sub main :main
    \$I0 = 242
.end
PIR

pdb_output_like( <<PASM, "pasm", "t\np N0", qr/^3.14159/m, 'print a numeric register');
    set N0, 3.14159
PASM

pdb_output_like( <<PIR, "pir", "t\np N0", qr/^3.14159/m, 'print a numeric register (pir)');
.sub main :main
    \$N0 = 3.14159
.end
PIR

pdb_output_like( <<PASM, "pasm", "t\np P0", qr/^ResizablePMCArray/m, 'print a PMC register');
    new P0, 'ResizablePMCArray'
PASM

pdb_output_like( <<PIR, "pir", "t\np P0", qr/^ResizablePMCArray=PMC/m, 'print a PMC register (pir)');
.sub main :main
    \$P0 = new 'ResizablePMCArray'
.end
PIR

pdb_output_like( <<PASM, "pasm", "t\np S0", qr/^ceiling cat/m, 'print a string register');
    set S0, "ceiling cat"
PASM

pdb_output_like( <<PIR, "pir", "t\np S0", qr/^ceiling cat/m, 'print a string register (pir)');
.sub main :main
    \$S0 = "ceiling cat"
.end
PIR

pdb_output_like( <<PASM, "pasm", "t 2\np I", qr/I0 = 242\s*I1 = 1982/, 'print all integer registers');
    set I0, 242
    set I1, 1982
PASM

pdb_output_like( <<PIR, "pir","t 2\np I", qr/I0 = 242\s*I1 = 1982/, 'print all integer registers (pir)');
.sub main :main
    \$I0 = 242
    \$I1 = 1982
.end
PIR

pdb_output_like( <<PASM, "pasm", "b\n d 1", qr/Breakpoint 1 deleted/, 'Delete a breakpoint');
    set I0, 242
PASM

pdb_output_like( <<PIR, "pir", "b\nd 1", qr/Breakpoint 1 deleted/, 'Delete a breakpoint (pir)');
.sub main :main
    \$I0 = 242
.end
PIR

pdb_output_like( <<PIR, "pir", "l", qr/\.sub main :main/, 'list source');
.sub main :main
    \$I0 = 242
.end
PIR

pdb_output_like( <<PIR, "pir", "l 2", qr/N4 = 6.28/, 'list source with start line');
.sub main :main
    \$N3 = 3.14
    \$N4 = 6.28
    print "\\n"
.end
PIR

pdb_output_like( <<PIR, "pir", "d 42", qr/No breakpoint number 42/, 'delete invalid breakpoint');
.sub main :main
    \$I0 = 242
.end
PIR

TODO: {

local $TODO = 'eval support functions deprecated, TT #872, pending eval reworking';

pdb_output_like( <<PIR, "pir", "e ", qr/Must give a command to eval/, 'eval nothing');
.sub main :main
    \$I0 = 242
.end
PIR

}

pdb_output_like( <<PIR, "pir", "t\na I0 17", qr/I0 = 17/, 'assign to an integer register');
.sub main :main
    \$I0 = 242
.end
PIR

pdb_output_like( <<PIR, "pir", "t\na i0 17", qr/I0 = 17/, 'assign to an integer register (lowercase)');
.sub main :main
    \$I0 = 242
.end
PIR

pdb_output_like( <<PIR, "pir", "a Z0 42", qr/Invalid register type Z/, 'assign to an invalid register');
.sub main :main
    \$I0 = 242
.end
PIR

pdb_output_like( <<PIR, "pir", "a foo", qr/Must give a register number and value to assign/, 'invalid assignment command');
.sub main :main
    \$I0 = 242
.end
PIR

pdb_output_like( <<PIR, "pir", "t\na N0 3.14", qr/N0 = 3.14/, 'assign to a numeric register');
.sub main :main
    \$N0 = 9.99
.end
PIR

pdb_output_like( <<PIR, "pir", "t\np S", qr/S0 = foobar/, 'print string registers');
.sub main :main
    \$S0 = "foobar"
.end
PIR

pdb_output_like( <<PIR, "pir", "t\na S0 foobar", qr/S0 = no such register/, 'print string registers when none exist');
.sub main :main
    new \$P0, 'ResizableIntegerArray'
.end
PIR

pdb_output_like( <<PIR, "pir", "r", qr/great job!/, 'run code');
.sub main :main
    print "great job!"
.end
PIR

TODO: {

local $TODO = 'arguments do not seem to populate $P0';
pdb_output_like( <<PIR, "pir", "r gomer", qr/gomer/, 'run code with args');
.sub main :main
    print \$P0
.end
PIR

}

pdb_output_like( <<PIR, "pir", "t\nw I0 == 2\nt", qr/Adding watchpoint/, 'watchpoint');
.sub main :main
    \$I0 = 1
    \$I0 = 2
    \$I0 = 3
.end
PIR

BEGIN { $tests += 45 }

BEGIN { plan tests => $tests; }

=head1 HELPER SUBROUTINES

=head2 pdb_output_like

    pdb_output_like(<<PASM, "pasm", 'r', "some output", "running $file");

Takes 4 arguments: a file to run, the filename-extension of the file
(probably "pir" or "pasm"), the command or commands to provide to
parrot_debugger as script file, and a regex string to match within
parrot_debugger's output.

=cut

my $testno = 0;

sub pdb_output_like {
    my ( $file, $ext, $input, $check, $diag ) = @_;
    $testno++;
    my $codefn   = "$0.$testno.$ext";
    my $stdinfn  = "$0.$testno.stdin";
    my $stdoutfn = "$0.$testno.stdout";
    my $f        = IO::File->new(">$codefn");
    $f->print($file);
    $f->close();
    $f = IO::File->new(">$stdinfn");
    $f->print($input);
    $f->print("\nquit\n");
    $f->close();
    system("$path_to_pdb --script $stdinfn $codefn >$stdoutfn 2>&1");
    $f = IO::File->new($stdoutfn);

    my $output = join( '', <$f> );

    local $Test::Builder::Level = $Test::Builder::Level + 1;
    unlink ($codefn, $stdinfn, $stdoutfn);
    like( $output, $check, $diag );
}

=head1 TODO

=over 4

=item

Flesh it out.  This is a bare bones proof of concept.
Add tests for all of the commands.

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
